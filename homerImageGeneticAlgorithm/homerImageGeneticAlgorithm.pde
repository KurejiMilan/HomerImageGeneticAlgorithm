//developed by Milan Rai
//git:https://github.com/KurejiMilan

//this sketch uses the genetic algorithm to 
//draw characters from the simpsons
//correct traits are passed from generation to generation
//untill the population could draw the characters with high accuracy

PImage homer; 
color[] homerColor= new color[2050];
void setup(){
  size(1200, 800);
  homer = loadImage("homer.png");
  colorMode(RGB);
  int c=0;
  homer.loadPixels();
  //for(int i=0; i<2050; i++){
  //  homerColor[i]=homer.pixels[11+i*21];
  //}
  for(int i=0; i<41; i++){
    for(int j=0; j<50;j++){
      homerColor[c]=homer.get(1+21*i, 1+21*j);
      c++;
    }  
  }
  for(int i=0; i<2050; i++){
    print("(",red(homerColor[i]),",", green(homerColor[i]),",", blue(homerColor[i]),")....\n");
  }
}

void draw(){
  background(0);
  int c=0;
  for(int i=0; i<41; i++){
    for(int j=0; j<50;j++){
      noStroke();
      fill(homerColor[c]);
      rect(i+(11*i), j+(11*j), 11, 11);
      c++;
    }  
  }
  image(homer,600, 0, 492, 600);
}
