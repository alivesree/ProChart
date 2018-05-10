<link rel="stylesheet" href="${resource(dir: 'plug/datepicker', file: 'datepicker3.css')}">
<link rel="stylesheet" href="${resource(dir: 'js/calender', file:'fullcalendar.min.css')}">
<link rel="stylesheet" href="${resource(dir: 'css', file:'select2.min.css')}">
<link rel="stylesheet" href="${resource(dir: 'css', file:'bootstrap-timepicker.min.css')}">
<script src="${resource(dir: 'js/calender', file:'moment.min.js')}"></script>
<script src="${resource(dir: 'js/calender', file:'fullcalendar.js')}"></script>
<script src="${resource(dir:'plug/datepicker',file:'bootstrap-datepicker.js')}"></script>
<script src="${resource(dir:'js',file:'validation.js')}"></script>
<script src="${resource(dir:'js',file:'select2.full.min.js')}"></script>
<script src="${resource(dir:'js',file:'bootstrap-timepicker.js')}"></script>

<script>
  $(document).ready(function(){
                $('form').submit(function(){
                  $('.btn-primary', this).attr('disabled', 'disabled');
              });
    $('.time').timepicker({defaultTime: false,showMeridian: false});
    $("#dayNameId").select2({
      placeholder: "Select program Day",
    });
    $("#combo_0").select2({
          placeholder: "Select program",
    });
$('#myModal').on('hidden.bs.modal', function () {
   clear();
});

            $("#progNameCmbo").select2({
                            placeholder: "Select a program to Edit",
                          allowClear: true
            });
            
    $("#progNameCmbo").on("select2:unselecting", function(){ clear(); });
    
    $("#progNameCmbo").on("change", function() {        
      var getDescId=$(this).val();
       $.ajax({
           url: "/ProChart/proProgSettingMastr/getData",
           type: 'GET', 
           data:{getDescId}
       }).done(function(response) {  
         $("#progName").val(response[0].progName);
         $("#progDesc").val(response[0].progDesc); 
         $("#modelBtn").text('Update');
         $("#modelBtn").removeAttr("onclick");
         $("#modelBtn").attr("onclick",'save("updt");');
         $("#deleteBtn").show();
     }); 
  });
    
                    $('#progName,#progDesc').keypress(function(event){
                  if (event.keyCode == 10 || event.keyCode == 13) 
                      event.preventDefault();
                }); 
    
  });
  
  function check(){
      
      if($("#dayNameId").val()==null){
        swal ("Please fill required*");  
        return false
       }
        var rn= parseInt($("#rowNo").val()); 
        for(var i=0;i<=rn;i++)
        {
            $('tbody tr').css('background-color', '');
              if($("#strtTim_"+i).val()==''||$("#endTim_"+i).val()==''||$("#combo_"+i).val()==''){
                    $('tbody tr').eq(i).css('background-color', '#f2dede !important');
                    swal ("Please fill required*");    
                    return false;  
              }  
              if($("#strtTim_"+i).val()==$("#endTim_"+i).val()){
              $('tbody tr').eq(i).css('background-color', '#f2dede !important');
              swal ("Timing is not correct*");    
              return false;  
              }  
              var d1 = new Date('2000-01-01 '+$("#strtTim_"+i).val());
              var d2 = new Date('2000-01-01 '+$("#endTim_"+i).val());
              var dif =  (d2- d1)/60000;
              if(dif<0){
                  swal ("Time Range is not correct!!"); 
                  $('tbody tr').eq(i).css('background-color', '#f2dede !important');
                  return false;
              }
                for(var j=i+1;j<=rn;j++)
                  {                
                    var D1 = new Date('2000-01-01 '+$("#strtTim_"+(j)).val());
                    var D2 = new Date('2000-01-01 '+$("#endTim_"+(j)).val());           
                    if(D1>d1&&D1<d2||D2>d1&&D2<d2  ||  d1>D1&&d1<D2||d2>D1&&d2<D2 || d1.getTime()==D1.getTime()&&d2.getTime()==D2.getTime()){                  
                      $('tbody tr').eq(j).css('background-color', '#f2dede !important');
                      swal ("Duplicate Timing"); 
                      return false
                    }
                  }
        }    
        //return false
//          var strtTim=['0'];
//          strtTim+=$('input[name="strtTim"]').serialize();
          var dat = $('input[name="strtTim"],input[name="endTim"],#dayNameId,#rowNo').serialize();
          dat+='&dayNameId=';      //to make these as an array if it has only one value
          dat+='&progStngId=${progSettingMastrInstance?.id}';
          //return false
          var flg=0;
                      $.ajax({
                      async:false,
                       url: "/ProChart/proProgSettingMastr/check",
                       type: 'POST',
                       data: dat
                   }).done(function(responce) {  
                    if (responce=="noError"){
                      $('tbody tr').css('background-color', '');
                      flg=1;
                    }
                    else{
                    $('tbody tr').css('background-color', '');
                    $('tbody tr').eq(responce).css('background-color', '#f2dede !important');
                      $.notify('A program present in this time',{offset: { x: 20, y: 70 }});
                      return false
                   }
                  });
                  if(flg==1) return true

return false
  }
  
  function addrow(){
  
      var rn= parseInt($("#rowNo").val());  
        //$("#row_"+rn).removeAttr('onclick');   
        $("#rowNo").val(++rn);             
        var string='<div class="col-md-3 col-sm-6  col-xs-12 col-lg-10" style="">'
                +'<select name="progNameId" class="form-control progNam" id="combo_'+rn+'"></select></div>';
        $("#tblRow").append('<tr><td>'+string+'</td>'+
              '<td><div class="col-xs-6"><div class="input-group bootstrap-timepicker timepicker"><input id="strtTim_'+rn+'" type="text" name="strtTim" class="form-control input-small time"><span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span></div></div></td>' +                   
                '<td><div class="col-xs-6">'+
                 '<div class="input-group bootstrap-timepicker timepicker"><input type="text" name="endTim" id="endTim_'+rn+'" class="form-control input-small time"><span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span></div></div></td></tr>' ); 

            $('.time').timepicker({defaultTime: false,showMeridian: false});
            var $options = $("#combo_0 > option").clone();  
            $('#combo_'+rn).append($options);
            $('#combo_'+rn).select2({placeholder: "Select program"});
            $('#combo_'+rn).val('').trigger('change');
  }

  function getList(){          
       $.ajax({
           url: "/ProChart/proProgSettingMastr/getData",
           type: 'GET'           
       }).done(function(response) { 
         $(".progNam").empty();
         for(i=0;i<response.row.length;i++)          
          $('.progNam').append($('<option />').text(response.row[i].progName).val(response.row[i].id));
            $(".progNam").val('').trigger('change');
      });
  }
   function clear()
   {
    $("#progName,#progDesc").val('');   
    $('#modelBtn').removeAttr('disabled'); 
    $("#modelBtn").text('Create');                                          
    $("#modelBtn").attr("onclick",'save();');
     $("#deleteBtn").hide();
      $("#progNameCmbo").val('').trigger('change');
   }
  function Delete(){
            swal({
              title: "Are you sure?",
              text: "You will not be able to recover this Program Details!",
              type: "warning",
              showCancelButton: true,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: "Yes, delete it!",
              cancelButtonText: "No, cancel plz!",
              closeOnConfirm: false,
              closeOnCancel: false
            },
            function(isConfirm){
              if (isConfirm) {
                swal("Deleted!", "The program record has been deleted.", "success");
                save('Del');
              } else {
                swal("Cancelled", "The program record is safe :)", "error");
              }
            });
  }
  //To save,update or delete Program Name
    function save(flag) {           
        if($("#progName").val()==""||$("#progDesc").val()==""){
          swal ("Please fill required*");
          return
       }

    $('#modelBtn').attr('disabled', 'disabled');
                 $.ajax({
                       url: "/ProChart/proProgSettingMastr/saveProg",
                       type: 'POST',
                       data: {Id:$("#progNameCmbo").val(),flg:flag,progName: $('#progName').val(),progDesc: $('#progDesc').val()}
                   }).done(function(responce) {                                         
                      if(responce!="err")
                        {                                          
                           clear();                            
                           swal(responce,"","success");
                           getList();
                        }
                      else{
                       $('#modelBtn').removeAttr('disabled');
                        swal ("Duplicate Program");
                      }
                      });  
      }
          
          function remove(){
          var rn= parseInt($("#rowNo").val());
          if(rn!=0)
            {
              $('tbody tr:last').remove ();
              $("#rowNo").val(--rn);
            }
          }
          
          
</script>
<g:hiddenField name="rowNo" id="rowNo"  value="0"/>
<div align="left" style="padding-left:15px;padding-right:15px;">
  <div id="frm" class="nav-tabs-custom" style="float: left; width: 100%;background-color: transparent;" >

    <div style="width: 100%;height:12px"></div>  

    <div class="row ">

      <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
        Applicable<font style="color: red;font-size: 16px;">*</font>
      </div>
      <div class="col-md-3 col-sm-6  col-xs-12 col-lg-4" style="">
        <g:hiddenField name="dayNameId" id="" value=""/>
        <g:select  class="form-control" multiple="true" id="dayNameId" name="dayNameId" from="${com.htl.pro.det.ProProgDaySetngMatr.createCriteria().list(){eq('delFlg','N')}}" optionKey="id" optionValue="dayName"  value="${day}" noSelection="${['null':'']}" required=""/>        
      </div>      
    </div>

    <div style="width: 100%;height:16px"></div>  
    <div class="row ">
      <div class="col-md-4 col-sm-6  col-xs-12 col-lg-4" style="">        
      </div>
      <button id="alter"  type="button" class="btn btn-warning" style="margin-left: 14px;" data-toggle="modal" data-target="#myModal">Alter Program</button>
    </div> 
    <div style="width: 100%;height:10px"></div>        

    <div class="row ">
      <div class="col-md-12 col-sm-12  col-xs-12 col-lg-12" style="">
        <font style="color: lightslategray;font-size: 10px;"><div align="right">Times are in 24Hrs format</div></font>
        <table class="table table-bordered" style="" id="tbl">
          <thead>
            <tr>
              <th>Program<font style="color: red;font-size: 16px;">*</font></th>
              <th>From Time<font style="color: red;font-size: 16px;">*</font></th>
              <th>To Time<font style="color: red;font-size: 16px;">*</font></th>
            </tr>
          </thead>
          <tbody id="tblRow">
            <g:hiddenField name="progNameId" id="" value=""/>
            <g:hiddenField name="strtTim" id="" value=""/>
            <g:hiddenField name="endTim" id="" value=""/>

            <g:if test="${rows}">
                <g:each var="v" in="${rows}" status="i">                 
                  <tr>
                       <div class="row">
                        <td width="30%">
                          <div class="col-md-3 col-sm-6  col-xs-12 col-lg-10" style="">
                            <g:select class="form-control progNam" id="combo_${i}"  name="progNameId" from="${com.htl.pro.det.ProProgMastr.createCriteria().list(){eq('delFlg','N')}}" optionKey="id" optionValue="progName" value="${rows[i][0]}" noSelection="${['':'']}" />                
                          </div>
                        </td>
                        <td><div class="col-xs-6"><div class="input-group bootstrap-timepicker timepicker"><input type="text" id="strtTim_${i}" name="strtTim" class="form-control input-small time" value="${rows[i][1]}"><span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span></div>
                          </div></td>
                        <td><div class="col-xs-6">
                            <div class="input-group bootstrap-timepicker timepicker"><input required="" type="text" id="endTim_${i}" name="endTim" class="form-control input-small time" value="${rows[i][2]}"><span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span></div>
                          </div></td>
                      </div>
                  </tr>
                  <script>$("#rowNo").val('${i}');$('#combo_${i}').select2({placeholder: "Select program"});</script>
                </g:each>
               </g:if>
          
          
               <g:else>
                    <tr>
                      <div class="row">
                        <td width="30%">
                          <div class="col-md-3 col-sm-6  col-xs-12 col-lg-10" style="">                            
                            <g:select class="form-control progNam" id="combo_0"  name="progNameId" from="${com.htl.pro.det.ProProgMastr.createCriteria().list(){eq('delFlg','N')}}" optionKey="id" optionValue="progName" noSelection="${['':'']}" />                
                          </div>
                        </td>
                        <td><div class="col-xs-6"><div class="input-group bootstrap-timepicker timepicker"><input type="text" id="strtTim_0" name="strtTim" class="form-control input-small time"><span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span></div>
                          </div></td>
                        <td><div class="col-xs-6">
                            <div class="input-group bootstrap-timepicker timepicker"><input required="" type="text" id="endTim_0" name="endTim" class="form-control input-small time"><span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span></div>
                          </div></td>
                      </div>
                      </tr>                   
               </g:else>


          </tbody>
        </table>
        <div class="col-md-12 col-sm-12  col-xs-12 col-lg-12" style="position: absolute;left: 87%;">
        <button type="button" class="btn btn-link" onclick="addrow();">Add</button>
        <button type="button" class="btn btn-link" onclick="remove();">Remove</button>
        </div>
      </div>
    </div>  




    <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog" style="position: relative;top: 100px">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" align="center">Program Alteration</h4>
          </div>
          <div class="modal-body">
            <div class="row ">
              <div class="col-md-2 col-sm-6  col-xs-12 col-lg-4" style=""></div>
              <!--`<div class="col-md-2 col-sm-6  col-xs-12 col-lg-5" style="">-->
              <g:select class="form-control progNam" id="progNameCmbo" name="progNameCmbo" from="${com.htl.pro.det.ProProgMastr.createCriteria().list(){eq('delFlg','N')}}" optionKey="id" optionValue="progName"  noSelection="${['':'']}" style="width: 44%;"/>                
              <!--</div>-->
            </div>
            <div style="width: 100%;height:16px"></div> 
            <div class="row ">
              <div class="col-md-2 col-sm-6  col-xs-12 col-lg-3" style="">
                Program Name<font style="color: red;font-size: 16px;">*</font>
              </div>
              <div class="col-md-3 col-sm-6  col-xs-11 col-lg-8" style="">
                <g:textField class="form-control" style="color:black;" name="progName" id="progName"  maxlength="20"  value="${proProgDaySetngMatrInstance?.progName}" />
              </div>      
            </div>
            <div style="width: 100%;height:16px"></div> 
            <div class="row ">
              <div class="col-md-2 col-sm-6  col-xs-12 col-lg-3" style="">
                Program Description<font style="color: red;font-size: 16px;">*</font>
              </div>
              <div class="col-md-3 col-sm-6  col-xs-11 col-lg-8" style="">
                <g:textArea rows="2" class="form-control" style="color:black;" name="progDesc" id="progDesc"  maxlength="60" placeholder="Describe Here" value="${proProgDaySetngMatrInstance?.progDesc}" />
              </div>       
            </div>         
            <div style="width: 100%;height:16px"></div> 
            <div class="row ">
              <div class="col-md-3 col-sm-6  col-xs-11 col-lg-3" style=""></div>
              <button type="button" onclick="save();" class="btn btn-info" style="margin-left: 14px;" id="modelBtn">Create</button>
              <button type="button" id="deleteBtn" style="display: none;" class="btn btn-danger" onclick="Delete();">Delete</button>
              <button type="button" class="btn btn-default" id="close" data-dismiss="modal">Close</button>              
            </div>


          </div>
        </div>

      </div>
    </div>

  </div>
</div>