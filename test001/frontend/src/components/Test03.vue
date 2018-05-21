<template>
<div>
    <v-form action="http://192.168.100.157:8085/test/card/regist" method="post" enctype="multipart/form-data" ref="t01">
        <v-text-field
          name="contents"
          v-model="contents"
          label="Label Text"
          multi-line
        ></v-text-field>
        <input type="file" name="files" ref="files" multiple >
        <input type="hidden" name="userId" value="kmw">
        <v-btn v-on:click="submitFile()"> submit
    </v-btn>
    </v-form>
     <v-carousel>
        <v-carousel-item v-for="(item,i) in photos" :src="'http://192.168.100.157:8085/test/cards/'+boardNum+'/photos/'+item.PHOTO_COUNT" :key="i"></v-carousel-item>
    </v-carousel> 
</div>
</template>
<script>
import router from '@/router'
export default {
    data(){
        return{
            contents:"",
            files:"",
            t01:"",
            boardNum:"",
            items:[],
            photos:[]
        }
    },
    beforeCreate:function(){
        console.log(isEmpty(this.$route.params));
        if(isEmpty(this.$route.params))
        {
            router.push({name: 'Test01'});
        }else{
            return;
        }    
    },
    created:function(value){
        this.boardNum=this.$route.params.boardNum;
        console.log("boardNum",this.boardNum);
        console.log(this.$route.params.boardNum);
        this.$http.get("http://192.168.100.157:8085/test/cards/"+this.$route.params.boardNum).then(function(response) {
                        this.items= response.data;
                        this.photos= response.data.photos;
                        this.contents=response.data.card.CONTENTS;

                    console.log("r1",this.items);
                    }.bind(this));
    },
  methods:{
      submitFile:function(){
      }
  }
}

function isEmpty(obj) {
    for(var prop in obj) {
        if(obj.hasOwnProperty(prop))
            return false;
    }

    return true;
}

</script>
