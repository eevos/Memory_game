void shuffleImages() {
  int[] cardImageNos = new int[numberOfCardsX * numberOfCardsY];  
  
  //extract the imagenumbers and store them in array of cardImageNos
  for (int i = 0; i < numberOfCardsX * numberOfCardsY; i++)
  {
    cardImageNos[i] = findCardById(i).getImageNo();      //println(thisCard.getImageNo());  //check if all the sets have equal numbers before shuffling
  }
  
  // shuffle the array of cardImageNos[]
  for (int i = 0; i < cardImageNos.length; i++)
  {
    int shuffledIndex = int (random(0, i+1));
    int dummy = cardImageNos[i];
    cardImageNos[i] = cardImageNos[shuffledIndex];
    cardImageNos[shuffledIndex] = dummy;
  }
  
  //then setImageFromImageNo(cardImageNos[i]) 
  for (int i = 0; i < cardImageNos.length; i++) 
  {
    findCardById(i).setImageFromImageNo(cardImageNos[i]);            //println(findCardById(i).getId(), " gets imageNo : " , cardImageNos[i]);
    findCardById(i).setImageNo(cardImageNos[i]);
  }
}


void initializeSidebarFieldDimensions()
{
  sidebarWidth = width/4;
  sidebarHeight = height;
  fieldWidth = width - sidebarWidth;
  fieldHeight = height;
}

void createBackground()
{
  clear();
  background(100, 149, 237);
}

void drawSetup()
{  
  yPositionNumberOfSets = height/2;
  widthStartButton = 150;
  heightStartButton = 60;
  xPositionStartButton = width/2 - widthStartButton /2;
  yPositionStartButton =  yPositionNumberOfSets + 256;

  drawText("How many sets of cards would you like to have? Click on the numbers to adjust, then click 'Start'", 200, yPositionNumberOfSets-250);
  drawNumberOfSets();
  drawButtonsFromArray(sets, sets.length, width/2, yPositionNumberOfSets + 64, 60, 60, "setGame");
  drawButton("Start", xPositionStartButton, yPositionStartButton, widthStartButton, heightStartButton, "startButton");
}

void drawText(String text, int x, int y)
{
  //textSize(32);

  fill(0, 0, 100);
  textAlign(LEFT, TOP);
  text(text, x, y);
}

void drawNumberOfSets()
{
  fill(176, 224, 230);
  rect(width/2 - 500, height/2 - 150, 1000, 300);
  fill(0, 0, 100);
  textAlign(CENTER); 
  textSize(64);
  text(numberOfSets, width/2, yPositionNumberOfSets );
  textSize(32);
}

void drawButtonsFromArray(int[] sets, int numberOfButtons, int x, int y, 
  int w, int h, String buttonId) 
{ 
  for (int index=0; index < numberOfButtons; index++)
  {
    int xPosButton = calculateXposButtons(x, numberOfButtons, w, index);
    drawButton(str(sets[index]), xPosButton, y, w, h, buttonId);
    if (isMouseOverButton(xPosButton, y, w, h))
    {
      doActionArray(buttonId, index);
    }
  }
}

void drawButton(String text, int x, int y, int w, int h, String buttonId )
{
  changeButtonColorIfMouseOver(x, y, w, h);
  rect(x, y, w, h);
  drawText(text, x + w/4, y);
  if (isMouseOverButton(x, y, w, h)) {
    doAction(buttonId);
  }
}

int calculateXposButtons(int x, int numberOfButtons, int w, int index)
{
  int nextxStartPoint = w + w / 2;
  int xPosButton = x - (numberOfButtons * nextxStartPoint/2) + (w / 4) + (index*nextxStartPoint);  
  return xPosButton;
}

void drawEndGame()
{
  createBackground();
  String winner=  determineWinner();
  int playerTurns = determineWinnerTurns(winner);//determineWinnerTurns(winner); 
  
  String[] text = {"Player " + winner + " has won in " + str(playerTurns) + " turns!", 
    "Score player 1 : "  + str(player1Points), 
    "Score player 2 : " + str(player2Points), 
    "Click mouse to restart game"
    };
  for (int i = 0; i < text.length; i++)
  {
    drawText(text[i], 500, 200 + i * 30);
  }
}

String determineWinner()
{
  String winner;
  if (player1Points>player2Points)
  {
    winner = "Player 1";
    return winner;
  } else if (player1Points<player2Points)
  {
    winner = "Player 2";
    return winner;
  } else
  {
    winner = "1 and 2 ";
    return winner;
  }
}

int determineWinnerTurns(String winner)
  {
    int tempPlayerTurns;
    println(winner);
    if (winner == "Player 1" )
    {
      tempPlayerTurns = player1Turns;
    } else 
    {
      tempPlayerTurns = player2Turns;
    }
    return tempPlayerTurns;
  }

void resetParametresToRestartGame()
{
  setupComplete = false;
  gameStarted = false;
  gameWon = false;
  gamePaused = false;
  pauseCounter = 0;

  clickedCard1 = null;
  clickedCard2 = null;
  clickedCard = null;
  numberOfCardsX = 0;
  numberOfCardsY = 0;
  playerTurn = 1;
  player1Points = 0;
  player2Points = 0;
  numberOfSets = 0;
  clickCount=0;

  //for (int x=0; x<numberOfCardsX; x++)
  //{
  //  for (int y = 0; y < numberOfCardsY; y++)
  //  {
  //    cards[x][y]=null;
  //  }
  //}
}
