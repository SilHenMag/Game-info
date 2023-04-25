//declare variables

String[][] gameInfo;
String[] data;
String[] temp;
String[][] gameDesc;
int max;
int bruh = 0;

//the runner. Calls the other methods for cleaner look
void data_splitter() {
  gameInfo_splitter();
  gameDesc_splitter();
}

//splits the main info
void gameInfo_splitter() {
  data = loadStrings("Games desc.txt"); //loads file
  gameInfo = new String[data.length][7]; //holds main info

  for (int i = 0; i < data.length; i++) { //goes through whole file
    temp = split(data[i], ";"); //goes through one line at a time
    for (int j = 0; j < 7; j++) { //goes through whole line
      gameInfo[i][j] = temp[j]; //places file content in array
    }
  }
}

//splits descriptions
void gameDesc_splitter() {
//this loop sets the desc array's size
  for (int i = 0; i < data.length; i++) { //goes through whole data list
    temp = split(data[i], "½"); //splits the description lines
    max = Math.max(max, temp.length); //initiates a variable as the max width the desc array should have
  }
  gameDesc = new String[data.length][max]; //holds game descriptions

//this loop puts data into the desc array
  for (int i = 0; i < data.length; i++) { //goes through whole data list
    temp = split(data[i], "½"); //splits the description
    gameDesc[i][0] = gameInfo[i][0]; //sets the desc array's first element in each row to the game's ID
    for (int j = 1; j < max && j < temp.length; j++) { //goes through whole line that holds one game's description
      gameDesc[i][j] = temp[j]; //places descriptions in array
    }
  }
}
