ArrayList<obstacle> o = new ArrayList<obstacle>(); 
obstacle obs = new obstacle();
character player = new character();
yuvarlak top = new yuvarlak();
float xx, yy;
float text;
String stat;
boolean left, right, up, down, space, death;
float dashcd;
int score;
float count;
float deg;
float dashb;

void setup() {
  o.add(new obstacle());
  size(700, 620);
  
  left = false;
  right = false;
  up = false;
  down = false;
  space = false;
  dashcd = 0;
  death = false;
  deg = 15;
  dashb = 0;
  xx = 0;
  yy = 0;
  


}

void draw() {
  
  if(!death) {
    if(player.speedX < 10 && player.speedY < 10) {
      score += 1;
    }else if (player.speedX > 10 && player.speedY > 10) {
      score += 3;
    }
    
  }
  text = score;
  if (dashcd > 0) {
    dashcd -= 1;
  }
  background(0);
  player.showChar();
  player.keepInScreen();
  if(o.size() > 0) {
    for(int i = 0; i < 25 + count; i++) {
      if(player.x > o.get(i).x - deg && player.x < o.get(i).x + deg && player.y > o.get(i).y - deg && player.y < o.get(i).y + deg) {
      death = true;
      o.get(i).stop();
      }
      if(!death) {
        o.add(new obstacle());
        o.get(i).locate();
        if(o.get(i).y >= height) {
          o.get(i).y = 0;
          o.get(i).x = random(width);
          if(i == 2) {
            count += 1;
            dashb += 1;
            if(player.speedX < 20 && player.speedY < 20) {
              player.speedX += 0.3;
              player.speedY += 0.3;
              xx += 0.2;
              yy += 0.2;
            }
          }
          
        }
      }
    
  }
  }
  
  if(death) {
    fill(255);
    stat = "Status: Dead";
    textSize(24);
    text(stat, 550, 50);
    fill(0,255,0);
    text("Press any mouse key to restart", 225, 75);
  }else {
    fill(255);
    stat = "Status: Alive";
    textSize(24);
    text(stat, 550, 50);
  }
  fill(255);
  //Texts
  textSize(24);
  text("Score: " + text, 100, 50);
  text("Bullets: " + (25 + count),100,100);
  text("Speed X: " + player.speedX + " Speed Y: " + player.speedY, 100, 150);
  text("Dash Speed: " + (60 + dashb), 100, 200);
  text("Save Halil",300, 25);
  //Player Movement/Dash
  player.move();
  player.dash();
  player.leftDash();
  player.oDash();
  if(!death) {
    top.chase(player.x, player.y);
    top.show();
    top.update();
    if(player.x > top. x - 11 && player.x < top.x + 11 && player.y > top.y - 11 && player.y < top.y + 11) {
      death = true;
      }
  }
  
  

}
//Key Detection for Movement
void keyPressed() {
  if(!death) {
    switch(keyCode) {
    case 38: // UP
      up = true;
      break;
    case 37: // LEFT
      left = true;
      break;
    case 40: //DOWN
      down = true;
      break;
    case 39: //RIGHT
      right = true;
      break;
    case 32 : //SPACE (for dash)
      space = true;
      break;
    case 87: // W Key
      up = true;
      break;
    case 65: // A Key
      left = true;
      break;
    case 83: // S Key
      down = true;
      break;
    case 68: // D Key
      right = true;
      break;
    
  }
  }
}

void keyReleased() {
  switch(keyCode) {
    
    case 38:// UP
      up = false;
      break;
    case 37: // LEFT
      left = false;
      break;
    case 40: //DOWN
      down = false;
      break;
    case 39: //RIGHT
      right = false;
      break;
    case 32:
      space = false; // SPACE (for dash)
      break;
    case 87: // W Key
      up = false;
      break;
    case 65: // A Key
      left = false;
      break;
    case 83: // S Key
      down = false;
      break;
    case 68: // D Key
      right = false;
      break;
}
}

void mousePressed() {
  if(death) {
    death = false;
    player.x = 350;
    player.y = 310;
    
    xx = 0;
    yy = 0;
    dashb = 0;
    score = 0;
    count = 0;
    dashcd = 0;
    player.speedX = 2;
    player.speedY = 2;
    for(int i = 0; i < o.size() + count; i++) {
      o.get(i).y = 0;
      top.x = 500;
      top.y = 100;
    }
  }else {
    return;
  }
}
