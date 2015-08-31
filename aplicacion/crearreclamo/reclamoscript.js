//el document ready, de Jquery, ya esta cargo por "plantilla.js" del html "crearreclamos.html"
var sesion;
var que_bd;
var bd_cliente=0;
var lista_cliente= new Array();
var que_cliente;
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
        $("#btn_consulta_cliente").click(function(){
        // alert("presionado bten crear");
            buscar_cliente();
        });
        //
    });           
});

function buscar_cliente(){
    $("#grid_consulta").empty();
    que_cliente=$("#input_consulta").val();
    sesion= restJson("../../core/json.php?funcion=informacion");
    que_bd=sesion.alias;
    bd_cliente = restJson("../../core/json.php?funcion=restFull&bd="+que_bd+"&t=vista_cliente_poliza&d=cedula="+que_cliente+"");
    lista_cliente[0]=bd_cliente.infotabla;
    //alert("lista: "+lista_cliente[0][1]);
    if(lista_cliente[0][1]!=0){
    lista_cliente[1]=bd_cliente.idcliente;
    lista_cliente[2]=bd_cliente.nom_cliente;
    lista_cliente[3]=bd_cliente.cedula;
    lista_cliente[4]=bd_cliente.num_poliza;
    //alert("buscando-...."+que_cliente);
    for(i=0;i<lista_cliente[1].length;i++){
        $("#grid_consulta").append("<tr id='columna_consulta"+i+"'></tr>");
        for(j=2;j<lista_cliente.length;j++){
          //alert("lista: "+lista_cliente[j][j]);
            if(j==2){
                $("#columna_consulta"+i).append("<th style='text-align: center'><a href='#'"+lista_cliente[j][i]+"</a></th>");
            }else{
                $("#columna_consulta"+i).append("<th style='text-align: center'>"+lista_cliente[j][i]+"</th>");
            }
            
        }
    }
    //
        $("#resltados_busqueda").show(500);
        $("#mensaje").hide(500);
    }
    else{
        $("#mensaje").append("<div class='col-md-12'><i class='alert alert-danger' style='padding:5px'>No se encotraron resultados</i></div>");
        $("#resltados_busqueda").hide(500);
    }
    
}
