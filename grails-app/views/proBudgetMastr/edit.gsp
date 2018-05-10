<!DOCTYPE html>
<html>
  
  <head>      
    <meta name="layout" content="main">         

  </head>   
  <body>
           
     <div class="box box-primary" id="2">
            <div class="box-header with-border">
              <legend align="center">Budget</legend>
            </div>           
            <g:form url="[resource:proBudgetMastrInstance, action:'update']" method="PUT">
              
            <g:render template="form"/>
              <!-- /.box-body -->
              <div class="box-footer">               
                <g:actionSubmit class="btn btn-primary" action="update" value="Update" />
                <button onclick="return confirm('Are you sure to Delete!!?')"  class="btn btn-danger"  name="del" value="1" >  Delete  </button>       
                <g:link class="btn btn-info" action="index">Back</g:link>
              </div>
            </g:form>
     
          </div>   
  </body>
  
  
 
</html>
