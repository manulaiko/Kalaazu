package package_11
{
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.system.ImageDecodingPolicy;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class class_65 extends class_38
   {
       
      
      private var loader:Loader;
      
      public function class_65()
      {
         super();
      }
      
      public function getBitmap() : Bitmap
      {
         return Bitmap(this.loader.content);
      }
      
      override protected function start() : void
      {
         this.loader = new Loader();
         this.loader.contentLoaderInfo.addEventListener(Event.INIT,this.method_5840);
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.handleLoadComplete);
         this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.method_3104);
         var _loc1_:LoaderContext = new LoaderContext();
         _loc1_.imageDecodingPolicy = ImageDecodingPolicy.ON_LOAD;
         this.loader.loadBytes(_data as ByteArray,_loc1_);
      }
      
      override protected function method_982() : void
      {
         if(this.loader)
         {
            if(this.loader.content is Bitmap && Bitmap(this.loader.content).bitmapData != null)
            {
               Bitmap(this.loader.content).bitmapData.dispose();
            }
            this.loader.contentLoaderInfo.removeEventListener(Event.INIT,this.method_5840);
            this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.handleLoadComplete);
            this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.method_3104);
            this.loader.unloadAndStop(true);
            this.loader = null;
         }
      }
      
      private function method_5840(param1:Event) : void
      {
      }
      
      private function method_3104(param1:IOErrorEvent) : void
      {
      }
      
      protected function handleLoadComplete(param1:Event) : void
      {
         method_206();
      }
   }
}
