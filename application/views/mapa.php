<!DOCTYPE html>
<html dir="ltr" lang="es">
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" type="image/png" href="<?=base_url();?>img/favicon_2.png"/>
	<link rel="stylesheet" href="<?=base_url();?>public/css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="<?=base_url();?>public/css/style.css?v=1" type="text/css" />
	<link rel="stylesheet" href="<?=base_url();?>public/css/swiper.css" type="text/css" />
	<link rel="stylesheet" href="<?=base_url();?>public/css/dark.css" type="text/css" />
	<link rel="stylesheet" href="<?=base_url();?>public/css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="<?=base_url();?>public/css/animate.css" type="text/css" />
	<link rel="stylesheet" href="<?=base_url();?>public/css/magnific-popup.css" type="text/css" />

	<link rel="stylesheet" href="<?=base_url();?>public/css/responsive.css" type="text/css" />

	<link rel="stylesheet" href="<?=base_url();?>public/chosen/chosen.min.css?v=1" type="text/css" />
	
	<link type="text/css" rel="stylesheet" href="<?=base_url();?>admin/plugins/modal-loading/css/modal-loading.css" />
	<link type="text/css" rel="stylesheet" href="<?=base_url();?>admin/plugins/modal-loading/css/modal-loading-animate.css" />
	
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css" integrity="sha512-07I2e+7D8p6he1SIM+1twR5TIrhUQn9+I6yjqD53JQjFiMf8EtC93ty0/5vJTZGF8aAocvHYNEDJajGdNx1IsQ==" crossorigin="" />
	
	<link rel="stylesheet" href="<?=base_url();?>public/leaflet/MarkerCluster.css" />
	<link rel="stylesheet" href="<?=base_url();?>public/leaflet/MarkerCluster.Default.css" />
	
	<style type="text/css">
		#map{
			height: 480px;
			z-index: 1;
		}
	</style>

	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Document Title
	============================================= -->
	<title>Participación Ciudadana</title>

</head>

<body class="stretched" data-loader="2" data-animation-in="fadeIn" data-speed-in="1500" data-animation-out="fadeOut" data-speed-out="800">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<div id="home" class="page-section" style="position:absolute;top:0;left:0;width:100%;height:200px;z-index:-2;"></div>

		
		<!-- Header
		============================================= -->
		<?php include('header.php'); ?>

		<div class="clear"></div>

		<!-- Content
		============================================= -->
		
		<section id="content">


			<div class="content-wrap">

				<div class="container clearfix" id="mapaMunicipios1"></div>
				<div class="container clearfix" id="map"></div>
			</div>
		</section>
		<!-- Footer
		============================================= -->
		<footer id="footer" class="dark">

			<!-- Copyrights
			============================================= -->
			<div id="copyrights">

				<div class="container clearfix">

					<div class="col_third_fourth">
						<div class="col_one_third">
							
						</div>
						<div class="col_one_third">
							<img src="<?=base_url();?>img/logo_yucatan.png">
						</div>						
					</div>					

				</div>

			</div><!-- #copyrights end -->

		</footer><!-- #footer end -->

	</div><!-- #wrapper end -->

	<div class="modal1 mfp-hide" id="myModal1">
		<div class="block divcenter" style="background-color: #FFF; max-width: 500px;">
			<div class="feature-box fbox-center fbox-effect nobottomborder nobottommargin" style="padding: 40px;">
				<div class="fbox-icon">
					<a href="#"><i class="icon-screen i-alt"></i></a>
				</div>
				<h3>Responsive Layout<span class="subtitle">Adapts well on Devices</span></h3>
			</div>
			<div class="section center nomargin" style="padding: 30px;">
				<a href="#" class="button" onClick="$.magnificPopup.close();return false;">Don't Show me Again</a>
			</div>
		</div>
	</div>

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<script src="<?=base_url();?>public/js/jquery.js"></script>
	<script src="<?=base_url();?>public/js/plugins.js"></script>

	
	<script src="<?=base_url();?>public/js/functions.js"></script>	
	<script src="<?=base_url();?>public/js/funciones.js?v=1.2"></script>

	
	<script src="<?=base_url();?>public/chosen/chosen.jquery.min.js"></script>
	<script src="<?=base_url();?>public/chosen/chosen.proto.min.js"></script>
	
	<script src="<?=base_url();?>admin/plugins/modal-loading/js/modal-loading.js"></script>
	
	<script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet-src.js" integrity="sha512-WXoSHqw/t26DszhdMhOXOkI7qCiv5QWXhH9R7CgvgZMHz1ImlkVQ3uNsiQKu5wwbbxtPzFXd1hK4tzno2VqhpA==" crossorigin=""></script>
	<script src="<?=base_url();?>public/leaflet/leaflet.markercluster-src.js"></script>	
	<script src="<?=base_url();?>public/highmaps/highmaps.js"></script>	
	<script type="text/javascript">
		
		var latlng = L.latLng(20.97, -89.62);
		var latlng2 = L.latLng(20.9590695,-89.6114042);
		

		var tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
			maxZoom: 18,
			attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
		});

		var map = L.map('map')
				.addLayer(tiles);

		var markers = L.markerClusterGroup();

		<?php 
		if($puntos)
		{
			foreach ($puntos as $p) {
				$img = ($p->ruta == ' ') ? '<img src="'.base_url().'img/si_860.jpg" width="200px">':'<img src="'.base_url().$p->ruta.'" width="200px">';
				$html = '<h4><a href="'.base_url().'C_propuestas/propuesta_sim?ad=1&id='.$p->iIdPropuesta.'" target="_blank">'.$p->vTitulo.'</a></h4>';
				$html.= '<p align="center">'.$img.'<br></p>';

				echo 'var latlng = L.latLng('.$p->nLatDec.','.$p->nLongDec.');';
				echo 'var marker = L.marker(latlng)
									.bindPopup(\''.$html.'\');';
				echo 'markers.addLayer(marker);';
			}
		}
		?>
		
	
		//markers.addLayer(marker);		
		map.addLayer(markers);
		map.fitBounds(markers.getBounds());		
	</script>
	<script type="text/javascript" src="<?=base_url();?>js/mapa.js"></script>	
	<!-- Footer Scripts
	============================================= -->

</body>
</html>