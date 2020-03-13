// Gamestatus: these are variables to direct the game
boolean gameStarted, gameWon, gamePaused, setupComplete;  

// Player information
String player1Name, player2Name;
String playerTurn;
int player1Points, player2Points;
int player1Discovered, player2Discovered;
int player1Turns, player2Turns;          // maybe not necessary

// Pictures: do we need an array of PImages  ?    //PImage[] images;

// Cards:  these variables are needed to create the Cards for the game
Card[][] cards;
int[] sets = {12, 24, 32};      //int[] sets = {12, 18, 24, 32};  //(add 18 to test expanding the game)    

int numberOfCardsX, numberOfCardsY;
int numberOfSets = 0;

// Dimensions of cards: we need the Cards to have a fixed dimension because of the size of the pictures
int cardWidth, cardHeight;      //100px

// Dimensions of field:  we need this to draw the playing field where the Cards are put
int fieldWidth, fieldHeight;
int spaceBetween;
int borderX, borderY;

// Dimensions of Sidebar:  
int sidebarX, sidebarY;
int sidebarWidth, sidebarHeight;

//Dimensions of the Buttons:
int xPositionStartButton, yPositionStartButton;      // Deze variabelen moeten globaal zijn omdat ze in draw() en mouseClicked() worden gebruikt
int widthStartButton, heightStartButton;
int yPositionNumberOfSets;
