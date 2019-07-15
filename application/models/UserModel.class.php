<?php

class UserModel {
    function createAccount($firstName, $lastName, $email, $password, $birthDate, $adresse, $city, $zipCode, $phone, $country) {
        $database = new Database();
        $database->executeSql("INSERT INTO user (FirstName, LastName, Email, Password, BirthDate, Adresse, City, ZipCode, Phone, Country) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",[$firstName, $lastName, $email, password_hash($password, PASSWORD_DEFAULT), $birthDate, $adresse, $city, $zipCode, $phone, $country]);
    }
    function verifyAccount($email) {
        $database = new Database();
    }
    function verifyLogin($email) {
        $database = new Database();
        $user = $database->queryOne("SELECT * FROM user WHERE email = ?",[$email]);
        return $user;
    }
    function getProfil($id) {
        $database = new Database();
        $user = $database->queryOne("SELECT * FROM user WHERE Id = ?", [$id]);
        return $user;
    }
}