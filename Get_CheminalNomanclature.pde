  String AlkaneNomanclature(int CarbonNo){
  String Preffixes[]={"","meth","eth","prop","but","pent","hex","hept","oct","non","dec","Undec","Dodeca","tridec","Tetradec","Pentadedc","Hexadec","Heptadec",
"Octadec","Nonadec","Ecos"};
  String AlkaneNomanclature=Preffixes[CarbonNo]+"ane";
  println(AlkaneNomanclature);
  return AlkaneNomanclature;
}
String  IonicName(String Formula ){
  if(Formula.length()<6){
  }
  return Formula;
}
String name;
String getIonicCpdName(String Formulas){
  if (Formulas.length()<6){
    name=Formulas;
 
  }
  return "name"+name;
}
  
