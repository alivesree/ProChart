
<div align="left" style="padding-left:15px;padding-right:15px;">
  <div id="MasterSec" class="nav-tabs-custom" style="float: left; width: 100%;background-color: transparent;" >
   
     <div style="width: 100%;height:12px"></div>  
     
      <div class="row ">
      
      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
       User Name<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-4" style="">
        <g:textField name="usrName" id="usrName" maxlength="20" required=""  class="form-control" value="${userInstance?.usrCd}"/>
        
      </div>      
       </div>
     
      <div style="width: 100%;height:12px"></div>  
     
      <div class="row ">
      
      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
         Password<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-4" style="">
        <g:passwordField name="userPaswrd1" id="pswd"  maxlength="50" required="" value="${null}" class="form-control"/>
        
      </div>      
       </div>
      
       <div style="width: 100%;height:12px"></div>  
     
      <div class="row ">
      
      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
       Confirm Password<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-4" style="">
        <g:passwordField name="userPaswrd" id="cpswd"  maxlength="50" value="${null}" onkeyup="Validate()" class="form-control"/>
        
      </div>  <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" id="pswdvalidation">
       
      </div>    
       </div>
   
<div style="width: 100%;height:12px"></div> 
     
    </div>
  </div>


