<!DOCTYPE html>
<html>
  
  <head>      
   <script type="text/javascript">
        
      $(document).ready(function() {  
$('form').submit(function(){
    $('button[type=submit]', this).attr('disabled', 'disabled');
});
});
     
    function Validate() {
        var password = document.getElementById("pswd").value;
        var confirmPassword = document.getElementById("cpswd").value;
        if (password != confirmPassword) {
            document.getElementById("pswdvalidation").innerHTML="Do not match!!";
           return false;
        }
        document.getElementById("pswdvalidation").innerHTML="";
       return true;
    }
       


</script>
   
   
    <meta name="layout" content="main">    
  </head>   
  <body>       
            
     <div class="box box-primary" id="2">
            <div class="box-header with-border">
              <legend align="center">Employee</legend>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <g:form controller="HrEmpMstr" action="save" enctype="multipart/form-data">                 
            <g:render template="form"/>
            <legend align="center">Create Login Account</legend>
            <g:render template="login"/>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" class="btn btn-primary" onclick="return Validate()">Save</button>
                <g:link class="btn btn-success" action="index">List</g:link>
              </div>
            </g:form>
          </div>   
     
  </body>
  
  
 
</html>
