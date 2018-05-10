<link rel="stylesheet" href="${resource(dir: 'plug/datepicker', file: 'datepicker3.css')}">
<script src="${resource(dir:'plug/datepicker',file:'bootstrap-datepicker.js')}"></script>
<script src="${resource(dir:'js',file:'validation.js')}"></script>

<style>
@media only screen and (max-width : 376px) {
#myModal{
    Width:100%;
    Height: 160px;
    position: absolute;
    left:0%;
    top: 20%;
    background-color: rgba(10, 0, 0, 0.2);
    color: white;
    }
  }
  @media only screen and (min-width : 376px) {
    #myModal{    
      width: 100%;
      Height: 30%;
      position: absolute;
      left: 0%;
      top: 20%;
      background-color: rgba(10, 0, 0, 0.2);
      color: white;
      }
    }
    @media only screen and (min-width : 768px){
      #myModal{
          width: 40%;
          Height: 40%;
          position: absolute;
          left: 25%;
          top: 33%;
          background-color: rgba(10, 0, 0, 0.2);
          color: white;
          }
  }
</style>

<script>
  $(window).load(function() {  
  
                $('#CatName').keypress(function(event){
                  if (event.keyCode == 10 || event.keyCode == 13) 
                      event.preventDefault();
                });      
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
                
                $( "#addBtn,#Cback").click(function() {
                        $("#myModal").modal("toggle");
                  });         

          });

              $('form').submit(function(){
                if($("#catg").val()=="null") {
                     var notify = $.notify('Please select category',{offset: { x: 20, y: 70 }});
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

                   function save() {   
                             if($('#CatName').val()!="")
                               {
                                 $('#Csave').attr('disabled', 'disabled');                                 
                                  $.ajax({
                                        url: "/ProChart/proProjCatagMastr/save",
                                        type: 'POST',
                                        data: {catgName: $('#CatName').val()}
                                    }).done(function(responce) {                                         
                                       if(responce=="Saved") location.reload();
                                       else{
                                         $('#Csave').removeAttr('disabled');                              
                                         alert (responce);
                                       }
                                       });  
                                  }
                    }     
</script>

<div align="left" style="padding-left:15px;padding-right:15px;">
  <div id="ProMstr" class="nav-tabs-custom" style="float: left; width: 100%;background-color: transparent;" >

    <div style="width: 100%;height:12px"></div>  

    <div class="row ">
      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        Name<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-6" style="">
        <g:textField name="projName" id="projName" maxlength="20" required=""  class="form-control" value="${proProjectMastrInstance?.projName}"/>
      </div>      
    </div>

    <div style="width: 100%;height:12px"></div>  

    <div class="row ">
      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        Category<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-6" style="">
        <g:select class="form-control" id="catg" name="catg" from="${com.htl.pro.det.ProProjCatagMastr.createCriteria().list(){eq('delFlg','N')}}" optionKey="id" optionValue="catgName"  value="${proProjectMastrInstance?.catg?.id}" noSelection="${['null':'']}" />
      </div>  
      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        <button id="addBtn" type="button" style="border-radius:28px; 	border:1px solid #48adf0;"  class="btn">+</button>
      </div>
    </div>

    <div style="width: 100%;height:12px"></div>  

    <div class="row ">
      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        Mode<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-4" style="">
        <label class="radio-inline">
          <g:radio name="projMode" value="R"  checked="${proProjectMastrInstance?.projMode=="R"} checked" />Running
        </label>
        <label class="radio-inline">
          <g:radio name="projMode" value="F" checked="${proProjectMastrInstance?.projMode=="F"}" />Finished
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
        <g:textField placeholder="DD-MM-YYYY" name="strtDtStr" maxlength="10" id="strtDtStr" class="form-control Date" required="" value="${proProjectMastrInstance?.strtDtStr}" style="" />
         <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>
      </div>  
      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        <div style="position: relative;left: 113px;">To<font style="color: red;font-size: 16px;">*</font> </div>
      </div>

      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-2" style="">
        <div class='input-group date' class="date">
        <g:textField placeholder="DD-MM-YYYY" name="endDtStr" maxlength="10" id="endDtStr" class="form-control Date" required="" value="${proProjectMastrInstance?.endDtStr}" style="" />
         <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>
      </div>      
    </div>

    <div style="width: 100%;height:12px"></div> 

  </div>

  <div id="myModal" class="modal fade" style="display: none;">
    <div style="padding-left: 10px;">
      <div class="row">
        <div style="width: 100%;height:12px"></div> 
        <div class="col-md-4 col-sm-6  col-xs-12 col-lg-3" style="">
          Name
        </div>
        <div class="col-md-3 col-sm-6  col-xs-12 col-lg-7" style="">
          <g:textField class="form-control" name="CatName" id="CatName" style="color:black;" maxlength="20" placeholder="Enter Category Name" />
        </div>   
      </div>

      <div style="width: 100%;height:12px"></div> 


      <div class="row">
        <div class="col-md-4 col-sm-6  col-xs-12 col-lg-3" style="">        
        </div>
        <button id="Csave" onclick="save()" type="button" class="btn btn-primary" style="margin-left: 14px;">Save</button>
        <button id="Cback" type="button"  class="btn btn-info">Back</button>
      </div>
    </div>
  </div>
</div>

