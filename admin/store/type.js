export const state =()=>({
    types:[]
})

export const mutations={
    setTypes(state,payload){
        state.types = payload
    }
}

export const actions={
    async getTypes({commit},payload){
        await this.$axios.get('api/admin/type/'+payload).then((res)=>{
            commit('setTypes',res.data)
          })
    }
}