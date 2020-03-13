class Card {

  int id; 
  int x, y;
  int w, h;
  PImage image;
  boolean visibility, discovered;
  int imageNo;

  Card (int tempId, int tempX, int tempY, int tempW, int tempH, PImage tempImage, int tempImageNo) {
    id = tempId;
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    image = tempImage;
    imageNo = tempImageNo;
  }

  //Get information from the Card
  int getId() {
    return id;
  }
  PImage getImage() {
    return image;
  }
  boolean getVisibility() {
    return visibility;
  }
  boolean getDiscovered() {
    return discovered;
  }
  int getX() {
    return x;
  };
  int getY() {
    return y;
  };  
  void setX(int tempx) {
    x = tempx;
  };
  void setY(int tempy) {
    y = tempy;
  };  
  int getImageNo()
  {
    return imageNo;
  }

  //Set information that is changeable
  void setVisibility(boolean tempVisibility) { 
    visibility = tempVisibility;
  }    //setVisible is a reserved function, so changed to setVisibility
  void setDiscovered(boolean tempDiscovered) { 
    discovered = tempDiscovered;
  }
}
