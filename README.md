Battleships Online
==================
This was the weekend challenge set for Week 5 at Makers Academy - the creation of web interface that would allow two players to Battleships).

Please note that this is currently work in progress and unfinished.

Objectives
----------
- Introduction to Sinatra
- Practice Ruby

High level specification
---------------------------
- When a potential player goes to the website the player will be prompted for a name to register for a new game (only if there are less than two players already registered).
- Once registered you will be able to place your ships (you will need to show a grid and allow the players to place their ships on it; the types and numbers of ships allowed are the same for each player).
- After the ships have been positioned, the game proceeds in a series of rounds. In each round, each player takes a turn to announce a target square in the opponent's grid which is to be shot at. The opponent announces whether or not the square is occupied by a ship, and if it is a "hit" they mark this on their own primary grid. The attacking player notes the hit or miss on their own "tracking" grid, in order to build up a picture of the opponent's fleet.
- When all of the squares of a ship have been hit, the ship is sunk, and the ship's owner announces this (e.g. "You sank my battleship!"). If all of a player's ships have been sunk, the game is over and their opponent wins.
- You will be able to use the Coordinate, Coordinates and Ship (and it’s children) from this repo https://github.com/ecomba/battleships

Technologies used
-----------------
* Ruby
* Sinatra

How to run program
------------------
```sh
git clone https://github.com/juliatan/battleships-online
cd battleships-online
ruby battleships.rb
```

Go to localhost:4567 in your browser. Note that you need to input 2 names for the game to commence.

Next steps
----------
- Allow two players to play this over the internet
