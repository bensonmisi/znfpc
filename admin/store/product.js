export const state =()=>({
    products:[]
})

export const mutations={
    setProducts(state,payload){
        state.products = payload
    }
}

export const actions={
    async getProducts({commit},payload){
        await this.$axios.get('api/admin/product/'+payload).then((res)=>{
            commit('setProducts',res.data)
          })
    }
}