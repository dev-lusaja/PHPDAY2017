<?php
require 'vendor/autoload.php';

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new \Slim\App();

$app->get('/', function (Request $request, Response $response) {
    $data = array('domain' => $_ENV['VIRTUAL_HOST'], 'containerId' => $_ENV['HOSTNAME']);
	
    return $response->withJson($data, 200);
});
$app->run();
