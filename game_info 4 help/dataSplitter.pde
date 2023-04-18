String[][] gameInfo;
String[] data;
String[] temp;
String[][] gameDesc;
int max;
int bruh = 0;

void data_splitter() {
  gameInfo_splitter();
  gameDesc_splitter();
}

void gameInfo_splitter() {
  data = loadStrings("Games desc.txt");
  gameInfo = new String[data.length][7];

  for (int i = 0; i < data.length; i++) {
    temp = split(data[i], ";");
    for (int j = 0; j < 7; j++) {
      gameInfo[i][j] = temp[j];
    }
  }
  for (int i = 0; i < data.length; i++) {
    if (data[i].indexOf(";½") != -1) bruh++;
    println(gameInfo[i][0] + " " + bruh);
  }
}

void gameDesc_splitter() {  
  for (int i = 0; i < data.length; i++) {
    temp = split(data[i], "½");
    max = Math.max(max, temp.length);
  }
  gameDesc = new String[data.length][max];
  
  for (int i = 0; i < data.length; i++) {
    temp = split(data[i], "½");
    gameDesc[i][0] = gameInfo[i][0];
    for (int j = 1; j < max && j < temp.length; j++) {
      gameDesc[i][j] = temp[j];
    }
  }
}
