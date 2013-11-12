int cols, rows, count;
Head[] heads;

void setup() {
  size(displayWidth,displayHeight,P3D);
  cols = 10;
  rows = 10;
  count = 0;
  heads = new Head[cols*rows];
  for(int x=0; x<cols; x++){
    for(int y=0; y<rows; y++){
      int loc = x+y*cols;
      heads[loc] = new Head();
    }
  }
}

void draw() {
  background(255);
  for(int x=0; x<cols; x++){
    for(int y=0; y<rows; y++){
      int loc = x+y*cols;
      pushMatrix();
      translate(x*(width/cols),y*(height/rows),0);
      heads[loc].display();
      popMatrix();
    }
  }
  
  if(count == 16){
    count = 0;
    //makeNew();
  }
  count++;
}
