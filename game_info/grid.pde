void grid() {
  for (float i = width*0.125; i < width; i+=width*0.125) {
    line(i, 0, i, height);
  }
  for (float i = height*0.125; i < height; i+=height*0.125) {
    line(0, i, width, i);
  }
}
