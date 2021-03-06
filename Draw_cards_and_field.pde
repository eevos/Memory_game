void playGame()
{
  checkIfGameWon();
  drawField();      
  checkTurn();
}

int[] createPossibleSets()
{     
  int possibleSet = 12;
  int[] tempSets = new int[12];
  for (int j = 0; j< tempSets.length; j++)
  {
    if (possibleSet == 34)
    {
      possibleSet = 40;
    }
    tempSets[j] = possibleSet;
    possibleSet += 2;
  }
  return tempSets;
}

Card[][] createField(int numberOfSets)
{
  partitionCardsXandY(numberOfSets);
  //println("numberOfCards: X = " + numberOfCardsX + " Y = " + numberOfCardsY);
  return makeArrayOfCards(numberOfCardsX, numberOfCardsY);
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

      arrayOfCards[x][y] = new Card(id, x*cardWidth, y*cardHeight, cardWidth, cardHeight, img, imageNo);  
      //println("x = "+ x + " and y = " + y);  //println("imagenumber = " + imagenumber + " id = " + id

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
void shuffleImages() {
  int[] cardImageNos = new int[numberOfCardsX * numberOfCardsY];  

  //extract the imagenumbers and store them in array of cardImageNos
  for (int i = 0; i < cardImageNos.length; i++)
  {
    cardImageNos[i] = findCardById(i).getImageNo();      //println(thisCard.getImageNo());  //check if all the sets have equal numbers before shuffling
  }

  // shuffle the array of cardImageNos[]
  for (int i = 0; i < cardImageNos.length; i++)
  {
    int shuffledIndex = int (random(0, i+1));
    int dummy = cardImageNos[i];
    cardImageNos[i] = cardImageNos[shuffledIndex];
    cardImageNos[shuffledIndex] = dummy;                //println(dummy);
  }

  //then setImageFromImageNo(cardImageNos[i]) 
  for (int i = 0; i < cardImageNos.length; i++) 
  {
    findCardById(i).setImageFromImageNo(cardImageNos[i]);            //println(findCardById(i).getId(), " gets imageNo : " , cardImageNos[i]);
    findCardById(i).setImageNo(cardImageNos[i]);
  }
}
Card findCardById(int id)
{
  Card foundCard = null;
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
      if (thisCard.getVisibility() == true)              //To see field drawn with images visible, toggle:  == false
      {
        image(img, thisCard.getX(), thisCard.getY());
        //println("cards[" + x + "][ " + y + "].getVisibility() = " + cards[x][y].getVisibility());//println("cards[" + x + "][ " + y + "].getDiscovered() = " + cards[x][y].getDiscovered());
      } 
      if (!thisCard.getVisibility() && !thisCard.getDiscovered())
      {
        fill(100);
        rect(thisCard.getX(), thisCard.getY(), cardWidth, cardHeight);
      }
    }
  }
}

void checkIfGameWon()
{
  if (clickedCard != null)
  {
    int totalPoints = (player1Points + player2Points) * 2; 
    if ((totalPoints >= numberOfCardsX*numberOfCardsY)) {
      //println("from checkIfGameWon(): game has been won ");
      setupComplete = true;    
      gameStarted = true;
      gameWon = true;
    }
  }
}
void checkTurn()
{
  if (gamePaused == false && clickedCard1!=null && clickedCard2!=null)
  {
    if (equalCards(clickedCard1, clickedCard2) && (clickedCard1.getId() != clickedCard2.getId()))
    { 
      winTurn();
      //println(clickedCard1.getId(), clickedCard2.getId());
      clickedCard1.setDiscovered(true);  
      clickedCard2.setDiscovered(true);
    } else if (!equalCards(clickedCard1, clickedCard2))
    {
      loseTurn();
    }
    clickedCard1.setVisibility(false); 
    clickedCard2.setVisibility(false);
    clickedCard1 = null;
    clickedCard2 = null;
  }
}

void drawSidebar()
{
  fill(150);  
  rect(fieldWidth, 0, sidebarWidth, sidebarHeight);    //draw to test field with dimensions of sideBar

  if (singlePlayer == 2)
  {
    String[] text = {
      "Player Turn: " + str(playerTurn), 
      "—————————", 
      "Player 1 score : "  + str(player1Points), 
      "Player 1 turns: "  + player1Turns, 
      "——", 
      "Player 2 score : " + str(player2Points), 
      "Player 2 turns: "  + player2Turns
      //,"——", 
      //"Stats:", 
      //"Game Paused : " + str(gamePaused), 
      //"Game Won: "+ str(gameWon)  
    };
    for (int i = 0; i < text.length; i++)
    {
      if (i == 0) {
        textSize(40);
      } else
      {
        textSize(32);
      }
      drawText(text[i], fieldWidth + spaceBetween, spaceBetweenText + i*spaceBetweenText);
    }
  } else
  {
    String[] text = {
      "Single Player", 
      "—————————", 
      "Player 1 score : "  + str(player1Points + player2Points), 
      "Player 1 turns : "  + (player1Turns + player2Turns)
      //, "—————————"
      //,"Stats:"
      //,"Game Paused : " + str(gamePaused), 
      //"Game Won: "+ str(gameWon)
    };

    for (int i = 0; i < text.length; i++)
    {
      if (i == 0) {
        textSize(40);
      } else
      {
        textSize(32);
      }
      drawText(text[i], fieldWidth + spaceBetween, spaceBetweenText + i*spaceBetweenText);
    }
  };

  if (clickedCard != null)
  {
    if (clickedCard.getImageNo()==1)
    {
      fill(255);
      drawText("you found a turd", 200, 100);
    }
  }
}

void partitionCardsXandY(int numberOfSets)
{ 
  switch (numberOfSets) {
  case 1:                  //only for testing, or lazy people.
    {
      numberOfCardsX = 2;      
      numberOfCardsY = 1;
      return;
    }
  case 12:
    {
      numberOfCardsX = 8;      
      numberOfCardsY = 3; 
      return;
    }
  case 14:
    {
      numberOfCardsX = 7;      
      numberOfCardsY = 2;       
      return;
    }
  case 16:
    {
      numberOfCardsX = 8;      
      numberOfCardsY = 4;       
      return;
    }
  case 18:
    {
      numberOfCardsX = 6;      
      numberOfCardsY = 6;       
      return;
    }
  case 20:
    {
      numberOfCardsX = 8;      
      numberOfCardsY = 5;       
      return;
    }
  case 22:
    {
      numberOfCardsX = 11;      
      numberOfCardsY = 4;       
      return;
    }
  case 24:
    {
      numberOfCardsX = 8;      
      numberOfCardsY = 6;      
      return;
    }
  case 26:
    {
      numberOfCardsX = 13;      
      numberOfCardsY = 4;       
      return;
    }
  case 28:
    {
      numberOfCardsX = 8;      
      numberOfCardsY = 7;       
      return;
    }
  case 30:
    {
      numberOfCardsX = 10;      
      numberOfCardsY = 6;       
      return;
    }
  case 32:
    {
      numberOfCardsX = 8;      
      numberOfCardsY = 8;      
      return;
    }
  case 40:
    {
      numberOfCardsX = 10;      
      numberOfCardsY = 8;      
      return;
    }
  }
}
