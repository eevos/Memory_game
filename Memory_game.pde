
void setup()
{
  fullScreen();  
  initializeSidebarFieldDimensions(); 
  resetGameParametres();          // The game will be (re)started with gamestatus-variables set on false
  card1 = false;
  card2 = false;
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

  if (gameStarted && !gameWon && !gamePaused && setupComplete)  // If setup & field are completed, we can draw and play the game
  {
    //the game is drawn:
    drawField();
    drawSidebar();
  }

  if (gameStarted && gameWon && !gamePaused && setupComplete)  // If the game is won, we can end the game
  {
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
  if (!gameStarted && !gameWon && !gamePaused && setupComplete)  // no input needed; game is being constructed
  {
  }
  if (gameStarted && !gameWon && !gamePaused && setupComplete)      // game is being played
  {
    clickedCard = identifyCard();      //println(clickedCard.getId());    //println(clickedCard.getImageNo());
    playGame(clickedCard);
  }
  if (gameStarted && gameWon && !gamePaused && setupComplete)  // resetting the game on a mouseclick
  {    
    resetGameParametres();
  }
}
