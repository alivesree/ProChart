<link rel="stylesheet" href="${resource(dir: 'plug/datepicker', file: 'datepicker3.css')}">
<link rel="stylesheet" href="${resource(dir: 'js/calender', file:'fullcalendar.min.css')}">
<!--<link rel="stylesheet" href="{resource(dir: 'plug/datepicker', file:'fullcalendar.print.css')}" media="print">-->
<script src="${resource(dir: 'js/calender', file:'moment.min.js')}"></script>
<script src="${resource(dir: 'js/calender', file:'fullcalendar.js')}"></script>
<script src="${resource(dir:'plug/datepicker',file:'bootstrap-datepicker.js')}"></script>
<script src="${resource(dir:'js',file:'validation.js')}"></script>
<style>
  @media only screen and (max-width : 376px) {
    #myModal{
        Width:100%;
        Height: 190px;
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
    Height: 29%;
    position: absolute;
    left: 0%;
    top: 10%;
    background-color: rgba(10, 0, 0, 0.2);
    color: white;
    }
    }
  @media only screen and (min-width : 768px){
    #myModal{
    width: 40%;
    Height: 22%;
    position: absolute;
    left: 37%;
    top: 40%;
    background-color: rgba(10, 0, 0, 0.2);
    color: white;
  }
  }
</style>
<script> 
  $(document).ready(function() { 
               
              $('form').submit(function(){
                  $('.btn-primary', this).attr('disabled', 'disabled');
              });
   
              $(".Date").keyup(function(e){   //prevent alphabets from Date Entry
                      var key=String.fromCharCode(e.keyCode);
                      if(!(key>=0&&key<=9))$(this).val($(this).val().substr(0,$(this).val().length-1));
                      var value=$(this).val();
                      if(value.length==2||value.length==5)$(this).val($(this).val()+'-');
                }); 
   
                $('#remark').keypress(function(event){

                  if (event.keyCode == 10 || event.keyCode == 13) 
                      event.preventDefault();

                });         
                 $("#strtDate").datepicker({
                        format : 'mm-dd-yyyy',
                        startDate: '-30y',
                        autoclose: true,
                        //onClick: alert("asdf"),
                }).on("changeDate", function (e) {                     
                        dt=new Date($("#strtDtStr").val());                                                
                        var dd = dt.getDate()+1;
                        if(dd=="32")dd--;
                        var mm = dt.getMonth()+1;
                        var yy = dt.getFullYear();
                        dt=mm+"-"+dd+"-"+yy;                        
                      $('#calendar').fullCalendar('gotoDate', dt);
                  });           

            $("#endDate").datepicker({
                        format : 'mm-dd-yyyy',
                        startDate: '-30y',
                        autoclose: true,                        
                });    
                    $( "#Eback").click(function() {                      
                        $("#myModal").modal("toggle");
                        $('#Esave').removeAttr('disabled'); 
                  }); 
                  
              $( "#Esave" ).click(function() {           
                $("#Esave").attr('disabled', 'disabled');
                      var title = ($('#remark').val());                                                                                          
                      endDt=new Date($('#endDtStr').val());                                                     

                      strt=new Date(strt);
                      var flag=0;
                      if(!$("#RptChk").is(":checked")) flag=1;

                           while(strt<=endDt){                                                                                                                                 
                                if (title) {
                                         $('#calendar').fullCalendar('renderEvent',
                                                {
                                                        title: title,
                                                        start: strt,                                                        							
                                                        allDay:true
                                                },
                                                true // make the event "stick"
                                        );
                                }                                
                                strt.setDate(strt.getDate()+7);
                                if(flag==1) break;
                           }
                           strt.setDate(strt.getDate()-7);
                            var dd = strt.getDate();                              
                            var mm = strt.getMonth()+1;
                            var yy = strt.getFullYear();
                            strt=mm+"-"+dd+"-"+yy;
                            $('#endDtStr').val(strt); 
                             $("#myModal").modal("toggle");
                  }); 
         

                  

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date();
    var d = date.getDate(),
        m = date.getMonth(),
        y = date.getFullYear();
    var strt=null;
    
    var calendar = $('#calendar').fullCalendar({
      
                        aspectRatio: 2.8,
                        header: {
                                left: 'prev,today,next',
                                center: 'title',
                                right: 'prevYear,month,agendaWeek,nextYear'
                        },
                        selectable: true,
                        selectHelper: true,
                        select: function(start) {       
                            calendar.fullCalendar('removeEvents');                                                                   
                            if($('#strtDtStr').val()==""||$('#endDtStr').val()==""){                                                    
                                $.notify('Enter starting Date and End Date',{offset: { x: 20, y: 70 }});
                                return
                            }
                           start=new Date(start);
                            start.setHours(0,0);           

                            var dd = start.getDate();                              
                            var mm = start.getMonth()+1;
                            var yy = start.getFullYear();
                            start=mm+"-"+dd+"-"+yy;  
                            $('#strtDtStr').val(start);
                            strtDt=new Date($('#strtDtStr').val());
                            endDt=new Date($('#endDtStr').val());                        
                            if(endDt<strtDt)
                              {
                                  var notify = $.notify('Range is not correct',{offset: { x: 20, y: 70 }});
                                  return
                              }
                            strt=start;
                             $('#remark').val("");  
                             $("#myModal").modal("toggle");
                             $('#Esave').removeAttr('disabled'); 
                        },
                        editable: true,

                });
                

                if($('#remark').val()!=""){
                i=new Date($('#strtDtStr').val());
                j=new Date($('#endDtStr').val()); 
                    var dd = i.getDate()+1;
                    var mm = i.getMonth()+1;
                    var yy = i.getFullYear();
                    dt=mm+"-"+dd+"-"+yy;                       
                   $('#calendar').fullCalendar('gotoDate', dt);
                   
                   while(i<=j){                                                                                                                                                                 
                      $('#calendar').fullCalendar('renderEvent',
                             {
                                     title: $('#remark').val(),
                                     start: i,                                                        							
                                     allDay:true
                             },
                             true // make the event "stick"
                     );                                                                
                       i.setDate(i.getDate()+7);                                
                    }
                   
                      $("#RptChk").attr("checked","true");
                 }                                  
          });
          function check(){
                    if($('#dayName').val()==""||$('#strtDtStr').val()==""||$('#endDtStr').val()==""){
                        var notify = $.notify('Please fill required!!!',{offset: { x: 20, y: 70 }}); 
                        return false;
                    }
                          if($('#remark').val()==""){
                            var notify = $.notify('Enter an event',{offset: { x: 20, y: 70 }}); 
                            return false;
                          }
                          var flg=0;
                      $.ajax({
                      async:false,
                       url: "/ProChart/ProProgDaySetngDtls/check",
                       type: 'POST',
                       data: {id:"${proProgDaySetngMatrInstance?.id}",dayName:$('#dayName').val()}
                   }).done(function(responce) {
                     if(responce=="err")
                       {
                         $.notify('Name should be unique',{offset: { x: 20, y: 70 }});
                         flg=1
                       }                       
                       }); 
                       if(flg==1) return false
                       else return true
          }
</script>

<div align="left" style="padding-left:15px;padding-right:15px;">
  <div id="frm" class="nav-tabs-custom" style="float: left; width: 100%;background-color: transparent;" >

    <div style="width: 100%;height:12px"></div>  

    <div class="row ">

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        Name<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-6" style="">
        <g:textField name="dayName" id="dayName" maxlength="20" required=""  class="form-control" value="${proProgDaySetngMatrInstance?.dayName}"/>

      </div>      
    </div>

    <div style="width: 100%;height:12px"></div>  

    <div class="row ">

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        From<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-2" style="">
          <div class='input-group date' id="strtDate">
        <g:textField placeholder="MM-DD-YYYY" name="strtDtStr" maxlength="10" id="strtDtStr" class="form-control Date" required="" value="${proProgDaySetngMatrInstance?.strtDtStr}" style="" />
         <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>        
      </div>  

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        <div style="position: relative;left: 113px;">  To<font style="color: red;font-size: 16px;">*</font> </div>
      </div>

      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-2" style="">
        <div class='input-group date' id="endDate">
        <g:textField placeholder="MM-DD-YYYY" name="endDtStr" maxlength="10" id="endDtStr" class="form-control Date" required="" value="${proProgDaySetngMatrInstance?.endDtStr}" style="" />
         <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>
      </div>      
    </div>

    <div style="width: 100%;height:12px"></div> 
    <div class="row ">
      <div class="col-md-12 col-sm-12  col-xs-12 col-lg-12" style="">                           
        <div id="calendar"></div>
      </div>       
    </div>


  </div>


  <div class="modal fade" id="myModal" style="display: none;">
    <div style="padding-left: 10px;">
      <div class="row">
        <div style="width: 100%;height:12px"></div> 
        <div class="col-md-4 col-sm-6  col-xs-12 col-lg-4" style="">
          Event Description
        </div>
        <div class="col-md-3 col-sm-6  col-xs-11 col-lg-8" style="">
          <g:textField class="form-control" style="color:black;" name="remark" id="remark"  maxlength="20" placeholder="Describe Here" value="${proProgDaySetngMatrInstance?.remarkStr}" />

        </div>   
      </div>

      <div style="width: 100%;height:12px"></div> 


      <div class="row">
        <div class="col-md-4 col-sm-6  col-xs-12 col-lg-4" style="">
          Repeat Event
        </div>
        <div class="col-md-3 col-sm-6  col-xs-12 col-lg-4" style="">        
          <g:checkBox name="RptChk" id="RptChk" checked="false" />       
        </div>  
      </div>
      <div style="width: 100%;height:12px"></div> 
      <div class="row">
        <div class="col-md-4 col-sm-6  col-xs-12 col-lg-4" style="">        
        </div>
        <button id="Esave"  type="button" class="btn btn-primary" style="margin-left: 14px;">Save</button>
        <button id="Eback" type="button"  class="btn btn-info">Back</button>
      </div>
    </div>
  </div>

</div>


