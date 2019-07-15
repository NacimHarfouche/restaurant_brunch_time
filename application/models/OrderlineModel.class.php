<?php

class OrderlineModel {
    function addOrderLine($quantity, $mealId, $orderId, $priceEach) {
        $database = new Database();
        $database->executeSql("INSERT INTO orderline (QuantityOrdered, Meal_Id, Order_Id, PriceEach) VALUES (?, ?, ?, ?)", [$quantity, $mealId, $orderId, $priceEach]);
    }
}