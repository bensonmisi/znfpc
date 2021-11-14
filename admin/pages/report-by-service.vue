<template>
    <v-container>
      <v-row>
          <v-col>
              <v-card>
                  <v-card-text class="d-flex">
                      <v-btn text to="dashboard">Dashboard</v-btn>
                       <v-btn text disabled>Report By Service</v-btn>
                  </v-card-text>
              </v-card>
          </v-col>
      </v-row>
      <v-row class="mt-5">
          <v-col>
                <v-card>
                <v-card-title>
                   Report By Service
                    <v-spacer/>
                </v-card-title>
                <v-card-text>
                 <v-simple-table>
                    <template v-slot:default>
                    <thead>
                        <tr>
                        <th class="text-left">
                            Name
                        </th>
                             <th class="text-left">
                            Entries
                        </th>
                        <th class="text-right">
                           
                        </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                        v-for="per in agents"
                        :key="per.id"
                        >
                        <td>{{ per.name }} </td>
                         <td>{{ per.inquiries.length }}</td>
                        <td class="d-flex justify-end pt-2 pb-2">
                          <InquiryByservice :id="per.id"/>
                        </td>
                        </tr>
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
export default {
layout:'user',
data(){
    return{
        overlay:false,
        agents:[]
    }
},
async fetch(){
    this.overlay=true
     this.$axios.get('api/admin/report/ByService').then((res)=>{
     this.agents = res.data
      this.overlay = false
   })
  
}
}
</script>

<style>

</style>