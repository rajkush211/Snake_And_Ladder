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
	while [[ $newPosition -lt 100 ]]
	do
		operation=$( option )
		case $operation in
			1)
				newPosition=0;;
			2)
				newPosition=$(( $newPosition + $( rollDie ) ));;
			3)
				newPosition=$(( $newPosition - $( rollDie ) ))
				if [[ $newPosition -lt  0 ]]
				then
					newPosition=0
				fi;;
		esac
	done
	echo $newPosition
}

playerOption

sleep 1
