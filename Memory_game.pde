void setup()
{
  textSize(32);
  //fullScreen();
  size(1600, 1200);             //toggle to test
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
    if (tempCard == null && gamePaused == false)
    {
      println("tempCard is null, no card clicked");
    }
    if (tempCard != null && gamePaused == false && tempCard != clickedCard && tempCard.getDiscovered() == false)  //&& tempCard != clickedCard
    {
      clickedCard = tempCard;
      playGame(clickedCard);
      println("clickedCard.getId = " + clickedCard.getId());
      println("tempCard.getId = " + tempCard.getId());
      tempCard = null;
    }
    

  }
  if (gameStarted && gameWon && setupComplete) 
  {    
    resetParametresToRestartGame();
  }
}
