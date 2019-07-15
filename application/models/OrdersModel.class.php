<?php

class OrdersModel {
    function addOrder($id) {
        $database = new Database();
        $idOrder = $database->executeSql("INSERT INTO orders (User_Id) VALUES (?)", [$id]);
        return $idOrder;
    }
    function addAmount($totalTTC, $taxRate, $taxAmount, $id) {
        $database = new Database();
        $database->executeSql("UPDATE orders SET TotalAmount = ?, TaxRate = ?, TaxAmount = ? WHERE Id = ?", [$totalTTC, $taxRate, $taxAmount, $id]);
    }
    function getOrder($id) {
        $database = new Database();
        $order = $database->query("SELECT * FROM orders 
INNER JOIN orderline ON orderline.Order_Id = orders.id 
INNER JOIN meal ON meal.Id = orderline.Meal_Id WHERE orders.id = ?", [$id]);
        return $order;
    }
    function orderPaid($id) {
        $database = new Database();
        $database->executeSql("UPDATE orders SET CompleteTimeStamp = now() WHERE id = ?", [$id]);
    }
}