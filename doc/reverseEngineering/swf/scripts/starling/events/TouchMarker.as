package starling.events
{
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.geom.Point;
   import starling.core.Starling;
   import starling.display.Image;
   import starling.display.Sprite;
   import starling.textures.Texture;
   
   class TouchMarker extends Sprite
   {
       
      
      private var mCenter:Point;
      
      private var mTexture:Texture;
      
      function TouchMarker()
      {
         var _loc2_:* = null;
         super();
         this.mCenter = new Point();
         this.mTexture = this.createTexture();
         var _loc1_:int = 0;
         while(_loc1_ < 2)
         {
            _loc2_ = new Image(this.mTexture);
            _loc2_.pivotX = this.mTexture.width / 2;
            _loc2_.pivotY = this.mTexture.height / 2;
            _loc2_.touchable = false;
            addChild(_loc2_);
            _loc1_++;
         }
      }
      
      override public function dispose() : void
      {
         this.mTexture.dispose();
         super.dispose();
      }
      
      public function moveMarker(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         if(param3)
         {
            this.mCenter.x += param1 - this.realMarker.x;
            this.mCenter.y += param2 - this.realMarker.y;
         }
         this.realMarker.x = param1;
         this.realMarker.y = param2;
         this.mockMarker.x = 2 * this.mCenter.x - param1;
         this.mockMarker.y = 2 * this.mCenter.y - param2;
      }
      
      public function moveCenter(param1:Number, param2:Number) : void
      {
         this.mCenter.x = param1;
         this.mCenter.y = param2;
         this.moveMarker(this.realX,this.realY);
      }
      
      private function createTexture() : Texture
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = 12 * _loc1_;
         var _loc3_:int = 32 * _loc1_;
         var _loc4_:int = 32 * _loc1_;
         var _loc5_:Number = 1.5 * _loc1_;
         var _loc6_:Shape;
         (_loc6_ = new Shape()).graphics.lineStyle(_loc5_,0,0.3);
         _loc6_.graphics.drawCircle(_loc3_ / 2,_loc4_ / 2,_loc2_ + _loc5_);
         _loc6_.graphics.beginFill(16777215,0.4);
         _loc6_.graphics.lineStyle(_loc5_,16777215);
         _loc6_.graphics.drawCircle(_loc3_ / 2,_loc4_ / 2,_loc2_);
         _loc6_.graphics.endFill();
         var _loc7_:BitmapData;
         (_loc7_ = new BitmapData(_loc3_,_loc4_,true,0)).draw(_loc6_);
         return Texture.fromBitmapData(_loc7_,false,false,_loc1_);
      }
      
      private function get realMarker() : Image
      {
         return getChildAt(0) as Image;
      }
      
      private function get mockMarker() : Image
      {
         return getChildAt(1) as Image;
      }
      
      public function get realX() : Number
      {
         return this.realMarker.x;
      }
      
      public function get realY() : Number
      {
         return this.realMarker.y;
      }
      
      public function get mockX() : Number
      {
         return this.mockMarker.x;
      }
      
      public function get mockY() : Number
      {
         return this.mockMarker.y;
      }
   }
}
