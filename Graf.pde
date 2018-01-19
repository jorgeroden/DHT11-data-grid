// Graf.pde
// Representa puntos con los valores de Temperatura y Humedad
// recogidos de Arduino con DHT11.
// Jorge Muñoz, Manuel Hidalgo, Pablo Garcia, Jorge L. Loza
// Licencia: GPL v3
// Este es un programa ad-hoc para demostración.
// Clase incorporada a visual_dot.pde
// Modificalo a tu gusto.
// Tildes omitidas.
class Graf {

  int nX, nY, colF;
  int anteriorXT , anteriorXH;
  float anteriorYT, anteriorYH;
  //boolean primeroT, primeroH;
  Graf (int x, int y, int cF){
    nX = x;
    nY = y; 
    colF  = cF;
  }
  void cuadricula1(){// Temperatura
    fill(0, 0, 0);
    text("TEMPERATURA", (nX / 2) - 50, 70);
    stroke(150);   
    for (int  j = 60 ; j <= nX - 60; j = j + 20){
      line (j, 80, j, (nY / 2) - 20);      } // Vert
    for (int  j = 80 ; j <= (nY / 2) - 20; j = j + 20){
      line (60, j, nX - 60, j);} // Horiz
    int i = 0;
    for (int n = (nY / 2) - 20; n >= (nY / 2) - 220; n = n - 20){
      fill(0, 0, 0);
      text(i, 35, n + 5);
      i = i + 5;
      
    }
  }
  
  void cuadricula2(){// Humedad
    fill(0, 0, 0);
    text("HUMEDAD RELATIVA", (nX / 2) - 60, (nY / 2) + 10);
    stroke(150);   
    for (int  j = 60 ; j <= nX - 60; j = j + 20){
      line (j, (nY / 2) + 20 , j, nY - 80);} // Vert
    for (int  j = (nY / 2) + 20 ; j <= nY - 80; j = j + 20){
      line (60, j, nX - 60, j);} // Horiz
    int i = 0;  
    for (int n = nY - 80; n >= nY - 280; n = n - 20){
      fill(0, 0, 0);
      text(i, 35, n + 5);
      i = i + 10;
    }
 
  }
  
  void borra(){
    fill(colF); // Color del fondo
    noStroke();
    rectMode(CORNERS);
    rect(50 , 50, nX , nY - 30 ); 
  }
  
  void puntosT(int x, float tem, boolean primeroT){
      
      float vT = map(tem, 0, 50, (nY / 2) - 20 , 80);
      ellipse(x, vT, 5, 5);
      if (primeroT == false){
        stroke(50);
        line(anteriorXT, anteriorYT, x, vT);
        
      
      }
      anteriorXT = x;
      anteriorYT = vT;
        
  }
void puntosH(int x, float hum, boolean primeroH){
            
      float vH = map(hum, 0, 100, nY - 80, (nY / 2) + 20); 
      ellipse(x, vH, 5, 5);
      if (primeroH == false){
        stroke(50);
        line(anteriorXH, anteriorYH, x, vH);
        
      
      }
        anteriorXH = x;
        anteriorYH = vH;   
  }

}