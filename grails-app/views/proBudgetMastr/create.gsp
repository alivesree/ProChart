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
            <!-- /.box-header -->
            <!-- form start -->
            <g:form controller="ProBudgetMastr" action="save">                 
            <g:render template="form"/>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" class="btn btn-primary" onclick="return Validate()">Save</button>
                <g:link class="btn btn-success" action="index">List</g:link>
              </div>
            </g:form>
          </div>   
     
  </body>
  
  
 
</html>
