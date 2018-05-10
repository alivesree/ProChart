<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>ProChart | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <!--<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">-->
  <link rel="stylesheet" href="${resource(file: 'bootstrap/css/bootstrap.min.css')}" type="text/css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}" type="text/css">
  <!-- Ionicons -->
   <link rel="stylesheet" href="${resource(dir: 'css', file: 'ionicons.min.css')}" type="text/css">
  <!-- Theme style -->
  <!--<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">-->
  <link rel="stylesheet" href="${resource(dir: 'dist/css', file: 'AdminLTE.min.css')}" type="text/css">
  <!-- iCheck -->
  <!--<link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">-->
  <link rel="stylesheet" href="${resource(dir: 'plug/iCheck/square', file: 'blue.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'notify', file: 'animate.css')}">
  
  <script src="${resource(dir:'plug/jQuery',file:'jquery-2.2.3.min.js')}"></script>
  <script src="${resource(dir:'bootstrap/js',file:'bootstrap.min.js')}"></script>
  <script src="${resource(dir:'plug/iCheck',file:'icheck.min.js')}"></script>
  <script src="${resource(dir:'notify',file:'bootstrap-notify.js')}"></script>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <script>
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
    </script>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="/ProChart/"><b>Pro</b>Chart</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

    <g:form action="authenticate" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Enter User Name" name="userName">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" name="password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
      <g:if test="${flash.message}">
          <script>  
                          $.notify({
                          // options
                         
                          message: '${flash.message}'
                          
                  },{
                     animate: {
                              enter: 'animated bounceIn',                              
                              exit: 'animated bounceOut'},
                      
                      offset: {
                                x: 470,
                                y: 50
                        }
                      
                      //delay: 50000,

                  });
         </script>
      </g:if>
        <!-- /.col -->
      </div>
    </g:form>

  
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
</body>
</html>
