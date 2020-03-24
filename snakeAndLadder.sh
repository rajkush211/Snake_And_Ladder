#!/bin/bash -x

clear

#Problem Statement: This problem simulates the Snake and Ladder game
#Author: Raj Kush
#Date: 21 March 2020

#CONSTANTS
START_POSITION=0

#VARIABLES
newPosition=0

function rollDie() {
	result=$(( RANDOM % 6 + 1 ))
	echo $result
}

function option() {
	choice=$(( RANDOM % 3 + 1 ))
	echo $choice
}

function playerOption() {
	operation=$( option )
	case $operation in
		1)
			newPosition=0;;
		2)
			newPosition=$(( $newPosition + $( rollDie ) ));;
		3)
			newPosition=$(( $newPosition - $( rollDie ) ));;
	esac
	echo $newPosition
}

playerOption

sleep 1
