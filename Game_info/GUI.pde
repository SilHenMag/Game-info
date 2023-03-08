public void button2_click2(GButton source, GEvent event) {
  background(0);
}

public void button1_click1(GButton source, GEvent event) {
  background(100);
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
  fill(75);
  rect(-1, -1, 610, height + 50);
  textSize(30);
  fill(95);
  rect(25, 270, 560, height);
  fill(0);
  for (int i = 0; i < data.length; i++) {
    text(gameInfo[i][1], 35, 300 + i * 45);
  }
}
