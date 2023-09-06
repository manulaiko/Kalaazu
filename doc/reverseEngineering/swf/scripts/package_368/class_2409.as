package package_368
{
   import away3d.arcane;
   import flash.events.EventDispatcher;
   import package_367.AssetLoader;
   
   public class class_2409 extends EventDispatcher
   {
       
      
      arcane var _loader:AssetLoader;
      
      public function class_2409(param1:AssetLoader)
      {
         super();
         this.arcane::_loader = param1;
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this.arcane::_loader.addEventListener(param1,param2,param3,param4,param5);
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this.arcane::_loader.removeEventListener(param1,param2,param3);
      }
      
      override public function hasEventListener(param1:String) : Boolean
      {
         return this.arcane::_loader.hasEventListener(param1);
      }
      
      override public function willTrigger(param1:String) : Boolean
      {
         return this.arcane::_loader.willTrigger(param1);
      }
   }
}
