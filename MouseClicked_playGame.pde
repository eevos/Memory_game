void playGame(Card clickedCard) //<>//
{
  if (clickCount==0)
  {
    clickedCard1 = clickedCard;
    clickedCard1.setVisibility(true);
    clickCount++;
    card1 = true;
  } else          
  {
    clickedCard2 = clickedCard;   
    clickedCard2.setVisibility(true);
    clickCount--;
    pauseCounterStarted = true;
  }
  if (checkIfGameWon())
  {
    println("game has been won");
    //reset variables to go to endGame()
    setupComplete = true;    
    gameStarted = true;
    gameWon = true;
    gamePaused = false;
  }
} 

void pauseGame(int tempDuration)
{
  int startMillis = millis();
  while (millis() < startMillis + tempDuration)
  {
    //do nothing for tempDuration
  }
  gamePaused = false;
}

boolean equalCards(Card clickedCard1, Card clickedCard2)
{
  if ((clickedCard1.getImageNo()==clickedCard2.getImageNo()))
  {
    return true;
  } else 
  {
    return false;
  }
}

void winTurn()
{
  if (playerTurn == 1) { 
    player1Points++;
  } else if (playerTurn == 2) {
    player2Points++;
  }
}

void loseTurn()
{
  //switch turn      //println("cards are NOT the same, switch turn. clickedCard2.setVisibility: " + clickedCard2.getVisibility());  
  if (playerTurn == 1) {
    playerTurn++;
  } else if (playerTurn == 2) {
    playerTurn--;
  }
}

void resetCards(String winOrLose)
{
  if (winOrLose=="Lose")
  {
  } else if (winOrLose=="Win")
  {    
    clickedCard1.setDiscovered(true);  
    clickedCard2.setDiscovered(true);
  }
  clickedCard1.setVisibility(false);  
  clickedCard2.setVisibility(false);
  clickedCard1=null;  
  clickedCard2=null;
  clickedCard=null;
}

boolean checkIfGameWon()
{
  if ( player1Points+player2Points == numberOfCardsX*numberOfCardsY)
  {
    return true;
  }
  return false;
}
