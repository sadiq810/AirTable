<template>
  <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
    <h1 class="text-5xl font-bold h1 mb-20">My Team</h1>
    <div class="grid grid-cols-2 gap-20">

        <PeopleFormComponent />

        <PeopleListComponent />

    </div>
  </div>
</template>

<script>
    import {mapActions} from 'vuex';
    import PeopleListComponent from "./PeopleListComponent";
    import PeopleFormComponent from "./PeopleFormComponent";

    export default {
        components: {PeopleFormComponent, PeopleListComponent},
        data() {
            return {}
        },

        mounted() {
            this.fetchPeople();
        },

        methods: {
            ...mapActions(['fetchPeople']),
        }
    }
</script>
