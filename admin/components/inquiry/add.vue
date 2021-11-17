<template>
  <div>
      <v-btn fab depressed color="primary" @click="addFunc"><v-icon>mdi-plus</v-icon></v-btn>
   
      <v-dialog v-model="addPermModel" 
       fullscreen
      hide-overlay>
           <v-form v-model="valid" ref="form" lazy-validation>
       <v-card>
           <v-card-title>
               Add Inquiery
               <v-spacer/>
               <v-btn icon @click="addPermModel=false"><v-icon>mdi-close</v-icon></v-btn>
           </v-card-title>
           <v-card-text>
               <v-row>
                   <v-col>
                        <v-text-field
                            label="Name"
                            outlined
                            dense
                            v-model="form.name"
                            :rules="nameRule"
                        />
                   </v-col>
                    <v-col>
                        <v-select
                            label="Marital Status"
                            outlined
                            dense
                             :items="maritalstatuslist"
                            v-model="form.maritalstatus"
                            :rules="maritalstatusRule"
                        />
                   </v-col>
                   <v-col>
                        <v-select
                            label="Gender"
                            outlined
                            dense
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
                            dense
                            outlined
                            v-model="form.email"
                        />
                   </v-col>
                
                    <v-col>
                            <v-text-field
                            label="Phone"
                            dense
                            outlined
                            v-model="form.phonenumber"
                            :rules="phonenumberRule"
                        />
                   </v-col>
                    <v-col>
                        <v-select
                            label="Province"
                            dense
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
                            dense
                             :items="districtList"
                            v-model="form.district"
                        />
                   </v-col>
                      <v-col>
                            <v-text-field
                            label="City/Town/Growth Point"
                            outlined
                            dense
                            v-model="form.city"
                            :rules="cityRule"

                        />
                   </v-col>
                
                    <v-col>
                            <v-text-field
                            label="Surburb"
                            outlined
                            dense
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
                            dense
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
                            dense
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
                            dense
                             :items="productlist"
                            v-model="form.productId"
                            item-text="name"
                            item-value="id"
                        />
                   </v-col>
                   
               </v-row>
               <v-row>
                     <v-col>
                            <v-text-field
                            label="Age"
                            outlined
                            type="number"
                            dense
                            v-model="form.age"
                            :rules="ageRule"
                        />
                   </v-col>
                     <v-col>
                             <v-select
                            label="Communication Mode"
                            outlined
                            dense
                             :items="modelist"
                            v-model="form.mode"
                            :rules="modeRule"
                        />
                       
                   </v-col>
                   <v-col>
                          <v-text-field
                            label="How did you know about us"
                            outlined
                            dense
                            v-model="form.reference"
                            :rules="referenceRule"
                        />
                   </v-col>
               </v-row>
               <v-row>
                   <v-col>
                        <v-menu
        ref="menu"
        v-model="menu"
        :close-on-content-click="false"
        :return-value.sync="date"
        transition="scale-transition"
        offset-y
        min-width="auto"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-text-field
            v-model="date"
            outlined
            dense
            :rule="calldateRule"
            label="Call Date"
             prepend-inner-icon="mdi-calendar"
            readonly
            v-bind="attrs"
            v-on="on"
          ></v-text-field>
        </template>
        <v-date-picker
          v-model="date"
          no-title
          scrollable
        >
          <v-spacer></v-spacer>
          <v-btn
            text
            color="primary"
            @click="menu = false"
          >
            Cancel
          </v-btn>
          <v-btn
            text
            color="primary"
            @click="$refs.menu.save(date)"
          >
            OK
          </v-btn>
        </v-date-picker>
      </v-menu>
                   </v-col>
                   <v-col>
                         <v-menu
        ref="menu2"
        v-model="menu2"
        :close-on-content-click="false"
        :nudge-right="40"
        :return-value.sync="time1"
        transition="scale-transition"
        offset-y
        max-width="290px"
        min-width="290px"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-text-field
            v-model="time1"
            outlined
            label="Start Time"
             :rules="starttimeRule"
            dense
             prepend-inner-icon="mdi-clock-time-four-outline"
            readonly
            v-bind="attrs"
            v-on="on"
          ></v-text-field>
        </template>
        <v-time-picker
          v-if="menu2"
          v-model="time1"
          full-width
          @click:minute="$refs.menu2.save(time1)"
        ></v-time-picker>
      </v-menu>
                   </v-col>
                   <v-col>
                         <v-menu
        ref="menu3"
        v-model="menu3"
        :close-on-content-click="false"
        :nudge-right="40"
        :return-value.sync="time2"
        transition="scale-transition"
        offset-y
        max-width="290px"
        min-width="290px"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-text-field
            v-model="time2"
            outlined
            label="End Time"
            dense
            :rules="endtimeRule"
            prepend-inner-icon="mdi-clock-time-four-outline"
            readonly
            v-bind="attrs"
            v-on="on"
          ></v-text-field>
        </template>
        <v-time-picker
          v-if="menu3"
          v-model="time2"
          full-width
          @click:minute="$refs.menu3.save(time2)"
        ></v-time-picker>
      </v-menu>
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
    data(){
     return{
         addPermModel:false,
         valid:false,
         form:{
              name:'',
              gender:'',
              maritalstatus:'',
              phonenumber:'',
              email:'',
              maritalstatus:'',
              province:'',
              city:'',
              location:'',
              serviceId:'',
              typeId:'',
              productId:'',
              issue:'',
              age:'',
              reference:'',
              mode:'',
              calldate:'',
              starttime:'',
              endtime:''


         },
         nameRule:[v=>!!v || 'Name is required'],
         genderRule:[v=>!!v || 'Gender is required'],
         maritalstatusRule:[v=>!!v || 'Marital Status is required'],
         phonenumberRule:[v=>!!v || 'Phone number is required'],
         cityRule:[v=>!!v || 'City is required'],
         locationRule:[v=>!!v || 'Location is required'],
         serviceRule:[v=>!!v || 'Service name required'],
         ageRule:[v=>!!v || 'Age required'],
         startRule:[v=>!!v || 'Start time required'],
         modeRule:[v=>!!v || 'Mode required'],
         referenceRule:[v=>!!v || 'Reference  required'],
         calldateRule:[v=>!!v || 'Call Date required'],
         starttimeRule:[v=>!!v || 'Call Start time required'],
         endtimeRule:[v=>!!v || 'Call End time required'],
         snackbar:false,
         color:'',
         text:'',
         time1: null,
           time2: null,
            menu: false,
         menu2: false,
         menu3:false,
         date: (new Date(Date.now() - (new Date()).getTimezoneOffset() * 60000)).toISOString().substr(0, 10),
         loading:false,
         genderlist:['M','F'],
         maritalstatuslist:['MARRIED','SINGLE'],
         provincelist:['Matabeleland South','Mashonaland Central','Mashonaland West','Mashonaland North','Mashonaland East','Masvingo','Midlands','Manicaland','Bulawayo','Harare'],
         modelist:['CALL','WHATSAPP','SMS','FACEBOOK','TWITTER','EMAIL']

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
          this.form.starttime = this.time1
          this.form.endtime = this.time2
          this.form.calldate = this.calldate
             try {
                 await this.$axios.post('api/admin/inquiry',this.form).then((res)=>{
                        this.loading = false
                        this.color="success"
                        this.snackbar=true
                        this.text=res.data.message
                         this.$store.dispatch('inquiry/getMyInquries')
                        this.$refs.form.reset()
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