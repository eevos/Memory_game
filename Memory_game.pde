
void setup()
{
  fullScreen();  
  cardWidth = 100;
  cardHeight = 100;

  sidebarWidth = 500;
  sidebarHeight = height;

  spaceBetween = 30;
  fieldWidth = width - sidebarWidth;
  fieldHeight = height;

  card1 = false;
  card2 = false;

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
    //println("setup completed, going to create field");
    if (cards == null) {
      //println("createField is running from draw()");
      cards = createField(numberOfSets);
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
    drawField();
    drawSidebar();
    playGame();
  }

  if (gameStarted && gameWon && !gamePaused && setupComplete)  // If the game is won, we can end the game
  {
    endGame();
  }
}

Card clickedCard;
int[] clickedIds = new int[2];  
int[] clickedImageNos = new int[2];
boolean card1, card2;

void mouseClicked()
{

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
    clickedCard = identifyCard();      //println(clickedCard.getId());    //println(clickedCard.getImageNo());
    playTurn2(clickedCard);
  }


  if (gameStarted && gameWon && !gamePaused && setupComplete)  // resetting the game on a mouseclick
  {
    setupComplete = false;
    gameStarted = false;
    gameWon = false;
    gamePaused = false;
  }
}

int numberOfTimesClicked;
void playTurn3(Card clickedCard)
{
 
}

void playTurn2(Card clickedCard)
{
  clickedImageNos[0]=clickedCard.getImageNo();  
  if (card1 == false && clickedImageNos[0]>-1)
  {
    card1=true;
    println(clickedImageNos[0]);
    println(card1);
  }
  if (card1==true && card2 ==false && clickedImageNos[0]>-1 && clickedImageNos[1]>-1)
  {
    clickedImageNos[1]=clickedCard.getImageNo();
    println(clickedImageNos[0] + clickedImageNos[1]);
    card2=true;
    println(card1, card2);
    card1=false;card2=false;
    clickedImageNos[0]=-1;clickedImageNos[1]=-1;
  }
}

//Er is een vertraging : de kaarten worden pas visibile als ik een set verder heb goedgeklikt

void playTurn(Card clickedCard)
{
  if (card1 == false && card2 == false)
  {
    clickedIds[0]=clickedCard.getId();
    clickedImageNos[0]=clickedCard.getImageNo();
    card1=true;

    findCardById(clickedImageNos[0]).setVisibility(true);

    println("card1 = "+ clickedCard.getId());
    println(card1);
  } 
  if (card1 == true & card2 == false)
  {
    clickedIds[1]=clickedCard.getId();
    clickedImageNos[1]=clickedCard.getImageNo();
    card2 = true;

    findCardById(clickedImageNos[1]).setVisibility(true);

    println("card2 = "+ clickedCard.getId());

    if (card1 && card2 && clickedImageNos[0]==clickedImageNos[1])
    {
      //zet de clickedIds op setDiscovered true
      println("card 1 is true imagenos are the same");

      //findCardById(clickedImageNos[0]).setDiscovered(true);
      //findCardById(clickedImageNos[1]).setDiscovered(true);

      player1Points++;
      card1=false;
      card2=false;
      clickedIds[0]=999; 
      clickedIds[1]=998;  
      clickedImageNos[0]=999; 
      clickedImageNos[1]=998;
    } 
    if (card1 && card2 && (clickedImageNos[0]!=clickedImageNos[1]))
    {
      println("card 1 is true and imagenos are NOT the same");
      card1=false;
      card2=false;
      clickedIds[0]=999; 
      clickedIds[1]=998;  
      clickedImageNos[0]=999; 
      clickedImageNos[1]=998;
    }
  }
}

Card foundCard;
Card findCardById(int id)
{
  for (int x = 0; x<numberOfCardsX; x++)
  {
    for (int y = 0; y<numberOfCardsY; y++)
    {
      if (cards[x][y].getId() == id)
      {
        foundCard= cards[x][y];
      }
    }
  }
  return foundCard;
}
