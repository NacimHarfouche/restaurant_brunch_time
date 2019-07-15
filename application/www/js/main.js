'use strict';
/////////////////////////////////////////////////////////////////////////////////////////
// Variable                                                                          //
/////////////////////////////////////////////////////////////////////////////////////////
let emailElt = $("#email");
let selectElt = $("#products");
let ulElt = $("#displayProduct");
let buttonAddElt = $("#addProduct");
let currentMeal;
let tab = [];
let panier = [];
panier = loadDataFromDomStorage("panier");
if (panier == null) panier = [];

let buttonSubmitElt = $("#submit");

/////////////////////////////////////////////////////////////////////////////////////////
// FONCTIONS                                                                           //
/////////////////////////////////////////////////////////////////////////////////////////
function ajaxRequest(data) {
    $.getJSON(getRequestUrl() + "/verifyaccount?email=" + emailElt.val(), verifyEmail);
}

function verifyEmail(data) {
    let mail = emailElt.val();
    emailElt.setAttribute("style", "border: red;");
    console.log("test");
}

function ajaxRequestMeal(id) {
    $.getJSON(getRequestUrl() + "/mealajax?id=" + id, mealReturnJson);
}

function mealReturnJson(data) {
    currentMeal = data;
    ulElt.empty();
    let imgElt = $("<img>").attr("src", getWwwUrl() + "/images/meals/" + data.Photo);
    imgElt.attr("style", "width: 200px;");
    let paraOneElt = $("<p>").text(data.Description);
    let paraTwoElt = $("<p>").text(data.SalePrice + " €");
    let liOneElt = $("<li>").append(imgElt);
    let liTwoElt = $("<li>").append(paraOneElt, paraTwoElt);
    ulElt.append(liOneElt, liTwoElt);
}

function deleteMeal(){
    let id = $(this).data("id");
    panier.splice(id, 1);
    console.log(id);
    saveDataToDomStorage("panier", panier);
    mealAddCart();
}

function mealAddCart() {
    $("#contenuProduct").empty();
    console.log(panier);
    let count = 0;
        for (let produit of panier) {
            let total = parseFloat(produit.SalePrice) * produit.quantity;
            let tdQuantiteElt = $("<td>").text(produit.quantity);
            let tdProduitElt = $("<td>").text(produit.Name);
            let tdPrixUnitElt = $("<td>").text(produit.SalePrice + " €");
            let tdPrixTotalElt = $("<td>").text(total + " €");

            let iconElt = $("<i>").addClass("far fa-trash-alt")
            let buttonDeleteElt = $("<a>").append(iconElt);
            buttonDeleteElt.attr("data-id", count);
            buttonDeleteElt.on("click", deleteMeal);
            buttonDeleteElt.attr("href", "#");
            buttonDeleteElt.addClass("trashIt");
            let tdDeletElt = $("<td>").append(buttonDeleteElt);

            let trLineProductElt = $("<tr>").attr("class", "productLine");

            trLineProductElt.append($("<td>"), tdQuantiteElt, tdProduitElt, tdPrixUnitElt, tdPrixTotalElt, tdDeletElt);
            $("#contenuProduct").append(trLineProductElt);
            count++;
        }
        console.log("Nombre de produit dans la panier: " + panier.length);
}

function returnFromBD(idOrder) {
    location.assign(getRequestUrl() + "/recap?id=" + JSON.parse(idOrder));
}

/////////////////////////////////////////////////////////////////////////////////////////
// CODE PRINCIPAL                                                                      //
/////////////////////////////////////////////////////////////////////////////////////////
// au chargement de la page
window.addEventListener("load", ()=> {
    ajaxRequestMeal(1);
    mealAddCart();
});

emailElt.change(function () {
    ajaxRequest(getRequestUrl() + "");
});

selectElt.change( function() {
    ajaxRequestMeal(this.value);
});

buttonAddElt.on("click", function() {
    currentMeal.quantity = parseFloat($("#quantity").val());
    let existingMeal = panier.find((meal)=>meal.Name == currentMeal.Name);
    if (existingMeal) {
        existingMeal.quantity += currentMeal.quantity;
    }else{
        panier.push(currentMeal);
    }
    saveDataToDomStorage("panier", panier);
    mealAddCart();
});

buttonSubmitElt.on("click", function() {
    let sendPanier = {
        "panier": JSON.stringify(panier)
    };
   $.post(getRequestUrl() + "/verifyorder", sendPanier, returnFromBD);
});
