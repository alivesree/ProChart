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
              <legend align="center">Department</legend>
            </div>           
            <g:form url="[resource:genDepMstrInstance, action:'update']" method="PUT">
              <!--<g:hiddenField name="version" value="{genDepMstrInstance?.version}" />-->
            <g:render template="form"/>
              <!-- /.box-body -->
              <div class="box-footer">               
                <g:actionSubmit class="btn btn-primary save" action="update" value="Update" />
                <button class="btn btn-danger"  name="del" value="true" onclick="return confirm('Are you sure to Delete!!?')" >  Delete  </button>       
                <g:link class="btn btn-info" action="index">Back</g:link>
              </div>
            </g:form>
     
          </div>   
  </body>
  
  
 
</html>
