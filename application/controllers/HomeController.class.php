<?php

class HomeController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
        $mealModel = new MealModel();
        $meals = $mealModel->selectAllMeal();
        return ["meals"=>$meals];


    	/*
    	 * Méthode appelée en cas de requête HTTP GET
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $queryFields contient l'équivalent de $_GET en PHP natif.
    	 */
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
        $http->moveUploadedFile("fichier","/images");
        $http->redirectTo("/");
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */
    }
}