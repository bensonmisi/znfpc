<template>
  <div>
        <v-btn color="success" icon dark @click="fetch()"><v-icon>mdi-vector-link</v-icon></v-btn>
        <v-dialog v-model="showModel" width="800">
            <v-card>
                <v-card-title>
                    <i>{{itm.name}}</i> =>Service Types
                    <v-spacer/>
                    <div class="d-flex">
                        <TypeAdd :id="itm.id"/>
                        <v-btn icon depressed color="error" @click="showModel=false"><v-icon>mdi-close</v-icon></v-btn>
                    </div>
                </v-card-title>
                <v-card-text>
                 <v-simple-table>
                    <template v-slot:default>
                    <thead>
                        <tr>
                        <th class="text-left">
                            Name
                        </th>
                          <th class="text-right">
                           
                        </th>
                        </tr>
                    </thead>
                    <tbody>
                        <template v-if="items.length>0">
                        <tr
                        v-for="item in items"
                        :key="item.id"
                        >
                        <td>{{ item.name }}</td>
                        <td class="d-flex justify-end pt-2 pb-2">
                            <TypeEdit :type="item"/>
                            <TypeDelete :type="item"/>
                            <ProductView :type="item"/>
                        </td>
                        </tr>
                        </template>
                        <template v-else>
                            <tr>
                                <td colspan="2" class="text-center red--text">Not Service Type Found</td>
                            </tr>
                        </template>
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
    props:['itm'],
 data(){
     return{
         showModel:false,
     }
 },
 computed:{
     items(){
      return this.$store.state.type.types
     }
 },
 methods:{
 async fetch(){
    this.$store.dispatch('type/getTypes',this.itm.id)  
    this.showModel = true
   
 }},
}
</script>

<style>

</style>