void setup()
{
  fullScreen();  
  initializeSidebarFieldDimensions(); 
  resetParametresToRestartGame();          // The game will be (re)started with gamestatus-variables set on false
}

void draw()
{
  createBackground();
  if (!gameStarted && !gameWon && !gamePaused && !setupComplete)  // If all gamestatuses are false: begin with setup
  {
    drawSetup();    //println("setup running");
  }
  if (!gameStarted && !gameWon && !gamePaused && setupComplete)  // If the setup is completed, we can create the field
  {
    if (cards == null) 
    {
      cards = createField(numberOfSets);  //println("createField is running from draw()");
      centerCardsInField();
    } else 
    {
      setupComplete = true;
      gameStarted = true;
      gameWon = false;
      gamePaused = false;
    }
  }  
  if (pauseCounterStarted)
  {
    pauseCounter++;
    if (pauseCounter >= 100)
    {
      pauseCounterStarted = false;
      pauseCounter = 0;
    }
  }
  if (gameStarted && !gameWon && setupComplete)  // If setup & field are completed, we can draw and play the game
  {
    drawField();
    checkCardVisibility();
    drawSidebar();
  }
  if (gameStarted && gameWon && !gamePaused && setupComplete)  // If the game is won, we can end the game
  {
    println("Endgame");
    endGame();      //draw a message : "player x has won! click mouse to restart game"
  }
}

void mouseClicked()
{
  if (!gameStarted && !gameWon && !gamePaused && !setupComplete)  // setup is running
  {
    if (isButtonClicked(xPositionStartButton, yPositionStartButton, widthStartButton, heightStartButton) && (numberOfSets > 0))
    {
      setupComplete = true;    //println("startButton is clicked, setupComplete = true");
      gameStarted = false;
      gameWon = false;
      gamePaused = false;
    }
  }
  if (gameStarted && !gameWon && setupComplete)      // game is being played
  {
    clickedCard = identifyCard();      //println(clickedCard.getId());    //println(clickedCard.getImageNo());
    playGame(clickedCard);
    gamePaused = true;    //Issue : second card is not drawn. Draw() and Mouseclick() --> pauseGame
  }
  if (gameStarted && gameWon && !gamePaused && setupComplete)  // resetting the game on a mouseclick
  {    
    //endGame() is being drawn in draw()
    resetParametresToRestartGame();
    println("resetParametres");
  }
  if (!gameStarted && !gameWon && !gamePaused && setupComplete)  // no input needed; game is being constructed
  {
  }
}
