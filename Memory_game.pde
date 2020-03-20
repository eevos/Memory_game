void setup()
{
  textSize(32);
  fullScreen();
  //size(1200, 800);             //toggle to test
  initializeSidebarFieldDimensions(); 
  resetParametresToRestartGame();
  sets = createPossibleSets();
}

void draw()
{  
  createBackground();  

  if (!gameStarted && !gameWon && !setupComplete)
  {
    drawSetup();
  }
  if (!gameStarted && !gameWon && setupComplete)
  {
    if (cardsAreSet == false)                                         
    {
      cardsAreSet = true;
      cards = createField(numberOfSets);
      shuffleImages(); 
      centerCardsInField();
      //println("cardsAreSet = ", cardsAreSet);
    } 
    if (cardsAreSet)
    {
      setupComplete = true;
      gameStarted = true;
      gameWon = false;
    }
  }  
  if (gamePaused)
  {
    pauseGame(2);
  }
  if (gameStarted && !gameWon && setupComplete)
  {
    playGame();
  }
  if (gameStarted && gameWon &&  setupComplete)
  {
    drawEndGame();
      drawSidebar();
  }
}

void mouseClicked()
{
  if (!gameStarted && !gameWon && !setupComplete)
  {
    if (isButtonClicked(xPositionStartButton, yPositionStartButton, widthStartButton, heightStartButton) && (numberOfSets > 0))
    {
      setupComplete = true;    //println("mouseClicked: setupComplete = true");
      gameStarted = false;
      gameWon = false;
    }
  }
  if (gameStarted && !gameWon && setupComplete && !gamePaused)   
  {
    tempCard = identifyCard();
    if (tempCard != null && tempCard != clickedCard && tempCard.getDiscovered() == false)
    {
      clickedCard = tempCard;
      makeVisible(clickedCard);
      tempCard = null;
    }
  }
  if (gameStarted && gameWon && setupComplete) 
  {    
    resetParametresToRestartGame();
    //println("mouseClicked resetParametresToRestartGame()");
  }
}
