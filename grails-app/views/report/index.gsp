<!DOCTYPE html>
<html>

  <head>      
    <meta name="layout" content="main">   
    <link rel="stylesheet" href="${resource(dir: 'jsgrid', file: 'jsgrid.css')}">
    <link rel="stylesheet" href="${resource(dir: 'jsgrid', file: 'jsgrid-theme.css')}">
    <script src="${resource(dir:'jsgrid',file:'jsgrid.min.js')}"> </script>    
<link rel="stylesheet" href="${resource(dir: 'plug/datepicker', file: 'datepicker3.css')}">
<script src="${resource(dir:'plug/datepicker',file:'bootstrap-datepicker.js')}"></script>
    <script>
      
     $(document).ready(function(){
                 $("#strttime").datepicker({format: 'dd-mm-yyyy',autoclose: true});                           
                 $("#endtime").datepicker({format: 'dd-mm-yyyy',autoclose: true});  
                 });
            function grid(){ 
                      if($("#strtDtStr").val()==""||$("#endDtStr").val()==""){
                          swal ("Please fill required*");
                          return
                      }
                          var strtDt=($('#strtDtStr').val()).substring(6, 10)+"-"+($('#strtDtStr').val()).substring(3, 5)+"-"+($('#strtDtStr').val()).substring(0, 2);
                           var endDt=($('#endDtStr').val()).substring(6, 10)+"-"+($('#endDtStr').val()).substring(3, 5)+"-"+($('#endDtStr').val()).substring(0, 2);
                            if(endDt<strtDt)
                              {
                                  var notify = $.notify('Date range is not correct',{offset: { x: 20, y: 70 }});
                                  return false
                              }
                    var Data;
                      $.ajax({
                       url: "${createLink(action: 'GetList', controller:'Report')}",
                       dataType: "json",
                       data:{start:$("#strtDtStr").val(),end:$("#endDtStr").val()},
                   }).done(function(response) {                       
                       Data=response.row;
                       alert(Data);
                       
                          
       $("#jsGrid").jsGrid({
           height: "auto",
           width: "100%",
           pageSize: 10,
           pageButtonCount: 5,
 
          // filtering: true,    
           sorting: true,
           paging: true,
           autoload: true,
           selecting: true,
           data:Data,
           fields: [
                 { name: "dates", type: "text",title: "Date", width: 100 },
                { name: "from", type: "text",title: "From", width: 100 },
                { name: "to", type: "text",title: "To", width: 100 },
                { name: "program", type: "text",title: "Program", width: 100 },
           ],

       });       
                       
                   });
   

            
                 
      }           
  </script>
  </head>   
  <body>
    
    
  <div class="box box-primary">
            <div class="box-header with-border">
              <legend align="center">Report</legend>
   </div>

 <div align="left" style="padding-left:15px;padding-right:15px;">
  <div  class="nav-tabs-custom" style="float: left; width: 100%;background-color: transparent;" >

    <div style="width: 100%;height:12px"></div> 
      
    <div class="row ">      
          <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
              From<font style="color: red;font-size: 16px;">*</font>
            </div>
            <div class="col-md-3 col-sm-6  col-xs-12 col-lg-2" style="">
              <div class='input-group date' id="strttime">
              <g:textField name="strtDtStr"  id="strtDtStr" class="form-control" required="" style=""/>
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
              </div>
            </div>  

            <div class="col-md-2 col-sm-6  col-xs-12 col-lg-2" style="">
               <div style="position: relative;left: 113px;">To<font style="color: red;font-size: 16px;">*</font> </div>
            </div>

            <div class="col-md-3 col-sm-6  col-xs-12 col-lg-2" style="">
              <div class='input-group date' id="endtime">
              <g:textField name="endDtStr"  id="endDtStr" class="form-control" required="" style=""/>
                 <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
              </div>
            </div>      
    </div> 
    
    
  <div style="width: 100%;height:12px"></div>  
  
  </div>
</div>
          

    <div id="grid" class="tab-pane fade" style="">
               <div id="jsGrid"></div>            
    </div> 
    
    
              <div class="box-footer">
                <button type="submit" data-toggle="tab" href="#grid" class="btn btn-primary" onclick="return grid();">Show</button>
                <g:link class="btn btn-success" action="index">Refresh</g:link>
              </div>
  </div>   
    
    
    
    
    
    

</body>



</html>
