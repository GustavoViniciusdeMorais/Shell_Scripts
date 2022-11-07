#!/bin/bash
read -p "Input some int number:" a
read -p "Input another int number:" b
read -p "Choose the math operator (+, -, /, *):" operator
echo "Result is " `expr $a $operator $b`
