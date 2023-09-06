package package_292
{
   import away3d.arcane;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import package_366.class_2105;
   import package_368.class_2416;
   import package_440.class_2423;
   import package_440.class_2424;
   
   public class class_2112 extends class_2105
   {
       
      
      private var file:class_2423;
      
      public function class_2112()
      {
         super(URLLoaderDataFormat.BINARY);
      }
      
      public static function supportsType(param1:String) : Boolean
      {
         return param1.toLowerCase() == "zip";
      }
      
      public static function supportsData(param1:*) : Boolean
      {
         return false;
      }
      
      override protected function method_196() : Boolean
      {
         if(this.file == null)
         {
            this.file = new class_2423();
            this.file.addEventListener(class_2424.FILE_LOADED,this.method_2623);
            this.file.debug = arcane::var_677;
            this.file.loadBytes(_data);
         }
         if(method_3984)
         {
            return const_2971;
         }
         return const_2361;
      }
      
      override arcane function method_3765(param1:class_2416) : void
      {
         var _loc2_:int = param1.assets.length - 1;
         while(_loc2_ >= 0)
         {
            method_3342(param1.assets[_loc2_]);
            _loc2_--;
         }
      }
      
      private function method_2623(param1:class_2424) : void
      {
         if(param1.file.method_4082.indexOf(".awp") != -1)
         {
            method_597(param1.file.method_4082,new URLRequest(param1.file.method_4082),false,param1.file.content,false);
            method_1516();
         }
      }
   }
}
