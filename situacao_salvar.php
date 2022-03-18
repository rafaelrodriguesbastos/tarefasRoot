<?php
  require_once("conexao.php");
  
  $idsituacao = $_POST['idsituacao'];
  $descricao = $_POST['descricao'];

  if ($idsituacao == "") {
    $sql = "insert into situacao (descricao) values ('$descricao')";
  }
  else {
    $sql = "update situacao set descricao = '$descricao' where idsituacao = $idsituacao";
  }

  if (pg_query($conexao, $sql)) {
    header("location: situacao.php");
  }
  else {
    echo "Deu erro";
  }

?>