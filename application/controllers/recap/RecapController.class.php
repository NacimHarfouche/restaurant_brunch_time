<?php

class RecapController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
        session_start();
        $userId = $_SESSION["id"];
        $orderId = $queryFields["id"];

        $userModel = new UserModel();
        $user = $userModel->getProfil($userId);

        $orderModel = new OrdersModel();
        $order = $orderModel->getOrder($orderId);

        return ["user"=>$user, "order"=>$order];
    	/*
    	 * Méthode appelée en cas de requête HTTP GET
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $queryFields contient l'équivalent de $_GET en PHP natif.
    	 */
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */
    }
}