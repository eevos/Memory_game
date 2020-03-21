void setup()
{
  println("Production of Ed&Ams");
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
    drawSidebar();
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
    //isMouseOverCard(tempCard);
    if (tempCard != null  && tempCard.getDiscovered() == false && isMouseOverCard(tempCard)) 
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
