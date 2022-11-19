import javax.swing.*;

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
boolean bandera = true;
boolean ban;
boolean arriba;
boolean abajo;
boolean derecha;
boolean avanzar;
boolean lim = true;
int v[];
int c[];
int Nuevo;
int espacio;
int cont = 0;
int i = 0;
int y = 330;
int a = 300;
int x = 0;
int puntos = 0;
int ancho = 0;
int e = 0;
float z = 0;
float k = PI;
int q = 0;
int monedas = 0;
int ristos= 0;
int horas;
int minutos;
int segundos;
int ml = 0;
int s = 0;
int m = 0;
int h = 0;
void setup(){
  size(800,500);
  img1 = loadImage("Fondo.jpg");
  img2 = loadImage("Plataforma.png");
  img3 = loadImage("Personaje.png");
  img4 = loadImage("monstruo.png");
  img5 = loadImage("moneda.png");
  background(img1);
  resetear();
}
void draw(){
  horas = hour();
  minutos = minute();
  segundos = second();
  background(img1);
  textSize(14);
  fill(#FFFFFF);
  text(puntos,140,47);
  textSize(14);
  fill(#FFFFFF);
  text(monedas,120,77);
  textSize(14);
  fill(#FFFFFF);
  text(ristos,100,107);
  textSize(10);
  fill(#FFFFFF);
  text("Hora: "+horas+":"+minutos+":"+segundos,10,10);
  Tiempo();
  Nuevo = 0; //Primer Espacio entre Plataformas
  ancho = generarAncho(); //Ancho de la primera plataforma
  randomSeed(0);
  image(img3,e,a, 100,100); //Creacion del personaje
  
  if(arriba && a > 0 && y == 330 && lim){ 
    a = a - 5;
  }else{
    if(abajo && a < 235 && y == 330 && lim){
        a = a + 5;
    }else{
      if(a == 0){
        Reintentar();
      }
    }
  }
      println("a= ",a);
  if(ban && a >= 235 && bandera){
    CrearPuente();
  }else{
    if(bandera == false){
       RotarPuente();
    }
  }
  //Creación de las plataformas
  for (int i=1; i< 5 ; i++){
        if(i>=2){
        image(img5,Nuevo+20,ancho/2, 50,50);
        v[i]=Nuevo+20;
        c[i]=ancho/2;
        }
        image(img2,Nuevo,330,ancho,200);
        ancho = generarAncho();
        randomSeed(i);
        espacio = generarEspacios();
        Nuevo = Nuevo + ancho + espacio;              
  }
  
}

int generarAncho(){
  int x = int(random(40,150));
  return x;
}

int generarEspacios(){
  int espacio = int(random(60,200));
  return espacio;
}

int generarAltura(){
  int altura = int(random(200,100));
  return altura;
}
void keyPressed(){
    if(key == ' '){
      ban = true;
    }
    if(keyCode == 38){
      arriba = true;
    }
     if(keyCode == 40){
      abajo = true;
    }
}

void keyReleased(){
    if(key == ' '){
      ban = false;
      bandera = false;
    }
    if(keyCode == 38){
      arriba = false;
    }
    if(keyCode == 40){
      abajo = false;
    }
}

void CrearPuente(){
    y = y - 1;
    noStroke();
    fill(255,0,0);
    image(img2,ancho-5,y, 5,z);
    z = z + 1;
}
void RotarPuente(){
     if(k <= 3*PI/2){
        translate(ancho-5,330);
        rotate(k);
        image(img2,0, 0, 5,z);
        resetMatrix();
        k += (PI/2)/90;
        println("valor de K= ",k);
      }
      if(k == 4.7298336){
         translate(ancho-5,330);
         image(img2,0, 0, z,5);
         resetMatrix();
         y = 330;
         AvanzarAvatar();
      }
}

void AvanzarAvatar(){
  if(z >= espacio && e <= ancho+espacio){
    image(img3,e,a, 100,100);
    e += 1;
    resetMatrix();
    puntos = puntos + 1;
  }
  println("e= ",e+1,"espacio = ",ancho+espacio);
  if(e+1 == ancho+espacio){
    z = 0;
    espacio = 0;
    q = q + 1;
    if(q == 1){
      ristos = ristos + 1;
    }
  }
}

void Tiempo(){
  textSize(12);
  if(ml <= 36){
    fill(#FFFFFF);
    text(h+":"+m+":"+s+":"+ml,690,22);
    if(lim){
         ml = ml + 1;
    }
  }else{
    if(s < 59){
      if(lim){
         s = s + 1;
      }
      ml = 0;
      fill(#FFFFFF);
      text(h+":"+m+":"+s+":"+ml,690,22);
    }else{
      if(m < 59){
       if(lim){
         m = m + 1;
       }
        ml = 0;
        s = 0;
        fill(#FFFFFF);
        text(h+":"+m+":"+s+":"+ml,690,22);
      }else{
        if(lim){
         h = h + 1;
        }
        ml = 0;
        s = 0;
        m = 0;
        fill(#FFFFFF);
        text(h+":"+m+":"+s+":"+ml,690,22);
      }
    }
  }
}
void Reintentar(){
  textSize(35);
  fill(#196F3D);
  text("GAME OVER",300,230);
  textSize(20);
  stroke(300,102,0);
  fill(#FFFFFF);
  text("Tiempo: "+ h+":"+m+":"+s+":"+ml,50,280);
  textSize(20);
  fill(#FFFFFF);
  text("Monedas: "+monedas,350,280);
  textSize(20);
  fill(#FFFFFF);
  text("Ristos: "+ristos,650,280);
  textSize(13);
  fill(#FFFFFF);
  text("Presione click para reintentar....",303,320);
  lim = false;
  if(mousePressed){
    resetear();
  }
}
void resetear(){
  background(img1);
  Nuevo = 0; //Primer Espacio entre Plataformas
  ancho = generarAncho(); //Ancho de la primera plataforma
  randomSeed(0);
  image(img3,e,a, 100,100); //Creacion del personaje
  bandera = true;
  i = 0;
  y = 330;
  a = 235;
  x = 0;
  puntos = 0;
  ancho = 0;
  e = 0;
  monedas = 0;
  ristos = 0;
  z = 0;
  q = 0;
  k = PI;
  lim = true;
  ml = 0;
  s = 0;
  m = 0;
  h = 0;
}
