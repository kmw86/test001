<template>
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
</template>
<script>
export default {
    data(){
        return{
            contents:"",
            files:"",
            t01:""
        }
    },
  methods:{
      submitFile:function(){
        //   var jbAry = new Array();
        //   var formData=new FormData();
        //   formData.append("userId",'kmw');
        //   formData.append("contents",this.contents);
        //   for( var i = 0; i < this.$refs.files.files.length; i++ ){
                
        //       jbAry.push(this.$refs.files.files[i]);
        //    }           
        //   formData.append('files',jbAry);

            //폼객체를 불러와서
            var form = this.$refs.t01.$el;
            console.log(form);
            //FormData parameter에 담아줌
            var formData = new FormData(form);  
        console.log(formData);

          this.$http.post("http://192.168.100.157:8085/test/card/regist",formData,{headers: {'Content-Type': 'multipart/form-data'}}).then(function(response) {
					
				console.log("response",response);
				});
      }
  }
}
</script>
