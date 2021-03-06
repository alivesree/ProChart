<link rel="stylesheet" href="${resource(dir: 'plug/datepicker', file: 'datepicker3.css')}">
<script src="${resource(dir:'plug/datepicker',file:'bootstrap-datepicker.js')}"></script>


<script src="${resource(dir:'js',file:'validation.js')}"></script>
<script> $(window).load(function() {         
                 $(".date").datepicker({
			
                        format : 'dd/mm/yyyy',
                        startDate: '-30y',
                        autoclose: true,
                        endDate: new Date(),
		});  
                 $(".Date").keyup(function(e){   //prevent alphabets from Date Entry
                      var key=String.fromCharCode(e.keyCode);
                      if(!(key>=0&&key<=9))$(this).val($(this).val().substr(0,$(this).val().length-1));
                      var value=$(this).val();
                      if(value.length==2||value.length==5)$(this).val($(this).val()+'/');
                }); 
          });
          </script>


<div align="left" style="padding-left:15px;padding-right:15px;">
  <div id="MasterSec" class="nav-tabs-custom" style="float: left; width: 100%;background-color: transparent;" >
    <div style="width: 100%;height:12px"></div>
     <div class="row ">
       
      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
       Employee ID
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
        <g:textField name="empId" id="empId" maxlength="20"  class="form-control" value="${hrEmpMstrInstance?.empId}"/>        
      </div>    
        <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
       Employee Type
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
        <g:select class="form-control" id="empTypeId" name="empTypeId" from="${com.htl.hr.det.HrEmpTypeMastr.createCriteria().list(){eq('delFlg','N')}}" optionKey="id" optionValue="empTypeDesc"  value="${hrEmpMstrInstance?.empType?.id}" noSelection="${['null':'']}" />
      </div>      
       </div>
    
     <div style="width: 100%;height:12px"></div>  
     
      <div class="row ">
      
      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
       Employee Name<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-8" style="">
        <g:textField name="empName" id="empName" required="" maxlength="50"  class="form-control" value="${hrEmpMstrInstance?.empName}"/>
        
      </div>      
       </div>
     
     
     <div style="width: 100%;height:12px"></div>    

         <div class="row ">
      
              <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">                
                 Date of Birth<font style="color: red;font-size: 16px;">*</font>
              </div>
              <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
                 <div class='input-group date'>
                      <g:textField name="dobStr" placeholder="DD/MM/YYYY" required="" id="dobStr" class="form-control Date"	value="${hrEmpMstrInstance?.dobStr}" style="" />
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>     
              </div>  

                <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                     Fathers Name
                </div>
           
                <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
                    <g:textField name="fatherName" id="fatherName"  maxlength="50"  class="form-control Date" value="${hrEmpMstrInstance?.fatherName}"/>
                </div>      
         </div>
     
     <div style="width: 100%;height:12px"></div>    

         <div class="row ">
      
              <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                 Designation
              </div>
              <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
               <g:select class="form-control" id="desigName" name="desigId" from="${com.htl.gen.det.GenDesigMastr.createCriteria().list(){eq('delFlg','N')}}" optionKey="id" optionValue="desigName"  value="${hrEmpMstrInstance?.desig?.id}" noSelection="${['null':'']}" />
              </div>  

                <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                     Department
                </div>
           
               <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
                 
                 <g:select class="form-control" id="depName" name="depId" from="${com.htl.gen.det.GenDepMstr.createCriteria().list(){eq('delFlg','N')}}" optionKey="id" optionValue="depName"  value="${hrEmpMstrInstance?.dep?.id}" noSelection="${['null':'']}" />
                 
               </div>      
         </div>
     
     <div style="width: 100%;height:12px"></div>  
     
      <div class="row ">
      
                <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                       Reporting to
                </div>
                <div class="col-md-3 col-sm-6  col-xs-12 col-lg-8" style="">
                   <g:textField type="number" name="reportTo" onkeypress="return number(event)" id="reportTo"  maxlength="20"  class="form-control" value="${hrEmpMstrInstance?.reportTo}"/>
        
                </div>      
       </div>
     
     
     <div style="width: 100%;height:12px"></div>    

         <div class="row ">
      
              <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                 Date of Join
              </div>
              <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
                 <div class='input-group date'>
                  <g:textField name="dojStr" placeholder="DD/MM/YYYY" id="dojStr" class="form-control"	value="${hrEmpMstrInstance?.dojStr}" style="" />
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>  
              </div>  
                <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                     District
                </div>
           
               <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
               <g:textField name="distrct" id="district"  maxlength="50" class="form-control" value="${hrEmpMstrInstance?.distrct}"/>
               </div>      
         </div>
     
     
        <div style="width: 100%;height:12px"></div>    

         <div class="row ">
      
              <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                 House Name
              </div>
              <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
                <g:textField name="bldngName" id="bldngName"  maxlength="50"  class="form-control" value="${hrEmpMstrInstance?.bldngName}"/>
              </div>  

                <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                     Place
                </div>
           
                <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
                    <g:textField name="place" id="place"  maxlength="50"  class="form-control" value="${hrEmpMstrInstance?.place}"/>
                </div>      
         </div>
     
        
        <div style="width: 100%;height:12px"></div>    

         <div class="row ">
      
              <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                 Post Office
              </div>
              <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
                <g:textField name="poDtls" id="poDtls"  maxlength="50"  class="form-control" value="${hrEmpMstrInstance?.poDtls}"/>
              </div>  

                <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                     Pin Code
                </div>
           
                <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
                    <g:textField name="pinCd" id="pinCd" onkeypress="return number(event)" maxlength="10" class="form-control" value="${hrEmpMstrInstance?.pinCd}"/>
                </div>      
         </div>
     
         <div style="width: 100%;height:12px"></div>    

         <div class="row ">
      
              <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                 State
              </div>
              <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
                <g:textField name="state" id="state"  maxlength="50"  class="form-control" value="${hrEmpMstrInstance?.state}"/>
              </div>  

                <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                     Country
                </div>
           
                <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
                    <g:textField name="country" id="country"  maxlength="50"  class="form-control" value="${hrEmpMstrInstance?.country}"/>
                </div>      
         </div>
     
         
          <div style="width: 100%;height:12px"></div>    

         <div class="row ">
      
              <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                 Mobile<font style="color: red;font-size: 16px;">*</font>
              </div>
              <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
                <g:textField type="number" name="mobNo" required="" onkeypress="return number(event)" id="mobNo"  maxlength="15"  class="form-control" value="${hrEmpMstrInstance?.mobNo}"/>
              </div>  

                <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                     Phone
                </div>
           
                <div class="col-md-3 col-sm-6  col-xs-12 col-lg-3" style="">
                   <g:textField type="number" name="landPhnNo" id="landPhnNo" onkeypress="return number(event)" maxlength="15"  class="form-control" value="${hrEmpMstrInstance?.landPhnNo}"/>
                </div>      
         </div>
          
           <div style="width: 100%;height:12px"></div>  
     
         <div class="row ">
      
                <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                       E-mail
                </div>
                <div class="col-md-3 col-sm-6  col-xs-12 col-lg-8" style="">
                   <g:textField name="email" id="email"  maxlength="100"  class="form-control" value="${hrEmpMstrInstance?.email}"/>
        
                </div>      
          </div>
           
           
           <div style="width: 100%;height:12px"></div>  
     
         <div class="row ">
      
                <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                       Status
                </div>
                <div class="col-md-3 col-sm-6  col-xs-12 col-lg-8" style="">
                     <label class="radio-inline">
                         <g:radio name="statsFlg" value="A"  required="" checked="${hrEmpMstrInstance?.statsFlg=="A"} checked" />Active
                     </label>
                     <label class="radio-inline">
                          <!--<g:radio name="statsFlg" value="{hrEmpMstrInstance?.statsFlg}"/>In Active-->
                       <g:radio name="statsFlg" value="N" checked="${hrEmpMstrInstance?.statsFlg=="N"}" />In Active
                     </label>
                </div>      
          </div>
           
             <div style="width: 100%;height:12px"></div>  
     
         <div class="row ">
      
                <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
                       Image
                </div>
                <div class="col-md-3 col-sm-6  col-xs-12 col-lg-8" style="">
<!--                     <input type="file" name="proPic1">                     -->
                 


                      <div class="fileinput fileinput-new" data-provides="fileinput">
                          <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                            <g:if test="${hrEmpMstrInstance?.picType.equals(null)}">
                              <img style="opacity:0.4;" src="data:image/png;base64,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" alt="Upload here">
                            </g:if>
                            <g:else>
                            <img id="img" src="${createLink(controller:'HrEmpMstr', action:'showimage', id:"${hrEmpMstrInstance?.id}")}" alt="Upload here">
                            </g:else>
                          </div>
                          <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
                          <div>
                            <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="proPic1"></span> 
                            <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                            
                          </div>
                          
                          <g:if test="${hrEmpMstrInstance?.picType!=null}">
                            <button type="button" onclick="imgDel()"  class="btn btn-default"><span>Remove Photo</span></button>
                          </g:if>
                        </div>
                </div>                                               
          </div>     
    </div>
  </div>