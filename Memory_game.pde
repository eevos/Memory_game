void setup()
{
  fullScreen();
  //size(1600, 1200);
  initializeSidebarFieldDimensions(); 
  resetParametresToRestartGame();
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
    if (cards == null) 
    {
      cards = createField(numberOfSets);
      centerCardsInField();
    } else 
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
    checkIfGameWon();
    drawField();
    checkTurn();
    drawSidebar();
  }
  if (gameStarted && gameWon &&  setupComplete)
  {
    drawEndGame();
    drawSidebar();
  }
}
Card tempCard;
void mouseClicked()
{
  if (!gameStarted && !gameWon && !setupComplete)
  {
    if (isButtonClicked(xPositionStartButton, yPositionStartButton, widthStartButton, heightStartButton) && (numberOfSets > 0))
    {
      setupComplete = true;    //println("startButton is clicked, setupComplete = true");
      gameStarted = false;
      gameWon = false;
    }
  }
  if (gameStarted && !gameWon && setupComplete)   
  {
    tempCard = identifyCard();      //println(clickedCard.getId());    //println(clickedCard.getImageNo());
    if (tempCard != null)
    {
      clickedCard = tempCard;
      playGame(clickedCard);
      tempCard = null;
    }
  }
  if (gameStarted && gameWon && setupComplete) 
  {    
    resetParametresToRestartGame();
  }
}
