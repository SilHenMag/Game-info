int move; //<>//
int backgound = 100;
float resultY;
int resultX = 30;
int searchResults;
float[][] searchButtons;
int tempID = 0;
int activity = -1;

public void button2_click2(GButton source, GEvent event) {
  backgound = 0;
}

public void button1_click1(GButton source, GEvent event) {
  backgound = 100;
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
  tempID = 0;

  fill(75);
  rect(-1, -1, 610, height + 50);
  textSize(30);
  fill(95);
  rect(25, 270, 560, height);
  fill(0);

  for (int i = 0; i < data.length; i++) { //goes through whole database
    if (gameInfo[i][1].substring(0, Math.min(textfield1.getText().length(), gameInfo[i][1].length())).toLowerCase().equals(textfield1.getText().toLowerCase())) { //does a game in database, match search?
      if (mouseX >= resultX && mouseX <= resultX + width*0.3 && mouseY >= (300 + move * 6 + resultY * 45) - 20 && mouseY <= (300 + move * 6 + resultY * 45) + 10) { //is mouse within a game's button area?
        fill(200); //set button color
        rect(resultX, (300 + move * 6 + resultY * 45) - 30, resultX + width*0.285, 45); //the button
        fill(0); //set text color
      }
      text(gameInfo[i][1], resultX, 300 + move * 6 + resultY * 45); //search results
      resultY++; //makes sure the search results have correct y position
      searchResults++; //counts the number of search results
    }
  }

  searchButtons = new float[searchResults][4]; //ID, y start, y end, activity
  tempID = 0;
  resultY = 0;
  for (int i = 0; i < data.length; i++) {
    if (gameInfo[i][1].substring(0, Math.min(textfield1.getText().length(), gameInfo[i][1].length())).toLowerCase().equals(textfield1.getText().toLowerCase())) { //does a game in database, match search?
      searchButtons[tempID][0] = int(gameInfo[i][0]);
      searchButtons[tempID][1] = (300 + move * 6 + resultY * 45) - 20;
      searchButtons[tempID][2] = (300 + move * 6 + resultY * 45) + 10;


      tempID++;
      resultY++;
    }
  }


  //deactivates buttons
  if (frameCount >= 1 && mousePressed && activity != -1) {
    for (int i = 0; i < searchButtons.length; i++) {
      if (mouseX < resultX || mouseX > resultX + width*0.3 || mouseY < searchButtons[i][1] || mouseY > searchButtons[i][2]) activity = -1;
    }
  }

  //activates buttons
  if (frameCount >= 1 && mousePressed) {
    for (int i = 0; i < searchButtons.length; i++) {
      if (mouseX >= resultX && mouseX <= resultX + width*0.3 && mouseY >= searchButtons[i][1] && mouseY <= searchButtons[i][2]) {
        searchButtons[i][3] = 1.0;
        activity = i;
        println("");
        printArray(searchButtons[i]);
      }
    }
  }

  if (activity != -1 && frameCount >= 1) {
    fill(200);
    rect(width*0.35, height*0.025, width*0.64, height*0.95);

    fill(0);
    for (int j = 0; j < data.length; j++) {
      if (searchButtons[activity][0] == float(gameInfo[j][0])) {
        //newPanel - the actual panel. ends when the if statement above is over

        text(gameInfo[j][0] + " " +
          gameInfo[j][1] + " " +
          gameInfo[j][2] + " " +
          gameInfo[j][3] + " " +
          gameInfo[j][4] + " " +
          gameInfo[j][5] + " " +
          gameInfo[j][6], width*0.4, height*0.5); //newPanel - location for actual panel
      }

      noFill();
    }
  }

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
