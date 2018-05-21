<template>
<div>
	<v-flex v-for="item in items" :key="item.BOARD_NUM" v-on:click="test01(item.BOARD_NUM)">
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
import router from '@/router'

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
		test01:function(value){
			
			router.push({ name: 'Test03', params: { boardNum: value }, props: { boardNum: value }});
		}
	}		
}
</script>
