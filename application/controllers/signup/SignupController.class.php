<?php

class SignupController
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

        $firstName = htmlspecialchars($formFields["firstName"]);
        $lastName = htmlspecialchars($formFields["lastName"]);
        $email = htmlspecialchars($formFields["email"]);
        $password = htmlspecialchars($formFields["password"]);
        $birthDate = htmlspecialchars($formFields["birthDate"]);
        $adresse = htmlspecialchars($formFields["adresse"]);
        $city = htmlspecialchars($formFields["city"]);
        $zipCode = htmlspecialchars($formFields["zipCode"]);
        $phone = htmlspecialchars($formFields["phone"]);
        $country = htmlspecialchars($formFields["country"]);

        $user = new UserModel();
        $user->createAccount($firstName, $lastName, $email, $password, $birthDate, $adresse, $city, $zipCode, $phone, $country);
        $http->redirectTo("/");
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */
    }
}