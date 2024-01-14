class character {
  String text;
  float x, y;
  float xSpeed, ySpeed;
  float speedX = 2, speedY = 2;
  float charSize = 22;
  void showChar() {
    fill(100);
    rect(x, y, charSize, charSize);
  }
  
  character() {
    x = 350;
    y = 310;
    xSpeed = 0;
    ySpeed = 0;
  
  
  }
  void leftDash() {
    if(left && up && !down && !right && space && dashcd == 0) { // Doesn't work with arrow key for some reason but W is fine!
      x = x - (60 + dashb);
      y = y - (60 + dashb);
      if(score < 1200) {
        dashcd = 120;
      } else {
        dashcd = 50;
      }
    }
    if(left && down && !up && !right && space && dashcd == 0) {
      x = x - (60 + dashb);
      y = y + (60 + dashb);
      if(score < 1200) {
        dashcd = 120;
      }else {
        dashcd = 50;
      }
    }
  }
  
  void move() {
    //LEFT - RIGHT PART
    if(left) {
      xSpeed = -speedX;
    }
    if(right) {
      xSpeed = speedX;
    }
    if((!left && !right) || (left && right)) { //Brakes.
      xSpeed = 0;
    }
    //UP - DOWN PART
    if(up) {
      ySpeed = -speedY;
    }
    if(down) {
      ySpeed = speedY;
    }
    if((!up && !down)|| (up && down)) {
      ySpeed = 0;
    }
    x += xSpeed;
    y += ySpeed;
  }//end of movement function
  
  /*void dash() {
    
    //ONE-DIRECTION DASH
    if(left && !right && !up && !down && space && !rd && dashcd == 0) {
      x = x - 60;
      rd = true;
      dashcd = 120;
    }
    if(right && !left && !up && !down && space && !rd && dashcd == 0) {
      x = x + 60;
      rd = true;
      dashcd = 120;
    
    //DIOGNAL DASH
    if(right && up && !down && !left && space && !rd && dashcd == 0) {
      x = x + 60;
      y = y- 60;
      rd = true;
      dashcd = 120;
    }
    if(right && down && !up && !left && space && !rd && dashcd == 0) {
      x = x + 60;
      y = y + 60;
      rd = true;
      dashcd = 120;
    }
    if(left && up && !down && !right && space && !rd && dashcd == 0) {
      x = x - 60;
      y = y - 60;
      rd = true;
      dashcd = 120;
    }
    if(left && down && !up && !right && space && !rd && dashcd == 0) {
      x = x + 60;
      y = y + 60;
      rd = true;
      dashcd = 120;
    }
  
  }
  }*/
  void dash() {
    //DIOGNAL +X -Y (RIGHT, UP)
    if(right && up && !left && !down && space && dashcd == 0) {
      x = x + (60 + dashb);
      y = y - (60 + dashb);
      if(score < 1200) {
        dashcd = 120;
      }else {
        dashcd = 50;
      }
    }
    if(right && down && !left && !up && space && dashcd == 0) {
      x = x + (60 + dashb);
      y = y + (60 + dashb);
      if(score < 1200) {
        dashcd = 120;
      }else {
        dashcd = 50;
      }
    }
   
    /*if(right && up && !left && !down && space && !rd && dashcd == 0) {
      x = x + 60;
      y = y- 60;
      rd = true;
      dashcd = 120;
    }*/
    
  }//end of right dash
  
  void oDash() {
    if(left && !right && !up && !down && space && dashcd == 0) {
      x = x - (60 + dashb);
      if(score < 1200) {
        dashcd = 120;
      }else {
        dashcd = 50;
      }
    }
    if(right && !left && !up && !down && space && dashcd == 0) {
      x = x + (60 + dashb);
      if(score < 1200) {
        dashcd = 120;
      }else {
        dashcd = 50;
      }
    }
    if(up && !right && !left && !down && space && dashcd == 0) {
      y = y - (60 + dashb);
      if(score < 1200) {
        dashcd = 120;
      }else {
        dashcd = 50;
      }
    }
    if(down && !left && !up && !right && space && dashcd == 0) {
      y = y + (60 + dashb);
      if(score < 1200) {
        dashcd = 120;
      }else {
        dashcd = 50;
      }
    }
  }
  
  
    
  
    
  void keepInScreen() {
    if(x >= width - charSize) {
      x -= xSpeed;
    }
    if(x <= 0) {
      x = x - xSpeed;
    }
    if(y >= height - charSize) {
      y = y - ySpeed;
    }
    if(y <= 0) {
      y = y - ySpeed;
    }
  
  }
  



}
