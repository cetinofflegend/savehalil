class obstacle {
  character character = new character();
  float x = random(width), y;
  float ySpeed1;
  float range1 = 2, range2 = 5;
  boolean sB;
  void locate() {
      /*ySpeed = -2;
      xSpeed = 0;*/
      fill(255);
      rect(x, y, 15, 15);
      ySpeed1 = random(range1, range2);
      y += ySpeed1;
      if(y >= height) {
        range1 += 0.2;
        range2 += 0.3;
        if(character.speedX < 20 && character.speedY < 20) {
          sB = true;
        }
        
      }
      
  }
  void stop() {
    ySpeed1 = 0;
  }
  /*void move() {
    x -= xSpeed;
    y -= ySpeed;
    rect(x, y, 15, 15);*/
  
  }
