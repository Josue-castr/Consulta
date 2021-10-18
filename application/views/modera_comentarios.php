<!DOCTYPE html>
<html lang="es" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

</head>

<body>
    <div class="container-fluid">
        <!-- ============================================================== -->
        <!-- Start Page Content -->
        <!-- ============================================================== -->
        <!-- Row -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <form id="form_comentarios" class="form-horizontal">
                        <div class="card-body">
                            <h4 class="card-title">Moderación de comentarios</h4>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Sector</label>
                                        <select class="form-control" id="iIdSector" name="iIdSector" onchange="carga_temas2('Temas','iIdSector', 'iIdTema', 'iIdPropuesta', 'Propuesta');">
                                            <option value="0">Sector</option>
                                            <?php
                                            if ($sectores != false) {
                                                foreach ($sectores as $vsec) {
                                                    echo '<option value="' . $vsec->iIdSector . '">' . $vsec->vSector . '</option>';
                                                }
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Tema</label>
                                        <select class="form-control" disabled="disabled" id="iIdTema" name="iIdTema" onchange="carga_propuestas2('Propuesta','iIdTema','iIdPropuesta')">
                                        <!--$("#iIdTema").empty();-->
                                        <option value="">Tema</option>
                                            <?php
                                            
                                            if ($temas != false) {
                                                
                                                foreach ($temas as $vsec) {
                                                    
                                                    echo '<option value="' . $vsec->iIdTema . '">' . $vsec->vTema . '</option>';
                                                }
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Propuestas</label>
                                        <select class="form-control" disabled="disabled" id="iIdPropuesta" name="iIdPropuesta">
                                            <option value="">Propuesta</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Estatus</label>
                                        <select name="iEstatus" id="iEstatus" class="form-control">
                                            <option value="">Estatus</option>
                                            <option value="0">Eliminado</option>
                                            <option value="1">Pendiente</option>
                                            <option value="2">Aprobado</option>
                                        </select>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <hr>
                        <div class="card-body">
                            <div class="form-group m-b-0 text-right">
                                <!--<button type="submit" class="btn btn-info waves-effect waves-light"><i class="ti-search"></i> Buscar</button>-->
                                <button type="button" class="btn btn-info waves-effect waves-light" onclick="carga_comentarios();"><i class="ti-search"></i> Buscar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- End Row -->
        <div class="row" id="contenido_comentarios"></div>
        
    </div>
</body>
<script type="text/javascript">
    function carga_temas2(nombrelst, lstpadreid, lsthijoid, lsthijoid2, nombrelst2) {
        var valor = $("#" + lstpadreid).val();
        var patron = /chosen-select/g;

        var loading = new Loading({
            discription: 'Espere...',
            defaultApply: true
        });

        $.post("<?=base_url();?>C_propuestas_admin/listado_dependiente",{nombrelst:nombrelst,valor:valor},function(resultado,status){
            //$('#'+lsthijoid+' option[value!="0"]').remove();
            if(valor > 0 && valor != '')
            { // En este caso se utiliza el largo de la cadena debido a que no se recibe numero si no cadenas
                se = '<option value="0" selected="0" style="text-transform: capitalize;">'+ nombrelst + ' </option>'+ resultado;
                $('#'+ lsthijoid).empty();                
                $('#'+lsthijoid).append(se);
                 //alert(se);
                $('#'+lsthijoid).attr("disabled",false);
                $('#'+lsthijoid2).attr("disabled",false);
                
            }
            else{
                se = '<option value="0" selected="0" style="text-transform: capitalize;">'+ nombrelst + ' </option>'+ resultado;
                $('#'+lsthijoid).append(se);
                $('#'+ lsthijoid2).empty();
                $('#'+lsthijoid).attr("disabled",true);
                se = '<option value="0" selected="0" style="text-transform: capitalize;">'+ nombrelst2 + ' </option>'+ resultado;
                $('#'+lsthijoid2).append(se);
                $('#'+lsthijoid2).attr("disabled",true);
                //alert("entro");
            }

            if(patron.test($('#'+lsthijoid).attr('class')))
            {
                $('#'+lsthijoid).trigger("chosen:updated");
            } 
        });

        loading.out();
    }
    

    function carga_propuestas2(nombrelst, lstpadreid, lsthijoid) {

        var valor = $("#" + lstpadreid).val();
        var patron = /chosen-select/g;

        var loading = new Loading({
            discription: 'Espere...',
            defaultApply: true
        });
        //alert(nombrelst + valor);
        $.post("<?= base_url(); ?>C_propuestas_admin/listado_dependiente", {nombrelst: nombrelst, valor: valor}, function(resultado, status) {
            //$('#'+lsthijoid+' option[value!="0"]').remove();

            if (valor > 0 && valor != '') { // En este caso se utiliza el largo de la cadena debido a que no se recibe numero si no cadenas
                se = '<option value="0" selected="0" style="text-transform: capitalize;">'+ nombrelst + ' </option>'+ resultado;
                $('#'+ lsthijoid).empty();
                $('#' + lsthijoid).append(se);
                $('#' + lsthijoid).attr("disabled", false);
            } else{
                se = '<option value="0" selected="0" style="text-transform: capitalize;">'+ nombrelst + ' </option>'+ resultado;
                $('#'+lsthijoid).append(se);
                $('#' + lsthijoid).attr("disabled", true);
            }

            if (patron.test($('#' + lsthijoid).attr('class'))) {
                $('#' + lsthijoid).trigger("chosen:updated");

            }
        });

        loading.out();
    }
</script>

</html>