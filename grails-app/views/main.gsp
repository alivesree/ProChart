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
    <link rel="stylesheet" href="${resource(dir: 'plugins/iCheck/flat', file: 'blue.css')}">
    <!-- Morris chart -->
    <link rel="stylesheet" href="${resource(dir: 'plugins/morris', file: 'morris.css')}">
    <!-- jvectormap -->
    <link rel="stylesheet" href="${resource(dir: 'plugins/jvectormap', file: 'jquery-jvectormap-1.2.2.css')}">
    <!-- Date Picker -->
    <!--  <link rel="stylesheet" href="{resource(dir: 'plugins/datepicker', file: 'datepicker3.css')}">
       Daterange picker 
      <link rel="stylesheet" href="{resource(dir: 'plugins/daterangepicker', file: 'daterangepicker.css')}">-->
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="${resource(dir: 'plugins/bootstrap-wysihtml5', file: 'bootstrap3-wysihtml5.min.css')}">

    <link rel="stylesheet" href="${resource(dir: 'notify', file: 'animate.css')}">

    <!-- jQuery 2.2.3 -->
    <script src="${resource(dir:'plugins/jQuery',file:'jquery-2.2.3.min.js')}"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="${resource(dir:'plugins/jQueryUI',file:'jquery-ui.min.js')}"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

    <!-- Bootstrap 3.3.6 -->
    <script src="${resource(dir:'bootstrap/js',file:'bootstrap.min.js')}"></script>



    <script src="${resource(dir:'bootstrap/js',file:'jasny-bootstrap.min.js')}"></script>

    <script src="${resource(dir:'notify',file:'bootstrap-notify.js')}"></script>

    <!-- AdminLTE App -->
    <script src="${resource(file:'dist/js/app.min.js')}"></script>



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

  notify.update({'type': 'success', 'message': '<strong style="color:red;">Success</strong> Your page has been saved!', 'progress': 40});

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
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
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
      <ul class="sidebar-menu" id="menuMstr">
        <li class="header">MAIN NAVIGATION</li> 

        <li class="treeview">
          <a href="#">
            <i class="fa fa-share"></i> <span>HR</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">

            <li>
              <a href="#"><i class="fa fa-circle-o"></i> Masters
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu">
                <li><g:link controller="GenDepMstr" action="create"><i class="fa fa-circle-o"></i>Department</g:link></li>
                <li><g:link controller="GenDesigMastr" action="create"><i class="fa fa-circle-o"></i>Designation</g:link></li>                
              <li><g:link controller="HrEmpTypeMastr" action="create"><i class="fa fa-circle-o"></i>Employee Type</g:link></li>
              <li><g:link controller="HrEmpMstr" action="create"><i class="fa fa-circle-o"></i>Employee</g:link></li>
            </ul>
            </li>

          </ul>
      </li>

      <li class="treeview">
        <a href="#">
          <i class="fa fa-share"></i> <span>Program</span>
          <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
          </span>
        </a>
        <ul class="treeview-menu">

          <li>
            <a href="#"><i class="fa fa-circle-o"></i> Masters
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><g:link controller="ProProjectMastr" action="index"><i class="fa fa-circle-o"></i>Project</g:link></li>
          <li><g:link controller="ProBudgetMastr" action="index"><i class="fa fa-circle-o"></i>Budget</g:link></li>                
      <li><g:link controller="ProChannelMastr" action="index"><i class="fa fa-circle-o"></i>Channel</g:link></li>

      </ul>
      </li>

      </ul>
      </li>

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


<script>
  var ajaxData= $.ajax({
type: "GET",
url: "${createLink(controller:'CmnMenuMastr',action:'menuList')}",
success: function(data) {
  
  
  
  for(var i=0;i<data[0].length;i++)
      {   

      $("#menu").append('<li class="treeview" id="star1_'+data[0][i].modlId+'"><a href="#"><i class="fa fa-star-half-o"> &nbsp; </i><span class="link-title">'+data[0][i].modlName+'</span><span class="fa arrow"></span></a>') 
      $("#star1_"+data[0][i].modlId).append('<ul class="treeview-menu" id="sub1_'+data[0][i].modlId+'">')


       for(var j=0;j<data[1].length;j++)
         {
           if(data[0][i].modlId==data[1][j].modlId)
             { 

                $("#sub1_"+data[0][i].modlId).append('<li class="treeview" id="seco1_'+data[1][j].menuGrpId+'" ><a href="#"><span class="fa fa-th-large" style="color:#D0D1D3"></span> '+data[1][j].menuGrpName+'<span class="fa arrow"></span></a><li class=""></li>')
                $("#seco1_"+data[1][j].menuGrpId).append('<ul class="treeview-menu" id="menut1_'+data[1][j].menuGrpId+'">')                                                                                                                                                                                                                                                       

                for(var k=0;k<data[2].length;k++)
                 {                                                                  
                    if(data[1][j].menuGrpId==data[2][k].menuGrpId)
                      {               

                         $("#menut1_"+data[1][j].menuGrpId).append('<li><a id="'+data[2][k].menuId+'" href="'+data[2][k].className+'" titile="'+data[2][k].menuName+'" onclick="menuRolesSet(this);" onkeypress="menuRolesSet(this);"><span class="fa fa-caret-right" style="color:#A9BCF5"></span>  '+data[2][k].menuName+'</a></li>')                                                                     
                         menuFlg=1
                      }
                 }
                 $("#menut1_"+data[1][j].menuGrpId).append('</ul>')                                                             
             }
               $("#sub1_"+data[0][i].modlId).append('</ul>')


               if($("#menut1_"+data[1][j].menuGrpId).children().length<1)
                {
                $("#seco1_"+data[1][j].menuGrpId).hide()
                }
}


$("#star1_"+data[0][i].modlId).append('</li>')    


} 






}  
});

</script>