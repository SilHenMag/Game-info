import g4p_controls.*;

String[] lines;
int Backgroud;

void setup() {
  background(100);
  size(1800, 900);
  lines = loadStrings("Steam data.txt");
  createGUI1();
}

void draw() {
}
