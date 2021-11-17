<template>
    <v-container>
      <v-row>
          <v-col>
              <v-card>
                  <v-card-text class="d-flex">
                      <v-btn text to="dashboard">Dashboard</v-btn>
                       <v-btn text disabled>Detailed Report </v-btn>
                  </v-card-text>
              </v-card>
          </v-col>
      </v-row>
      <v-row class="mt-5">
          <v-col>
                <v-card>
                <v-card-title>
                   Detailed Report 
                    <v-spacer/>
                    <downloadexcel :data="getdata.data"><v-btn small depressed class="primary mr-2" rounded>Export</v-btn></downloadexcel> 
                   <Search/>
                </v-card-title>
                <v-card-text>
                   <v-row>
                       <v-col class="md-6">
                           <v-card>
                               <v-card-text class="d-flex justify-space-between">
                                  <div class="display-1">Females</div>
                                  <div class="display-1">{{getdata.totalfemale}}</div>
                               </v-card-text>
                           </v-card>
                       </v-col>
                        <v-col class="md-6">
                             <v-card>
                               <v-card-text class="d-flex justify-space-between">
                                  <div class="display-1">Males</div>
                                  <div class="display-1">{{getdata.totalmale}}</div>
                               </v-card-text>
                           </v-card>
                        </v-col>
                   </v-row>
                  <v-simple-table>
                    <template v-slot:default>
                    <thead>
                        <tr>
                        <th class="text-left">
                            Date
                        </th>
                        <th class="text-left">
                            Name
                        </th>
                        <th class="text-left">
                           City
                        </th>
                        <th class="text-left">
                           Location
                        </th>
                         <th class="text-left">
                           Service
                        </th>
                          <th class="text-left">
                           Service Type
                        </th>
                          <th class="text-left">
                          Product
                        </th>
                        <th class="text-right">
                           
                        </th>
                        </tr>
                    </thead>
                    <tbody>
                        <template v-if="getdata.data.length>0">
                        <tr
                        v-for="per in getdata.data"
                        :key="per.id"
                        >
                        <td>{{ per.created_at }}</td>
                        <td>{{ per.name }}</td>
                          <td>{{ per.city }}</td>
                            <td>{{ per.location }}</td>
                              <td>{{ per.service }}</td>
                              <td>{{ per.type }}</td>
                              <td>{{ per.product}}</td>
                        <td class="d-flex justify-end pt-2 pb-2">
                            <InquiryView :inquiry="per"/>
                        </td>
                        </tr>
                        </template>
                        <template v-else>
                            <tr>
                                <td colspan="6" class="text-center red--text"> No Inquires Found as yet</td>
                            </tr>
                        </template>
                    </tbody>
                    </template>
                </v-simple-table>
                </v-card-text>
            </v-card>
          </v-col>
      </v-row>
           <v-overlay :value="overlay">
      <v-progress-circular
        indeterminate
        size="64"
      ></v-progress-circular>
    </v-overlay>
    </v-container>
</template>

<script>

import JsonExcel from "vue-json-excel";
import Filter from '../components/inquiry/filter.vue';
export default {
layout:'user',
components:{
 downloadexcel:JsonExcel
},
data(){
    return{
        overlay:false,
        data:[],
        totals:[]
    }
},
async fetch(){
    this.overlay=true
       await this.$store.dispatch('report/getData') 
     this.overlay = false
},computed:{
    getdata(){
        const data = this.$store.state.report.data
        let totalmale = 0
        let totalfemale = 0
         let filterdata = []
        data.forEach(element => {
            const agent = element.administrator.name+" "+element.administrator.surname
            const service = element.service ? element.service.name :""
            const type =  element.type ? element.type.name : ""
            const product = element.product ? element.product.name :""
            filterdata.push({...element,service:service,agent:agent,type:type,product:product})
             if(element.gender=='F'){
                 totalfemale++
             }else{
                 totalmale++
             }
        });
     
        return {data:filterdata,totalfemale:totalfemale,totalmale:totalmale}
    }
}
}
</script>

<style>

</style>