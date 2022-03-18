<?php
  require_once("conexao.php");
  
  $idpessoa = $_GET['id'];

  $sql = "delete from pessoa where idpessoa = $idpessoa";

  if (pg_query($conexao, $sql)) {
    header("location: pessoa.php");
  }
  else {
    echo "Deu erro " . pg_last_error($conexao);
  }

?>