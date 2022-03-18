<?php
  require_once("conexao.php");
  
  $idsituacao = $_GET['id'];

  $sql = "delete from situacao where idsituacao = $idsituacao";

  if (pg_query($conexao, $sql)) {
    header("location: situacao.php");
  }
  else {
    echo "Deu erro " . pg_last_error($conexao);
  }

?>