import axios from 'axios';

const state = () => {
    return {
        tasks: null
    }
}

const getters = {
    GetTasks(state){
        if(state.tasks !== null && state.tasks !== undefined){
            return state.tasks;
        }
        return null;
    }
};


const mutations = {
    SET_TASKS_STATE(state, payload){
        state.tasks = payload;
    }
};


const actions = {
    async FetchTasks(context){
        try{
            const response = await axios.get(`${process.env.VUE_APP_API_ENDPOINT_V1}/tasks`,{headers: {'Content-Type': 'application/json',"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsImlhdCI6MTYyMzQ0NTUxMn0.QxG6XFMHzsJKNMlq6Um3vfJU7YAXBiOJmMf9TmyY1ac"}});
            context.commit('SET_TASKS_STATE', response); //por medio del commit seteamos el state.tasks con el response que retorna el endpoint
        }catch(error){
            console.log(error.response);
        }
    },

    async MarkTaskProgress(context, payload){
        try{
            await axios.put(`${process.env.VUE_APP_API_ENDPOINT_V1}/tasks/update/${payload.id}`,payload.data,{headers: {'Content-Type': 'application/json',"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsImlhdCI6MTYyMzQ0NTUxMn0.QxG6XFMHzsJKNMlq6Um3vfJU7YAXBiOJmMf9TmyY1ac"}});
            context.dispatch('FetchTasks')
        }catch(error){
            console.log(error.response);
        }
    },

    async deleteTask(context, payload){
        try{
            await axios.delete(`${process.env.VUE_APP_API_ENDPOINT_V1}/tasks/delete/${payload.id}`,{headers: {'Content-Type': 'application/json',"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsImlhdCI6MTYyMzQ0NTUxMn0.QxG6XFMHzsJKNMlq6Um3vfJU7YAXBiOJmMf9TmyY1ac"}});
            context.dispatch('FetchTasks')
        }catch(error){
            console.log(error.response);
        }
    }
};

export default {
    namespaced: true,
    state,
    getters,
    mutations,
    actions
}