boolean searching = false;
int searchingOn = 0;
String search = "";
String notSearching = "Type to search";

void searchBar() {
  fill(buttonsC);
  rect(width*(0.125/4), height*0.375, width*(0.25+(0.125/2)), height*0.125);
  fill(0);
  if (searching) {
  if (searchingOn <= 60) {
    line(width*(0.25*0.75), height*(0.375+(0.125/8)), width*(0.25*0.75), height*(0.5-(0.125*(1.0/8))));
  }
  if (searchingOn >= 120) searchingOn = 0;
  searchingOn++;
  }
  fill(textC);
  textAlign(CENTER);
  
  if (search.length() == 0) text(notSearching, width*(0.125+(0.125/2)), height*(0.375+(0.125*0.60)));
  else text(search, width*(0.125+(0.125/2)), height*(0.375+(0.125*0.60)));
  
  textAlign(LEFT);
  noFill();
}
