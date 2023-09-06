package package_292
{
   import package_368.class_2110;
   import package_368.class_2412;
   
   public class class_2111 extends class_2110
   {
       
      
      private var var_3204:uint;
      
      public function class_2111(param1:uint, param2:String = null)
      {
         super(true,param2);
         this.var_3204 = param1;
      }
      
      override public function method_5804(param1:String) : Boolean
      {
         return true;
      }
      
      override public function method_1190(param1:String) : String
      {
         if(param1.indexOf(".awp") == -1 && param1.indexOf(".zip") == -1)
         {
            param1 = this.method_607(method_2890,param1);
            param1 = param1.replace(".obj",".awd");
            param1 = param1.replace(".png",".atf");
         }
         return param1;
      }
      
      private function method_607(param1:String, param2:String) : String
      {
         if(param2.charAt(0) == "/")
         {
            param2 = param2.substr(1);
         }
         if(param1.length == 0)
         {
            return param2;
         }
         if(param1.charAt(param1.length - 1) == "/")
         {
            param1 = param1.substr(0,param1.length - 1);
         }
         return param1.concat("/",param2);
      }
      
      override public function method_6396(param1:uint) : class_2412
      {
         return new class_2422(this.var_3204,param1);
      }
   }
}
