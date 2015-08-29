/*
An exercise about the use of recursion in processing
The use of recursion methods/call allows to create the leaf



author: Carlens Faustin @2011
*/

int windowWidth=1400;
int windowHeight=1000;
float offset = 6*PI/360;   
float shrinkFactor = 0.90;
float segwidth=150;
color colorGreen=color (42, 240, 17);


void setup() {
  size(windowWidth, windowHeight);
  strokeWeight(3);
}


void draw() {

  background(255);        // White
  stroke(colorGreen);    // Black


  //draw the rest of the tree
  segment(10, 190, segwidth, PI-PI);
}

void segment( int startX, int startY, float segmentLenght, float angle) {

  //base
  if (segmentLenght>1)
  {

    //recursive
    int endX = startX + int(segmentLenght * cos(angle-offset));
    int  endY = startY + int(segmentLenght * sin(PI+angle-offset));

    //mileu
    line(startX, startY, endX, endY);


    //segment for main branch
    segment(endX, endY, segmentLenght*shrinkFactor, angle-offset); 

    //segment for upstream
    segment(endX, endY, segmentLenght/3*shrinkFactor, (angle+(PI/3) -offset));

    //segment for downstream
    segment(startX + (int(segmentLenght * cos(angle-offset)))/3, startY + (int(segmentLenght * sin(PI+angle-offset)))/3, segmentLenght/3*shrinkFactor, (angle+(-11*PI/36) -offset));
  }
}


