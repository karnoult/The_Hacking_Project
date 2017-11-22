var tiles = ["green", "blue", "red", "yellow"];
var seq;
var turn;
var tileClicked;

document.getElementById("start").addEventListener("click", function () { return init(); });

// init game
function init() {
    turn = 0;
    seq = [];
    for (var i = 0; i < tiles.length; i++) {
        document.getElementById(tiles[i]).addEventListener("click", clickTile);
    }
    newTile();
}

// stop game
function loose() {
    document.getElementById("black").textContent = "you loose";
    for (var i = 0; i < tiles.length; i++) {
        document.getElementById(tiles[i]).removeEventListener("click", clickTile);
    }
}

function clickTile() {
    // only one tile can be clicked at a time
    if (tileClicked) return;

    tileClicked = this;

    // identify which tile has been clicked
    tileClickedIndex = tileClicked.getAttribute("value");

    // play sound
    new Audio("/assets/audio/beep-" + tileClickedIndex + ".mp3").play();

    // show which tile has been clicked
    tileClicked.style.opacity = 0.5;
    setTimeout(function () {
        tileClicked.style.opacity = 1;
        tileClicked = null;
        checkTileClicked(tileClickedIndex);
    }, 100);
}

// add a new tile to the game sequence
function newTile() {
    turn = 0;
    seq.push(Math.floor((Math.random() * 4)));
    document.getElementById("black").textContent = seq.length;
    highlightTile();
}

function checkTileClicked(tileClickedIndex) {
    if (tileClickedIndex == seq[turn]) {
        turn++;
        if (turn == seq.length)
            newTile();
    } else
        loose();
}

async function highlightTile(i = 0) {

    if (i == 0) {
        await sleep(1000);
    } else if (i > 0) {
        document.getElementById(tiles[seq[i - 1]]).style.opacity = 1;
    }

    if (i != seq.length) {
        new Audio("/assets/audio/beep-" + seq[i] + ".mp3").play();
        document.getElementById(tiles[seq[i]]).style.opacity = 0.5;
        i++
        setTimeout(function () { highlightTile(i); }, 500);
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}