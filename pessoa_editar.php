<?php
  require_once("cabecalho.php");
  require_once("conexao.php");

  if (isset($_GET['id']) && $_GET['id']!="") {
    $idpessoa = $_GET['id'];

    $sql = "select
        nome,
        funcao
      from
        pessoa
      where
        idpessoa = $idpessoa";
    
    $resultado = pg_query($conexao, $sql);
    $dados = pg_fetch_array($resultado);
  
    $nome = $dados['nome'];
    $funcao = $dados['funcao'];
  }
  else {
    $idpessoa = "";
    $nome = "";
    $funcao = "";
  }
?>

<form action="pessoa_salvar.php" method="POST">
  <input type="hidden" name="idpessoa" value="<?php echo $idpessoa; ?>">
  Nome <input type="text" name="nome" maxlength="200" size="80" value="<?php echo $nome; ?>" required>
  <br />
  Função <input type="text" name="funcao" maxlength="25" size="25" value="<?php echo $funcao; ?>" required>
  <br />
  <input type="submit" value="Salvar">

</form>

<?php
  require_once("rodape.php");
?>