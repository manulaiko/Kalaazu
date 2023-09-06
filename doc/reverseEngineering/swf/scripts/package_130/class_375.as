package package_130
{
   import flash.utils.Dictionary;
   import package_240.class_1471;
   import package_240.class_1472;
   import package_240.class_1473;
   import package_240.class_1474;
   import package_240.class_1475;
   import package_240.class_1476;
   import package_240.class_1477;
   import package_240.class_1478;
   import package_240.class_1479;
   
   public class class_375
   {
      
      private static const const_1413:String = "standart";
      
      private static const const_1398:String = "spaceball";
      
      private static const const_772:String = "mothership";
      
      private static const const_1774:String = "minion";
      
      private static const const_1169:String = "police";
      
      private static const SOLACE:String = "solace";
      
      private static const CITADEL:String = "citadel";
      
      private static const const_3123:String = "cubicon";
      
      private static const AEGIS:String = "aegis";
       
      
      private var var_1288:Dictionary;
      
      public function class_375()
      {
         this.var_1288 = new Dictionary();
         super();
         this.var_1288[const_1413] = new class_1471();
         this.var_1288[const_1398] = new class_1475();
         this.var_1288[const_772] = new class_1476();
         this.var_1288[const_1774] = new class_1474();
         this.var_1288[const_1169] = new class_1472();
         this.var_1288[SOLACE] = new class_1479();
         this.var_1288[AEGIS] = new class_1473();
         this.var_1288[CITADEL] = new class_1478();
         this.var_1288[const_3123] = new class_1477();
      }
      
      public function method_5001(param1:String) : class_1470
      {
         return this.var_1288[param1];
      }
   }
}
