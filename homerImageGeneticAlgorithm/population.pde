class population{
  int totalp=0;
  pixel[] pic;
  
  population(int x){
    totalp=x;
    pic= new pixel[totalp];
    for(int i=0; i<totalp; i++){
      pic[i]= new pixel();
    }
  }
  
  void evalFitness(){
     for(int i=0; i<totalp; i++){
       pic[i].calcFitness();
     }
  }
  
  float getMaxFitness(){
    float f=pic[0].totalFitness;
    for(int i=1; i<totalPopulation; i++){
      if(pic[i].totalFitness>f){
        f= pic[i].totalFitness;
      }
    }
    return f;
  }
}
