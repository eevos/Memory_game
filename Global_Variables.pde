// Gamestatus: these are variables to direct the game
boolean gameStarted, gameWon, gamePaused, setupComplete;  

// Player information
String player1Name, player2Name;
String playerTurn;
int player1Points, player2Points;
int player1Discovered, player2Discovered;
int player1Turns, player2Turns;          // maybe not necessary

// Pictures
PImage[] images;

// Cards
Card[][] cards;
int[] sets = {12, 24, 32};

int numberOfCardsX, numberOfCardsY;
int numberOfSets = 00;

// Dimensions of cards
int cardWidth, cardHeight;      //100px

// Dimensions of field
int fieldWidth, fieldHeight;
int spaceBetween;

// Dimensions of Sidebar
int sidebarX, sidebarY;
int sidebarWidth, sidebarHeight;

//Buttons
int xPositionStartButton, yPositionStartButton;      // Deze variabelen moeten globaal zijn omdat ze in draw() en mouseClicked() worden gebruikt
int widthStartButton, heightStartButton;
int yPositionNumberOfSets;
