// Gamestatus: these are variables to direct the game
boolean gameStarted= false;
boolean gameWon = false;
boolean setupComplete = false;  
boolean gamePaused = false;
int pauseCounter = 0;

// Player information
String player1Name, player2Name;
int playerTurn = 1;
int player1Turns = 0;
int player2Turns = 0;
int player1Points = 0;
int player2Points = 0;

// Cards:  these variables are needed to create the Cards for the game
Card[][] cards;
Card tempCard;
int[] sets = new int[11];  //int[] sets = {1, 12, 18, 24, 32};  //(add 1, 18 to test expanding the game)  
//int[] sets = {1, 12, 18, 24, 32};
int numberOfCardsX, numberOfCardsY;
int numberOfSets = 0;

//variables to use in mouseClick() when playGame()
Card clickedCard;
Card clickedCard1;
Card clickedCard2;
boolean card1 = false;
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
int spaceBetweenText = 50;
 
//Dimensions of the Buttons:
int xPositionStartButton, yPositionStartButton;      // Deze variabelen moeten globaal zijn omdat ze in draw() en mouseClicked() worden gebruikt
int widthStartButton, heightStartButton;
int yPositionNumberOfSets;
