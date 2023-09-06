package package_100
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import package_11.class_39;
   import package_9.ResourceManager;
   
   public class class_313 extends class_270
   {
       
      
      private var _libId:String;
      
      private var _resKey:String;
      
      private var var_3810:Number = 0;
      
      public function class_313(param1:String, param2:String = "minimap", param3:int = 0, param4:Number = 0)
      {
         this._resKey = param1;
         this._libId = param2;
         this.var_3810 = param4 || false;
         super(new Bitmap(),true,true,param3);
      }
      
      public function set resKey(param1:String) : void
      {
         this._resKey = param1;
         this.load();
      }
      
      private function load() : void
      {
         if(owner)
         {
            ResourceManager.name_15.load(this._libId,this.method_3291);
         }
      }
      
      override public function method_6037() : void
      {
         super.method_6037();
         this.load();
      }
      
      override public function method_2753() : void
      {
         ResourceManager.name_15.method_2379(this._libId,this.method_3291);
         super.method_2753();
      }
      
      private function method_3291(param1:class_39) : void
      {
         Bitmap(_icon).bitmapData = !!param1.hasEmbeddedObject(this._resKey) ? param1.getEmbeddedBitmapData(this._resKey) : null;
         this.update();
      }
      
      override protected function update() : void
      {
         if(this.var_3810 != 0)
         {
            var _loc1_:* = Number(this.var_3810) * Number(_scale);
            _icon.scaleY = Number(this.var_3810) * Number(_scale);
            _icon.scaleX = _loc1_;
         }
         super.update();
      }
   }
}
