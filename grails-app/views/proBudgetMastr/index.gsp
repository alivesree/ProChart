<!DOCTYPE html>
<html>

  <head>      
    <meta name="layout" content="main">   
    <link rel="stylesheet" href="${resource(dir: 'jsgrid', file: 'jsgrid.css')}">
    <link rel="stylesheet" href="${resource(dir: 'jsgrid', file: 'jsgrid-theme.css')}">

    <script src="${resource(dir:'jsgrid',file:'jsgrid.min.js')}"> </script>
    <!--<link rel="javascript" href="{resource(dir: 'jsgrid', file: 'jsgrid.js')}">-->

  </head>   
  <body>


    <div id="jsGrid1">
      <script>       
            $(document).ready(function () {
 
       $("#jsGrid1").jsGrid({
           height: "auto",
           width: "100%",
           pageSize: 5,
           pageButtonCount: 5,
 
           filtering: true,    
           sorting: true,
           paging: true,
           autoload: true,
           selecting: true,
          // inserting: true,
          // editing: true,
        //shrinkToFit: true,
                 //onSelectRow: function(item)               
           controller: {
               loadData: function(filter) {
                   var d = $.Deferred();
 
                   $.ajax({
                       url: "${createLink(action: 'GetList', controller:'ProBudgetMastr')}",

                       dataType: "json",
                       data:filter,
                   }).done(function(response) {    
                   
                       d.resolve(response.row);
                   });
 
                   return d.promise();
                
               }
           },
        
        
 
           fields: [
                // { name: "id", type: "text",title: "Department ID", width: 100 },
                 { name: "bdgtName", type: "text",title: "Name", width: 100 },
                 { name: "projId", type: "text",title: "Project", width: 200 },        
                 { name: "bdgtAmt", type: "text",title: "Amount", width: 200 }, 
                 { name: "strtDtStr", type: "text",title: "Start Date", width: 150 },
                 { name: "endDtStr", type: "text",title: "End Date", width: 100 },     

              // { type: "control", modeSwitchButton: true, editButton: false }
           
           ],
   //        rowClick: function(args) {
   //    var item    = $(args.event.target).closest("td");
   //
   //    if(this._clicked_row != null) {
   //        this._clicked_row.removeClass('jsgrid-clicked-row');
   //    }
   //    this._clicked_row = item;
   //
   //    item.addClass('jsgrid-clicked-row');
   //    alert (item.id);
   //},
          rowClick: function(args)
           //onSelectRow: function(item, itemIndex)  
           {   
                  // alert (args.item.depCd);
   //                alert  ( "here "+ (id) );
                   window.location = '${createLink(controller:"ProBudgetMastr",action:"edit",id:"")}'+(args.item.id);
           },

 
       });
    
    
   });
      </script>
    </div>

    <div style="width: 100%;height:12px"></div> 
  <g:link class="btn btn-primary save"controller="ProBudgetMastr"  action="create">Create</g:link>
</body>



</html>
