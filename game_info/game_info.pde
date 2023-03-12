void setup() {
  size(1800, 900);
  data_splitter();
}

void draw() {
  background(backgroundC);
  gui();
}

void mouseWheel(MouseEvent event) {
  if ((mouseX >= 35 && mouseX <= 570) && (mouseY >= 270)) {
    move = move - event.getCount();
  }
}

void mousePressed() {
  if (mouseX >= width*0.125 && mouseX <= width*0.25 && mouseY >= height*0.125 && mouseY <= height*0.25) {
    if (theme == 1) {
      backgroundC = 255;
      buttonsC = 100;
      textC = 255;
      theme = 2;
    } else if (theme == 2) {
      backgroundC = 100;
      buttonsC = 255;
      textC = 0;
      theme = 1;
    }
  }

  if (mouseX >= width*(0.125/4) && mouseX <= (width*(0.125/4))+(width*(0.25+(0.125/2))) && mouseY >= height*0.375 && mouseY <= (height*0.375)+(height*0.125)) {
    searching = true;
  } else if (mouseX <= width*(0.125/4) || mouseX >= (width*(0.125/4))+(width*(0.25+(0.125/2))) || mouseY <= height*0.375 || mouseY >= (height*0.375)+(height*0.125)) {
    searching = false;
    searchingOn = 0;
  }
}

void keyPressed() {
  if (searching && !(key == CODED || key == BACKSPACE || key == TAB || key == ENTER || key == RETURN || key == ESC || key == DELETE)) search = search + key;
  else if (searching && key == BACKSPACE && search.length() >= 1) search = search.substring(0, search.length()-1);
}
