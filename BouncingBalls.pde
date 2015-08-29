

/*
Exercise simulating the drop or throw of a ball
inside 4 walls.
Applying a sort of G Force
Author: Carlens Faustin @2011
*/


final int ball_radius=25; 
int windowWidth=600;
int windowHeight=600;
final float acceleration=1.63;
final int leap=25;
int numBalls = 100;//# of balls 
Ball[] balls = new Ball[numBalls];//array containing balls
int r=int(random(256))+0;//red
int g=int(random(256))+0;//green
int b=int(random(256))+0;//bleu


 
void setup() {
  size(windowWidth, windowHeight);
  
  background (0);
  b1= new Ball((random(576))+25, -25, 0, 0, 5, color(255, 255, 255));
  smooth();
  noStroke();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball((random(width)), (random(height)), 0, 0, 5, color(r, g, b));
  }
  
  
}
 
void draw() {
  background (0);
  drawBall(b1);
  
  drawBall(balls[4]);
  
  b1.yspeed = b1.yspeed += 0.2;
  b1.xspeed = b1.xspeed/1.005;
  b1.y = b1.y + b1.yspeed;
  b1.x = b1.x + b1.xspeed;

  

  moveBall(b1);
  mouseChecks(b1);
  
  
}
 
void mouseChecks(Ball b) {
  if (mousePressed == true) {
    b.x = mouseX;
    b.y = mouseY;
    b.yspeed = mouseY - pmouseY;
    b.xspeed = mouseX - pmouseX;
  }
}
 
void moveBall(Ball b) {
  if (b.y +ball_radius>= height ) {
    b.y = height - ball_radius;
    b.yspeed = -b.yspeed/acceleration;
    b.y=b.y+b.yspeed;
  }
  if (b.y <= b.bounces*leap) {
    b.y = b.bounces*leap;
    b.yspeed = -b.yspeed/acceleration;
  }
  if (b.x >= width -ball_radius) {
    b.x = width -ball_radius;
    b.xspeed = -b.xspeed/1.10;
  }
  if (b.x <= ball_radius) {
    b.x = ball_radius;
    b.xspeed = -b.xspeed/1.10;
  }
}
 


Ball b1;

class Ball {
  float  x;
  float y;
  float xspeed;
  float yspeed;
  int bounces;
  color ballColor;

  int direction;

  Ball ( float p1, float p2, float p3, float p4, int p5, color p6)
  {
    x=p1;
    y=p2;
    xspeed=p3;
    yspeed=p4;
    bounces=p5;
    ballColor=p6;
  }
}


void drawBall(Ball b) {
  fill(b.ballColor);
  ellipse(b.x, b.y, ball_radius, ball_radius);
}
