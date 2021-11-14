export const state =()=>({
    inquires:[]
})

export const mutations={
    setInquiries(state,payload){
        state.inquires = payload
    }
}

export const actions={
    async getMyInquries({commit},){
        await this.$axios.get('api/admin/inquiry/data/getCurrentByUser').then((res)=>{
            commit('setInquiries',res.data)
          })
    },
    async customFilter({commit},payload){
        await this.$axios.post('api/admin/inquiry/custome/getByUserCustom',payload).then((res)=>{
            commit('setInquiries',res.data)
          })
    },
    async getByAgent({commit},payload){
        await this.$axios.get('api/admin/inquiry/report/getByAgent/'+payload).then((res)=>{
            commit('setInquiries',res.data)
          })
    }
    ,async getByService({commit},payload){
        await this.$axios.get('api/admin/inquiry/report/getByService/'+payload).then((res)=>{
            commit('setInquiries',res.data)
          })
    }
}