<?php
require_once("cabecalho.php");
require_once("conexao.php");
?>

<h3>Situações</h3>

<a href="situacao_editar.php" class='btn btn-primary'  style="margin-bottom: 10px;">Novo registro</a>

<table width="100%" id="registros" class="display">
  <thead>
    <tr>
      <th>ID</th>
      <th>Descrição</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <?php
      $sql = "select
                  idsituacao,
                  descricao
                from
                  situacao
                order by
                  descricao";

      $resultado = pg_query($conexao, $sql);
      $cont = 0;
      while ($linha = pg_fetch_array($resultado)) {
        $cont++;
        $idsituacao = $linha['idsituacao'];
        $descricao = $linha['descricao'];

        echo "<tr>
                  <td align='center'>$idsituacao</td>
                  <td>$descricao</td>
                  <td align='center' width='200'>
                    <a href='situacao_editar.php?id=$idsituacao' class='btn btn-warning'>Editar</a>
                    <a href='situacao_excluir.php?id=$idsituacao' class='btn btn-danger'>Excluir</a>
                  </td> 
                </tr>";
      }
    ?>
  </tbody>
  <tfoot>
    <tr>
      <th>ID</th>
      <th>Descrição</th>
      <th></th>
    </tr>
  </tfoot>
</table>

<?php
echo "$cont registros encontrados!";
?>

<script>
    $(document).ready(function () {
      $('#registros').DataTable({
        "language": {
          url: 'https://cdn.datatables.net/plug-ins/1.11.4/i18n/pt_br.json'
        },
        columnDefs: [
          { orderable: false, targets: 2 },
          { className: 'text-center', targets: 0 }
        ],
        lengthMenu: [[10, 20, -1], [10, 20, "Todos"]],
        dom: 'lBfrtip',
        buttons: [
          {
            extend: 'excel',
            title: 'Situações',
            exportOptions: {
                columns: [0, 1]
            }
          }, 
          {
            extend: 'print',
            title: 'Situações',
            exportOptions: {
                columns: [0, 1]
            },
            customize: function ( win ) {
                    $(win.document.body)
                        .css( 'font-size', '10pt' )
 
                    $(win.document.body).find( 'table' )
                        .addClass( 'compact' )
                        .css( 'font-size', 'inherit' );
            }
          }
        ]
      })
    });
  
</script>

<?php
require_once("rodape.php");
?>