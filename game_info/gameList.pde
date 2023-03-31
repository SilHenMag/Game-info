float yPos = height*0.125;

void gameList() {
  //game's name is on gameInfo[i][1]
  
  for (int i = 0; i < data.length; i++) {
    if (gameInfo[i][1].substring(0, searchSent.length()).toLowerCase().equals(searchSent.toLowerCase())) text(gameInfo[i][1], width*0.5, yPos);
    yPos = yPos += height*0.125;
  }
}
