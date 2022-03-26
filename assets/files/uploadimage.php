<?php

date_default_timezone_set('America/Mexico_City');
$fecha = date("Y-m-d");
$hora = date("g:i a");
$letras = '123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
$codigo = '';

for($i=0; $i<15 ; $i++){
    $codigo .= substr($letras, rand(0,62),1);
}

$new_image_name = $codigo.".jpg";
$file_name = $new_image_name;
$final = 'jpg';
$file_tmp = $_FILES["file"]["tmp_name"];

$dir = './images/'.$new_image_name;
$copiar = move_uploaded_file($_FILES["file"]["tmp_name"],$dir);

if($copiar){
    echo 'https://www.alexquiranza.com/detection/images/'.$new_image_name;
}else{
    echo 'Hubo un error';
}

?>