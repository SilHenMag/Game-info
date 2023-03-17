int move;
int backgound = 100;
float resultY;
int resultX = 35;
int searchResults;
float[][] searchButtons;
int[] searchResultsY;
int[][] searchButtonsPressed;
int[] searchResultsID;
int tempSearchID = 0;
boolean searchButtonsCheck = false;

public void button2_click2(GButton source, GEvent event) {
  backgound = 0;
}

public void button1_click1(GButton source, GEvent event) {
  backgound = 100;
}

public void textfield1_change1(GTextField source, GEvent event) {
}

public void createGUI1() {
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  G4P.setDisplayFont("Arial", G4P.PLAIN, 30);
  G4P.setInputFont("Arial", G4P.PLAIN, 30);
  G4P.setSliderFont("Arial", G4P.PLAIN, 30);
  surface.setTitle("Sketch Window");
  textfield1 = new GTextField(this, 5, 150, 600, 100, G4P.SCROLLBARS_NONE);
  textfield1.setPromptText("Insert game name here");
  textfield1.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  button1 = new GButton(this, 350, 50, 200, 50);
  button1.setText("Light");
  button1.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  button1.addEventHandler(this, "button1_click1");
  button2 = new GButton(this, 50, 50, 200, 50);
  button2.setText("Dark");
  button2.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  button2.addEventHandler(this, "button2_click2");
  G4P.setDisplayFont("Arial", G4P.PLAIN, 20);
  G4P.setInputFont("Arial", G4P.PLAIN, 20);
  G4P.setSliderFont("Arial", G4P.PLAIN, 20);
}

GTextField textfield1;
GButton button1;
GButton button2;

void search_area() {
  resultY = 0;
  searchResults = 0;
  tempSearchID = 0;

  fill(75);
  rect(-1, -1, 610, height + 50);
  textSize(30);
  fill(95);
  rect(25, 270, 560, height);
  fill(0);

  for (int i = 0; i < data.length; i++) {
    if (gameInfo[i][1].substring(0, Math.min(textfield1.getText().length(), gameInfo[i][1].length())).toLowerCase().equals(textfield1.getText().toLowerCase())) {
      if (mouseX >= resultX-5 && mouseX <= resultX + width*0.3 && mouseY >= (300 + move * 6 + resultY * 45) - 25 && mouseY <= (300 + move * 6 + resultY * 45) + 10) {
        fill(200);
        rect(resultX - 5, (300 + move * 6 + resultY * 45) - 30, resultX + width*0.285, 45);
        fill(0);
        if (mousePressed && frameCount >= 1) {
          for (int j = 0; j < searchButtons.length; j++) {
            if (searchButtons[j][0] == int(gameInfo[i][0])) searchButtonsPressed[j][1] = 1;
            println(gameInfo[i][1] + " " + searchButtonsPressed[j][1]);
          }
        }
      }
      text(gameInfo[i][1], resultX, 300 + move * 6 + resultY * 45);
      resultY++;
      searchResults++;
    }
  }

  searchButtonsPressed = new int[searchResults][2];
  for (int i = 0; i < searchButtonsPressed.length; i++) {
    if (frameCount >= 1 && searchButtonsPressed[i][1] == 1) {
      fill(200);
      rect(width*0.5, height*0.2, width*0.3, height*0.6);

      noFill();
    }
  }

  //does pseudus shitus
  searchButtons = new float[searchResults][3]; //[gameid][xpos][ypos]
  for (int i = 0; i < data.length; i++) {
    if (gameInfo[i][1].substring(0, Math.min(textfield1.getText().length(), gameInfo[i][1].length())).toLowerCase().equals(textfield1.getText().toLowerCase())) {
      searchButtons[tempSearchID][0] = int(gameInfo[i][0]);
      searchButtons[tempSearchID][1] = resultX;
      searchButtons[tempSearchID][2] = (300 + move * 6 + resultY * 45);

      tempSearchID++;
    }
  }
  
  for (int i = 0; i < searchResults; i++) {
    searchButtonsPressed[i][0] = int(searchButtons[i][0]);
    if (!searchButtonsCheck) searchButtonsPressed[i][1] = 0;
  }
  searchButtonsCheck = true;
  //readus abovus u idiotus

  fill(75);
  strokeWeight(0);
  rect(0, 0, 600, 269);
}

void ScrollFix() {
  if (move <= -308) {
    move = -307;
  }
  if (move > -1) {
    move = 0;
  }
}
