
class Head {
  float x, y, z;
  float eyedist, eyeheight, eyeSizeX, eyeSizeY, eyePotrude, pupilX, pupilY, pupilZ;
  float mouthHeight, mouthX, mouthY, mouthZ;
  float hairHeight, hairSizeX, hairSizeY, hairSizeZ, hcSelector, hcbw;
  float noseHeight, noseDist, noseX, noseY, noseZ;
  color hairColor, faceColor, mouthColor, noseColor;
  float earHeight, earBackness, earSizeX, earSizeY, earSizeZ;
  float n;
  float r1, r2;
  float r = random(1);

  
  Head() {
    //HEAD
    x = random(20,50);
    y = random(20,50);
    z = random(20,30);
    faceColor = color(255,random(200,255),random(200,255));
    
    //EYE
    eyedist = random(x/10,x)/2;
    eyeheight = random(-y/4,y/4);
    eyeSizeX = random(eyedist/2, eyedist/1.5);
    eyeSizeY = random(y/8, y/3);
    eyePotrude = random(5,10);
    pupilX = random(eyeSizeX/3,eyeSizeX);
    pupilY = random(eyeSizeY/3,eyeSizeY);
    pupilZ = random(eyePotrude, eyePotrude*1.2);
    
    //MOUTH
    mouthHeight = random(eyeheight,y/2);
    mouthX = random(1,x/2);
    mouthY = random(1,y/5);
    mouthZ = random(10);
    if(mouthHeight < eyeheight*1.05) constrain(mouthX,1,eyedist);
    mouthColor = color(random(173,255),random(0,87),random(87,173));
    
    //NOSE
    noseHeight = random(eyeheight, mouthHeight-(mouthX*2));
    noseX = random(eyedist/4, eyedist/2);
    noseY = random(y/8,y/3);
    noseZ = random(0,20);
    noseColor = color(255,random(200,255),random(200,255));
    
    //HAIR
    hairSizeX = random(x,x*1.2);
    hairSizeY = random(0, y);
    hairSizeZ = random(z,z*1.2);
    hairHeight = random((-y/2)-(hairSizeY/2),(-y/2)+((hairSizeY/2)-eyedist));
    hcSelector = random(1);
    if(hcSelector<0.5){
      hcbw = random(255);
      hairColor = color(hcbw);
    } else {
      hairColor = color(random(173,255), random(255), 0);
    }
    
    //EARS
    earHeight = random(-y/4,y/4);
    earBackness = random(-z/2,z/2.5);
    earSizeX = random(1,x/3);
    earSizeY = random(1,y);
    earSizeZ = random(1,z/3);
    
    
    n = 0.0; //COUNTER
    
    //ortho(0, width, 0, height); 
  }
  
  void eyes() {
    pushMatrix();
    translate(eyedist,eyeheight,z/2);
    fill(255);
    box(eyeSizeX, eyeSizeY, eyePotrude);
    fill(0);
    box(pupilX, pupilY, pupilZ);
    popMatrix();
    
    pushMatrix();
    translate(-eyedist,eyeheight,z/2);
    fill(255);
    box(eyeSizeX, eyeSizeY, eyePotrude);
    fill(0);
    box(pupilX, pupilY, pupilZ);
    popMatrix();
  }
  
  void mouth() {
    fill(mouthColor);
    pushMatrix();
    translate(0,mouthHeight,z/2);
    box(mouthX,mouthY,mouthZ);
    popMatrix();
  }
  
  void nose(){
    fill(noseColor);
    pushMatrix();
    translate(0,noseHeight,z/2);
    box(noseX,noseY,noseZ);
    popMatrix();
  }
  
  void hair() {
    fill(hairColor);
    pushMatrix();
    translate(0,hairHeight,0);
    box(hairSizeX,hairSizeY,hairSizeZ);
    popMatrix();
  }
  
  void ears(){
    fill(faceColor);
    pushMatrix();
    translate(x/2,earHeight,earBackness);
    box(earSizeX,earSizeY,earSizeZ);
    popMatrix();
    pushMatrix();
    translate(-x/2,earHeight,earBackness);
    box(earSizeX,earSizeY,earSizeZ);
    popMatrix();
  }
  
  void display() {
    noStroke();
    lights();
    pushMatrix();
    translate(x,y,0);
    if(r<0.5) rotateY(sin(n));
    else rotateX(sin(n));
    //rotateY(sin(n));
    fill(faceColor);
    box(x,y,z);
    eyes();
    mouth();
    hair();
    ears();
    nose();
    popMatrix();
    
    n+=PI/32;
  }
}
