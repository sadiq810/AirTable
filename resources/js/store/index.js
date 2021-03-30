export default {
    state: {
        people: {}
    },

    getters: {
        getPeople(state) {
            return state.people;
        }
    },

    actions: {
        async fetchPeople({commit}, page = 1) {
            try {
                let {data} = await axios.get(BaseUrl+'/api/list?page='+page);
                commit('SET_PEOPLE_LIST', data);
            } catch (err) {
                console.error('Error occurred while fetching people list: ', err);
            }
        }
    },

    mutations: {
        SET_PEOPLE_LIST(store, data) {
            store.people = data
        },
    }
}
