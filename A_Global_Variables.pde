// Gamestatus: these are variables to direct the game
boolean gameStarted, gameWon, gamePaused, setupComplete;  

int pauseCounter = 0;
boolean pauseCounterStarted = false;

// Player information
String player1Name, player2Name;
int playerTurn = 1;
int player1Points = 0;
int player2Points = 0;

// Cards:  these variables are needed to create the Cards for the game
Card[][] cards;
int[] sets = {1, 12, 24, 32};      //int[] sets = {12, 18, 24, 32};  //(add 18 to test expanding the game)    

int numberOfCardsX, numberOfCardsY;
int numberOfSets = 0;

//variables to use in mouseClick() when playGame()
Card clickedCard;
Card clickedCard1;
Card clickedCard2;
boolean card1 = false;
boolean card2 = false;
int clickCount=0;

// Dimensions of cards: we need the Cards to have a fixed dimension because of the size of the pictures
int cardWidth = 100;
int cardHeight = cardWidth;      //100px

// Dimensions of field:  we need this to draw the playing field where the Cards are put
int fieldWidth, fieldHeight;
int spaceBetween = 30;
int borderX, borderY;

// Dimensions of Sidebar:  
int sidebarX, sidebarY;
int sidebarWidth, sidebarHeight;

//Dimensions of the Buttons:
int xPositionStartButton, yPositionStartButton;      // Deze variabelen moeten globaal zijn omdat ze in draw() en mouseClicked() worden gebruikt
int widthStartButton, heightStartButton;
int yPositionNumberOfSets;
