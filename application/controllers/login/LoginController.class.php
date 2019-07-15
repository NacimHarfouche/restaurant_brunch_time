<?php

class LoginController
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
        $email = htmlspecialchars($formFields["email"]);
        $password = htmlspecialchars($formFields["password"]);

        $userModel = new UserModel();
        $user = $userModel->verifyLogin($email);

        if($user) {
            if (password_verify($password, $user["Password"])) {
                session_start();
                $_SESSION["id"] = $user["Id"];
                $_SESSION["name"] = $user["FirstName"];
                $_SESSION["lastName"] = $user["LastName"];
                $http->redirectTo("/");
            }
        } else {
            echo "N'existe pas sur la base";
        }
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */
    }
}