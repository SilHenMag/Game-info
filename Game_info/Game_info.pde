import g4p_controls.*; //<>//

String[][] gameInfo;
String[] data;
String[] temp;

void setup() { //<>//
  background(100); //<>//
  //size(1800, 900);
  data = loadStrings("Games.txt");
  gameInfo = new String[data.length][7];

  for (int i = 0; i < data.length; i++) {
    temp = split(data[i], ";");
    for (int j = 1; j < 7; j++) {
      gameInfo[i][j] = temp[j];
    }
  }
  createGUI1();
}

void draw() {
  fill(75);
  rect(-1, -1, 610, height);
  for (int i = 0; i < data.length; i++) {
    //for (int j = 1; j < 7; j++) {
      //println(gameInfo[i][1]);
    //}
  }
}
