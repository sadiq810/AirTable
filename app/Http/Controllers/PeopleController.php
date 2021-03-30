<?php

namespace App\Http\Controllers;

use App\Http\Resources\PeopleResource;
use App\Repositories\PeopleRepository;
use App\Utility\DataFormatter;
use \Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Support\Facades\Validator;

class PeopleController extends Controller
{
    public const PENDING = 0; //.... means record could not saved at airtable, due to rate limit or any other error.
    public const SYNCED = 1; //..... means records is saved to airtable successfully.
    public const UPDATES_PENDING = 2; //..... record is updated locally but not saved to airtable due to any error.

	public function index()
	{
		return view('people');
	}

    /**
     * @return AnonymousResourceCollection
     *
     * First get people list from database and if not found in database,
     * Then fetch them from Airtable Api and cache them for subsequent requests.
     */
    public function list(): AnonymousResourceCollection | Illuminate\Pagination\LengthAwarePaginator
    {
        $people = (new PeopleRepository)->paginate();

        if ($people->isEmpty())
            $people = $this->fetchAndCachePeople();

        return PeopleResource::collection($people);
	}//..... end of list() .....//

    /**
     * @return Collection|\Illuminate\Support\Collection
     *
     * Fetch records from Airtable and then insert them into Database.
     */
    private function fetchAndCachePeople(): Collection | \Illuminate\Support\Collection | \App\Repositories\Illuminate\Pagination\LengthAwarePaginator
    {
        $airTablePeople = (new \App\Services\People())->get();

        if ($airTablePeople and isset($airTablePeople['records'])) {
            $peopleRepository = new PeopleRepository;

            $people = (new DataFormatter())->list($airTablePeople['records']);

            $peopleRepository->bulkInsert($people);

            return $peopleRepository->paginate();
        }//..... end if() ....//

        return collect([]);
	}//..... end of fetchAndCachePeople() .....//

    /**
     * @param Request $request
     * @return array
     * Create people record first in Airtable and upon successful response,
     * then save that user to local database for caching.
     */
    public function create(Request $request): array
    {
        $imageName = null;

        $validator = Validator::make($request->all(), [
           'name'   => 'required',
           'email'  => 'required|email',
           'image'  => 'sometimes|mimes:jpg,jpeg|max:102400'
        ]);

        if ($validator->fails())
            return ['status' => false, 'message'=> implode(' ', $validator->errors()->all())];

        if ($request->has('image'))
            $imageName = $this->uploadImage($request->file('image'));

        $data = [
            'Name'  => $request->name,
            'Email' => $request->email
        ];

        if ($imageName)
            $data['Photo'][] = ['url' => asset('uploads/'.$imageName)];

        $response = (new \App\Services\People())->save($data);

        if ($response) {
            $data = (new DataFormatter())->single($response, self::SYNCED);
            (new PeopleRepository)->create($data);

            return ['status' => true, 'message' => 'Record saved successfully.'];
        } else {
            (new PeopleRepository)->create(array_merge(
                    $request->only(['name', 'email'],
                    ['status' => self::PENDING, 'photo' => json_encode($data['photo'] ?? [])]
                )));

            return ['status' => true, 'message' => 'Could not save record to Airtable, but cached locally and will be synced later.'];
        }//..... end if() .....//

        return ['status' => false, 'message' => 'Could not save record.'];
    }//..... end of create() ....//
}
