/*
Interactive rat maze where you get 
to move rat one square at a time following the path
It is a mouse pressed interraction base
*/  

int[][]      maze = {{1,1,1,1,1,1,1,1,1,1},
                       {1,0,0,1,0,0,0,0,0,1},
                       {1,0,1,1,1,0,1,1,0,1},
                       {1,0,1,0,0,0,1,0,0,1},
                       {1,0,1,0,1,1,1,0,1,1},
                       {1,0,0,0,1,0,1,1,1,1},
                       {1,0,1,0,0,0,0,0,0,1},
                       {1,1,1,1,1,1,1,1,1,1}};
  int  GRID_SIZE = 75;
  int  ratRow, ratCol;
  int  direction;      // 0 = right, 90 = up, 180 = left, 270 = down
  
  void setup() {
    size(GRID_SIZE*maze[0].length,GRID_SIZE*maze.length);
    stroke(0);           // use a black border
    ratRow = 1; ratCol = 1; direction = 0;
    frameRate(3);
  }
  
  void draw() {
    drawMaze();
    drawRat();
    println ("("+ratRow+","+ratCol+") " + direction);
    //travel();
  }
  
  void mousePressed() {
    int newRow = mouseY/GRID_SIZE;
    int newCol = mouseX/GRID_SIZE;
    if (maze[newRow][newCol] == 0) {
       if (abs(newRow-ratRow) + abs(newCol-ratCol) == 1) {  
          if (newRow > ratRow) direction = 3;
          else if (newRow < ratRow) direction = 1;
          else if (newCol > ratCol) direction = 0;
          else if (newCol < ratCol) direction = 2;
          ratRow = newRow;
    	  ratCol = newCol; 
       }
    }
  }
  
  
  void drawMaze() {
    for (int row=0; row<8; row++) {
      for (int col=0; col<10; col++) {
          if (maze[row][col] == 1)                 
             fill(150,200,255);     // light blue
          else
             fill(255, 255, 255);   // white
          rect(col*GRID_SIZE, row*GRID_SIZE, GRID_SIZE, GRID_SIZE);
      }
    }
  }
  
  
  void drawRat() {
    int[][] xOff = {{20, 0, 0, -10, -20, 17, 17, 17, 20, 17, 17, 17, 20, 14, 14},
                    {0, 10, -10, 0, 0, 0, -10, 0, -10, 0, 10, 0, 10, -3, 3},
                    {-20, 0, 0, 10, 20, -17, -17, -17, -20, -17, -17, -17, -20, -14, -14},
                    {0, -10, 10, 0, 0, 0, 10, 0, 10, 0, -10, 0, -10, 3, -3}};
                      
    int[][] yOff = {{0, 10, -10, 0, 0, 0, -10, 0, -10, 0, 10, 0, 10, -3, 3},
                    {-20, 0, 0, 10, 20, -17, -17, -17, -20, -17, -17, -17, -20, -14, -14},
                    {0, -10, 10, 0, 0, 0, 10, 0, 10, 0, -10, 0, -10, 3, -3},
                    {20, 0, 0, -10, -20, 17, 17, 17, 20, 17, 17, 17, 20, 14, 14}};
    int[]  xs = xOff[direction];
    int[]  ys = yOff[direction];
   
    int   x = ratCol*GRID_SIZE + (GRID_SIZE /2);
    int   y = ratRow*GRID_SIZE + (GRID_SIZE /2);
    fill(150, 150, 150);   // gray
    triangle(x+xs[0], y+ys[0], x+xs[1], y+ys[1], x+xs[2], y+ys[2]);
    line(x+xs[3], y+ys[3], x+xs[4], y+ys[4]);  // tail
    line(x+xs[5], y+ys[5], x+xs[6], y+ys[6]);  // whisker1
    line(x+xs[7], y+ys[7], x+xs[8], y+ys[8]);  // whisker2
    line(x+xs[9], y+ys[9], x+xs[10], y+ys[10]);  // whisker3
    line(x+xs[11], y+ys[11], x+xs[12], y+ys[12]);  // whisker4
    ellipse(x, y, 20, 20);
    fill(255, 0, 0);   // red
    ellipse(x+xs[13], y+ys[13], 3, 3);
    ellipse(x+xs[14], y+ys[14], 3, 3);
  }
  

  void travel() {
    if (((direction == 1)&&(maze[ratRow][ratCol+1] == 1)) ||
        ((direction == 2)&&(maze[ratRow-1][ratCol] == 1)) ||
        ((direction == 3)&&(maze[ratRow][ratCol-1] == 1)) ||
        ((direction == 0)&&(maze[ratRow+1][ratCol] == 1))){
      println("wall on right");
      if (((direction == 0)&&(maze[ratRow][ratCol+1] == 0)) ||
          ((direction == 1)&&(maze[ratRow-1][ratCol] == 0)) ||
          ((direction == 2)&&(maze[ratRow][ratCol-1] == 0)) ||
          ((direction == 3)&&(maze[ratRow+1][ratCol] == 0))){
        println("moving forward");
        if (direction == 0) ratCol++;
        else if (direction == 1) ratRow--;
        else if (direction == 2) ratCol--;
        else if (direction == 3) ratRow++;
      }
      else {
        println("turning left");
        direction = (direction + 1)%4;
      }
    }
    else {
      println("turning right, moving forward");
      direction = (direction + 3)%4;
      if (direction == 0) ratCol++;
      else if (direction == 1) ratRow--;
      else if (direction == 2) ratCol--;
      else if (direction == 3) ratRow++;    
    }
  }
  
  
  
  
  
