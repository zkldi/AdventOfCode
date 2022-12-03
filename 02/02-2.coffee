fs = require "fs"
path = require "path"

data = fs.readFileSync(path.join(__dirname, "02.txt"), "utf-8")

score = 0

ROCK = "A"
PAPER = "B"
SCISSORS = "C"

pickPoints = {
	[ROCK]: 1,
	[PAPER]: 2,
	[SCISSORS]: 3
}

toWin = {
	[ROCK]: PAPER,
	[PAPER]: SCISSORS,
	[SCISSORS]: ROCK
}

toLose = {
	[ROCK]: SCISSORS,
	[PAPER]: ROCK,
	[SCISSORS]: PAPER
}

LOSE = "X"
DRAW = "Y"
WIN = "Z"

getPickForState = (elfInput, desiredState) ->
	switch desiredState
		when WIN then toWin[elfInput]
		when DRAW then elfInput
		when LOSE then toLose[elfInput]

for line from data.split("\n")
	if line == ""
		break

	[elfPick, desiredState] = line.split(" ")

	yourPick = getPickForState(elfPick, desiredState)

	# add points for your pick
	score += pickPoints[yourPick]

	score += switch desiredState
		when WIN then 6
		when DRAW then 3
		else 0

console.log score