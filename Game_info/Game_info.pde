import g4p_controls.*; //<>// //<>// //<>//

void setup() { //runs once
  size(1800, 900); //sets canvas size
  data_splitter(); //splits data
  createGUI1(); //creates GUI
}

void draw() { //loops many times a second
  background(backgound); //sets background
  search_area(); //runs the whole searching stuff - couldnt be bothered to split the searching and showing into 2 methods
  ScrollFix(); //makes sure you dont scroll out of bounds
}

void mouseWheel(MouseEvent event) { //runs every time you scroll
  if ((mouseX >= 35 && mouseX <= 570) && (mouseY >= 270)) { //is mouse within search results area?
    move = move - event.getCount(); //scroll according to scroll-direction
  }
  if (mouseX >= width*0.35 && mouseX <= width*0.989 && mouseY >= height*0.4 && mouseY <= height*0.975) { //is mouse within a game's description?
    moveDesc = moveDesc - event.getCount(); //scroll according to scroll-direction
  }
}
