#!/bin/bash -x

clear

#Problem Statement: This problem simulates the Snake and Ladder game
#Author: Raj Kush
#Date: 21 March 2020

#CONSTANTS
START_POSITION=0

function rollDie() {
	result=$(( RANDOM % 6 + 1 ))
	echo $result
}

rollDie

sleep 1
