<template>
<div>
	<v-flex v-for="item in items" :key="item.BOARD_NUM">
		<v-card> 
			<v-card-title primary-title>{{item.BOARD_NUM}}</v-card-title>
			  <v-card-text>{{item.CONTENTS}}</v-card-text>
		</v-card>
	</v-flex>
	<router-link to="/2/02">
    <v-btn
		color="blue"
		dark
		bottom
		right
		fab
		fixed
    >
    <v-icon>edit</v-icon>
    </v-btn> 
	</router-link>
</div>
</template>
<script>

export default {
  name: 'Test01',
  data :function(){
			return{
			items:[]
			}
			},
  created:function(value){
				console.log(this);
				this.$http.get("http://192.168.100.157:8085/test/method01").then(function(response) {
					this.items= response.data;
				console.log("r1",this.items);
				}.bind(this));
				},
	methods	:{
		test:function(){
		}
	}		
}
</script>
