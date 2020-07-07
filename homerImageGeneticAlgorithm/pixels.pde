
class pixel{
  float rFit, gFit, bFit, totalFitness, prob;
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
  
  float calcFitness(){
    for(int i=0; i<2050; i++){
      rFit= map(sqrt(sq(red(homerColor[i])-red[i])), 255, 0, 0, 255);
    }
    for(int i=0; i<2050; i++){
      gFit= map(sqrt(sq(green(homerColor[i])-green[i])), 255, 0, 0, 255);
    }
    for(int i=0; i<2050; i++){
      bFit= map(sqrt(sq(blue(homerColor[i])-blue[i])), 255, 0, 0, 255);
    }
    rFit=(rFit/2050)*10;
    gFit=(gFit/2050)*10;
    bFit=(bFit/2050)*10;
    totalFitness= rFit+gFit+bFit;
    //print(totalFitness,"\n");
    return totalFitness;
  }
  
  void calcProbability(float x){
    prob = totalFitness/x;
  }
}
