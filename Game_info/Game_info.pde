import g4p_controls.*; //<>// //<>// //<>//

void setup() {
  size(1800, 900);
  data_splitter();
  createGUI1();
}

void draw() {
  background(backgound);
  search_area();
  ScrollFix();
}

void mouseWheel(MouseEvent event) {
  if ((mouseX >= 35 && mouseX <= 570) && (mouseY >= 270)) {
    move = move - event.getCount();
  }
  if (mouseX >= width*0.35 && mouseX <= width*0.989 && mouseY >= height*0.4 && mouseY <= height*0.975) {
    moveDesc = moveDesc - event.getCount();
  }
}
