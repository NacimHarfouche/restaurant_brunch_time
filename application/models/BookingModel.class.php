<?php

class BookingModel {
    function makeReservation($bookingDate, $bookingTime, $numberOfSeats, $userId) {
        $database = new Database();
        $database->executeSql("INSERT INTO booking (BookingDate, BookingTime, NumberOfSeats, User_Id) VALUES (?, ?, ?, ?)", [$bookingDate, $bookingTime, $numberOfSeats, $userId]);
    }
}