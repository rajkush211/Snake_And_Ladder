#!/bin/bash -x

clear

#Problem Statement: This problem simulates the Snake and Ladder game
#Author: Raj Kush
#Date: 21 March 2020

#CONSTANTS
START_POSITION=0
WINNING_POSITION=100
NO_PLAY=1
LADDER=2
SNAKE=3


#VARIABLES
newPosition1=0
prevPosition1=0
newPosition2=0
prevPosition2=0
diceRolledCount=0
playerTurn=0


function rollDie() {
	result=$(( RANDOM % 6 + 1 ))
	echo $result
}

function option() {
	choice=$(( RANDOM % 3 + 1 ))
	echo $choice
}

function playerOption() {
	player1=$1
	player2=$2
	playerTurn=$player1
	operation=0
	while [[ $newPosition1 -lt $WINNING_POSITION && $newPosition2 -lt $WINNING_POSITION ]]
	do
		echo -e "\nPlaying $playerTurn:"
		operation=$( option )
		if [ $operation -ne 1 ]
		then
			(( diceRolledCount++ ))
		fi
		case $operation in
			$NO_PLAY)
				echo "NO PLAY"
				if [ $playerTurn == $player1 ]
				then
					prevPosition1=$newPosition1
					newPosition1=$newPosition1
					echo "Position of $player1 is still $newPosition1"
				else
					prevPosition2=$newPosition2
					newPosition2=$newPosition2
					echo "Position of $player2 is still $newPosition2"
				fi;;
			$LADDER)
				echo "LADDER"
				if [ $playerTurn == $player1 ]
				then
					prevPosition1=$newPosition1
					newPosition1=$(( $newPosition1 + $( rollDie ) ))
					if [[ $newPosition1 -gt $WINNING_POSITION ]]
					then
						newPosition1=$prevPosition1
					fi
					echo "Position of $player1 after Dice rolled $newPosition1"
				else
					prevPosition2=$newPosition2
					newPosition2=$(( $newPosition2 + $( rollDie ) ))
					if [[ $newPosition2 -gt $WINNING_POSITION ]]
					then
						newPosition2=$prevPosition2
					fi
					echo "Position of $player2 after Dice rolled $newPosition2"
				fi;;
			$SNAKE)
				echo "SNAKE"
				if [ $playerTurn == $player1 ]
				then
					prevPosition1=$newPosition1
					newPosition1=$(( $newPosition1 - $( rollDie ) ))
					if [[ $newPosition1 -lt  0 ]]
					then
						newPosition1=0
					fi
					echo "Position of $player1 after Dice rolled $newPosition1"
				else
					prevPosition2=$newPosition2
					newPosition2=$(( $newPosition2 - $( rollDie ) ))
					if [[ $newPosition2 -lt  0 ]]
					then
						newPosition2=0
					fi
						echo "Position of $player2 after Dice rolled $newPosition2"
				fi;;
		esac
		if [ $playerTurn == $player1 ]
		then
			playerTurn=$player2
		else
			playerTurn=$player1
		fi
	done
	echo -e "\nThe Dice rolled $diceRolledCount times"
}

function snakeAndLadderGame() {
	read -p "Enter Player 1 name: " player1
	read -p "Enter Player 2 name: " player2
	playerOption $player1 $player2
	if [[ $newPosition1 -eq 100 ]]
	then
		echo -e "\nCongratulations $player1 you won"
	else
		echo -e "\nCongratulations $player2 you won"
	fi
}

snakeAndLadderGame

sleep 1
