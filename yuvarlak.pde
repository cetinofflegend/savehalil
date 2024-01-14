class yuvarlak {
  float x, y, w, h, vx, vy;
  
  //constructor
  yuvarlak() {
    x = random(0, 500);
    y = 100;
    w = 20;
    h = 20;
    vx = 0;
    vy = 0;
  }
  void update() {
    x += vx;
    y += vy;
  }
  void chase(float px, float py) {
    if(abs(x - px) < abs(y -py)) {
      //Vertical Bigger
      if(y < py) {
        vy = 1.5 + yy;
        vx = 0;
      }else {
        vy = -1.5 - yy;
        vx = 0;
      }//End of Y chase
    } else {
      //Horizontal Move
      if(x < px) {
        vx = 1.5 + xx;
        vy = 0;
      }else {
        vx = -1.5 - xx;
        vy = 0;
        
      }
    }
  }
  void show() {
    fill(255,0,0);
    ellipse(x, y, w, h);
  }
}
