String carbon="C";
String hydrogen="H";
String getAlkane(int CarbonNo) {
  int hydrogen_atom=(CarbonNo*2)+2;
  String ChemicalFormula=carbon+str(CarbonNo)+hydrogen+str(hydrogen_atom);
  println(ChemicalFormula);
  return ChemicalFormula;
}
String Formula="";
boolean Condense=false;
String getCondensedForm(int CarbonNo) {
  if (CarbonNo>1) {
    for (int b=0; b<2; b++) {
      Formula +="C"+"H"+"3";
      if (Condense==false) {
        for (int a=0; a<CarbonNo-2; a++) {
          Formula+="C"+"H"+"2";
        }
        Condense=true;
      }
    }
  }
  return Formula;
}
void SetCondensedForm(String Formula) {
  textSize(15);

  noStroke();
  stroke(white);
  fill(backGround);
  rect(260, 631, 345, 76, 30, 30, 30, 30);
  fill(white);
  text("CONDENSED FORM OF THE STRUCTURE:", 270, 660);
  
  stroke(white);
  fill(blueLight);
  rect(620, 631, 550, 76, 30, 30, 30, 30);
  fill(white);
  text(Formula, 640, 660);
  
}
String getIsomers(int CarbonNo, String ChemicalFormula) {
  float isomers=pow(2, (CarbonNo-4))+1;
  int isomer=int(isomers);
  int O2=((3*CarbonNo)+1)/2;
  int CO2=CarbonNo;
  int H2O=(CarbonNo+1);
  String Final_Rxn=ChemicalFormula+" +"+str(O2)+"O2"+"->"+"  "+CO2+"CO2"+" +"+H2O+"H2O"+" +"+"Heat";
  return Final_Rxn+","+str(isomer);
}
String metal; 
String nonMeta;
String metalInfo="";
int b;
String nonmetalInfo="";
String non="";
String Info;
String metalSymbol;
String Formulas;
int metalOxidation;
String nonmetalSymbol;
int nonmetalOxidation;
String form="";
int g;
String Name;
String firstname;
String secondname;
String  secondName="";
String SecondName;
String getTheIonicCpd(String Metal, String NonMetal) {
  for (int a=0; a<table.getRowCount(); a++) {
    if (Metal.equals(table.getString(a, 0))) {
      metalSymbol=table.getString(a, 1);
      metalOxidation=int( table.getString(a, 2));
      firstname=table.getString(a, 0);
    }
  }

  for (int b=0; b<table2.getRowCount(); b++) {
    if (NonMetal.equals(table2.getString(b, 0))) {
      nonmetalSymbol=table2.getString(b, 1);
      nonmetalOxidation=int(table2.getString(b, 2));
      non+=table2.getString(b, 0)+",";
      secondname=table2.getString(b, 0);
      if (secondname.charAt(secondname.length()-1)=='e') {
        for (int h=0; h<secondname.length()-3; h++) {
          secondName+=secondname.charAt(h);
        }
      } else {
        for (int d=0; d<secondname.length()-4; d++) {
          secondName+=secondname.charAt(d);
        }
      }
    }
  } 
  SecondName=secondName+"ide";
  if (str(metalOxidation).length()<=1) {
    if (nonmetalOxidation==metalOxidation||nonmetalOxidation==1&&metalOxidation==1) {
      Formulas=metalSymbol+nonmetalSymbol;
      Name=firstname+SecondName;
    } else if (nonmetalOxidation==1||metalOxidation==1 ) {
      if (nonmetalOxidation==1) {
        Formulas=metalSymbol+nonmetalSymbol+str(metalOxidation);
        Name=firstname+SecondName;
      }
      if (metalOxidation==1) {
        Formulas=metalSymbol+str(nonmetalOxidation)+nonmetalSymbol;
        Name=firstname+SecondName;
      }
    } else if (nonmetalOxidation!=1&&metalOxidation!=1) {
      Formulas=metalSymbol+str(nonmetalOxidation)+nonmetalSymbol+str(metalOxidation);
      Name=firstname+SecondName;
    }
  } else if (str(metalOxidation).length()>1) {

    String eachVal[]=split(str(metalOxidation), "0");
    if (str(metalOxidation).length()==5) {
      g=2;
    }
    if (str(metalOxidation).length()==9) {
      g=4;
    }
    if (str(metalOxidation).length()==3) {
      g=1;
    }
    if (str(metalOxidation).length()==7) {
      g=3;
    }
    for (int a=0; a<str(metalOxidation).length()-g; a++) {
      if (int(eachVal[a])!=0) {
        String Oxdn=eachVal[a];

        if (nonmetalOxidation!=1 && int(Oxdn)!=1&&nonmetalOxidation!=int(Oxdn)) {
          if (nonmetalOxidation%int(Oxdn)!=0&&int(Oxdn)%nonmetalOxidation!=0) {
            form+=metalSymbol+str(nonmetalOxidation)+nonmetalSymbol+Oxdn+",";
          } else {
            if (nonmetalOxidation%int(Oxdn)==0) {
              form+=metalSymbol+str(nonmetalOxidation/int(Oxdn))+nonmetalSymbol+",";
            }
            if (nonmetalOxidation!=0) {
              if ((int(Oxdn))%nonmetalOxidation==0) {
                int Ox=int(Oxdn)/nonmetalOxidation;
                form+=metalSymbol+nonmetalSymbol+Ox+",";
              }
            }
          }
        } else if (nonmetalOxidation==int(Oxdn)) {
          form=metalSymbol+nonmetalSymbol+",";
        } else if (nonmetalOxidation!=int(Oxdn)&&int(Oxdn)==1) {
          form=metalSymbol+nonmetalOxidation+nonmetalSymbol;
        } else if (nonmetalOxidation!=int(Oxdn)&&nonmetalOxidation==1) {
          form=metalSymbol=nonmetalSymbol+int(Oxdn);
        }
      }
    }

    Formulas=form;
  }

  return Formulas+","+  SecondName;
}
String get;
String I;
String polyOxidation(int metalOxidation) {
  if (str(metalOxidation).length()>1) {
    get="poly Valance"+metalOxidation;
    String eachVal[]=split(str(metalOxidation), "0");
    I=eachVal[0];
  }
  return I;
}
