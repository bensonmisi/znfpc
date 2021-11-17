<template>
  <div>
      <v-btn x-small depressed color="info" @click="addPermModel=true">View</v-btn>
   
      <v-dialog v-model="addPermModel" 
       fullscreen
      hide-overlay>
        
       <v-card>
           <v-card-title>
               View
               <v-spacer/>
               <v-btn icon @click="addPermModel=false"><v-icon>mdi-close</v-icon></v-btn>
           </v-card-title>
           <v-card-text>
             <v-simple-table>
    <template v-slot:default>
      
      <tbody>
        <tr><th>Name</th><td>{{inquiry.name}}</td></tr>
        <tr><th>Gender</th><td>{{inquiry.gender}}</td></tr>
        <tr><th>Marital Status</th><td>{{inquiry.maritalstatus}}</td></tr>
        <tr><th>Phone number</th><td>{{inquiry.phonenumber}}</td></tr>
        <tr><th>Email</th><td>{{inquiry.email}}</td></tr>
        <tr><th>Province</th><td>{{inquiry.province}}</td></tr>
         <tr><th>District</th><td>{{inquiry.district}}</td></tr>
       <tr><th>City</th><td>{{inquiry.city}}</td></tr>
       <tr><th>Location</th><td>{{inquiry.location}}</td></tr>
       <tr><th>Service</th><td>{{inquiry.service ? inquiry.service.name: ''}}</td></tr>
       <tr><th>Service Type</th><td>{{inquiry.type ? inquiry.type.name : ''}}</td></tr>
       <tr><th>Product</th><td>{{inquiry.product ? inquiry.product.name:  ''}}</td></tr>
       <tr><th>Age</th><td>{{inquiry.age ? inquiry.age:  ''}}</td></tr>
       <tr><th>Communication Mode</th><td>{{inquiry.mode ? inquiry.mode:  ''}}</td></tr>
       <tr><th>Date</th><td>{{inquiry.calldate ? inquiry.calldate:  ''}}</td></tr>
       <tr><th>Time</th><td>{{inquiry.starttime ? inquiry.starttime:  ''}}-{{inquiry.endtime ? inquiry.endtime:  ''}}</td></tr>
       <tr><th>Issue</th><td v-html="inquiry.issue"></td></tr>
       <tr><th>Agent</th><td >{{inquiry.administrator ? inquiry.administrator.name  : ''}}</td></tr>
      </tbody>
    </template>
  </v-simple-table>
             
                      
                          
           </v-card-text>
       </v-card>
         
      </v-dialog>
  </div>
</template>

<script>
export default {
    props:['inquiry'],
    data(){
        return{
        addPermModel:false
        }
    }

}
</script>

<style>

</style>