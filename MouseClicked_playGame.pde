void playGame(Card clickedCard) //<>//
{
  if (clickedCard.getDiscovered() == false) {
    if (clickCount==0)
    {
      clickedCard1 = clickedCard;
      clickedCard1.setVisibility(true);
      clickCount++;
    } else if (clickCount==1)         
    {
      clickedCard2 = clickedCard;   
      clickedCard2.setVisibility(true);
      clickCount--;
      gamePaused = true;
    }
    if (clickedCard2 == null)
    {
      //clickCount--;
    }
  }
} 
void pauseGame(int seconds)
{
  int frames = 50 * seconds;
  pauseCounter++;
  if (pauseCounter >= frames)
  {
    gamePaused = false;
    pauseCounter = 0;
  }
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
    player1Turns++;
  } else if (playerTurn == 2) {
    player2Points++;
    player2Turns++;
  }
}

void loseTurn()
{
  //switch turn      //println("cards are NOT the same, switch turn. clickedCard2.setVisibility: " + clickedCard2.getVisibility());  
  if (playerTurn == 1) {
    playerTurn++;
    player1Turns++;
  } else if (playerTurn == 2) {
    playerTurn--;
    player2Turns++;
  }
}

void checkIfGameWon()
{
  int totalPoints = (player1Points + player2Points); 
  if (((player1Points + player2Points)*2 >= numberOfCardsX*numberOfCardsY)) {
    println("from checkIfGameWon(): game has been won ");
    setupComplete = true;    
    gameStarted = true;
    gameWon = true;
  }
}
void resetCards(String winOrLose)
{
  if (winOrLose=="Lose")
  {  // do nothing special
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

//pauseGame with milliseconds
void pauseGameMillis(int tempDuration)
{
  int startMillis = millis();
  while (millis() < startMillis + tempDuration)
  {
    //do nothing for tempDuration
  }
  gamePaused = false;
}
