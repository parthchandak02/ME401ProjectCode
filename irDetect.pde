void irDetect(){
//  Serial.println("\n\ntargetAngle:");
 // Serial.println("\n\nChecking Distance\n\n");
 
 
  newPosition = position;
  
  Kp = 17;
  Kd = 3.0;
  Ki = 0.5;

    //TAKING THE AVERAGE DISTANCE READING AT A POSITION
  p = -200;
  
    while( irState != DETECT ){ //takes multiple readings at each position
    
    
      if(p<=220 && flag == false){
        p+=5;
        
        if(p == 200){
          flag = true;
        }
      }
  
      if(p>=-200 && flag == true){
        p-=5;
        
        if(p <= -200){
          flag = false;
          }
        }
     
        targetAngle = p;
        Serial.println(targetAngle);
        
        start_time = millis();
        while (millis() < start_time + 50) {
        }//wait 0.01 seconds
        
        irToColor = analogRead(sensorPinIrToColor);
        
        if (irToColor < 50){
        irState = DETECT;
        digitalWrite(irDetectLEDPin,HIGH);
        }
        else{
        irState = NOSIGNAL;
        digitalWrite(irDetectLEDPin,LOW);        
        }
        
    }

  //determines which way to turn based on the angle at which the greatest value was found
  
  if(p<0){ // turn left
     right();
     start_time = millis();
     while(millis()<start_time+int(abs(p)*encoderToDeg*degToMs)){
    }
  }
  else if(p>0){// turn right
     left();    
     start_time = millis();
     while(millis()<start_time+int(abs(p)*encoderToDeg*degToMs)){
    }
  } 
}

