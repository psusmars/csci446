var guessesLeft = 10;
var answer = 0;
var done = false;
var highScores = new Array([9, "HarryJamesPotter"], [3, "ZedCthulhu"], [2, "NearlyDied"]);

$(function() {
	updateScore(guessesLeft);
	generateNumberToGuess();
	populateHighScores(highScores);
});

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

function doEndGame() {
	$('div#inputArea').hide(1000);
	done = true;
}

function theGuess() {
	if(!done)
	{
		var guess = $("#guess").attr("value");
		if (isNaN(guess) || guess == "" || guess < 0
		    || guess > 100)
		{
			$('#hint').html("Invalid input! Try again.");
			return;
		}
		if (guess == answer) {
			var name = prompt("Enter your name for high scores: ", "Anonymous");
			if( name != null ){ highScores.push([guessesLeft, name]); }
			populateHighScores(highScores);
			$("#end_game_text").airport([ "You have outsmarted the zombies!",  "Play again?", "You have won!" ]);
			doEndGame();
		} else {
			guessesLeft--;
			if(guessesLeft <= 0)
			{
				$("#end_game_text").airport([ "Your brains are Zombified!",  "Play again?", "You have lost!" ]);
				doEndGame();
			} else {
				if (guess > answer) {
					$('#hint').html("Your guess is too high!");
				} else {
					$('#hint').html("Your guess is too low!");
				}
			}
			updateScore(guessesLeft);
		}
	}
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


$.fn.extend({
    airport: function(array) {
        var self = $(this);
        //only modified this array
        //added the needed characters
        var chars = ['P', '\'', 'Z', 'Y', 'a', 'b', 'c', 'd', 'e', 'f', 'g', ' ', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '-', '!', '?'];        var longest = 0;
        var items = items2 = array.length;

        function pad(a, b) { return a + new Array(b - a.length + 1).join(' '); }
        $(this).empty();
        while (items--)
            if (array[items].length > longest) longest = array[items].length;
        while (items2--)
            array[items2] = pad(array[items2], longest);
        spans = longest;
        while (spans--)
            $(this).prepend("<span class='c" + spans + "'></span>");
        function testChar(a, b, c, d) {
            if (c >= array.length) setTimeout(function() {
                testChar(0, 0, 0, 0);
            }, 500);
            else if (d >= longest) setTimeout(function() {
                testChar(0, 0, c + 1, 0);
            }, 500);
            else {
                $(self).find('.c' + a).html((chars[b] == " ") ? "&nbsp;" : chars[b]);
                setTimeout(function() {
                    if (b > chars.length) testChar(a + 1, 0, c, d + 1);
                    else if (chars[b] != array[c].substring(d, d + 1)) testChar(a, b + 1, c, d);
                    else testChar(a + 1, 0, c, d + 1);
                }, 20);
            }
        }
        testChar(0, 0, 0, 0);
    }
});