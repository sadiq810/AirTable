<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePeopleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('people', function (Blueprint $table) {
            $table->id();
            $table->string('airtable_id', 100);
            $table->string('name', 255);
            $table->string('email', 50);
            $table->text('photo')->nullable();
            $table->tinyInteger('status', 0)->comment('0: means not saved to airtable, 1: means saved to airtable, 2: means updates at airtable is pending.');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('people');
    }
}
