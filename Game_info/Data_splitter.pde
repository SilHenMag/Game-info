String[][] gameInfo;
String[] data;
String[] temp;

void data_splitter() {
  data = loadStrings("Games.txt");
  gameInfo = new String[data.length][7];

  for (int i = 0; i < data.length; i++) {
    temp = split(data[i], ";");
    for (int j = 1; j < 7; j++) {
      gameInfo[i][j] = temp[j];
    }
  }
}
