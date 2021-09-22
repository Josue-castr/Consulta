<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <title>AdminBite admin Template - The Ultimate Multipurpose admin template</title>
    <!-- Custom CSS -->
    <link href="<?=base_url();?>admin/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="<?=base_url();?>admin/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="<?=base_url();?>admin/assets/libs/morris.js/morris.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<?=base_url();?>admin/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
       <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->       
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-5 align-self-center">
                        <h4 class="page-title">Dashboard</h4>
                        <div class="d-flex align-items-center">

                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Info box -->
                <!-- ============================================================== -->
                <div class="card-group">
                    <!-- Card -->
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="m-r-10">
                                    <span class="btn btn-circle btn-lg bg-danger">
                                        <!--<i class="ti-clipboard text-white"></i>-->
                                        <img src="<?=base_url();?>/public/images/i_participantes.png" width="20px">
                                    </span>
                                </div>
                                <div>
                                    Participantes
                                </div>
                                <div class="ml-auto">
                                    <h2 class="m-b-0 font-light">23</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Card -->
                    <!-- Card -->
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="m-r-10">
                                    <span class="btn btn-circle btn-lg btn-info">
                                        <!--<i class="ti-wallet text-white"></i>-->
                                        <img src="<?=base_url();?>/public/images/i_propuestas.png" width="20px">
                                    </span>
                                </div>
                                <div>
                                    Propuestas recibidas
                                </div>
                                <div class="ml-auto">
                                    <h2 class="m-b-0 font-light">113</h2>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="m-r-10">
                                    <span class="btn btn-circle btn-lg bg-warning">
                                        <!--<i class="mdi mdi-currency-usd text-white"></i>-->
                                        <img src="<?=base_url();?>/public/images/i_propuestas.png" width="20px">
                                    </span>
                                </div>
                                <div>
                                    Propuestas integradas
                                </div>
                                <div class="ml-auto">
                                    <h2 class="m-b-0 font-light">63</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="m-r-10">
                                    <span class="btn btn-circle btn-lg bg-success">
                                        <!--<i class="ti-shopping-cart text-white"></i>-->
                                        <img src="<?=base_url();?>/public/images/i_votaciones.png" width="20px">
                                    </span>
                                </div>
                                <div>
                                    Votaciones
                                </div>
                                <div class="ml-auto">
                                    <h2 class="m-b-0 font-light">43</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    


                </div>
                <!-- ============================================================== -->
                <!-- Info box -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Email campaign chart -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- Column -->
                    <div class="col-md-6 col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div>
                                        <h4 class="card-title">Product Sales</h4>
                                        <h5 class="card-subtitle">Overview of Latest Month</h5>
                                    </div>
                                    <div class="ml-auto">
                                        <ul class="list-inline font-12 dl m-r-10">
                                            <li class="list-inline-item">
                                                <i class="fas fa-dot-circle text-info"></i> Ipad
                                            </li>
                                            <li class="list-inline-item">
                                                <i class="fas fa-dot-circle text-danger"></i> Iphone</li>
                                        </ul>
                                    </div>
                                </div>
                                <div id="product-sales" style="height:305px"></div>
                            </div>
                        </div>

                    </div>
                    <!-- Column -->
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body bg-light-info">
                                <div class="d-flex align-items-center m-t-10 m-b-20">
                                    <div class="m-r-10">
                                        <i class="icon-Cloud-Sun display-5"></i>
                                    </div>
                                    <div>
                                        <h1 class="m-b-0 font-light">35
                                            <sup>o</sup>
                                        </h1>
                                        <h5 class="font-light">Clear and sunny</h5>
                                    </div>
                                </div>
                                <div id="ct-weather" style="height: 170px"></div>
                            </div>
                            <div class="card-body">
                                <div class="d-flex align-items-center">

                                    <div>
                                        <span class="btn-circle btn-lg btn btn-outline-secondary">
                                            <i class="wi wi-day-sunny"></i>
                                        </span>
                                    </div>
                                    <div class="m-l-10">
                                        <h4 class="m-b-0">Monday</h4>
                                        <h6 class="font-light m-b-0">March 2019</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body bg-light-warning text-white">
                                <div id="weeksales-bar" class="position-relative" style="height: 270px"></div>
                            </div>
                            <div class="card-body">
                                <div class="d-flex align-items-center">

                                    <div>
                                        <span class="btn-circle btn-lg btn btn-outline-secondary">
                                            <i class="ti-shopping-cart"></i>
                                        </span>
                                    </div>
                                    <div class="m-l-10">
                                        <h4 class="m-b-0">Sales</h4>
                                        <h6 class="font-light m-b-0">March 2019</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Email campaign chart -->
                <!-- ============================================================== -->
                
                <div class="row">
                    <!-- Column -->
                    <div class="col-lg-4 col-md-12">
                        <div class="row">
                            <!-- Column -->
                            <div class="col-md-12">
                                <div class="card bg-light-info no-card-border">
                                    <div class="card-body">
                                        <h5 class="card-title">Sales Difference</h5>
                                        <div class="d-flex no-block">
                                            <div class="align-self-center no-shrink">
                                                <h2 class="m-b-0">$2842</h2>
                                                <h6 class="text-muted">(160-165 Sales)</h6>
                                            </div>
                                            <div class="ml-auto">
                                                <div id="sales" class="" style=" width:150px; height:140px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Column -->
                            <div class="col-md-12">
                                <div class="card bg-light-success no-card-border">
                                    <div class="card-body">
                                        <h5 class="card-title">Sales Prediction</h5>
                                        <div class="d-flex no-block">
                                            <div class="align-self-end no-shrink">
                                                <h2 class="m-b-0">$6528</h2>
                                                <h6 class="text-muted">(160-165 Sales)</h6>
                                            </div>
                                            <div class="ml-auto">
                                                <div id="prediction"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Column -->
                        </div>
                    </div>
                    <!-- Column -->
                    <div class="col-lg-8 col-md-12">
                        <div class="card o-income">
                            <div class="card-body">
                                <div class="d-flex m-b-30 no-block">
                                    <h5 class="card-title m-b-0 align-self-center">Our Income</h5>
                                    <div class="ml-auto">
                                        <select class="custom-select b-0">
                                            <option selected="">January</option>
                                            <option value="1">February</option>
                                            <option value="2">March</option>
                                            <option value="3">April</option>
                                        </select>
                                    </div>
                                </div>
                                <div id="income" style="height:250px; width:100%;"></div>
                                <ul class="list-inline m-t-30 text-center font-12">
                                    <li class="list-inline-item">
                                        <i class="fa fa-circle text-success"></i> Growth</li>
                                    <li class="list-inline-item">
                                        <i class="fa fa-circle text-info"></i> Net</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- ============================================================== -->
                <!-- Table -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Comentarios mejor valorados</h4>
                            </div>
                            <div class="comment-widgets scrollable" style="height:560px;">
                                <!-- Comment Row -->
                                <?php 
                                if($comentarios)
                                {
                                	if($comentarios->num_rows() > 0)
                                	{
                                		$comentarios = $comentarios->result();
                                		foreach ($comentarios as $c)
                                		{

                                			echo ' <div class="d-flex flex-row comment-row m-t-0">
				                                    <div class="p-2">
				                                        <img src="'.base_url().'admin/assets/images/users/usuario.jpg" alt="user" width="50" class="rounded-circle">
				                                    </div>
				                                    <div class="comment-text w-100">
				                                        <h6 class="font-medium">'.$c->vNombre.'</h6>
				                                        <span class="m-b-15 d-block">'.$c->vComentario.'</span>
				                                        <div class="comment-footer">
				                                            <span class="text-muted float-right">April 14, 2016</span>
				                                            <span class="label label-rounded label-primary">Pending</span>
				                                            <span class="action-icons">
				                                                <a href="javascript:void(0)">
				                                                    <i class="ti-pencil-alt"></i>
				                                                </a>
				                                                <a href="javascript:void(0)">
				                                                    <i class="ti-check"></i>
				                                                </a>
				                                                <a href="javascript:void(0)">
				                                                    <i class="ti-heart"></i>
				                                                </a>
				                                            </span>
				                                        </div>
				                                    </div>
				                                </div>';
                                		}
                                	}
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Propuetas más votadas</h4>
                                <div class="chat-box scrollable position-relative" style="height:475px;">
                                    <!--chat Row -->
                                    <ul class="chat-list">
                                        <!--chat Row -->
                                        <li class="chat-item">
                                            <div class="chat-img">
                                                <img src="../../assets/images/users/1.jpg" alt="user">
                                            </div>
                                            <div class="chat-content">
                                                <h6 class="font-medium">James Anderson</h6>
                                                <div class="box bg-light-info">Lorem Ipsum is simply dummy text of the printing &amp; type setting industry.</div>
                                            </div>
                                            <div class="chat-time">10:56 am</div>
                                        </li>
                                        <!--chat Row -->
                                        <li class="chat-item">
                                            <div class="chat-img">
                                                <img src="../../assets/images/users/2.jpg" alt="user">
                                            </div>
                                            <div class="chat-content">
                                                <h6 class="font-medium">Bianca Doe</h6>
                                                <div class="box bg-light-info">It’s Great opportunity to work.</div>
                                            </div>
                                            <div class="chat-time">10:57 am</div>
                                        </li>
                                        <!--chat Row -->
                                        <li class="odd chat-item">
                                            <div class="chat-content">
                                                <div class="box bg-light-inverse">I would love to join the team.</div>
                                                <br>
                                            </div>
                                        </li>
                                        <!--chat Row -->
                                        <li class="odd chat-item">
                                            <div class="chat-content">
                                                <div class="box bg-light-inverse">Whats budget of the new project.</div>
                                                <br>
                                            </div>
                                            <div class="chat-time">10:59 am</div>
                                        </li>
                                        <!--chat Row -->
                                        <li class="chat-item">
                                            <div class="chat-img">
                                                <img src="../../assets/images/users/3.jpg" alt="user">
                                            </div>
                                            <div class="chat-content">
                                                <h6 class="font-medium">Angelina Rhodes</h6>
                                                <div class="box bg-light-info">Well we have good budget for the project</div>
                                            </div>
                                            <div class="chat-time">11:00 am</div>
                                        </li>
                                        <!--chat Row -->
                                        <!-- <div id="someDiv"></div> -->
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body border-top">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="input-field m-t-0 m-b-0">
                                            <input type="text" id="textarea1" placeholder="Type and enter" class="form-control
                                    border-0">
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <a class="btn-circle btn-lg btn-cyan float-right text-white" href="javascript:void(0)">
                                            <i class="fas fa-paper-plane"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
  
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->        
    <script src="<?=base_url();?>admin/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="<?=base_url();?>admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="<?=base_url();?>admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <script src="<?=base_url();?>admin/dist/js/app.min.js"></script>
    <script src="<?=base_url();?>admin/dist/js/app.init.horizontal.js"></script>
    <script src="<?=base_url();?>admin/dist/js/app-style-switcher.horizontal.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="<?=base_url();?>admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="<?=base_url();?>admin/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="<?=base_url();?>admin/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="<?=base_url();?>admin/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="<?=base_url();?>admin/dist/js/custom.min.js"></script>
    
    <!--chartis chart-->
    <script src="<?=base_url();?>admin/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="<?=base_url();?>admin/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <!--c3 charts -->
    <script src="<?=base_url();?>admin/assets/extra-libs/c3/d3.min.js"></script>
    <script src="<?=base_url();?>admin/assets/extra-libs/c3/c3.min.js"></script>
    <!--chartjs -->
    <script src="<?=base_url();?>admin/assets/libs/raphael/raphael.min.js"></script>
    <script src="<?=base_url();?>admin/assets/libs/morris.js/morris.min.js"></script>

    <script src="<?=base_url();?>admin/dist/js/pages/dashboards/dashboard1.js"></script>
</body>

</html>