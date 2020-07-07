class population{
  int totalp=0;
  pixel[] pic;
  float normalizer=0;
  
  population(int x){
    totalp=x;
    pic= new pixel[totalp];
    for(int i=0; i<totalp; i++){
      pic[i]= new pixel();
    }
  }
  
  void evalFitness(){
    normalizer =0; 
    for(int i=0; i<totalp; i++){
       normalizer+= pic[i].calcFitness();
    }
    for(int i=0; i<totalp; i++){
       pic[i].calcProbability(normalizer);
    }
  }
  
  float getMaxFitness(){
    float f=pic[0].totalFitness;
    index=0;
    for(int i=1; i<totalPopulation; i++){
      if(pic[i].totalFitness>f){
        f= pic[i].totalFitness;
        index=i;
      }
    }
    return f;
  }
  
  void newGeneration(){
    pixel[] newpic= new pixel[totalp];
    for(int i=0; i<totalp; i++){
      pixel p1= new pixel();
      p1=selection();
      pixel p2= new pixel();
      p2=selection();
      newpic[i]=crossOver(p1, p2);
    }
    for(int j=0; j<totalp; j++){
      pic[j]= newpic[j];
    }
  }
  
  pixel selection(){
    float per = random(1.0001);
    int c=0;
    do{
      per-=pic[c].prob;
      c++;
      if(c>=2000)break;
    }while(!(per<0));
    --c;
    return pic[c];
  }
  
  pixel crossOver(pixel p1, pixel p2){
    //cross over of the red value of pixel
    for(int i=0; i<2050; i++){
      if(p1.red[i]==red(homerColor[i])){
        //do nothing
      }else if(p2.red[i]==red(homerColor[i])){
        p1.red[i]=p2.red[i];
      }else if(p1.rFit<p2.rFit){
         //do nothing
      }else{
        p1.red[i]=p2.red[i];
      }
    }
    //cross over of the green value of pixel
    for(int i=0; i<2050; i++){
      if(p1.green[i]==green(homerColor[i])){
        //do nothing
      }else if(p2.green[i]==green(homerColor[i])){
        p1.green[i]=p2.green[i];
      }else if(p1.gFit<p2.gFit){
         //do nothing
      }else{
        p1.green[i]=p2.green[i];
      }
    }
    //cross over of the blue value of pixel
    for(int i=0; i<2050; i++){
      if(p1.blue[i]==blue(homerColor[i])){
        //do nothing
      }else if(p2.blue[i]==blue(homerColor[i])){
        p1.blue[i]=p2.blue[i];
      }else if(p1.bFit<p2.bFit){
         //do nothing
      }else{
        p1.blue[i]=p2.blue[i];
      }
    }
    return p1;
  }
  
  //this function is used to mutate the genes i.e. the rgb values
  void mutate(){
     for(int i=0; i<totalp; i++){
       //mutate red value
       for(int j=0; j<2050; j++){
         if(random(1)<.01){
           pic[i].red[j]= int(random(255.8));
         }
       }
       //mutate green value
       for(int j=0; j<2050; j++){
         if(random(1)<.01){
           pic[i].green[j]= int(random(255.8));
         }
       }
       //mutate blue value
       for(int j=0; j<2050; j++){
         if(random(1)<.01){
           pic[i].blue[j]= int(random(255.8));
         }
       }
     }
  }
  
}
