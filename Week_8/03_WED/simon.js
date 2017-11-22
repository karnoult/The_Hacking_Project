var tiles = ["green", "blue", "red", "yellow"];
var seq;
var turn;
var elementClicked;

function init() {
    turn = 0;
    seq = [Math.floor((Math.random() * 4))];
    highlightTile();
    for (var i = 0; i < tiles.length; i++) {
        document.getElementById(tiles[i]).addEventListener("click", clickTile);
    }
    updateTurn();
    console.log(seq);
}

function loose() {
    document.getElementById("black").textContent = "you loose";
    for (var i = 0; i < tiles.length; i++) {
        document.getElementById(tiles[i]).removeEventListener("click", clickTile);
    }
}

function updateTurn() {
    document.getElementById("black").textContent = seq.length;
}

function clickTile() {
    // only one tile can be clicked at a time
    if (elementClicked) return;

    i = this.getAttribute("value");

    new Audio("audio/beep-" + i + ".mp3").play();

    // show which tile has been clicked
    elementClicked = this;
    elementClicked.style.opacity = 0.5;
    setTimeout(function () {
        elementClicked.style.opacity = 1;
        elementClicked = null;
        checkTileClicked(i);
    }, 100);
}

function checkTileClicked(i) {
    if (i == seq[turn]) {
        turn++;
        if (turn == seq.length) {
            turn = 0;
            seq.push(Math.floor((Math.random() * 4)));
            highlightTile();
            updateTurn();
        }
    } else {
        loose();
    }

    console.log(seq);
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function highlightTile(i = 0) {

    if (i == 0) {
        await sleep(1000);
    } else if (i > 0) {
        document.getElementById(tiles[seq[i - 1]]).style.opacity = 1;
    }

    if (i != seq.length) {
        new Audio("audio/beep-" + seq[i] + ".mp3").play();
        document.getElementById(tiles[seq[i]]).style.opacity = 0.5;
        i++
        setTimeout(function () { highlightTile(i); }, 500);
    }
}

document.getElementById("start").addEventListener("click", function () { return init(); });