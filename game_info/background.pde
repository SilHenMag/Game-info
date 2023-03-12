color backgroundC = 100;
color buttonsC = 255;
color textC = 0;
int theme = 1;

void backgroundButtons() {
  fill(buttonsC);
  rect(width*0.125, height*0.125, width*0.125, height*0.125);
  fill(textC);
  textAlign(CENTER);
  textSize(50);
  text("Theme", (width*0.125)+(width*(0.125/2)), (height*0.125)+(height*(0.125*0.60)));
  
  textAlign(LEFT);
  noFill();
}
