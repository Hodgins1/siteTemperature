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
    <link href="/assets/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="/assets/plugins/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/assets/plugins/font-awesome/5.0/css/fontawesome-all.min.css" rel="stylesheet" />
    <link href="/assets/plugins/animate/animate.min.css" rel="stylesheet" />
    <link href="/assets/css/default/style.min.css" rel="stylesheet" />
    <link href="/assets/css/default/style-responsive.min.css" rel="stylesheet" />
    <link href="/assets/css/default/theme/default.css" rel="stylesheet" id="theme" />
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="/assets/plugins/pace/pace.min.js"></script>
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
                    <img src="/assets/img/user/user-13.jpg" alt="" />
                    <span class="d-none d-md-inline">user</span> <b class="caret"></b>
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
                        <li><a href="/temp/list">Zoznam</a></li>
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
            <li class="breadcrumb-item active">Zoznam</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">Tabuľka <small></small></h1>
        <!-- end page-header -->

        <!-- begin row -->
        <div class="row">
            <!-- begin col-3 -->
            <div class="col-md-6">
                <!-- begin panel -->
                <div class="panel panel-inverse" data-sortable-id="table-basic-5">
                    <!-- begin panel-heading -->
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                        </div>
                        <h4 class="panel-title">Zoznam nameraných hodnôt</h4>
                    </div>
                    <!-- end panel-heading -->
                    <!-- begin panel-body -->
                    <div class="panel-body">
                        <!-- begin table-responsive -->
                        <div class="table-responsive">
                            <table class="table table-striped m-b-0">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>Teplota ºC</th>
                                    <th>Editácia</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list temperatures>
                                    <#items as temperature>
                                        <tr id="${temperature.id}">
                                            <td>${temperature.id}</td>
                                            <td>${temperature.content}</td>
                                            <td>
                                                <a href="/temp/edit/${temperature.id}"><i class="fas fa-pencil-alt fa-lg"></i></a>
                                                <a href="javascript:void(0);" onclick="deleteSaying(${temperature.id});"><i class="fas fa-trash-alt fa-lg"></i></a>
                                            </td>
                                        </tr>
                                    </#items>
                                <#else>
                                <p>No temperatures</p>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                        <!-- end table-responsive -->
                    </div>
                    <!-- end panel-body -->
                </div>
                <!-- end panel -->
            </div>
            <!-- end col-3 -->

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
<script src="/assets/plugins/jquery/jquery-3.2.1.min.js"></script>
<script src="/assets/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="/assets/plugins/bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
<!--[if lt IE 9]>
<script src="/assets/crossbrowserjs/html5shiv.js"></script>
<script src="/assets/crossbrowserjs/respond.min.js"></script>
<script src="/assets/crossbrowserjs/excanvas.min.js"></script>
<![endif]-->
<script src="/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/plugins/js-cookie/js.cookie.js"></script>
<script src="/assets/js/theme/default.min.js"></script>
<script src="/assets/js/apps.min.js"></script>
<!-- ================== END BASE JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="/assets/plugins/highlight/highlight.common.js"></script>
<script src="/assets/js/demo/render.highlight.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
<script>
    $(document).ready(function() {
        App.init();
        Highlight.init();
    });

    function deleteSaying(id){
        var result = confirm("Naozaj ale za naozaj si si isty ze chces vymazat teplotu? Uz sa to neda vrati ale ze naozaj !!!");

        if (result) {
            $.ajax({
                url: '/temp/'+id,
                type: 'DELETE',
                success: function(result) {
                    alert('Item Deleted');
                    $('#'+id).remove();
                    //location.reload();
                }
            });
        }
    }
</script>
</body>
</html>
