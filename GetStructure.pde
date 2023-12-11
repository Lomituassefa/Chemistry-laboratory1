void getStructure(int CarbonNo) {
  textSize(15);

  noStroke();
  stroke(white);
  fill(backGround);
  rect(45, 380, 550, 76, 25, 25, 25, 25);
  fill(white);
  text("STRAIGHT CHAIN DETAILED STRUCTURE", 350, 400);



  int x =90;
  int change = 15;
  int y = 500;
  int z;
  int radius = 15;
  textSize(15);
  fill(255);
  circle(45, 545, 25);
  fill(0);
  text("H", 52, 533);
  for (int a=0; a<CarbonNo; a++) {
    line(x, y+45, x+change, y+45);
    fill(255);
    circle(x-15, y+45, 25);
    fill(0);
    text("C", x-7, y+31);
    z= x+change;


    x= z+30;
  }
  // }
  x=75;
  y=500;
  for (int b = 0; b <CarbonNo; b++) {
    int w =0;
    for (int c = 0; c<2; c++) {
      if (c!=1) {
        strokeWeight(2);
        fill(255);
        circle(x, y, 25);
        fill(0);
        text("H", x+7, y-15);
      } else {
        fill(255);
        circle(x, y+40, 25);
        fill(0);
        text("H", x+7, y+30);
      }
      strokeWeight(4);
      line(x, y+5, x, y+25);
      w = y+ change;
      y +=60;
    }

    x=x+45;
    y =500;
  }
  strokeWeight(2);
  fill(255);
  circle(x, y+45, 25);
  fill(0);
  text("H", x+8, y+33);
}



void SetProperty(String Nomanclature, String ChemicalFormula, int isomern) {
  textSize(20);
  fill(0);
  text(Nomanclature, 1090, 320);
  text(ChemicalFormula, 1115, 400);
  //text(FinalRxn,480, 700);

  text(isomer, 1115, 480);
}
