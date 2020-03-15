void drawSidebar()
{
  fill(150);  
  rect(fieldWidth, 0, sidebarWidth, sidebarHeight);    //draw to test field with dimensions of sideBar

  String[] text = {"Player Turn: " + str(playerTurn), "Score player 1 : "  + str(player1Points), "Score player 2 : " + str(player2Points), 
    "Extra info", "cardId: "+clickedCard};
  for (int i = 0; i < text.length; i++)
  {
    drawText(text[i], fieldWidth, i*30);
  }
}

Card[][] createField(int numberOfSets)
{
  partitionCardsXandY(numberOfSets);
  //println("numberOfCards: X = " + numberOfCardsX + " Y = " + numberOfCardsY);
  return makeArrayOfCards(numberOfCardsX, numberOfCardsY);
}

void partitionCardsXandY(int numberOfSets)
{ 
  switch (numberOfSets) {
  case 2:
    {
      numberOfCardsX = 2;      
      numberOfCardsY = 1;
    }
  case 12:
    {
      numberOfCardsX = 8;      
      numberOfCardsY = 3; 
      return;
    }
  case 18:
    {
      numberOfCardsX = 8;      
      numberOfCardsY = 3;       
      return;
    }
  case 24:
    {
      numberOfCardsX = 8;      
      numberOfCardsY = 6;      
      return;
    }
  case 32:
    {
      numberOfCardsX = 8;      
      numberOfCardsY = 8;      
      return;
    }
  }
}

Card[][] makeArrayOfCards(int numberOfCardsX, int numberOfCardsY)
{
  Card[][] arrayOfCards = new Card[numberOfCardsX][numberOfCardsY];
  int imagenumber= 0;
  int id = 0;
  boolean secondCardIsSet = false;

  for (int x = 0; x < numberOfCardsX; x++)
  {
    for (int y = 0; y < numberOfCardsY; y++)
    {
      PImage img;
      img = loadImage(+imagenumber+".png");
      int imageNo=imagenumber;

      arrayOfCards[x][y] = new Card(id, x*cardWidth, y*cardHeight, cardWidth, cardHeight, img, imageNo);  //println("x = "+ x + " and y = " + y);  //println("imagenumber = " + imagenumber + " id = " + id

      //increase id for every Card, but only increase imagenumber when the same image is also set for the second Card
      id++;
      if (secondCardIsSet) {
        imagenumber++;
      };  
      secondCardIsSet=!secondCardIsSet;
    }
  }
  return arrayOfCards;
}

void centerCardsInField()
{
  for (int x = 0; x < numberOfCardsX; x++)
  {
    for (int y = 0; y < numberOfCardsY; y++)
    {
      borderX = (fieldWidth - (numberOfCardsX * cardWidth) - (numberOfCardsX * spaceBetween))/2;  
      borderY = (fieldHeight - (numberOfCardsY * cardHeight) - (numberOfCardsY * spaceBetween))/2;
      int startx = borderX + x * cardWidth + x * spaceBetween + spaceBetween/2;
      int starty = borderY + y * cardHeight + y * spaceBetween + spaceBetween/2;  //println(borderX, borderY);

      cards[x][y].setX(startx);
      cards[x][y].setY(starty);
    }
  }
}

void drawField()
{
  PImage img;
  for (int x = 0; x < numberOfCardsX; x++)
  {
    for (int y = 0; y < numberOfCardsY; y++)
    {
      Card thisCard = cards[x][y];

      img = thisCard.getImage();
      if (thisCard.getVisibility() && !thisCard.getDiscovered())              //To see field drawn with images visible, toggle:   !cards[x][y].getVisibility()
      {
// Issue: card2 doesn't get to this point.
        image(img, thisCard.getX(), thisCard.getY());
        //println("cards[" + x + "][ " + y + "].getVisibility() = " + cards[x][y].getVisibility());
      } 
      if (!thisCard.getVisibility() && thisCard.getDiscovered())
      {
        //draw nothing if card is discovered
      }
      if (!thisCard.getVisibility() && !thisCard.getDiscovered())
      {
        fill(100);
        rect(thisCard.getX(), thisCard.getY(), cardWidth, cardHeight);
      }
    }
  }
}
