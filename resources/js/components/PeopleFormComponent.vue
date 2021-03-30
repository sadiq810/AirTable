<template>
    <div>
        <h2 class="text-xl mb-5">Add new team member</h2>
        <form class="space-y-5" @submit.prevent="submit">
            <div>
                <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                <div class="mt-1">
                    <input type="text" name="name" id="name" v-model="name" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 p-3 border rounded-md" placeholder="Calvin Hawkins" required="required">
                </div>
            </div>
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                <div class="mt-1">
                    <input type="email" name="email" id="email" v-model="email" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 p-3 border rounded-md" placeholder="you@example.com" required="required">
                </div>
            </div>
            <div>
                <label for="photo" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">
                    Photo
                </label>
                <div class="mt-1">
                    <div class="w-full flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-md">
                        <div class="space-y-1 text-center">
                            <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                                <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                            </svg>
                            <div class="flex text-sm text-gray-600">
                                <label for="file-upload" class="relative cursor-pointer bg-white rounded-md font-medium text-indigo-600 hover:text-indigo-500 focus-within:outline-none focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-indigo-500">
                                    <span>Upload a file</span>
                                    <input accept="image/jpeg" id="file-upload" name="file-upload" type="file" class="sr-only" ref="file" v-on:change="handleFileUpload()">
                                </label>
                                <p class="pl-1">or drag and drop</p>
                            </div>
                            <p class="text-xs text-gray-500">
                                PNG, JPG, GIF up to 100MB
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit" :disabled="saving" class="inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                Submit
            </button>
            <img v-if="saving" src="/loader.gif" alt="Saving...." class="inline-flex loader">
        </form>
    </div>
</template>

<script>
import {mapActions} from 'vuex';

export default {
    name: "PeopleCreateComponent",
    data() {
        return {
            name: '',
            email: '',
            image: '',
            saving: false
        }
    },

    methods: {
        ...mapActions(['fetchPeople']),

        async submit() {
            this.saving = true;
            let formData = new FormData();

            if (this.image)
                formData.append('image', this.image);

            formData.append('name', this.name);
            formData.append('email', this.email);

            try {
                let {data} = await axios.post( BaseUrl+'/api/people', formData, {
                        headers: {
                            'Content-Type': 'multipart/form-data'
                        }
                    }
                );

                if (data.status) {
                    this.fetchPeople();
                    this.name = '';
                    this.email = '';
                    this.image = '';

                    alert('Saved successfully.');
                } else {
                    alert(data.message);
                }//.... end if-else() .....//

            } catch(err) {
                alert('Error occurred while saving record: '+ err);
            }

            this.saving = false;
        },

        handleFileUpload(){
            let type = this.$refs.file.files[0].type;
            let size = this.$refs.file.files[0].size;

            if (! (type.includes('jpeg') || type.includes('jpeg'))) {
                alert('Please select jpg/jpeg image type.');
                return false;
            }//..... end if() .....//

            size = size/1024/1024;

            if (size > 100) {
                alert('Max image size is 100MB allowed.');
                return false;
            }//..... end if() .....//

            this.image = this.$refs.file.files[0];
        }
    }
}
</script>
