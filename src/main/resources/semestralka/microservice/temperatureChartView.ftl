<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <title>Color Admin | Dashboard</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <#if !(temperature??)>
        <#assign temperature = {"id":-1,"content":"gusto"}>
    </#if>

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    <link href="../assets/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/plugins/font-awesome/5.0/css/fontawesome-all.min.css" rel="stylesheet" />
    <link href="../assets/plugins/animate/animate.min.css" rel="stylesheet" />
    <link href="../assets/css/default/style.min.css" rel="stylesheet" />
    <link href="../assets/css/default/style-responsive.min.css" rel="stylesheet" />
    <link href="../assets/css/default/theme/default.css" rel="stylesheet" id="theme" />
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="../assets/plugins/jquery-jvectormap/jquery-jvectormap.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="../assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="../assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #header -->
    <div id="header" class="header navbar-default">
        <!-- begin navbar-header -->
        <div class="navbar-header">
            <a href="#" class="navbar-brand"><span class="navbar-logo"></span> <b>Temperature</b> Site</a>
            <button type="button" class="navbar-toggle" data-click="sidebar-toggled">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <!-- end navbar-header -->

        <!-- begin header-nav -->
        <ul class="navbar-nav navbar-right">
            <li class="dropdown">
            <li class="dropdown navbar-user">
                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                    <img src="../assets/img/user/user-13.jpg" alt="" />
                    <span class="d-none d-md-inline">User</span> <b class="caret"></b>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a href="javascript:;" class="dropdown-item">Log Out</a>
                </div>
            </li>
        </ul>
        <!-- end header navigation right -->
    </div>
    <!-- end #header -->

    <div id="sidebar" class="sidebar">
        <div data-scrollbar="true" data-height="100%">
            <ul class="nav">
                <li class="nav-profile">
                    <a href="javascript:;" data-toggle="nav-profile">
                        <div class="cover with-shadow"></div>
                    </a>
                </li>
            </ul>
            <ul class="nav">
                <li class="nav-header">Navigácia</li>
                <li class="has-sub active">
                    <a href="javascript:;">
                        <b class="caret"></b>
                        <i class="fa fa-th-large"></i>
                        <span>Menu</span>
                    </a>
                    <ul class="sub-menu">
                        <li class="active"><a href="/temp/list">Zoznam</a></li>
                        <li><a href="/temp/chart">Graf</a></li>
                    </ul>
                </li>
                <li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a></li>
            </ul>
        </div>
    </div>
    <div class="sidebar-bg"></div>

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb pull-right">
            <li class="breadcrumb-item"><a href="javascript:;">Domov</a></li>
            <li class="breadcrumb-item active">Graf</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">Graf <small>graf pre nameranú teplotu</small></h1>
        <!-- end page-header -->

        <!-- begin row -->
        <div class="row">
            <!-- begin col-3 -->
            <div class="col-lg-4 col-md-6">
                <div class="widget widget-stats bg-red">
                    <div class="stats-icon"><i class="fas fa-lg fa-fw m-r-10 fa-sun"></i></div>
                    <div class="stats-info text-center">
                        <h2>Max. teplota</h2>
                        <p id="max-temp">ºC</p>
                    </div>

                </div>
            </div>
            <!-- end col-3 -->
            <!-- begin col-3 -->
            <div class="col-lg-4 col-md-6">
                <div class="widget widget-stats bg-orange">
                    <div class="stats-icon"><i class="far fa-lg fa-fw m-r-10 fa-snowflake"></i></div>
                    <div class="stats-info text-center">
                        <h2>Min. teplota</h2>
                        <p id="min-temp"></p>
                    </div>

                </div>
            </div>
            <!-- end col-3 -->
            <!-- begin col-3 -->
            <div class="col-lg-4 col-md-6">
                <div class="widget widget-stats bg-grey-darker">
                    <div class="stats-icon"><i class="fa fa-users"></i></div>
                    <div class="stats-info text-center">
                        <h2>Priemerná teplota</h2>
                        <p id="average-temp"> </p>
                    </div>
                </div>
            </div>
            <!-- end col-3 -->
        </div>
        <!-- end row -->
        <!-- begin row -->
        <div class="row">
            <!-- begin col-8 -->
            <div class="col-lg-8">
                <!-- begin panel -->
                <div class="panel panel-inverse" data-sortable-id="index-1">
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                        </div>
                        <h4 class="panel-title">Teploty za posledne obdobie</h4>
                    </div>
                    <div class="panel-body">
                        <div id="interactive-chart" class="height-sm"></div>
                    </div>
                </div>
                <!-- end panel -->
            </div>
            <!-- end col-8 -->
        </div>
        <!-- end row -->
    </div>
    <!-- end #content --
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="../assets/plugins/jquery/jquery-3.2.1.min.js"></script>
<script src="../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="../assets/plugins/bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
<!--[if lt IE 9]>
<script src="../assets/crossbrowserjs/html5shiv.js"></script>
<script src="../assets/crossbrowserjs/respond.min.js"></script>
<script src="../assets/crossbrowserjs/excanvas.min.js"></script>
<![endif]-->
<script src="../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../assets/plugins/js-cookie/js.cookie.js"></script>
<script src="../assets/js/theme/default.min.js"></script>
<script src="../assets/js/apps.min.js"></script>
<!-- ================== END BASE JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="../assets/plugins/gritter/js/jquery.gritter.js"></script>
<script src="../assets/plugins/flot/jquery.flot.min.js"></script>
<script src="../assets/plugins/flot/jquery.flot.time.min.js"></script>
<script src="../assets/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../assets/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../assets/plugins/sparkline/jquery.sparkline.js"></script>
<script src="../assets/plugins/jquery-jvectormap/jquery-jvectormap.min.js"></script>
<script src="../assets/plugins/jquery-jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<!--	<script src="../public/assets/js/demo/dashboard.min.js"></script>-->
<script src="../assets/js/chart.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<?php

?>

<script>
    $(document).ready(function() {
        App.init();
        //Dashboard.init();
        var pom = 1;
        var pole1 = [];
        var xLabel = [];
        var arrayValue = [];


        <#list temperatures>
            <#items as temperature>
               var pole = [pom,${temperature.content}];
               pole1.push(pole);
               arrayValue.push(parseInt(${temperature.content}));
               var poleLabel = [pom,''+pom+''];
               xLabel.push(poleLabel);
               pom++;
            </#items>
        </#list>
        handleInteractiveChart(pole1,xLabel);

        console.log(arrayValue);
        var maxValue = Math.max.apply(Math, arrayValue);
        var minValue = Math.min.apply(Math, arrayValue);

        var sum = 0;
        for( var i = 0; i < arrayValue.length; i++ ){
            sum += parseInt( arrayValue[i],10); //don't forget to add the base
        }

        var avg = sum/arrayValue.length;
        console.log(maxValue);

        console.log(minValue);
        handleInteractiveChart(pole1,xLabel);

        $("#min-temp").text(minValue+'°C');
        $("#max-temp").text(maxValue+'°C');
        $("#average-temp").text(parseInt(avg)+'°C');
    });
    // var data1 = [
    //     [1, 40], [2, 50], [3, 60], [4, 60], [5, 60], [6, 65], [7, 75], [8, 90], [9, 100], [10, 105],
    //     [11, 110], [12, 110], [13, 120], [14, 130], [15, 135],[16, 145], [17, 132], [18, 123], [19, 135], [20, 150]
    // ];

    // var xLabel = [
    //     [1,''],[2,''],[3,'May&nbsp;15'],[4,''],[5,''],[6,'May&nbsp;19'],[7,''],[8,''],[9,'May&nbsp;22'],[10,''],
    //     [11,''],[12,'May&nbsp;25'],[13,''],[14,''],[15,'May&nbsp;28'],[16,''],[17,''],[18,'May&nbsp;31'],[19,''],[20,'']
    // ];

</script>
</body>
</html>
