package net.bigpoint.darkorbit.mvc.common.model.external
{
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   
   public class ExternalLoader
   {
       
      
      private var store:Object;
      
      public function ExternalLoader()
      {
         this.store = new Object();
         super();
      }
      
      public function load(param1:String, param2:Function) : void
      {
         var _loc3_:* = null;
         if(this.store[param1] != undefined && this.store[param1] != null)
         {
            param2(this.store[param1]);
         }
         else
         {
            _loc3_ = new AssetLoader();
            _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.handleLoadComplete);
            _loc3_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.handleError);
            _loc3_.callback = param2;
            _loc3_.name = param1;
            _loc3_.load(new URLRequest(param1));
         }
      }
      
      private function handleError(param1:IOErrorEvent) : void
      {
      }
      
      private function handleLoadComplete(param1:Event) : void
      {
         var _loc2_:AssetLoader = (param1.target as LoaderInfo).loader as AssetLoader;
         _loc2_.callback(_loc2_);
         _loc2_.removeEventListener(Event.COMPLETE,this.handleLoadComplete);
         _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.handleError);
         _loc2_.callback = null;
         this.store[_loc2_.name] = _loc2_;
      }
      
      public function cleanup() : void
      {
         this.store = new Object();
      }
   }
}
