<?php

require '../config.php';

class Resposta
{
    private $mysql;

    public function __construct(mysqli $mysql)
    {
        $this->mysql = $mysql;
    }

    public function resposta1(): array
    {

        $resultado = $this->mysql->query('select count(*) as "consultas" from consulta where data_exame >= "2020-12-12" and data_exame <= "2021-03-25"');
        $respostas = $resultado->fetch_all(MYSQLI_ASSOC);

        return $respostas;
    }

    public function resposta2(): array
    {

        $resultado = $this->mysql->query('SELECT fk_medico_nome, fk_cliente_nome FROM consulta');
        $respostas = $resultado->fetch_all(MYSQLI_ASSOC);

        return $respostas;
    }

    public function resposta3(): array
    {

        $resultado = $this->mysql->query('select fk_medico_nome, sum(recebido_por_medico) as "pago" from trabalhodb.info_pagamento group by fk_medico_nome;');
        $respostas = $resultado->fetch_all(MYSQLI_ASSOC);

        return $respostas;
    }

    public function resposta4(): array
    {

        $resultado = $this->mysql->query('select fk_medico_nome, sum(recebido_por_medico + comissao_clinica) as "soma" from trabalhodb.info_pagamento group by fk_medico_nome');
        $respostas = $resultado->fetch_all(MYSQLI_ASSOC);

        return $respostas;
    }

    public function resposta5(): array
    {
        $resultado = $this->mysql->query('SELECT fk_medico_nome, COUNT( * ) AS "clientes" FROM consulta GROUP BY fk_cliente_nome ORDER BY COUNT( * ) DESC;');
        $respostas = $resultado->fetch_all(MYSQLI_ASSOC);

        return $respostas;
    }

    public function resposta7(): array
    {
        $resultado = $this->mysql->query('select fk_cliente_nome, exame_realizado, data_exame, doenca_cronica from consulta where doenca_cronica = True and date_add(data_exame, interval 6 month)');
        $respostas = $resultado->fetch_all(MYSQLI_ASSOC);

        return $respostas;
    }

    public function resposta8(): array
    {
        $resultado = $this->mysql->query('select fk_plano_de_saude_nome as "plano", COUNT( * ) as "rede" from atende group by fk_plano_de_saude_nome order by COUNT( * ) desc;');
        $respostas = $resultado->fetch_all(MYSQLI_ASSOC);

        return $respostas;
    }

    public function resposta9(): array
    {
        $resultado = $this->mysql->query('select AVG(idade) as "media" from cliente');
        $respostas = $resultado->fetch_all(MYSQLI_ASSOC);

        return $respostas;
    }

    public function resposta10(): array
    {
        $resultado = $this->mysql->query("select nome, tipo_contrato, especialidade, crm from medico where tipo_contrato = 'PJ' ");
        $respostas = $resultado->fetch_all(MYSQLI_ASSOC);

        return $respostas;
    }
}