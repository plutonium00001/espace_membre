<?php

$pdo = new PDO('mysql:dbname='nom_de_votre_base';host='adresse_du_serveur','nom_utilisateur','mot_de_passe');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
