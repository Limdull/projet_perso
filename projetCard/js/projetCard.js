// author: Morgan Liébert
// date created: 24/08/18



function putCardBorder(element) {
	element.style.border = "5px outset white";
}

function removeCardBorder(element) {
	element.style.border = "none";
}


// gestion du drag&drop des cartes dans la main d'un joueur
// what data to drag
function drag(ev) {
	ev.dataTransfer.setData("card", ev.target.id);
}

// what do when you release mouseButton
function drop(ev) {
	ev.preventDefault();
	var data = ev.dataTransfer.getData("card");
	ev.target.appendChild(document.getElementById(data));
}

// prevent default browser behaviour
function allowDrop(ev) {
	ev.preventDefault();
}