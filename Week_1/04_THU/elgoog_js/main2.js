//get the container
let monTableau = document.querySelector('#tableau');

//get the number of cells per line/row
let tabSize = parseInt(prompt("Quelle dimension de la grille veux-tu?"));

//max 70 cells per line/row
if (tabSize > 70) tabSize = 70;

//fill the container
for (var iter = 1; iter <= tabSize*tabSize; iter++) {
	var newCel = document.createElement("div");
	newCel.style.width = (300/tabSize) + "px";
	newCel.style.heigth = (300/tabSize) + "px";
	monTableau.appendChild(newCel);
}