<?php

class VerifyorderController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
    	/*
    	 * Méthode appelée en cas de requête HTTP GET
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $queryFields contient l'équivalent de $_GET en PHP natif.
    	 */
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
        session_start();
        $userId = $_SESSION["id"];

        $order = new OrdersModel();
        $id = $order->addOrder($userId);

        $panier = json_decode($formFields["panier"]);
        $orderLine = new OrderlineModel();
        $totalHT = 0;

        foreach ($panier as $meal) {
            $orderLine->addOrderLine($meal->quantity, $meal->Id, $id, $meal->SalePrice);
            $totalHT += floatval($meal->SalePrice) * $meal->quantity;
        }

        $taxRate = 0.2;
        $taxAmount = $totalHT * $taxRate;
        $totalTTC = $taxAmount + $totalHT;
        $order->addAmount($totalTTC, $taxRate, $taxAmount, $id);

        $http->sendJsonResponse($id);
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */
    }
}