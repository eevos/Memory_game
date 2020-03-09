class Card {
  
  int id; 
  int x, y;
  int cardWidth, cardHeight;
  PImage image;
  boolean visibility, discovered;
  
  Card (int tempId, int tempX, int tempY, int tempCardWidth, PImage tempImage) {
    id = tempId;
    x = tempX;
    y = tempY;
    cardWidth = tempCardWidth;
    image = tempImage;
  }
  
  //Get information from the Card
  int getId() {return id;}
  PImage getImage() {return image;}
  boolean getVisibility(){return visibility;}
  boolean getDiscovered(){return discovered;}
  
  //Set information that is changeable
  void setVisibility(boolean tempVisibility){ visibility = tempVisibility; }    //setVisible is a reserved function, so changed to setVisibility
  void setDiscovered(boolean tempDiscovered){ discovered = tempDiscovered; }
  
}
