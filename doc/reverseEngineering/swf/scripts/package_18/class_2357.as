package package_18
{
   import flash.events.EventDispatcher;
   import package_11.class_39;
   import package_9.ResourceManager;
   
   public class class_2357 extends EventDispatcher
   {
      
      public static const ASSET_LOADED:String = "ASSET_LOADED";
       
      
      public var var_1637:String;
      
      public function class_2357()
      {
         super();
      }
      
      public function loadAsset(param1:String) : void
      {
         this.var_1637 = param1;
         ResourceManager.method_1412(param1,this.handleAssetLoaded,this.method_3249);
      }
      
      private function handleAssetLoaded(param1:class_39 = null) : void
      {
         dispatchEvent(new class_2562(ASSET_LOADED,this.var_1637));
      }
      
      private function method_3249() : void
      {
      }
   }
}
