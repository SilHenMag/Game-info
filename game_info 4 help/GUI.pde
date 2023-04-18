 //<>// //<>// //<>// //<>//
int move; //<>//
int backgound = 100;
float resultY;
int resultX = 30;
int searchResults;
float[][] searchButtons;
int tempID = 0;
int activity = -1;
float descMax;
String desc = "";

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

  search_panel();
  searchButtons_giveValue();
  searchButtonsDeactivate();
  searchButtonsActivate();
  infoPanel();

  fill(75);
  strokeWeight(0);
  rect(0, 0, 600, 269);
}

void search_panel() {
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
}

void searchButtons_giveValue() {
  searchButtons = new float[searchResults][4]; //ID, y start, y end, activity
  tempID = 0;
  resultY = 0;
  for (int i = 0; i < data.length; i++) {
    if (gameInfo[i][1].substring(0, Math.min(textfield1.getText().length(), gameInfo[i][1].length())).toLowerCase().equals(textfield1.getText().toLowerCase())) { //does a game in database, match search?
      searchButtons[tempID][0] = int(gameInfo[i][0]); //give ID
      searchButtons[tempID][1] = (300 + move * 6 + resultY * 45) - 20; //give start-Y position
      searchButtons[tempID][2] = (300 + move * 6 + resultY * 45) + 10; //give end-Y position

      tempID++;
      resultY++;
    }
  }
}

void searchButtonsDeactivate() {
  if (frameCount >= 1 && mousePressed && activity != -1) { //is a button on, mouse down, and has script run least once?
    for (int i = 0; i < searchButtons.length; i++) { //runs through whole list of buttons
      if (mouseX < resultX || mouseX > resultX + width*0.3 || mouseY < searchButtons[i][1] || mouseY > searchButtons[i][2]) activity = -1; //is mouse outside just 1 button? then turn them all off
    }
  }
}

void searchButtonsActivate() {
  if (frameCount >= 1 && mousePressed) { //is mouse held, and has script run least once?
    for (int i = 0; i < searchButtons.length; i++) { //runs through whole list of buttons
      if (mouseX >= resultX && mouseX <= resultX + width*0.3 && mouseY >= searchButtons[i][1] && mouseY <= searchButtons[i][2]) { //is mouse inside a button?
        searchButtons[i][3] = 1.0; //set the button's activity to "active" - unsure if this is even needed
        activity = i; //set activity ID to active button
        println(""); //prints some space in console - just for devs
        printArray(searchButtons[i]); //prints the active button's info - just for devs
      }
    }
  }
}

void infoPanel() {
  desc = "";
  if (activity != -1 && frameCount >= 1) { //is a button active, and has script run least once?
    fill(200); //sets background
    rect(width*0.35, height*0.025, width*0.64, height*0.95); //places panel

    fill(0); //sets text color

    for (int i = 0; i < gameDesc[int(searchButtons[activity][0])-1].length && gameDesc[int(searchButtons[activity][0])-1][i] != null; i++) {
      if (textWidth(desc + gameDesc[int(searchButtons[activity][0])-1][i]) < descMax) desc = desc + gameDesc[int(searchButtons[activity][0])-1][i] + "\n";
      else {
        temp = split(gameDesc[int(searchButtons[activity][0])-1][i], " ");
        for (int j = 0; j < temp.length; j++) {
          if (textWidth(desc + temp[j]) < descMax) desc = desc + temp[j] + " ";
          else desc = desc + "\n" + temp[j] + " ";
        }
      }
    }

    text(desc, width*0.35+50, height*0.025+30+50);

    /*
 text(gameInfo[activity][0] + " " + //the shown text
     gameInfo[activity][1] + " " +
     gameInfo[activity][2] + " " +
     gameInfo[activity][3] + " " +
     gameInfo[activity][4] + " " +
     gameInfo[activity][5] + " " +
     gameInfo[activity][6], width*0.4, height*0.5);
     //info panel end*/
  }

  noFill();
}

void ScrollFix() {
  if (move <= -308) {
    move = -307;
  }
  if (move > -1) {
    move = 0;
  }
}
