
//Test
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

//int mouseClickCounter = 0;
//void playGame(Card clickedCard)
//{
//  mouseClickCounter++;
//  if (mouseClickCounter == 1 && clickedCard1 == null)
//  {
//    println("MouseClickCounter = " + mouseClickCounter);
//    if (clickedCard == null)
//    {
//      println("You did NOT click a card");
//      mouseClickCounter = 0;
//      println("MouseClickCounter = " + mouseClickCounter);
//    }
//    if (clickedCard != null)
//    {
//      clickedCard1 = clickedCard;
//      println("Id card 1: "+ clickedCard1.getId());
//      if (clickedCard1.getDiscovered() == false) {
//        clickedCard1.setVisibility(true);
//      } 
//      if (clickedCard1.getDiscovered() == true &&  clickedCard.getVisibility() == true) {
//        println("already discovered");
//        //do nothing or this: 
//        //clickedCard1 = null;
//        //mouseClickCounter = 0; switchTurn();
//      }
//      clickedCard = null;
//    }
//  }
//  if (mouseClickCounter == 2 && clickedCard1 != null && clickedCard != clickedCard1)
//  {    
//    clickedCard1 = null;
//    println("MouseClickCounter = " + mouseClickCounter);
//    if (clickedCard == null)
//    {
//      println("you clicked no second card");
//      clickedCard1.setVisibility(false); //fout geklikt bij 2e kaart
//      mouseClickCounter = 0;
//    }
//    if (clickedCard != null)
//    {
//      clickedCard2 = clickedCard;
//      println("Id card 2: "+ clickedCard2.getId());
//      //clickedCard = null;
//      if ( clickedCard2.getDiscovered() == false)
//      {
//        clickedCard2.setVisibility(true);
//        mouseClickCounter = 0;
//        gamePaused = true;
//      }
//      if (clickedCard2.getDiscovered() == true) {
//        println("2nd card already discovered");
//        // Do nothing or this:
//        //clickedCard1 = null; clickedCard2 = null;
//        //mouseClickCounter = 0;  switchTurn();
//      }
//    }
//    clickedCard = null;
//  }
//} 


//void playGame(Card clickedCard) //<>//
//{
//  if (clickedCard.getDiscovered() == false) {
//    if (clickCount==0)
//    {
//      clickedCard1 = clickedCard;
//      clickedCard1.setVisibility(true);
//      clickCount++;
//    } else          
//    {
//      clickedCard2 = clickedCard;   
//      clickedCard2.setVisibility(true);
//      clickCount--;
//      gamePaused = true;
//    }
//  }
//} 
