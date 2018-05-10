<!DOCTYPE html>
<html>
  
  <head>      
    <meta name="layout" content="main">    
  </head>   
  <body>       
            
     <div class="box box-primary" id="2">
            <div class="box-header with-border">
              <legend align="center">Program Setting</legend>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <g:form controller="proProgSettingMastr" action="save" id="form">                 
            <g:render template="form"/>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" class="btn btn-primary" onclick="return check();">Save</button>
                <g:link class="btn btn-success" action="index">List</g:link>
              </div>
            </g:form>
          </div>   
     
  </body>
  
  
 
</html>
