void firstPageDraw(){
  intro = loadImage( "data/images/splash.png");
  image( intro ,0, 0, width, height);
}

void mainPagedraw(){
  if (page == 1) {
        textSize(40);
    fill(blueLight);
    noStroke();
    rect(117,69,676,75,0,0,25,25);
     fill(white);
    textAlign(TOP,CORNER);
    text("CHEMISRTY LABORATORY", 191, 120);
    noFill();
    strokeWeight(5);
    stroke(255);
    rect(149,182,417,53,10);
    textSize(25);
    fill(255);
    text("SELECT COMPOUND TYPE ", 197, 215);

    Organic_Compounds.draw();
    Inorganic_Compounds.draw();
    drawLine();
  } else {
    if (Organic_Compounds.value.equals("Alkane")) {
      
    textSize(35);
    fill(blueLight);
    noStroke();
    rect(50,40,676,60,0,0,25,25);
     fill(#C2B59B);
    textAlign(TOP,CORNER);
    text("CHEMISRTY LABORATORY", 80, 80);
    textSize(20);
    fill(backGround);
    noStroke();
    stroke(white);
    rect(150,150,400,50,0,0,25,25);
    fill(white);
    textAlign(TOP,CORNER);
    text("ENTER CARBON NUMBER", 220, 180);
      EnterCarbonNo.draw();
      stroke(white);
      strokeWeight(1);
      line(380,265,500,265);
      if (CarbonNo<20) {
        getStructure(CarbonNo);
      }
      CompoundProperty.draw();
      //Chemicalformula.draw();
      //CompoundName.draw();
      //IsomerBox.draw();
      text("COMPOUND NAME:", 910, 320);
      line(910,360, 1080,360);
      text("CHEMICAL FORMULA:", 910, 400);  
      line(910,440, 1080,440);
      text("NUMBER OF ISOMERS:", 910, 480);
      line(910,520, 1080,520);
      //text(Formula, 191, 700);
      
      
      SetProperty( Nomanclature, ChemicalFormula, isomer);
      drawTheForm();
    } else if (Inorganic_Compounds.value.equals("IonicCompounds")) {
          textSize(35);
    fill(blueLight);
    noStroke();
    rect(30,40,580,60,0,0,25,25);
     fill(white);
    textAlign(TOP,CORNER);
    text("CHEMISRTY LABORATORY", 150, 80);
    fill(backGround);
    noStroke();
    stroke(white);
    rect(120,200,450,60,25,25,25,25);
    textAlign(TOP,CORNER);
    fill(white);
    textSize(25);
    text("SELLECT FOR ELEMENT", 140, 240);
    fill(blueLight);
    triangle(600,200,600,260,640,230);
      MetalicElements.draw();
      NonMetalicElements.draw();
    }
    prev.draw();
  }
}

void mainPageMouseReleased(){
    MetalicElements.mouseReleased ();
    NonMetalicElements.mouseReleased ();
} 

void firstPageMouseReleased(){
  isfirstPage = false;
  isMainPage = true;
}
 
