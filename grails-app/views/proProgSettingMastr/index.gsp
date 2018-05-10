<!DOCTYPE html>
<html>

  <head>      
    <meta name="layout" content="main">   
    <link rel="stylesheet" href="${resource(dir: 'jsgrid', file: 'jsgrid.css')}">
    <link rel="stylesheet" href="${resource(dir: 'jsgrid', file: 'jsgrid-theme.css')}">

    <script src="${resource(dir:'jsgrid',file:'jsgrid.min.js')}"> </script>    

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
                       url: "${createLink(action: 'GetList', controller:'ProProgSettingMastr')}",

                       dataType: "json",
                       data:filter,
                   }).done(function(response) {    
                   
                       d.resolve(response.row);
                   });
 
                   return d.promise();
                
               }
           },
        
        
 
           fields: [
                 { name: "refNo", type: "text",title: "Reference Number", width: 100 },
           ],


          rowClick: function(args)
           {   
                   window.location = '${createLink(controller:"ProProgSettingMastr",action:"edit",id:"")}'+(args.item.id);
           },

 
       });
    
    
   });
      </script>
    </div>

    <div style="width: 100%;height:12px"></div> 
  <g:link class="btn btn-primary save"controller="ProProgSettingMastr"  action="create">Create</g:link>
</body>



</html>
