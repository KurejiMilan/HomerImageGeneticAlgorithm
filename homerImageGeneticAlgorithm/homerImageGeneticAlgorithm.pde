//developed by Milan Rai
//git:https://github.com/KurejiMilan

//this sketch uses the genetic algorithm to 
//draw characters from the simpsons
//correct traits are passed from generation to generation
//untill the population could draw the characters with high accuracy
//2460000 is the max fitness one can reach
PImage homer; 
color[] homerColor= new color[2050];
int totalPopulation=5000;
int generation = 1, index=0, mFitScored;
boolean mutationComplete = false;

population homerGen= new population(totalPopulation);

void setup(){
  size(1200, 650);
  homer = loadImage("homer.png");
  frameRate(20);
  colorMode(RGB);
  int c=0;
  homer.loadPixels();
  for(int i=0; i<41; i++){
    for(int j=0; j<50;j++){
      homerColor[c]=homer.get(1+21*i, 1+21*j);
      c++;
    }  
  }
}

void draw(){
  if(!mutationComplete){
    homerGen.evalFitness();
    mFitScored=homerGen.getMaxFitness();
  }
  if(mFitScored==2460000)mutationComplete=true;
  display();
  if(!mutationComplete){
    homerGen.newGeneration();
    homerGen.mutate();
  }
  if(!mutationComplete)generation++;
}

void display(){
  background(0);
  int c=0;
  for(int i=0; i<41; i++){
    for(int j=0; j<50;j++){
      stroke(homerGen.pic[index].red[c], homerGen.pic[index].green[c], homerGen.pic[index].blue[c]);
      fill(homerGen.pic[index].red[c], homerGen.pic[index].green[c], homerGen.pic[index].blue[c]);
      rect(i+(11*i), j+(11*j), 11, 11);
      c++;
    }  
  }
  image(homer,600, 0, 492, 600);
  textSize(20);
  fill(255);
  text("generation=",2, 630);
  text(generation,textWidth("generation="), 630);
  text("max fitness=", 200, 630);
  text(mFitScored, 200+textWidth("max fitness="), 630);
  if(mutationComplete){
    text("completed", 500, 630);
  }
}
