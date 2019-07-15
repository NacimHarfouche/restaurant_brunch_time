<?php

class MealModel {
    function selectAllMeal() {
        $database = new Database();
        $meals = $database->query("SELECT * FROM meal");
        return $meals;
    }
    function selectOneMeal($id) {
        $database = new Database();
        $meal = $database->queryOne("SELECT * FROM meal WHERE Id = ?", [$id]);
        return $meal;
    }
}