void playGame(Card clickedCard)
{     
  if (!card1Clicked())
  {
    makeCard1Visible(clickedCard);
    //println(clickedCard);
  } else if (card1Clicked())
  {
    makeCard2Visible(clickedCard);
    //println(clickedCard);
    pauseGame(2000);
    if (compareCards(clickedCard1, clickedCard2))    //check if the cards are the same: visibility false, setDiscovered(true), card1 card2 = false, turn=turn
    {
      winTurn();
      //if (checkIfGameWon()==true)
      //{ 
      //  //set parametres to gameWon
      //  setupComplete = true;    
      //  gameStarted = true;
      //  gameWon = true;
      //  gamePaused = false;
      //}
    } else if (!compareCards(clickedCard1, clickedCard2))  //clickedCard1.getImageNo()!=clickedCard2.getImageNo() && card1 && card2
    {
      loseTurn();      //show 2nd card, pause 2 secs addPlayerNumberOfTurns(turn) and playerTurn switches
    }
    clickedCard=null;
  }
} 

boolean checkIfGameWon()
{
  if (!((player1Points+player2Points)<(numberOfCardsX*numberOfCardsY)))
  {
    return true;
  }
  return false;
}

void resetGameParametres() {
  setupComplete = false;
  gameStarted = false;
  gameWon = false;
  gamePaused = false;
}

void makeCard1Visible(Card clickedCard)
{
  if (clickedCard.getDiscovered()==false)
  {
    clickedCard1 = clickedCard;
    clickedCard1.setVisibility(true);
    card1 = true;
  }
}

void makeCard2Visible(Card clickedCard)
{
  if (clickedCard.getDiscovered()==false)
  {
    clickedCard2 = clickedCard;
    clickedCard2.setVisibility(true);
    card2 = true;                        //println("make card 2 visible");
    //println(clickedCard.getDiscovered(), clickedCard.getVisibility());
  }
}

boolean card1Clicked()
{
  if (card1 == true && card2 == false)
  {
    return true;
  } else 
  {
    return false;
  }
}

boolean compareCards(Card clickedCard1, Card clickedCard2)
{
  if (  clickedCard1.getImageNo()==clickedCard2.getImageNo() && card1 && card2)
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
  //and then reset cards
  resetCards("Win");
}

void loseTurn()
{
  clickedCard2.setVisibility(true);
  println("cards are NOT the same, switch turn. clickedCard2.setVisibility: " + clickedCard2.getVisibility() + " , next comes pauseGame(2);" );

  //pauseGame(2);
  resetCards("Lose");

  //switch turn  
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
    card1 = false;   
    card2 = false;
    clickedCard1.setVisibility(false);  
    clickedCard2.setVisibility(false);
    clickedCard1=null;  
    clickedCard2=null;
  } else if (winOrLose=="Win")
  {
    card1 = false;   
    card2 = false;
    clickedCard1.setVisibility(false);  
    clickedCard2.setVisibility(false);    
    clickedCard1.setDiscovered(true);  
    clickedCard2.setDiscovered(true);
    clickedCard1=null;  
    clickedCard2=null;
  }
}


void pauseGame(int tempDuration)
{
  int startMillis = millis();
  while (millis() < startMillis + tempDuration)
  {
    gamePaused = true;
  }
  gamePaused = false;
}
