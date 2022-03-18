<?php
  require_once("conexao.php");
  
  $idpessoa = $_POST['idpessoa'];
  $nome = $_POST['nome'];
  $funcao = $_POST['funcao'];

  if ($idpessoa == "") {
    $sql = "insert into pessoa (nome, funcao) values ('$nome', '$funcao')";
  }
  else {
    $sql = "update pessoa set nome = '$nome', funcao = '$funcao' where idpessoa = $idpessoa";
  }

  if (pg_query($conexao, $sql)) {
    header("location: pessoa.php");
  }
  else {
    echo "Deu erro";
  }

?>