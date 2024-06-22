# Tic Tac Toe

## Instructions to run this game

1. Clone this repository into your local machine or run this command `git@github.com:Atul-Vish/tic-tac-toe.git`
2. Go to the **tic-tac-toe** directory in your local machine and run `ruby main.rb`
3. Game will start and you'll be prompted with a message *Player1 is 'X' and Player2 is 'O'*
4. First turn will be given to **Player1**
5. Second turn will be given to **Player2**
6. After that **Player1** and **Player2** will take consecutive turns
7. For making a valid move, you'll be prompted to enter row and column
8. If you win the game, you'll be prompted with a `(Your Player Name) won the Game!!` message
9. If board gets filled but no one has won then you'll be prompted with a `The Game ended in Draw!!`


## My Learnings

I learned and implemented the Object Oriented Principles. I had trouble understanding whether to put some method into **Board** class or **Player** class. I tried my best to show as little interfaces as possible as I read in [this article](https://eriktrautman.com/posts/ruby-explained-inheritance-and-scope) that doing so is considered to be a good practice and make better APIs. The most difficult part was implementing the winning condition. Although, it was quite simple logically *check for either row, col or diagonal*. If any of the condition satisfies then you won but implementing that took a huge toll on my mental capacity. I tried the brute force approach of checking for every possible case, like `array[0][0] == "X" && array[0][] == array[0][1] && array[0][1] == array[0][2]` but it was quite inefficient. So I settled on looping through each row, then increase a counter for each value in that row, at the end of row if your counter == 3, you won. I still don't know if it's efficient or not, lol. 
