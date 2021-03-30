<template>
    <div>
        <ul class="divide-y divide-gray-200">
            <li class="py-4 flex" v-for="item in list" :key="item.id">
                <img class="h-10 w-10 rounded-full" :src="item.thumbnail || 'https://www.seekpng.com/png/full/110-1100707_person-avatar-placeholder.png'" alt="">
                <div class="ml-3">
                    <p class="text-sm font-medium text-gray-900">{{ item.name }}</p>
                    <p class="text-sm text-gray-500">{{ item.email }}</p>
                </div>
            </li>
        </ul>

        <laravel-vue-tailwind-pagination :data="getPeople" :showNumbers="true" @pageChanged="getData">
        </laravel-vue-tailwind-pagination>
    </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
    name: "PeopleListComponent",
    computed: {
        ...mapGetters(['getPeople']),

        list() {
            return this.getPeople.data ?? [];
        }
    },

    methods: {
        ...mapActions(['fetchPeople']),
        getData(page = 1) {
            this.fetchPeople(page);
        }
    }
}
</script>
