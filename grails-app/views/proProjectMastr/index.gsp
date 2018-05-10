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
           pageSize: 10,
           pageButtonCount: 5,
           filtering: true,    
           sorting: true,
           paging: true,
           autoload: true,
           selecting: true,            
           controller: {
               loadData: function(filter) {
                   var d = $.Deferred();
 
                   $.ajax({
                       url: "${createLink(action: 'GetList', controller:'ProProjectMastr')}",

                       dataType: "json",
                       data:filter,
                   }).done(function(response) {    
                   
                       d.resolve(response.row);
                   });
 
                   return d.promise();
                
               }
           },
        
           fields: [                
                 { name: "projName", type: "text",title: "Project Name", width: 100 },
                 { name: "catgId", type: "text",title: "Category", width: 200 },        
                 { name: "strtDtStr", type: "text",title: "Start Date", width: 150 },
                 { name: "endDtStr", type: "text",title: "End Date", width: 100 },                            
                  ],

          rowClick: function(args)           
           {   
                   window.location = '${createLink(controller:"ProProjectMastr",action:"edit",id:"")}'+(args.item.id);
           },
       });
    
    
   });
      </script>
    </div>

    <div style="width: 100%;height:12px"></div> 
  <g:link class="btn btn-primary save"controller="ProProjectMastr"  action="create">Create</g:link>
</body>



</html>
