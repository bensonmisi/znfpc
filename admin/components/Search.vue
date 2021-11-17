<template>
<div>
   <v-btn small depressed class="success" rounded @click="addFunc">Filter</v-btn>
  <v-dialog v-model="addPermModel" width="300">
           <v-form v-model="valid" ref="form" lazy-validation>
       <v-card>
           <v-card-title>
               Filter Records
               <v-spacer/>
               <v-btn icon @click="addPermModel=false"><v-icon>mdi-close</v-icon></v-btn>
           </v-card-title>
           <v-card-text>
               
                           <v-select
                            label="Service"
                            outlined
                            dense
                             :items="servicelist"
                            v-model="form.serviceId"
                            item-text="name"
                            item-value="id"
                            @change="filterType"
                        />
                    <v-select
                            label="Service Types"
                            outlined
                            dense
                             :items="typelist"
                            v-model="form.typeId"
                            item-text="name"
                            item-value="id"
                            @change="filterProducts"
                        />
                            <v-select
                            label="Product"
                            outlined
                            dense
                             :items="productlist"
                            v-model="form.productId"
                            item-text="name"
                            item-value="id"
                        />
                           <v-text-field
                            label="Min Age"
                            outlined
                            type="number"
                            dense
                            v-model="form.minage"
                       />
                        <v-text-field
                            label="Max Age"
                            outlined
                            type="number"
                            dense
                            v-model="form.maxage"
                       />
                               <v-select
                            label="Communication Mode"
                            outlined
                            dense
                             :items="modelist"
                            v-model="form.mode"
                            :rules="modeRule"
                        />
                          <v-select
                            label="District"
                            outlined
                            dense
                             :items="districtList"
                            v-model="form.district"
                        />
                         <v-select
                            label="Province"
                            dense
                            outlined
                             :items="provincelist"
                            v-model="form.province"
                        />
                           <v-select
                            label="Marital Status"
                            outlined
                            dense
                             :items="maritalstatuslist"
                            v-model="form.maritalstatus"
                        />
                         <v-select
                            label="Gender"
                            outlined
                            dense
                            v-model="form.gender"
                            :items="genderlist"
                        />
                          
           </v-card-text>
           <v-card-actions>
               <v-btn rounded class="error" @click="addPermModel=false">Cancel</v-btn>
              <v-btn rounded class="primary" @click="Reset">Reset</v-btn>
               <v-btn rounded class="success" @click="submit" :loading="loading" :disabled="loading">Submit</v-btn>
           </v-card-actions>
       </v-card>
           </v-form>
      </v-dialog>
       <v-snackbar
      absolute
      :color="color"
      right
      top
      v-model="snackbar"
    >{{text}}</v-snackbar>
  </div>
</template>

<script>
export default {
    props:['id'],
 data(){
     return{
         addPermModel:false,
         valid:false,
         form:{
              serviceId:'',
              typeId:'',
              productId:'',
              minage:'',
              maxage:'',
              mode:'',
              district:'',
              province:'',
              maritalstatus:'',
              gender:''
         },
          genderlist:['M','F'],
         maritalstatuslist:['MARRIED','SINGLE'],
         provincelist:['Matabeleland South','Mashonaland Central','Mashonaland West','Mashonaland North','Mashonaland East','Masvingo','Midlands','Manicaland','Bulawayo','Harare'],
         modelist:['CALL','WHATSAPP','SMS','FACEBOOK','TWITTER','EMAIL'],
        
         snackbar:false,
         color:'',
         text:'',
         loading:false
     }
 },methods:{
    
    async addFunc()
     {
            this.$store.dispatch('service/getServices')  
            this.addPermModel = true
     },
     filterType(){
        this.$store.dispatch('type/getTypes',this.form.serviceId)  
     },
     filterProducts(){
          this.$store.dispatch('product/getProducts',this.form.typeId) 
     },
     submit(){
         this.loading = true
         this.$store.dispatch('report/filterData',this.form)
         this.loading = false
     },
     Reset(){
          this.$refs.form.reset()
     }
 },computed:{
      districtList(){
            var list = [];
            if(this.form.province =='Matabeleland South')
            {
                list=['Beitbridge','Bulilima','Gwanda','Insiza','Mangwe','Matobo','Umzingwane']
            }
            else if(this.form.province =='Bulawayo'){
                list =['Bulawayo']
            }
            else if(this.form.province=='Mashonaland Central'){
                list=["Bindura","Guruve","Mazowe","Mbire","Mount Darwin","Muzarabani"]
            }
            else if(this.form.province=='Mashonaland West'){
                list=["Chegutu","Chinhoyi","Hurungwe","Kariba","Makonde","Mhondoro-Ngezi","Sanyati","Zvimba"]
            }
            else if(this.form.province=='Mashonaland East'){
                list=["Chikomba","Goromonzi","Marondera","Mudzi","Murehwa","Mutoko","Seke","Uzumba-Maramba-Pfungwe"]
            }
            else if(this.form.province=='Masvingo'){
                list=["Bikita","Chiredzi","Chivi","Gutu","Masvingo","Mwenezi","Zaka"]
            }
            else if(this.form.province=='Midlands'){
                list=["Chirumhanzu","Gokwe North","Gokwe South","Gweru","Kwekwe","Mberengwa","Shurugwi","Zvishavane"]
            }
            else if(this.form.province=='Manicaland'){
                list=[ "Buhera","Chimanimani","Chipinge","Makoni","Mutare","Mutasa","Nyanga"]
            }
            else if(this.form.province=='Harare'){
                list=['Harare']
            }

            return list;
        },
        servicelist(){
             return this.$store.state.service.services
        },
         typelist(){
             return this.$store.state.type.types
        },
         productlist(){
             return this.$store.state.product.products
        },
      

 }
}
</script>

<style>

</style>