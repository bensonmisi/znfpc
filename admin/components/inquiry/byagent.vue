<template>
  <div>
      <v-btn x-small depressed color="info" @click="addPermModel=true">View</v-btn>
   
      <v-dialog v-model="addPermModel" width="900">
        
                <v-card>
                <v-card-title>
                  Report By Agent
                </v-card-title>
                <v-card-text>
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
                        <th class="text-right">
                           
                        </th>
                        </tr>
                    </thead>
                    <tbody>
                        <template v-if="inquiries.length>0">
                        <tr
                        v-for="per in inquiries"
                        :key="per.id"
                        >
                        <td>{{ per.created_at }}</td>
                        <td>{{ per.name }}</td>
                          <td>{{ per.city }}</td>
                            <td>{{ per.location }}</td>
                              <td>{{ per.service.name }}</td>
                              <td>{{ per.type.name||'' }}</td>
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
       
      </v-dialog>
           <v-overlay :value="overlay">
      <v-progress-circular
        indeterminate
        size="64"
      ></v-progress-circular>
    </v-overlay>
  </div>
</template>

<script>
export default {
layout:'user',
props:['id'],
data(){
    return{
        overlay:false,
        addPermModel:false
    }
},
async fetch(){
    this.overlay=true
   await this.$store.dispatch('inquiry/getByAgent',this.id) 
   this.overlay = false
},computed:{
    inquiries(){
        return this.$store.state.inquiry.inquires
    }
}
}
</script>

<style>

</style>