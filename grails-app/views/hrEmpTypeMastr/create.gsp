<!DOCTYPE html>
<html>
  
  <head>      
    <meta name="layout" content="main">    
         <script>
            $(document).ready(function() {  
              $('form').submit(function(){
                  $('.btn-primary', this).attr('disabled', 'disabled');
              });
              //funtion(){}
              });
        </script>
  </head>   
  <body>

     <div class="box box-primary" id="2">
            <div class="box-header with-border">
              <legend align="center">Employee Type</legend>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <g:form controller="HrEmpTypeMastr" action="save">
            <g:render template="form"/>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Save</button>
                <g:link class="btn btn-success" action="index">List</g:link>
              </div>
            </g:form>
          </div>   
     
  </body>
  
  
 
</html>
