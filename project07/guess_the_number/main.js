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
		highScores.push([guessesLeft, "Anonymous"]);
		populateHighScores(highScores);
	} else if (guess > answer) {
		alert("Your guess is too high!");
	} else {
		alert("Your guess is too low!");
	}

	guessesLeft--;
	updateScore(guessesLeft);
}

function generateNumberToGuess() {
	answer = Math.floor((Math.random()*100)+1);
}
