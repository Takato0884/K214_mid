float barX = 500.0f;
float barY = 700.0f;
float barVX = 5.0f;
float barWidth = 100.0f;
float barHeight = 25.0f;

void moveBar(){
  if ( keyPressed ) {
    if ( keyCode == RIGHT ) {
      barX = barX + barVX;
    } else if ( keyCode == LEFT ) {
      barX = barX - barVX;
    }
  }
}

void drawBar(){
  rect(barX, barY, barWidth, barHeight);
}
