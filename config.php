<?php

$mysql = new mysqli('31.220.63.114', 'felipesandy', '123456', 'trabalhodb', '3306');
$mysql->set_charset('utf8');

if ($mysql == FALSE) {
    echo "Erro na conexão";
}
