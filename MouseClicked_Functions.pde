boolean isButtonClicked(int x, int y, int w, int h)
{
  return isMouseOverButton(x, y, w, h);
}

boolean isMouseOverButton(int x, int y, int w, int h) {
  if (mouseX > x 
    && mouseX < x + w
    && mouseY > y
    && mouseY < y + h) 
  {
    //println("mouseOver Buttons");
    return true;
  } else 
  {
    return false;
  }
}

void changeButtonColorIfMouseOver(int xStartPoint, int tempyPosButtons, int buttonWidth, int buttonHeight) {
  if (isMouseOverButton(xStartPoint, tempyPosButtons, buttonWidth, buttonHeight)) 
  {
    fill(100, 200, 100);
  } else 
  {
    fill(176, 224, 230);
  }
}

void doActionArray(String buttonId, int index) {
 
  if (buttonId=="setGame")
  {
    numberOfSets = sets[index];
    //println("doActionArray : NumberOfSets = " + sets[index]);
  }
}
void doAction(String buttonId)
{
  if (buttonId == "setupGame")
  {
    //println("doAction: ButtonId setupGame");
  }
}
