Button next, prev;
Checkbox MetalicElements;
Checkbox NonMetalicElements;
TextField EnterCarbonNo;
TextField CompoundName;
TextField CompoundProperty;
TextField IsomerBox;
TextField Chemicalformula;
Table table;
Table table2;
int page = 1;
int CarbonNo;
int isomer;
DropDownMenu Organic_Compounds;
DropDownMenu Inorganic_Compounds;
String Metal;String NonMetal;
String FinalRxn;
String Nomanclature="";
String ChemicalFormula="";
String OrganicCompounds [] = {"Alkane", "Alkene", "Alkine", "Alkohls", "Deriv.OfHydrocarbons"};
String  InorganicCompounds[]={"IonicCompounds", "CovalentCpds", "ThoseContainingMetaloid"};
PImage intro;
boolean isfirstPage= true;
boolean isMainPage = false;
String pageName = " ";


void setup () {
   
  table =loadTable("data/tables/personal_Info.csv","header");
  table2 =loadTable("data/tables/Non-Metals.csv","header");
  size (1366, 768);
  next = new Button ("Next", 1006, 631, 107, 76);
  prev = new Button ("Prev", 20, 631, 107, 76);
  CompoundProperty=new TextField("", 900, 300, 400, 280);
  Chemicalformula=new TextField("", 800, 160, 170, 60);
  CompoundName=new TextField("", 800, 90, 170, 60);
  Organic_Compounds=new DropDownMenu("Organic_Compounds", OrganicCompounds, 200, 270, 300, 60);
  Inorganic_Compounds=new DropDownMenu("InorganicCompounds", InorganicCompounds, 800, 270, 300, 60);
  IsomerBox=new TextField("", 800, 230, 100, 65);
  EnterCarbonNo=new TextField("", 370, 220, 182, 50);
  EnterCarbonNo.acceptNumbersOnly (2);

  String thoseMetals [] = table.getStringColumn(0);
  MetalicElements = new Checkbox ("Metals", thoseMetals, 750, 250, 220, 47);
  String thoseNonMetals[]=table2.getStringColumn(0);
   NonMetalicElements=new Checkbox("NonMetals",thoseNonMetals,1100,250,220,47);
   
  
}

void draw () {
  background (blueDeep);
  if ( isMainPage == true && isfirstPage== false){  
  mainPagedraw();
  } else if ( isMainPage == false && isfirstPage == true ){
    firstPageDraw();
  }
 
}

void mousePressed () {
  Organic_Compounds. mousePressed ();
  Inorganic_Compounds. mousePressed ();
  EnterCarbonNo.mousePressed();
  MetalicElements.mousePressed();
  NonMetalicElements.mousePressed();
  Metal=MetalicElements.value;
  NonMetal=NonMetalicElements.value;
 println("nonmetal:"+NonMetalicElements.value);
  println("metal:"+MetalicElements.value);
  String Formulas=getTheIonicCpd( Metal,NonMetal);
   println(getTheIonicCpd( Metal,NonMetal));
     println(Metal); 
 
 
println(polyOxidation(metalOxidation));
}



void keyPressed () {
  EnterCarbonNo.keyPressed();
  if (keyCode==ENTER) {
    CarbonNo=int(EnterCarbonNo.value);
    ChemicalFormula=getAlkane( CarbonNo);
    Formula=getCondensedForm( CarbonNo);
    Nomanclature= AlkaneNomanclature(CarbonNo);
    String No_Isomer[]=split(getIsomers(CarbonNo, ChemicalFormula), ",");
    isomer=int(No_Isomer[1]);
    FinalRxn=No_Isomer[0];
    text(FinalRxn, 480, 700);
    println(isomer);
    println(getIsomers(CarbonNo, ChemicalFormula));
  }
}
void mouseClicked () {
  next.mouseClicked();
  prev.mouseClicked();

  if (page == 1) {
    if (next.clicked) {
      page = 2;
    }
  }
  if(page==2&&prev.clicked){
    page=1;
    Organic_Compounds.value="";
      Inorganic_Compounds.value="";
  }
}
void drawLine() {
  next.draw();
}
void drawTheForm() {
  SetCondensedForm(Formula);
}
void mouseReleased () {
  if ( isfirstPage == true && isMainPage == false ){
     firstPageMouseReleased();
  } else if ( isMainPage == true && isfirstPage == false){
    mainPageMouseReleased();
  }
}

void mouseDragged () {
  MetalicElements.mouseDragged ();
   NonMetalicElements.mouseDragged ();
}

void mouseWheel (MouseEvent e) {
  int factor = e.getCount();
  
  MetalicElements.mouseWheel (factor);
  NonMetalicElements.mouseWheel(factor);
  
}
