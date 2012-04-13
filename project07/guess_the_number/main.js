var guessesLeft = 10;
var answer = 0;
var highScores = new Array([9, "HarryJamesPotter"], [3, "ZedCthulhu"], [2, "NearlyDied"]);

$(function() {
	updateScore(guessesLeft);
	generateNumberToGuess();
	cheat();
	populateHighScores(highScores);
});

function cheat(){
	highScores.push([answer, "answer"]);
}

function populateHighScores(scores) {
	$('div#highScores').html("");
	//Sort the array by score
	scores.sort(SortByScore);
	for (var i = 0; i < scores.length; ++i) {
		$('div#highScores').append("<p>" + scores[i][0] + " " + scores[i][1] + "</p>");
	}
}

function updateScore(score) {
	$('h2#score span#guessesLeft').html(score);
}

function theGuess() {
	var guess = $("#guess").attr("value");
	if (guess == answer) {
		var name = prompt("Enter your name for high scores: ", "Anonymous");
		if( name != null ){ highScores.push([guessesLeft, name]); }
		populateHighScores(highScores);
		$('form#guessTheNumber').before("<p>Play again?</p>");
	} else if (guess > answer) {
		alert("Your guess is too high!");
	} else {
		alert("Your guess is too low!");
	}

	guessesLeft--;
	updateScore(guessesLeft);
}

function SortByScore(x, y) {
	var xScore = x[0];
	var yScore = y[0];
	if(xScore == yScore) 
	{
		return 0;
	} else if (xScore < yScore) {
		// x will come after y
		return 1;
	} else {
		// x will come before y
		return -1;
	}
}

function generateNumberToGuess() {
	answer = Math.floor((Math.random()*100)+1);
}
