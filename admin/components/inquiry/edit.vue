<template>
  <div>
      <v-btn icon depressed color="info" @click="addFunc"><v-icon>mdi-pencil</v-icon></v-btn>
   
      <v-dialog v-model="addPermModel" 
       fullscreen
      hide-overlay>
           <v-form v-model="valid" ref="form" lazy-validation>
       <v-card>
           <v-card-title>
               Update Inquiery
               <v-spacer/>
               <v-btn icon @click="addPermModel=false"><v-icon>mdi-close</v-icon></v-btn>
           </v-card-title>
           <v-card-text>
               <v-row>
                   <v-col>
                        <v-text-field
                            label="Name"
                            outlined
                            v-model="form.name"
                            :rules="nameRule"
                        />
                   </v-col>
                    <v-col>
                        <v-select
                            label="Marital Status"
                            outlined
                             :items="maritalstatuslist"
                            v-model="form.maritalstatus"
                            :rules="maritalstatusRule"
                        />
                   </v-col>
                   <v-col>
                        <v-select
                            label="Gender"
                            outlined
                            v-model="form.gender"
                            :items="genderlist"
                            :rules="genderRule"
                        />
                   </v-col>
               </v-row>
               <v-row>
                      <v-col>
                            <v-text-field
                            label="Email"
                            outlined
                            v-model="form.email"
                        />
                   </v-col>
                
                    <v-col>
                            <v-text-field
                            label="Phone"
                            outlined
                            v-model="form.phonenumber"
                            :rules="phonenumberRule"
                        />
                   </v-col>
                    <v-col>
                        <v-select
                            label="Province"
                            outlined
                             :items="provincelist"
                            v-model="form.province"
                        />
                   </v-col>
                   
               </v-row>
                
                 <v-row>
                       <v-col>
                           <v-select
                            label="District"
                            outlined
                             :items="districtList"
                            v-model="form.district"
                        />
                   </v-col>
                      <v-col>
                            <v-text-field
                            label="City/Town/Growth Point"
                            outlined
                            v-model="form.city"
                            :rules="cityRule"

                        />
                   </v-col>
                
                    <v-col>
                            <v-text-field
                            label="Surburb"
                            outlined
                            v-model="form.location"
                            :rules="locationRule"
                        />
                   </v-col>
               </v-row>
                <v-row>
                       <v-col>
                           <v-select
                            label="Service"
                            outlined
                             :items="servicelist"
                            v-model="form.serviceId"
                            :rules="serviceRule"
                            item-text="name"
                            item-value="id"
                            @change="filterType"
                        />
                   </v-col>
                      <v-col>
                           <v-select
                            label="Service Types"
                            outlined
                             :items="typelist"
                            v-model="form.typeId"
                            item-text="name"
                            item-value="id"
                            @change="filterProducts"
                        />
                   </v-col>
                
                    <v-col>
                             <v-select
                            label="Product"
                            outlined
                             :items="productlist"
                            v-model="form.productId"
                            item-text="name"
                            item-value="id"
                        />
                   </v-col>
               </v-row>
               <v-row>
                <v-col>
                    <client-only>
                    <VueEditor v-model="form.issue"/>
                    </client-only>
                </v-col>
               </v-row>
             
                      
                          
           </v-card-text>
           <v-card-actions>
               <v-btn rounded class="error" @click="addPermModel=false">Cancel</v-btn>
               <v-spacer/>
               <v-btn rounded class="success" @click="submit" :loading="loading" :disabled="loading">Submit</v-btn>
           </v-card-actions>
       </v-card>
           </v-form>
      </v-dialog>
       <v-snackbar
      :color="color"
      right
      top
      v-model="snackbar"
    >{{text}}</v-snackbar>
  </div>
</template>

<script>
export default {
    props:['inquiry'],
    data(){
     return{
         addPermModel:false,
         valid:false,
         form:{
              name:this.inquiry.name,
              gender:this.inquiry.gender,
              maritalstatus:this.inquiry.maritalstatus,
              phonenumber:this.inquiry.phonenumber,
              email:this.inquiry.email,
              province:this.inquiry.province,
              city:this.inquiry.city,
              location:this.inquiry.location,
              serviceId:this.inquiry.serviceId,
              productId:this.inquiry.productId,
              typeId:this.inquiry.typeId,
              issue:this.inquiry.issue

         },
         nameRule:[v=>!!v || 'Name is required'],
         genderRule:[v=>!!v || 'Gender is required'],
         maritalstatusRule:[v=>!!v || 'Marital Status is required'],
         phonenumberRule:[v=>!!v || 'Phone number is required'],
          cityRule:[v=>!!v || 'City is required'],
           locationRule:[v=>!!v || 'Location is required'],
           serviceRule:[v=>!!v || 'Service name required'],
         snackbar:false,
         color:'',
         text:'',
         loading:false,
         genderlist:['M','F'],
         maritalstatuslist:['MARRIED','SINGLE'],
         provincelist:['Matabeleland South','Mashonaland Central','Mashonaland West','Mashonaland North','Mashonaland East','Masvingo','Midlands','Manicaland','Bulawayo','Harare'],
         

     }
 },methods:{
     async addFunc()
     {
            this.$store.dispatch('service/getServices')  
            this.addPermModel = true
     },
     async submit(){
       if(this.$refs.form.validate())
       {
          this.valid = true
          this.loading=true
             try {
                 await this.$axios.patch('api/admin/inquiry/'+this.inquiry.id,this.form).then((res)=>{
                        this.loading = false
                        this.color="success"
                        this.snackbar=true
                        this.text=res.data.message
                         this.$store.dispatch('inquiry/getMyInquries')
                        this.addPermModel= false

                 })
             }catch (err) {
                 this.loading = false
                 this.color="error"
                this.snackbar=true
                this.text=err.response.data.message
            }
       }
     },
     filterType(){
        this.$store.dispatch('type/getTypes',this.form.serviceId)  
     },
     filterProducts(){
          this.$store.dispatch('product/getProducts',this.form.typeId) 
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