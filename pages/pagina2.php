<?php

require '../config.php';
require '../src/respostas.php';

/** @var TYPE_NAME $mysql */
$resposta = new Resposta($mysql);
$respostas = $resposta->resposta2();

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Trabalho BD</title>
</head>

<body>

<header>
    <div class="container bg-secondary bg-gradient">
        <div class="row justify-content-center m-2">
            <div class="col-4 p-2 text-center">
                <h4> Trabalho BD - A</h4>
            </div>
        </div>
    </div>
</header>

<section class="container mt-5">
    <div class="row">
        <div class="col-md-5">
            <div class="">
                <h4>
                    2) Qual(is) médicos atenderam quais pacientes;
                </h4>
                <div>
                    O Código utilizado no banco para a consulta:
                    <hr>
                    <code>select fk_medico_nome, fk_cliente_nome from consulta</code>
                </div>
            </div>
            <a class="btn btn-outline-primary mt-4" href="../index.php" role="button">Voltar</a>
        </div>
        <div class="col-md-7">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Médico</th>
                    <th scope="col">Paciente</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($respostas as $resposta) : ?>
                <tr>
                    <th scope="row"></th>
                    <td><?php echo $resposta['fk_medico_nome']; ?></td>
                    <td><?php echo $resposta['fk_cliente_nome']; ?></td>
                </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>
