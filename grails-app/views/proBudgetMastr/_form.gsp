<link rel="stylesheet" href="${resource(dir: 'plug/datepicker', file: 'datepicker3.css')}">
<script src="${resource(dir:'plug/datepicker',file:'bootstrap-datepicker.js')}"></script>
<script src="${resource(dir:'js',file:'validation.js')}"></script>


<script> $(window).load(function() {         
                
                 $(".date").datepicker({
                        format : 'dd-mm-yyyy',
                        startDate: '-30y',
                        autoclose: true,
                });     
                  $(".Date").keyup(function(e){
                      var key=String.fromCharCode(e.keyCode);
                      if(!(key>=0&&key<=9))$(this).val($(this).val().substr(0,$(this).val().length-1));
                      var value=$(this).val();
                      if(value.length==2||value.length==5)$(this).val($(this).val()+'-');
                }); 
                
              $('form').submit(function(){
                if($("#proj").val()=="null") {
                     var notify = $.notify('Please select Project',{offset: { x: 20, y: 70 }});
                     return false
                }             
                           var strtDt=($('#strtDtStr').val()).substring(6, 10)+"-"+($('#strtDtStr').val()).substring(3, 5)+"-"+($('#strtDtStr').val()).substring(0, 2);
                           var endDt=($('#endDtStr').val()).substring(6, 10)+"-"+($('#endDtStr').val()).substring(3, 5)+"-"+($('#endDtStr').val()).substring(0, 2);
                            if(endDt<=strtDt)
                              {
                                  var notify = $.notify('Schedule is not correct',{offset: { x: 20, y: 70 }});
                                  return false
                              }
                              else
                             $('.btn-primary', this).attr('disabled', 'disabled');
              });

          });


</script>

<div align="left" style="padding-left:15px;padding-right:15px;">
  <div class="nav-tabs-custom" style="float: left; width: 100%;background-color: transparent;" >

    <div style="width: 100%;height:12px"></div>  

    <div class="row ">

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        Name<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-6" style="">
        <g:textField name="bdgtName" id="bdgtName" maxlength="20" required=""  class="form-control" value="${proBudgetMastrInstance?.bdgtName}"/>

      </div>      
    </div>
        <div style="width: 100%;height:12px"></div>  

    <div class="row ">

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        Amount<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-6" style="">
        <g:textField name="bdgtAmt" id="bdgtAmt" onkeypress="return number(event)" maxlength="20" required=""  class="form-control" value="${proBudgetMastrInstance?.bdgtAmt}"/>

      </div>      
    </div>


    <div style="width: 100%;height:12px"></div>  

    <div class="row ">

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        Project<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-6" style="">
       <g:select class="form-control" id="proj" name="proj" from="${com.htl.pro.det.ProProjectMastr.createCriteria().list(){eq('delFlg','N')}}" optionKey="id" optionValue="projName"  value="${proBudgetMastrInstance?.proj?.id}" noSelection="${['null':'']}" />
      </div>  
    </div>

    <div style="width: 100%;height:12px"></div>  

    <div class="row ">

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        Mode<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-4" style="">
        <label class="radio-inline">
          <g:radio name="bdgtMode" value="R"  checked="${proBudgetMastrInstance?.bdgtMode=="R"} checked" />Running
        </label>
        <label class="radio-inline">
             <!--<g:radio name="statsFlg" value="{hrEmpMstrInstance?.statsFlg}"/>In Active-->
          <g:radio name="bdgtMode" value="F" checked="${proBudgetMastrInstance?.bdgtMode=="F"}" />Finished
        </label>

      </div>  
    </div>

    <div style="width: 100%;height:12px"></div> 

    <div class="row ">

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        From<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-2" style="">
          <div class='input-group date' class="date">
        <g:textField placeholder="DD-MM-YYYY" name="strtDtStr" maxlength="10" id="strtDtStr" class="form-control Date" required="" value="${proBudgetMastrInstance?.strtDtStr}" style="" />
         <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>        
      </div>  

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        <div style="position: relative;left: 113px;">  To<font style="color: red;font-size: 16px;">*</font> </div>
      </div>

      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-2" style="">
        <div class='input-group date' class="date">
        <g:textField placeholder="DD-MM-YYYY" name="endDtStr" maxlength="10" id="endDtStr" class="form-control Date" required="" value="${proBudgetMastrInstance?.endDtStr}" style="" />
         <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>
      </div>      
    </div>

    <div style="width: 100%;height:12px"></div> 

  </div>

</div>

