
void setup()
{
  fullScreen();  

  // The game will be started with gamestatus-variables set on false 
  gameStarted = false;
  gameWon = false;
  gamePaused = false;
  setupComplete = false;
}

void draw()
{
  createBackground();

  if (!gameStarted && !gameWon && !gamePaused && !setupComplete)  // If all gamestatuses are false: begin with setup
  {
    //println("setup running");
    drawSetup();
  }

  if (!gameStarted && !gameWon && !gamePaused && setupComplete)  // If the setup is completed, we can create the field
  {
    println("setup completed, going to create field");
    //if (cards == null) {
    println("createField is running");
    createField(numberOfSets);
    //cards = createField(numberOfSets);
    //} 
    //else 
    //{
    //  setupComplete = true;
    //  gameStarted = true;
    //  gameWon = false;
    //  gamePaused = false;
    //}
  }

  if (gameStarted && !gameWon && !gamePaused && setupComplete)  // If setup & field are completed, we can play the game
  {
    playGame();
  }

  if (gameStarted && gameWon && !gamePaused && setupComplete)  // If the game is won, we can end the game
  {
    endGame();
  }
}

void mouseClicked()
{
  boolean cardClicked;

  if (!gameStarted && !gameWon && !gamePaused && !setupComplete)  // setup is running
  {
    if (isButtonClicked(xPositionStartButton, yPositionStartButton, widthStartButton, heightStartButton) && (numberOfSets > 0))
    {
      //println("startButton is clicked, setupComplete = true"); 
      setupComplete = true;
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
  }
  if (gameStarted && gameWon && !gamePaused && setupComplete)  // resetting the game on a mouseclick
  {
    setupComplete = false;
    gameStarted = false;
    gameWon = false;
    gamePaused = false;
  }
}
