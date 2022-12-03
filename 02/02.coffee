fs = require "fs"
path = require "path"

data = fs.readFileSync(path.join(__dirname, "02.txt"), "utf-8")

score = 0

ELF_ROCK = "A"
ELF_PAPER = "B"
ELF_SCISSORS = "C"

# thanks!
YOU_ROCK = "X"
YOU_PAPER = "Y"
YOU_SCISSORS = "Z"

pickMap = {
	[YOU_ROCK]: 1,
	[YOU_PAPER]: 2,
	[YOU_SCISSORS]: 3
}

elfToYou = {
	[ELF_ROCK]: YOU_ROCK,
	[ELF_PAPER]: YOU_PAPER,
	[ELF_SCISSORS]: YOU_SCISSORS
}

for line from data.split("\n")
	if line == ""
		break

	[elfPick, yourPick] = line.split(" ")

	# add points for your pick
	score += pickMap[yourPick]

	# did you draw?
	if elfToYou[elfPick] == yourPick
		score += 3
	else if (elfPick == ELF_ROCK and yourPick == YOU_PAPER) or (elfPick == ELF_PAPER and yourPick == YOU_SCISSORS) or (elfPick == ELF_SCISSORS and yourPick == YOU_ROCK)
		score += 6

console.log score