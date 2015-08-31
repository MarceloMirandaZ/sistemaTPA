//el document ready, de Jquery, ya esta cargo por "plantilla.js" del html "crearreclamos.html"
$(function() {
    $('#crearreclamo').addClass('active');
    
    //
    $("#grid_reclamos").load('../crearreclamo/grid.html',function(){
        //
        $("#form_filtro").hide();
        $("#resltados_busqueda").hide();
        //
        $("#btn_filtro").click(function(){
            // alert("presionado bten crear");
            $("#btn_filtro").hide(500);
            $("#form_filtro").show(500);
        });
        //
        $("#btn_cancelar_filtro").click(function(){
        // alert("presionado bten crear");
            $("#btn_filtro").show(500);
            $("#form_filtro").hide(500);
        });
        //
        //
    });           
});

