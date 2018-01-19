// visual_dot.pde
// Representa puntos con los valores de Temperatura y Humedad
// recogidos de Arduino con DHT11.
// Jorge Muñoz, Manuel Hidalgo, Pablo Garcia, Jorge L. Loza
// Licencia: GPL v3
// Este es un programa ad-hoc para demostración.
// Necesita Graf.pde
// Modificalo a tu gusto.
// Tildes omitidas.

import processing.serial.*;

int x = 65, ancho = 700, alto = 600;
int cFondo = 255; //Color fondo
boolean flagTemp = false; 
boolean pH = true;
boolean pT = true;
float t = 100, h = 0 ;
PrintWriter datos;
Serial puertoArduino;
Graf g = new Graf(ancho, alto, cFondo);


void setup (){
 
  size(700, 600);
  background(255);
  print(Serial.list());//Cambia el indice [1] por el que indique la consola
  puertoArduino = new Serial(this, Serial.list()[1], 9600);
  datos = createWriter("medidasT_HR.txt");
  fill(255, 0, 0);
  text("TEMPERATURA (ºC) : ", 20, 20);
  fill(0, 0, 255);
  text("HR (%) : ", 20, 40);
  text("DHT11 - Rango de temperaturas (0ºC < T < 50ºC)", (ancho / 2) - 100, 20);
  text("DHT11 - Rango de humedad relativa (20 % < H < 90 %)", (ancho / 2) - 100, 40);
  pT = true;
  pH = true;
  g.cuadricula1();
  g.cuadricula2();
}

void draw(){

  String inString = puertoArduino.readStringUntil('\n'); 
  
  
  if (inString != null){
      
     inString = trim(inString);
     if (flagTemp == false){
      fill(255,255,255);
      noStroke();
      rectMode(CORNERS); 
      rect(140,20,200,45);//Borra lectura anterior 
      h = float(inString);
      datos.print(h +" "+ TAB); 
      flagTemp = true;
      fill (0,0,255);
      text(h, 140, 40);
      println("Humedad Relativa (%) :", h);
      if (h >= 20.0 && h <= 90.0){
        
        g.puntosH(x, h, pH);
        
        
       }
       pH = false;
     }
     else{
       fill(255,255,255);
       noStroke();
       rectMode(CORNERS);
       rect(140,5,200,25); //borra lectura anterior 
       t = float(inString);
       
       datos.println(t);
       flagTemp = false;
       fill (255,0,0);
       text(t, 140, 20);
       println("Temperatura (ºC) : ", t);
      
       if (t >= 0.0 && t <= 50.0){
          
         g.puntosT(x, t, pT);
          
        }
         pT = false;  
     }
     
     x = x + 5;
     
     }
                
     if (x > ancho - 60) {
        x = 60;
        pT = true;
        pH = true;
        g.borra();
        g.cuadricula1();
        g.cuadricula2();
              
     }
         
    }
     
void keyPressed() {//Presionar 'ESC' para salir
    datos.flush();  
    datos.close();  
    exit();  
}