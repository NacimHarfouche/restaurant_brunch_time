<?php

class ReservationController
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
        $bookingDate = htmlspecialchars($formFields["bookingDate"]);
        $bookingTime = htmlspecialchars($formFields["bookingTime"]);
        $numberOfSeats = htmlspecialchars($formFields["numberOfSeats"]);
        $userId = $_SESSION["id"];

        $bookingModel = new BookingModel();
        $bookingModel->makeReservation($bookingDate, $bookingTime, $numberOfSeats, $userId);
        $http->redirectTo("/");
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */
    }
}