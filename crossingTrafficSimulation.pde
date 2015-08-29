/*
Simulating a person crossing a street while cars are passing by.
The cars are supposed to stop whenever the person is in their lane

*/
//Carlens Faustin  @2011




Car myCar, myTruck, otherCar, otherTruck;
Building b1, b2, b3, b4, b5, b6, b7, b8, b9, b10;

final int PANEL = 20;
final int GAP = 5;

class Building {
  int x;
  float h;
  float w;
  int r;
  int g ;
  int b;
}
class Car {
  int x, y;
  float speed;
  color color1;
  color color2;
  color color3;
  int direction;
  int type;
  float acceleration = 0;
  int pedestrianx;
  int pedestriany;
}


void setup() {


  size(1024, 600);

  background(#60AFFE);



  int xOffset = GAP;
  int x = 0;

  fill(180);
  rect(x, height-290, width, 300);//pavement
  rect(x, height-180, width, 8);// curb
  rect(x, height-80, width, 5);//curb
  fill(#4DBD33);
  rect(x, height-75, width, 80);//grass
  fill(#696969);
  rect(x, height-174, width, 95);//road
  fill(#FFFF7E);
  rect(x, height-130, width, 2);
  rect(x, height-133, width, 2);
  // Draw 10 buildings 
  b1 =new Building();
  b1.x=0;
  b1.h = 7;
  b1.w=4;
  b1.r=90;
  b1.g=6;
  b1.b=6;


  b2 = new Building();
  b2.x=int(b1.x+ (PANEL+GAP)*b1.w + GAP*3); 
  b2.h = 10;
  b2.w = 3;
  b2.r=85;
  b2.g=81;
  b2.b=81;

  b3 = new Building();
  b3.x=int(b2.x+ (PANEL+GAP)*b2.w + GAP*3); 
  b3.h = 4;
  b3.w = 2;
  b3.r=245;
  b3.g=27;
  b3.b=231;
  b4 = new Building();
  b4.x=int (b3.x+ (PANEL+GAP)*b3.w + GAP*3); 
  b4.h = 7;
  b4.w = 2;
  b4.r=250;
  b4.g=0;
  b4.b=29;
  b5 = new Building();
  b5.x=int ((b4.x+ (PANEL+GAP)*b4.w + GAP*3)); 
  b5.h = 3;
  b5.w = 4;
  b5.r=11;
  b5.g=250;
  b5.b=1;
  b6 = new Building();
  b6.x=int(b5.x+ (PANEL+GAP)*b5.w + GAP*3); 
  b6.h = 5;
  b6.w = 2;
  b6.r=19;
  b6.g=0;
  b6.b=250;
  b7 = new Building();
  b7.x=int(b6.x+ (PANEL+GAP)*b6.w + GAP*3); 
  b7.h = 3;
  b7.w = 2;
  b7.r=250;
  b7.g=231;
  b7.b=1;
  b8 = new Building();
  b8.x= int(b7.x+ (PANEL+GAP)*b7.w + GAP*3); 
  b8.h = 9;
  b8.w = 3;
  b8.r=85;
  b8.g=113;
  b8.b=8;
  b9= new Building();
  b9.x= int(b8.x+ (PANEL+GAP)*b8.w + GAP*3); 
  b9.h = 9;
  b9.w = 4;
  b9.r=26;
  b9.g=151;
  b9.b=198;
  b10 = new Building();
  b10.x= int(b9.x+ (PANEL+GAP)*b9.w + GAP*3); 
  b10.h = 3;
  b10.w = 6;
  b10.r=6;
  b10.g=101;
  b10.b=142;
  drawBuilding(b1);
  drawBuilding(b2);
  drawBuilding(b3);
  drawBuilding(b4);
  drawBuilding(b5);
  drawBuilding(b6);
  drawBuilding(b7);
  drawBuilding(b8);
  drawBuilding(b9);
  drawBuilding(b10);
  //car
  myCar = new Car();
  myCar.x =0;
  myCar.y = 500;
  myCar.direction = 1;
  myCar.speed = random(3, 6);
  myCar.color1= color(((random(255))+1), ((random(255))+ 1), ((random(255))+1));
  myCar.type=int(random(2))+1;;
  myCar.direction =1;
  myCar.pedestrianx=mouseX;
  myCar.pedestriany=mouseY;
  otherCar = new Car();
  otherCar.x =0;
  otherCar.y = 500;
  otherCar.direction = 1;
  otherCar.speed = random(3, 6);
  otherCar.color1= color(((random(255))+1), ((random(255))+ 1), ((random(255))+1));
  otherCar.type= int(random(2))+1;
  otherCar.direction = -1;
  otherCar.pedestrianx=mouseX;
  otherCar.pedestriany=mouseY;
  //truck
  myTruck = new Car();
  myTruck.x =0;
  myTruck.y = 300;
  myTruck.direction = 1;
  myTruck.speed =random(3, 6);
  myTruck.color3= color(((random(255))+1), ((random(255))+ 1), ((random(255))+1));
  myTruck.color2= color(((random(255))+1), ((random(255))+ 1), ((random(255))+1));
  myTruck.pedestrianx=mouseX;
  myTruck.pedestriany=mouseY;
  myTruck.type= int(random(2))+1;

  otherTruck = new Car();
  otherTruck.x =0;
  otherTruck.y = 300;
  otherTruck.direction = -1;
  otherTruck.speed =random(3, 6);
  otherTruck.color3= color(((random(255))+1), ((random(255))+ 1), ((random(255))+1));
  otherTruck.color2= color(((random(255))+1), ((random(255))+ 1), ((random(255))+1));
  otherTruck.pedestrianx=mouseX;
  otherTruck.pedestriany=mouseY;
  otherTruck.type=int(random(2))+1;

  //  myPerson = new Person();
  //  myPerson.x= mouseX;
  //  myPerson.y=mouseY;
}


void draw() {// loop to draw car repeateadly

  background(#60AFFE);
  //redraw background 
  int x = 0;

  fill(180);
  stroke(0);
  rect(x, height-290, width, 300);//pavement
  rect(x, height-180, width, 8);// sidewalkcurb
  rect(x, height-80, width, 5);//curb
  fill(#4DBD33);
  rect(x, height-75, width, 80);//grass
  fill(#696969);
  rect(x, height-174, width, 95);//road
  fill(#FFFF7E);
  rect(x, height-130, width, 2);//yellow line
  rect(x, height-133, width, 2);//yellow line
  drawBuilding(b1);
  drawBuilding(b2);
  drawBuilding(b3);
  drawBuilding(b4);
  drawBuilding(b5);
  drawBuilding(b6);
  drawBuilding(b7);
  drawBuilding(b8);
  drawBuilding(b9);
  drawBuilding(b10);

  // Car brakes
  int stopX = myCar.x+200;
  if (mouseX - stopX < 50)
  {
    if (mouseY <=521 && mouseY >= 474) {
      myCar.acceleration = 10*myCar.speed/( mouseX - stopX);
      myCar.speed = myCar.speed - myCar.acceleration;
      myCar.x = int(myCar.x + myCar.speed*myCar.direction);
    }
    else {
      myCar.acceleration=0.1;
      myCar.speed = myCar.speed + myCar.acceleration;
      myCar.x = int(myCar.x + myCar.speed*myCar.direction);
    }
  } 

  // Car2 brakes 
  int stopX3 = (otherCar.x+900)-150;
  if (mouseX - stopX3 > 50)
  {
    if (mouseY <= 456 && mouseY >= 441) {
      otherCar.acceleration = 10*otherCar.speed/ (mouseX - stopX3);
      otherCar.speed = otherCar.speed - otherCar.acceleration;

      myCar.x = int(myCar.x + myCar.speed*myCar.direction);
    }
    else {
      otherCar.acceleration=0.1;
      otherCar.speed = otherCar.speed + otherCar.acceleration;
      otherCar.x = int(otherCar.x + otherCar.speed*otherCar.direction);
    }
  } 





  //Truck brakes 
  int stopX2 = myTruck.x+300;
  if (mouseX - stopX2<200) {
    if (mouseY <=521 && mouseY >= 473) {
      myTruck.acceleration = 10*myTruck.speed/(mouseX-stopX2);

      myTruck.speed = myTruck.speed - myTruck.acceleration;
      myTruck.x = int(myTruck.x + myTruck.speed*myTruck.direction);
    }
    else {
      myTruck.acceleration=0.1;
      myTruck.speed = myTruck.speed + myTruck.acceleration;
      myTruck.x = int(myTruck.x + myTruck.speed*myTruck.direction);
    }
  }  
  //Truck2 brakes   
  int stopX4 = (otherTruck.x+880)-300;
  if (mouseX - stopX4 > 50)
  {
    if (mouseY <= 467 && mouseY >= 426) {
      otherTruck.acceleration =  10*otherTruck.speed/(mouseX-stopX4);
      otherTruck.speed = otherTruck.speed - otherTruck.acceleration;
      otherTruck.x = int(otherTruck.x + otherTruck.speed*otherTruck.direction);
    }
    else {
      otherTruck.acceleration=0.1;
      otherTruck.speed = otherTruck.speed + otherTruck.acceleration;
      otherTruck.x = int(otherTruck.x + otherTruck.speed*otherTruck.direction);
    }
  }
  if (mouseY>406&& mouseY<=446)
    drawPerson(mouseX, mouseY);
  // draw sec. car and move car
  if (otherCar.type == 2 && otherTruck.type == 1) {
    drawCarII(otherCar);
    moveCarII(otherCar);
  }
  else if  (otherCar.type == 1 && otherTruck.type == 2) {
    drawTruck2(otherTruck);
    moveTruck2(otherTruck);
  }
  else if (otherCar.type == 2 && otherTruck.type == 2) {
    drawCarII(otherCar);
    moveCarII(otherCar);
  }
  else if  (otherCar.type == 1 && otherTruck.type == 1) {
    drawTruck2(otherTruck);
    moveTruck2(otherTruck);
  }
  if (mouseY > 446  && mouseY<509)
    drawPerson(mouseX, mouseY);
  // draw car and move car
  if ( myCar.type == 1 && myTruck.type == 2) {
    drawCar(myCar);
    moveCar(myCar);
  }
  else if (myCar.type == 2 && myTruck.type == 1) {
    drawTruck(myTruck);
    moveTruck(myTruck);
  }
  if ( myCar.type == 2 && myTruck.type == 2) {
    drawCar(myCar);
    moveCar(myCar);
  }
  else if (myCar.type == 1 && myTruck.type == 1) {
    drawTruck(myTruck);
    moveTruck(myTruck);
  }
  if (mouseY>=509)
    drawPerson(mouseX, mouseY);


  //draw mouse location
  fill(#000000); //black
  rect(width-60, 10, 55, 30);
  String mouseLocation = "" + mouseX + ", " + mouseY;
  fill(#FFFF00); //yellow
  text(mouseLocation, width-55, 30);
}



// Draw a building with the left side at the given x offset and with a floor width of w and with h floors
void drawBuilding(Building b) {

  // Choose building color
  int r = (int)random(200);
  int g = (int)random(200);
  int bl = (int)random(200);
  fill(b.r, b.g, b.b);

  // Draw the building background
  int bWidth = int((PANEL+GAP)*b.w + GAP);
  int y = int(height -200 - ((PANEL+GAP)*b.h+GAP));
  rect(b.x, y, bWidth, (PANEL+GAP)*b.h+GAP);

  // Draw the building's roof
  fill(b.r+35, b.g+35, b.b+35);
  quad(b.x, y, 
  b.x + bWidth, y, 
  b.x + bWidth + b.w*PANEL/1.5, y - b.w*PANEL/1.5, 
  b.x + b.w*PANEL/1.5, y - b.w*PANEL/1.5); 

  // Draw the building's side
  fill(b.r-35, b.g-35, b.b-35);
  quad(b.x + bWidth, y, 
  b.x + bWidth + b.w*PANEL/1.5, y - b.w*PANEL/1.5, 
  b.x + bWidth + b.w*PANEL/1.5, y - b.w*PANEL/1.5 + (PANEL+GAP)*b.h+GAP, 
  b.x + bWidth, height-200);

  // Draw the front windows
  fill(255);
  for (int i=1; i<b.h; i++) {
    for (int j=0; j<b.w; j++) {
      rect(b.x + GAP + (GAP+PANEL)*j, height -200 - GAP - PANEL - (GAP+PANEL)*i, PANEL, PANEL);
    }
  }

  // Draw the side windows
  fill(255);
  for (int i=1; i<b.h; i++) {
    for (int j=0; j<b.w; j++) {
      quad(b.x + GAP/1.5 + (GAP/2+PANEL/2)*j + bWidth, height-200 - GAP - PANEL - (GAP+PANEL)*i - j*PANEL/1.5, 
      b.x + GAP/1.5 + (GAP/2+PANEL/2)*j + bWidth + PANEL/2, height-200 - GAP - PANEL - (GAP+PANEL)*i - PANEL/2- j*PANEL/1.5, 
      b.x + GAP/1.5 + (GAP/2+PANEL/2)*j + bWidth + PANEL/2, height -200- GAP - PANEL - (GAP+PANEL)*i + PANEL/2- j*PANEL/1.5, 
      b.x + GAP/1.5 + (GAP/2+PANEL/2)*j + bWidth, height -200 - GAP - PANEL - (GAP+PANEL)*i + PANEL- j*PANEL/1.5);
    }
  }

  //Draw the doors
  drawDoors ((b.x + ((PANEL+GAP)*b.w + GAP)/2));
}

// Draw the dual doors with bottom centered at x.  Draw two door handles as well
void drawDoors(float x) {
  stroke(0);
  rect(x - PANEL, height -200- PANEL - GAP, PANEL, PANEL+GAP);
  rect(x, height -200- PANEL - GAP, PANEL, PANEL+GAP);

  line(x-3, height-13-200, x-3, height-10-200);
  line(x+3, height-13-200, x+3, height-10-200);
}
// Draw a person at the given location
void drawPerson(int x, int y) {
  stroke(0);
  // Draw shirt/pants 
  fill(#FF0320);
  rect(x-5, y-27, 10, 15); 

  // Draw legs and arms and head
  fill(#8E5B0E);
  rect(x-5, y-12, 3, 12);
  rect(x+2, y-12, 3, 12);
  rect(x-8, y-25, 3, 10); 
  rect(x+5, y-25, 3, 10); 
  ellipse(x, y-32, 8, 10);
}
//Draw car 
void drawCar(Car aCar) {
  stroke(0);
  fill (aCar.color1);
  rect(aCar.x, aCar.y-30, 100, 20);
  quad(aCar.x+20, aCar.y-30, aCar.x+30, aCar.y-45, aCar.x+55, aCar.y-45, aCar.x+70, aCar.y-30);
  fill(0, 0, 0); //black
  ellipse(aCar.x+20, aCar.y-10, 20, 20);
  ellipse(aCar.x+75, aCar.y-10, 20, 20);
  fill(255, 255, 255); // white
  ellipse(aCar.x+20, aCar.y-10, 10, 10);
  ellipse(aCar.x+75, aCar.y-10, 10, 10);
}
//Draw other car on other side
void drawCarII(Car aCar) {
  stroke(0);
  fill (aCar.color1);
  rect(aCar.x+925, aCar.y-70, 100, 20);
  quad(aCar.x+960, aCar.y-70, aCar.x+980, aCar.y-85, aCar.x+1000, aCar.y-85, aCar.x+1010, aCar.y-70);
  fill(0, 0, 0); //black
  ellipse(aCar.x+945, aCar.y-50, 20, 20);//wwheels
  ellipse(aCar.x+1010, aCar.y-50, 20, 20);//wheels
  fill(255, 255, 255); // white
  ellipse(aCar.x+945, aCar.y-50, 10, 10);
  ellipse(aCar.x+1010, aCar.y-50, 10, 10);
}



void drawTruck(Car aTruck) {

  // truck
  //draw truck back
  stroke(0);
  fill(aTruck.color2);
  rect(aTruck.x, aTruck.y+140, 165, 55); 

  //draw truck front
  fill(aTruck.color3);
  noStroke();
  rect(aTruck.x+170, aTruck.y+140, 40, 50);
  rect(aTruck.x+120, aTruck.y+185, 130, 10);
  rect(aTruck.x+210, aTruck.y+155, 40, 33);
  triangle(aTruck.x+180, aTruck.y+165, aTruck.x+210, aTruck.y+140, aTruck.x+230, aTruck.y+155);

  // Draw the wheels
  fill(0, 0, 0); // black
  ellipse(aTruck.x+10, aTruck.y+195, 20, 20);
  ellipse(aTruck.x+30, aTruck.y+195, 20, 20);
  fill(255, 255, 255); // white
  ellipse(aTruck.x+10, aTruck.y+195, 10, 10);
  ellipse(aTruck.x+30, aTruck.y+195, 10, 10);
  fill(0, 0, 0); // black
  ellipse(aTruck.x+140, aTruck.y+195, 20, 20);
  ellipse(aTruck.x+160, aTruck.y+195, 20, 20);
  fill(255, 255, 255); // white
  ellipse(aTruck.x+140, aTruck.y+195, 10, 10);
  ellipse(aTruck.x+160, aTruck.y+195, 10, 10);
  fill(0, 0, 0); // black
  ellipse(aTruck.x+230, aTruck.y+195, 20, 20);
  fill(255, 255, 255); // white
  ellipse(aTruck.x+230, aTruck.y+195, 10, 10);
}

void drawTruck2( Car myTruck) {
  // Draw trailor
  stroke(0);
  fill(myTruck.color2);
  rect(myTruck.x+880, myTruck.y+95, 145, 45); 


  // Draw tractor part
  noStroke();
  fill(myTruck.color3);
  quad(myTruck.x+875, myTruck.y+95, myTruck.x+840, myTruck.y+95, myTruck.x+830, myTruck.y+115, myTruck.x+875, myTruck.y+115); 
  rect(myTruck.x+820, myTruck.y+115, 55, 23); 
  rect(myTruck.x+820, myTruck.y+132, 102, 8); 



  // Draw the wheels
  fill(0);
  ellipse(myTruck.x+840, myTruck.y+140, 20, 20);
  ellipse(myTruck.x+910, myTruck.y+140, 20, 20);
  ellipse(myTruck.x+890, myTruck.y+140, 20, 20);
  ellipse(myTruck.x+989, myTruck.y+140, 20, 20);
  ellipse(myTruck.x+1010, myTruck.y+140, 20, 20);
  fill(255);
  ellipse(myTruck.x+840, myTruck.y+140, 10, 10);
  ellipse(myTruck.x+910, myTruck.y+140, 10, 10);
  ellipse(myTruck.x+890, myTruck.y+140, 10, 10);
  ellipse(myTruck.x+989, myTruck.y+140, 10, 10);
  ellipse(myTruck.x+1010, myTruck.y+140, 10, 10);
}  

// to move car / truck
void moveCar(Car myCar) {
  stroke(0);
  myCar.x =  int(myCar.x + myCar.speed*myCar.direction);
  if (myCar.x+20 > width) {

    myCar.x=-4;
    myCar.type= int(random(2))+1;
    myCar.speed=random(3, 6);
    myCar.color1=color(((random(255))+1), ((random(255))+ 1), ((random(255))+1));
  }
  else
    myCar.x = int((myCar.x + myCar.speed*myCar.direction));
}
void moveCarII(Car aCar) {
  stroke(0);
  aCar.x =  int(aCar.x + aCar.speed*aCar.direction);
  aCar.direction = -1;
  if (aCar.x+20 < -width) {

    aCar.x=700;
    aCar.type= int(random(2))+1;
    aCar.speed=random(3, 6);
    aCar.color1=color(((random(255))+1), ((random(255))+ 1), ((random(255))+1));
  }
  else
    aCar.x = int((aCar.x + aCar.speed*aCar.direction));
}


void moveTruck(Car myTruck) {



  if (myTruck.x+20 > width) {

    myTruck.x=-50;
    myTruck.type=int(random(2))+1;
    myTruck.speed=random(3, 6);
    myTruck.color2=color(((random(255))+1), ((random(255))+ 1), ((random(255))+1));
    myTruck.color3=color(((random(255))+1), ((random(255))+ 1), ((random(255))+1));
    myTruck.x = int(myTruck.x + myTruck.speed*myTruck.direction);
  }
  else
    myTruck.x = int(myTruck.x + myTruck.speed*myTruck.direction);
}


void moveTruck2(Car myTruck) {


  myTruck.x = int(myTruck.x + myTruck.speed*myTruck.direction);
  myTruck.direction = -1;

  if (myTruck.x+20 < -width) {

    myTruck.x=1000;
    myTruck.type= int(random(2))+1;
    myTruck.speed=random(3, 6);
    myTruck.color2=color(((random(255))+1), ((random(255))+ 1), ((random(255))+1));
    myTruck.color3=color(((random(255))+1), ((random(255))+ 1), ((random(255))+1));
    myTruck.x = int(myTruck.x + myTruck.speed*myTruck.direction);
  }
  else
    myTruck.x = int(myTruck.x + myTruck.speed*myTruck.direction);
}
