package package_433
{
   import package_293.class_1751;
   
   public class class_2687 extends class_2411
   {
       
      
      public function class_2687()
      {
         super();
      }
      
      override public function method_5147(param1:class_1751, param2:class_1751, param3:Object, param4:String) : void
      {
         throw new Error("Asset name collision while AssetLibrary.namingStrategy set to AssetLibrary.THROW_ERROR. Asset path: " + param1.method_915);
      }
      
      override public function create() : class_2411
      {
         return new class_2687();
      }
   }
}
