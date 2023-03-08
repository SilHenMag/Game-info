import g4p_controls.*; //<>// //<>// //<>//

String[][] gameInfo;
String[] data;
String[] temp;

void setup() {
  background(100);
  size(1800, 900);
  data_splitter();
  createGUI1();
}

void draw() {
  search_area();
}
