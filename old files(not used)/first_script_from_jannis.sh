#!/bin/bash
# This is a comment

echo "Welcome to the game!"
echo "Please select a game mode:"
echo "1. Single player"
echo "2. Multiplayer"
echo "3. End Game"

read -p "Enter your choice (1 or 2 or 3): " choice

if [ "$choice" == "1" ]; then
  echo "You have selected single player mode."
# Funktion zum Ausgeben des Spielstandes
function print_score {
  echo "===================="
  echo -e "Spieler: \e[33m$player_score\e[0m"
  if (( $move > 2 )); then
    echo -e "Computer: \e[31m$computer_score\e[0m"
  else
    echo -e "Computer: \e[34m$computer_score\e[0m"
  fi
  echo "===================="
  if (( $player_score >= 20 )); then
    echo -e "\e[32mHerzlichen Glückwunsch, Sie haben gewonnen!\e[0m"
    exit
  elif (( $computer_score >= 20 )); then
    echo -e "\e[31mDer Computer hat gewonnen. Versuchen Sie es noch einmal!\e[0m"
    exit
  fi
}

# Funktion zum Überprüfen, ob das Spiel beendet ist
function check_game_over {
  if (( $player_score >= 20 || $computer_score >= 20 )); then
    return 1
  fi
  return 0
}

# Funktion zum Ziehen des Computers
function computer_move {
  if (( $difficulty == 1 )); then
    move=$((RANDOM % 2 + 1))
  else
    if (( $player_score >= 18 )); then
      move=2
    elif (( $player_score == 17 )); then
      move=$((RANDOM % 2 + 1))
    elif (( $player_score == 16 && $computer_score == 0 )); then
      move=2
    elif (( $player_score == 16 && $computer_score == 1 )); then
      move=1
    elif (( $player_score == 15 && $computer_score == 1 )); then
      move=2
    elif (( $player_score == 14 && $computer_score == 1 )); then
      move=$((RANDOM % 2 + 1))
    else
      move=1
    fi
  fi
  computer_score=$((computer_score+move))
}

# Initialisieren Sie den Spielstand
player_score=0
computer_score=0

# Wählen Sie den Schwierigkeitsgrad
echo -e "mWählen Sie den Schwierigkeitsgrad (1 für Easy, 2 für Schwierig): "
read difficulty

# Starten Sie die Schleife für das Hauptspiel
while true; do
  echo "Ihr Spielstand: $player_score"
  echo -e "Wählen Sie eine Zahl zwischen 1 und 2:"
  read move
  if (( $move < 1 || $move > 2 )); then
    echo -e "\e[31mUngültiger Zug. Bitte wählen Sie eine Zahl zwischen 1 und 2.\e[0m"
    continue
  fi
  player_score=$((player_score+move))
  check_game_over
  print_score
  computer_move
  print_score
done
  # code for single player mode goes here
elif [ "$choice" == "2" ]; then
  echo "You have selected multiplayer mode."
  # Set the starting score and player
score=0
read -p "Player name 1: " playerName1
read -p "Player name 2: " playerName2
player1="$playerName1"
player2="$playerName2"
current_player=$player1

# Loop until someone reaches 20 points
while [ $score -lt 20 ]
do
    # Prompt the player for their choice (1 or 2)
    read -p "$current_player, choose 1 or 2: " choice

    # Make sure the input is valid (1 or 2)
    while [ $choice -ne 1 ] && [ $choice -ne 2 ]
    do
        read -p "Invalid input. $current_player, choose 1 or 2: " choice
    done

    # Add the player's choice to the score
    score=$((score + choice))

    # Switch to the other player
    if [ "$current_player" = "$player1" ]
    then
        current_player=$player2
    else
        current_player=$player1
    fi

    # Print the current score
    echo "Current score: $score"
done

# The player who caused the score to reach 20 wins
echo "$current_player wins!" # code for multiplayer mode goes here
elif [ "$choice" == "3" ]; then
  echo "Thanks for Play :)"
  # code for end mode goes here
else
  echo "Invalid choice. Please enter 1 or 2 or 3."
fi
