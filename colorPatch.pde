void colorPatch()
{

  
//  Serial.println("state: ");
//  Serial.println(state);
  
  if( redCounter > blueCounter){
    patchState = RED;
  }
  else if (redCounter < blueCounter){
    patchState = BLUE;
  }
  else{
    stopServos();
  }
  
  Serial.println("patchState: ");
  Serial.println(patchState);
  
  start_time = millis();
        while(millis()<start_time+3000){}
  
  
  found = false;
  
  Serial.println("found: ");
  Serial.println(found);
  
  while(!found)
  {
    detectColor();
    if (state == patchState)
    {
      stopServos();
      //found = true;
       start_time = millis();
       while(millis()<start_time+20000){
      }//wait
    }
    else
    {
      Serial.println("NOT FOUND");
      fwd();
      
      start_time = millis();
      while(millis()<start_time+10){
      }//wait
      
      
      if(state == BLUE)
      {
        Serial.println("LEFT");
        left();
        start_time = millis();
        while(millis()<start_time+60){}
        fwd();
        start_time = millis();
        while(millis()<start_time+400){}
      }
      if(state == RED)
      {
        Serial.println("RIGHT");
        right();
        start_time = millis();
        while(millis()<start_time+60){}
        fwd();
        start_time = millis();
        while(millis()<start_time+400){}
      }
       if(state == WHITE)
      {
        Serial.println("WHITE");
        fwd();
        start_time = millis();
        while(millis()<start_time+400){}
      }


      //insert code here that lands on the right color. 
      //once it lands on the right color, the if statement above will stop the servos, hence completing the course.
      
    }
  }

}

