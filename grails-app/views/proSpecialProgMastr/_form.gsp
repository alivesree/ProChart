<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-datetimepicker.css')}">
<script src="${resource(dir: 'js/calender', file:'moment.min.js')}"></script>
<script src="${resource(dir:'js',file:'bootstrap-datetimepicker.js')}"></script>
<script src="${resource(dir:'js',file:'validation.js')}"></script>



<script> 
  $(window).load(function() {    
                 $("#strttime").datetimepicker({format: 'DD-MM-YYYY HH:mm',useCurrent:false});                           
                 $("#endtime").datetimepicker({format: 'DD-MM-YYYY HH:mm',useCurrent:false});    
                 
            $('form').submit(function(){              
                   $('.btn-primary', this).attr('disabled', 'disabled');
              });
});  
     function check(){
                 var strtDt=($('#strtDtStr').val())
                 var endDt=($('#endDtStr').val())
     
            if(strtDt==""||endDt==""||$('#spclName').val()==""||$('#timAlloted').val()==""){
                swal ("Please fill required*");  
                return false
              }
              
                   if(endDt<=strtDt)
                      {
                          var notify = $.notify('Schedule is not correct',{offset: { x: 20, y: 70 }});
                          return false
                      }
          var dat = $('input[name="strtDtStr"],input[name="endDtStr"]').serialize();
          dat+='&id=${proSpecialProgMastrInstance?.id}';
          var flg=0;
                      $.ajax({
                      async:false,
                       url: "/ProChart/ProSpecialProgMastr/check",
                       type: 'POST',
                       data: dat
                   }).done(function(responce) {
                    if (responce=="noError"){
                      flg=1;
                    }
                    else{
                      $.notify('A program present in this time',{offset: { x: 20, y: 70 }});
                      return false
                   }
                  });
                  if(flg==1) return true

return false
  }
</script>

<div align="left" style="padding-left:15px;padding-right:15px;">
  <div  class="nav-tabs-custom" style="float: left; width: 100%;background-color: transparent;" >

    <div style="width: 100%;height:12px"></div> 
    
    <div class="row ">

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        Name<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-6" style="">
        <g:textField name="spclName" id="spclName" maxlength="30" required=""  class="form-control" value="${proSpecialProgMastrInstance?.spclName}"/>

      </div>      
    </div>

    <div style="width: 100%;height:12px"></div>  
    
    
    <div class="row ">

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        From<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-2" style="">
        <div class='input-group date' id="strttime">
        <g:textField name="strtDtStr"  id="strtDtStr" class="form-control" required=""	value="${proSpecialProgMastrInstance?.strtDtStr}" style="" />
          <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>
      </div>  

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
         <div style="position: relative;left: 113px;">To<font style="color: red;font-size: 16px;">*</font> </div>
      </div>

      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-2" style="">
        <div class='input-group date' id="endtime">
        <g:textField name="endDtStr"  id="endDtStr" class="form-control" required="" value="${proSpecialProgMastrInstance?.endDtStr}" style="" />
           <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>
      </div>      
    </div>
           

    <div style="width: 100%;height:12px"></div>  

    <div class="row ">

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        Allotted<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-4" style="">
        <input type="number" name="timAlloted"  id="timAlloted" class="form-control" required="" value="${proSpecialProgMastrInstance?.timAlloted}" style=""></input>      
      </div>  
      <font style="color: lightslategray;font-size: 10px;">Seconds</font>
    </div>

    <div style="width: 100%;height:12px"></div> 
  
      <div class="row ">

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        Description
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-4" style="">
          <g:textArea rows="2" name="descr" maxlength="100"  id="descr" class="form-control" value="${proSpecialProgMastrInstance?.descr}" style="" />
      </div>  
    </div>
    
    
  <div style="width: 100%;height:12px"></div>  
  
  </div>
</div>

