<!DOCTYPE html>
<html>
  
  <head>      
    <meta name="layout" content="main">   

  </head>   
  <body>
           
     <div class="box box-primary" id="2">
            <div class="box-header with-border">
              <legend align="center">Program Day Settings</legend>
            </div>           
            <g:form url="[resource:proSpecialProgMastrInstance, action:'update']" method="PUT">
            <g:render template="form"/>
              <!-- /.box-body -->
              <div class="box-footer">               
                <g:actionSubmit class="btn btn-primary" onclick="return check();" value="Update" />
                <button onclick="return confirm('Are you sure to Delete!!?')"  class="btn btn-danger"  name="del" value="1" >  Delete  </button>       
                <g:link class="btn btn-info" action="index">Back</g:link>
              </div>
            </g:form>
     
          </div>   
  </body>
  
  
 
</html>
