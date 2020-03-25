#!/bin/bash -x

clear

#Problem Statement: This problem simulates the Snake and Ladder game
#Author: Raj Kush
#Date: 21 March 2020

#CONSTANTS
START_POSITION=0
WINNING_POSITION=100

#VARIABLES
newPosition=0
prevPosition=0
diceRolledCount=0

function rollDie() {
	result=$(( RANDOM % 6 + 1 ))
	echo $result
}

function option() {
	choice=$(( RANDOM % 3 + 1 ))
	echo $choice
}

function playerOption() {
	while [[ $newPosition -lt $WINNING_POSITION ]]
	do
		operation=$( option )
		case $operation in
			1)
				prevPosition=$newPosition
				newPosition=$newPosition;;
			2)
				prevPosition=$newPosition
				newPosition=$(( $newPosition + $( rollDie ) ))
				(( diceRolledCount++ )) 
				if [[ $newPosition -gt $WINNING_POSITION ]]
				then
					newPosition=$prevPosition
				fi;;
#				echo "Position after Dice rolled $newPosition";;
			3)
				prevPosition=$newPosition
				newPosition=$(( $newPosition - $( rollDie ) ))
				(( diceRolledCount++ ))
				if [[ $newPosition -lt  0 ]]
				then
					newPosition=0
				fi;;
#				echo "Position after Dice rolled $newPosition";;
		esac
	done
	echo "$diceRolledCount"
}

function snakeAndLadderGame() {
	read -p "Enter Player1 name: " player1
	read -p "Enter Player2 name: " player2
	player1Game=$( playerOption )
	player2Game=$( playerOption )
	echo -e "\n$player1 rolled the Dice for $player1Game times"
	echo "$player2 rolled the Dice for $player2Game times"
	if [[ $player1Game -lt $player2Game ]]
	then
		echo -e "\nCongratulations $player1 you won"
	else
		echo -e "\nCongratulations $player2 you won"
	fi
}

snakeAndLadderGame

sleep 1
