<?php
require_once("cabecalho.php");
require_once("conexao.php");
?>

<h3>Pessoas</h3>

<a href="pessoa_editar.php" class='btn btn-primary' style="margin-bottom: 10px;">Novo registro</a>

<table id="pessoas" width="100%" class="display">
  <thead>
    <tr>
      <th>ID</th>
      <th>Nome</th>
      <th>Função</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <?php
      $sql = "select
                  idpessoa,
                  nome,
                  funcao
                from
                  pessoa
                order by
                  nome,
                  funcao";

      $resultado = pg_query($conexao, $sql);
      $cont = 0;
      while ($linha = pg_fetch_array($resultado)) {
        $cont++;
        $idpessoa = $linha['idpessoa'];
        $nome = $linha['nome'];
        $funcao = $linha['funcao'];

        echo "<tr>
                  <td align='center'>$idpessoa</td>
                  <td>$nome</td>
                  <td>$funcao</td>
                  <td align='center' width='200'>
                    <a href='pessoa_editar.php?id=$idpessoa' class='btn btn-warning'>Editar</a>
                    <a href='pessoa_excluir.php?id=$idpessoa' class='btn btn-danger'>Excluir</a>
                  </td> 
                </tr>";
      }
    ?>
  </tbody>
  <tfoot>
  <tr>
      <th>ID</th>
      <th>Nome</th>
      <th>Função</th>
      <th></th>
    </tr>
  </tfoot>
</table>

<?php
echo "$cont registros encontrados!";
?>

<script>
    $(document).ready(function () {
      $('#pessoas').DataTable({
        "language": {
          url: 'https://cdn.datatables.net/plug-ins/1.11.4/i18n/pt_br.json'
        },
        columnDefs: [
          { orderable: false, targets: 3 },
          { className: 'text-center', targets: 0 }
        ],
        lengthMenu: [[10, 20, -1], [10, 20, "Todos"]],
        dom: 'lBfrtip',
        buttons: [
          {
            extend: 'excel',
            title: 'Pessoas',
            exportOptions: {
                columns: [0, 1, 2]
            }
          }, 
          {
            extend: 'print',
            title: 'Pessoas',
            exportOptions: {
                columns: [0, 1, 2]
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