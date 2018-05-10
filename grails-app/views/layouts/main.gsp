<!DOCTYPE html>
<html>
  <head>   
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Project</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'jasny-bootstrap.css')}" type="text/css">



    <!-- Font Awesome -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}" type="text/css">
    <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">-->
    <!--Ionicons--> 
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'ionicons.min.css')}" type="text/css">
    <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">-->
    <!--Theme style--> 
    <link rel="stylesheet" href="${resource(dir: 'dist/css', file: 'AdminLTE.css')}">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${resource(dir: 'dist/css/skins', file: '_all-skins.min.css')}">
    <!-- iCheck -->
    <link rel="stylesheet" href="${resource(dir: 'plug/iCheck/flat', file: 'blue.css')}">
    <!-- Morris chart -->
    <link rel="stylesheet" href="${resource(dir: 'plug/morris', file: 'morris.css')}">
    <!-- jvectormap -->
    <link rel="stylesheet" href="${resource(dir: 'plug/jvectormap', file: 'jquery-jvectormap-1.2.2.css')}">

    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="${resource(dir: 'plug/bootstrap-wysihtml5', file: 'bootstrap3-wysihtml5.min.css')}">

    <link rel="stylesheet" href="${resource(dir: 'notify', file: 'animate.css')}">
    
    <link rel="stylesheet" href="${resource(dir: 'css', file:'sweetalert.min.css')}">

    <!-- jQuery 2.2.3 -->
    <script src="${resource(dir:'plug/jQuery',file:'jquery-2.2.3.min.js')}"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="${resource(dir:'plug/jQueryUI',file:'jquery-ui.min.js')}"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

    <!-- Bootstrap 3.3.6 -->
    <script src="${resource(dir:'bootstrap/js',file:'bootstrap.min.js')}"></script>



    <script src="${resource(dir:'bootstrap/js',file:'jasny-bootstrap.min.js')}"></script>

    <script src="${resource(dir:'notify',file:'bootstrap-notify.js')}"></script>
    <script src="${resource(dir:'js',file:'sweetalert.min.js')}"></script>
    <!-- AdminLTE App -->
    <script src="${resource(file:'dist/js/app.min.js')}"></script>

    <script>
      //console.log($("#menu").html());
      $(document).ready(function () {
              $.ajax({
              dataType: "json",            
              type: "GET",
              url: "${createLink(controller:'CmnMenuMastr',action:'menuList')}",
              success: function(data) {
              //alert(data[0].grpcount[0][1]);
                for(var i=0,c=0,z=0,b=0,a=0,p=0;p<data[0].mdlcount.length;p++)
                    {                      
                      $("#menu").append('<li class="treeview">\n\
                          <a href="#"><i class="fa fa-share"></i> \n\
                          <span>'+data[0].lst[i][0]+'</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>\n\
                          <ul class="treeview-menu" id="mdl_'+data[0].lst[i][0]+'"></li></ul></li>');
      
                      
                      for(var j=0;j<data[0].mdlcount[a][1];j++,b=b+data[0].grpcount[z][1],z++){
                             
                              //alert(a+" _ "+b);
                                $("#mdl_"+data[0].lst[i][0]).append('<li><a href="#"><i class="fa fa-circle-o">\n\
                                </i> '+data[0].lst[b][1]+' <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i></span></a>\n\
                                <ul id="grp_'+data[0].lst[i][0]+data[0].lst[b][1]+'" class="treeview-menu"></ul>');
                
                                       for(var k=0;k<data[0].grpcount[z][1];k++,c++){                                                                                   
                                                 
                                              $("#grp_"+data[0].lst[i][0]+data[0].lst[b][1]).append('<li><a href="'+data[0].lst[c][3]+'"><i class="fa fa-circle-o"></i>'+data[0].lst[c][2]+'</a></li>');
                                             
                                         }
                               
                               
                           }
                
                i=i+data[0].mdlcount[a][2];
                a++;
                    }

              }  
              });


(function (global) { 

    if(typeof (global) === "undefined") {
        throw new Error("window is undefined");
    }

    var _hash = "!";
    var noBackPlease = function () {
        global.location.href += "#";

        // making sure we have the fruit available for juice (^__^)
        global.setTimeout(function () {
            global.location.href += "!";
        }, 50);
    };

    global.onhashchange = function () {
        if (global.location.hash !== _hash) {
            global.location.hash = _hash;
        }
    };

    global.onload = function () {            
        noBackPlease();

        // disables backspace on page except on input fields and textarea..
        document.body.onkeydown = function (e) {
            var elm = e.target.nodeName.toLowerCase();
            if (e.which === 8 && (elm !== 'input' && elm  !== 'textarea')) {
                e.preventDefault();
            }
            // stopping event bubbling up the DOM tree..
            e.stopPropagation();
        };          
    }

})(window);


  });
    </script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  <g:layoutHead/>
</head>
<body class="hold-transition skin-blue sidebar-mini">

<g:if test="${flash.message=="Saved"}">
  <script>
  var notify = $.notify('<strong>Saving</strong> Do not close this page...', {
  allow_dismiss: false,
  showProgressbar: true
});

  notify.update({'type': 'success', 'message': '<strong style="color:blue;">Success</strong> Your page has been saved!', 'progress': 40});

  </script>
</g:if>
<g:else>
  <g:if test="${flash.message}">
    <script>  
                    $.notify({
                    // options
                         
                    message: '${flash.message}'
                          
            },{
               animate: {
                        enter: 'animated bounceIn',
                         delay: 1111111110,
                        exit: 'animated bounceOut'},
                      
                offset: {
                          x: 20,
                          y: 70
                  }
                      
                //delay: 50000,

            });
                  
    </script>
  </g:if>
</g:else>


<div class="wrapper">
  <header class="main-header">
    <!-- Logo -->
    <g:link controller="CmnUsrMastr" action="dash"  class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>D</b>B</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Dash</b>board</span>
    </g:link>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">4</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have no messages</li>
              <ul class="menu"><li>Empty</li></ul>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have no Notification</li>
              <ul class="menu"><li>Empty</li></ul>
              <li class="footer"><a href="#">See All</a></li>
            </ul>
          </li>
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have no Tasks</li>
              <ul class="menu"><li>Empty</li></ul>
              <li class="footer"><a href="#">See All</a></li>
            </ul>
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="${createLink(controller:'HrEmpMstr', action:'showimage', id:"${request.getCookie('htl_li')}")}" class="user-image" alt="User Image">
              <span class="hidden-xs">${request.getCookie('htl_rn')}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="${createLink(controller:'HrEmpMstr', action:'showimage', id:"${request.getCookie('htl_li')}")}" class="img-circle" alt="User Image">

                <p>
                  Department: ${request.getCookie('htl_dp')}
                  <small>Designation: ${request.getCookie('htl_dg')}</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="${createLink(controller:"HrEmpMstr",action:"edit",id:"${request.getCookie('htl_li')}")}" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <g:link controller="CmnUsrMastr" action="logout" class="btn btn-default btn-flat">Sign out</g:link>
                </div>
              </li>
            </ul>
          </li>
           <!--Control Sidebar Toggle Button--> 
          <li>
            <!--<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>-->
          </li>
        </ul>
      </div>
    </nav>
  </header>   <!-- header -->
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${createLink(controller:'HrEmpMstr', action:'showimage', id:"${request.getCookie('htl_li')}")}" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${request.getCookie('htl_rn')}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
            <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
            </button>
          </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" id="menu">
        <li class="header">MAIN NAVIGATION</li> 




      </ul>

    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">




    <!-- Main content -->
    <section class="content">
      <g:layoutBody/>      
      <r:layoutResources/>
    </section>
    <!-- /.content -->

  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Beta</b> version
    </div>
    <strong>Copyright Hasten Labs</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

</body>
</html>

