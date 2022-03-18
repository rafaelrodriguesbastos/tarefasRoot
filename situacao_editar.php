<?php
  require_once("cabecalho.php");
  require_once("conexao.php");

  if (isset($_GET['id']) && $_GET['id']!="") {
    $idsituacao = $_GET['id'];

    $sql = "select
        descricao
      from
        situacao
      where
        idsituacao = $idsituacao";
    
    $resultado = pg_query($conexao, $sql);
    $dados = pg_fetch_array($resultado);
  
    $descricao = $dados['descricao'];
  }
  else {
    $idsituacao = "";
    $descricao = "";
  }
?>

<form action="situacao_salvar.php" method="POST">
  <input type="hidden" name="idsituacao" value="<?php echo $idsituacao; ?>">
  Descrição <input type="text" name="descricao" maxlength="25" size="25" value="<?php echo $descricao; ?>" required>
  <br />
  <input type="submit" value="Salvar">

</form>

<?php
  require_once("rodape.php");
?>