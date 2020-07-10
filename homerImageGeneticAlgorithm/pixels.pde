//pixel class holds the dna/genes in this case the rgb values
//it also holds its fitness levels and probability of being selected
//in random pool selection

class pixel{
  int rFit, gFit, bFit, totalFitness; 
  float prob;
  int[] red= new int[2050];
  int[] green= new int[2050];
  int[] blue= new int[2050];
  
  pixel(){
    rFit=0;
    gFit=0;
    bFit=0;
    prob=0;
    totalFitness=0;
    if(generation == 1){
      for(int i=0; i< 2050; i++){
        red[i] = int(random(255.8));
      }
      for(int i=0; i< 2050; i++){
        green[i] = int(random(255.8));
      }
      for(int i=0; i< 2050; i++){
        blue[i] = int(random(255.8));
      }
    }
  }
  
  
  //calculates the fitness based on the rgb values
  int calcFitness(){
    rFit=0;
    gFit=0;
    bFit=0;
    prob=0;
    for(int i=0; i<2050; i++){
      rFit+= map(sqrt(sq(red(homerColor[i])-red[i])), 255, 0, 0, 10000)/2050;
    }
    for(int i=0; i<2050; i++){
      gFit+= map(sqrt(sq(green(homerColor[i])-green[i])), 255, 0, 0, 10000)/2050;
    }
    for(int i=0; i<2050; i++){
      bFit+= map(sqrt(sq(blue(homerColor[i])-blue[i])), 255, 0, 0, 10000)/2050;
    }
    rFit=(rFit)*100;
    gFit=(gFit)*100;
    bFit=(bFit)*100;
    totalFitness= rFit+gFit+bFit;
    //print(totalFitness,"\n");
    return totalFitness;
  }
 
  //calculates the probability
  void calcProbability(float x){
    prob = (totalFitness/x)*100;
  }
}
