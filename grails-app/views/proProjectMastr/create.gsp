<!DOCTYPE html>
<html>
  
  <head>      
    <meta name="layout" content="main">   
  </head>   
  <body>       
            
     <div class="box box-primary" id="2">
            <div class="box-header with-border">
              <legend align="center">Project</legend>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <g:form controller="ProProjectMastr" action="save">                 
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
