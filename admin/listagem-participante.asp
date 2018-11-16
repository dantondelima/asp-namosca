<!--#include file="template-admin.asp"-->
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css"> 
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<script type="text/javascript"> 
    $(document).ready(function(){
        $('#myTable').DataTable({
            "bProcessing": true,
            "bServerSide": true,
            "pageLength": 5,
            "sAjaxSource" : "dados-participantes.asp",
            "columnDefs": [
                {
                    "targets": [ 7, 8 ], 
                    "orderable":false
                }
            ],
            "lengthChange": false,
            "language": { 
                "sEmptyTable": "Nenhum registro encontrado",
                "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
                "sInfoFiltered": "(Filtrados de _MAX_ registros)",
                "sInfoPostFix": "",
                "sInfoThousands": ".",
                "sLengthMenu": "_MENU_ resultados por página",
                "sLoadingRecords": "Carregando...",
                "sProcessing": "Processando...",
                "sZeroRecords": "Nenhum registro encontrado",
                "sSearch": "Pesquisar",
                "oPaginate": {
                    "sNext": "Próximo",
                    "sPrevious": "Anterior",
                    "sFirst": "Primeiro",
                    "sLast": "Último"
                },
                "oAria": {
                    "sSortAscending": ": Ordenar colunas de forma ascendente",
                    "sSortDescending": ": Ordenar colunas de forma descendente"
                }
        }
       }); 
    });
</script>
<%
action = Request("action")
    If action = "sucesso" then %>
    <script type="text/javascript">
        $("body").before("<div class='alert alert-success alert-dismissible'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Participante deletado com sucesso</strong></div>");
    </script>

    <%
    Elseif action = "alsucesso" then %>
    <script type="text/javascript">
        $("body").before("<div class='alert alert-success alert-dismissible'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Participante alterado com sucesso</strong></div>");
    </script>
    <%End if%> 
<div id="corpo" class="inner"> 
<table id="myTable" class="table">
    <thead>
        <tr>
            <th>Num. ingresso</th>
            <th>Nome completo</th>
            <th>tipo ingresso</th>
            <th>email</th>
            <th>telefone</th>
            <th>Data festa</th>
            <th>status planejamento</th>
            <th>Alterar</th>
            <th>Excluir</th>
        </tr>
    </thead>
    <tbody>

    </tbody>
</table>
</div> 