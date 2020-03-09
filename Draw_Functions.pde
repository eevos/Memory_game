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

  drawText("How many sets of cards would you like to have? Click on the numbers to adjust, then click 'Start'", 200, 200);
  drawNumberOfSets();
  drawButtonsFromArray(sets, sets.length, width/2, yPositionNumberOfSets + 64, 60, 60, "setGame");
  drawButton("Start", xPositionStartButton, yPositionStartButton, widthStartButton, heightStartButton, "startButton");
}

void drawText(String text, int x, int y)
{
  fill(0, 0, 100);
  textAlign(LEFT, TOP);
  textSize(32);
  text(text, x, y);
}

void drawNumberOfSets()
{
  fill(176, 224, 230);
  rect(width/2 - 200, height/2 - 150, 400, 300);
  fill(0, 0, 100);
  textAlign(CENTER); 
  textSize(64);
  text(numberOfSets, width/2, yPositionNumberOfSets );
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
  if (isMouseOverButton(x, y, w, h)){
    doAction(buttonId);
  }
}

void createField(int numberOfSets)
{
  partitionCards(numberOfSets);
  //make an array of cards, for-loop with x(i) and y(j):
  makeArrayOfCards(numberOfCardsX, numberOfCardsY);
}

void makeArrayOfCards(int numberOfCardsX, int numberOfCardsY)
{
  //write a for-loop to fill an array[][] with Card-objects  
}


void partitionCards(int numberOfSets)
{ 
  switch (numberOfSets) {
  case 12:
    {
      numberOfCardsX = 8;
      numberOfCardsY = 3;
    }
  case 18:
    {
      numberOfCardsX = 8;
      numberOfCardsY = 3;
    }
  case 24:
    {
      numberOfCardsX = 8;
      numberOfCardsY = 6;
    }
  case 32:
    {
      numberOfCardsX = 8;
      numberOfCardsY = 8;
    }
  }
}

int calculateXposButtons(int x, int numberOfButtons, int w, int index)
{
  int nextxStartPoint = w + w / 2;
  int xPosButton = x - (numberOfButtons * nextxStartPoint/2) + (w / 4) + (index*nextxStartPoint);  
  return xPosButton;
}

void playGame()
{
}

void endGame()
{
}
