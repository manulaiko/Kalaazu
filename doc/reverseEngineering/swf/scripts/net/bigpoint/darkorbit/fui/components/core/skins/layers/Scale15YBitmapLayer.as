package net.bigpoint.darkorbit.fui.components.core.skins.layers
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Scale15YBitmapLayer extends Sprite implements ISkinLayer
   {
       
      
      protected var _width:Number;
      
      protected var _height:Number;
      
      protected var _unscaledBitmapData:BitmapData;
      
      protected var _x1:Number = 0;
      
      protected var _x2:Number = 0;
      
      protected var _y1:Number = 0;
      
      protected var _y2:Number = 0;
      
      protected var _y3:Number = 0;
      
      protected var _y4:Number = 0;
      
      protected var tl:Bitmap;
      
      protected var tc:Bitmap;
      
      protected var tr:Bitmap;
      
      protected var tml:Bitmap;
      
      protected var tmc:Bitmap;
      
      protected var tmr:Bitmap;
      
      protected var cl:Bitmap;
      
      protected var cc:Bitmap;
      
      protected var cr:Bitmap;
      
      protected var bml:Bitmap;
      
      protected var bmc:Bitmap;
      
      protected var bmr:Bitmap;
      
      protected var bl:Bitmap;
      
      protected var bc:Bitmap;
      
      protected var br:Bitmap;
      
      public function Scale15YBitmapLayer(param1:BitmapData, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number = 10, param9:Number = 10)
      {
         super();
         if(param2 >= param3 || param4 >= param5 || param5 >= param6 || param6 >= param7)
         {
            throw new Error("Wrong scale15 grid definitions.");
         }
         this._unscaledBitmapData = param1;
         this._x1 = param2;
         this._x2 = param3;
         this._y1 = param4;
         this._y2 = param5;
         this._y3 = param6;
         this._y4 = param7;
         this._width = param8;
         this._height = param9;
         this.createSegments();
         this.redraw();
      }
      
      protected function createSegments() : void
      {
         var _loc12_:* = null;
         var _loc1_:Number = this._unscaledBitmapData.width;
         var _loc2_:Number = this._x1;
         var _loc3_:Number = this._x2 - this._x1;
         var _loc4_:Number = this._unscaledBitmapData.width - this._x2;
         var _loc5_:Number = this._unscaledBitmapData.height;
         var _loc6_:Number = this._y1;
         var _loc7_:Number = this._y2 - this._y1;
         var _loc8_:Number = this._y3 - this._y2;
         var _loc9_:Number = this._y4 - this._y3;
         var _loc10_:Number = this._unscaledBitmapData.height - this._y4;
         var _loc11_:Point = new Point(0,0);
         (_loc12_ = new BitmapData(_loc2_,_loc6_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(0,0,this._x1,this._y1),_loc11_);
         this.tl = new Bitmap(_loc12_);
         this.addChild(this.tl);
         (_loc12_ = new BitmapData(_loc3_,_loc6_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x1,0,this._x2,this._y1),_loc11_);
         this.tc = new Bitmap(_loc12_);
         this.addChild(this.tc);
         (_loc12_ = new BitmapData(_loc4_,_loc6_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x2,0,_loc1_,this._y1),_loc11_);
         this.tr = new Bitmap(_loc12_);
         this.addChild(this.tr);
         (_loc12_ = new BitmapData(_loc2_,_loc7_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(0,this._y1,this._x1,this._y2),_loc11_);
         this.tml = new Bitmap(_loc12_);
         this.addChild(this.tml);
         (_loc12_ = new BitmapData(_loc3_,_loc7_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x1,this._y1,this._x2,this._y2),_loc11_);
         this.tmc = new Bitmap(_loc12_);
         this.addChild(this.tmc);
         (_loc12_ = new BitmapData(_loc4_,_loc7_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x2,this._y1,_loc1_,this._y2),_loc11_);
         this.tmr = new Bitmap(_loc12_);
         this.addChild(this.tmr);
         (_loc12_ = new BitmapData(_loc2_,_loc8_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(0,this._y2,this._x1,this._y3),_loc11_);
         this.cl = new Bitmap(_loc12_);
         this.addChild(this.cl);
         (_loc12_ = new BitmapData(_loc3_,_loc8_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x1,this._y2,this._x2,this._y3),_loc11_);
         this.cc = new Bitmap(_loc12_);
         this.addChild(this.cc);
         (_loc12_ = new BitmapData(_loc4_,_loc8_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x2,this._y2,_loc1_,this._y3),_loc11_);
         this.cr = new Bitmap(_loc12_);
         this.addChild(this.cr);
         (_loc12_ = new BitmapData(_loc2_,_loc9_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(0,this._y3,this._x1,this._y4),_loc11_);
         this.bml = new Bitmap(_loc12_);
         this.addChild(this.bml);
         (_loc12_ = new BitmapData(_loc3_,_loc9_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x1,this._y3,this._x2,this._y4),_loc11_);
         this.bmc = new Bitmap(_loc12_);
         this.addChild(this.bmc);
         (_loc12_ = new BitmapData(_loc4_,_loc9_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x2,this._y3,_loc1_,this._y4),_loc11_);
         this.bmr = new Bitmap(_loc12_);
         this.addChild(this.bmr);
         (_loc12_ = new BitmapData(_loc2_,_loc10_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(0,this._y4,this._x1,_loc5_),_loc11_);
         this.bl = new Bitmap(_loc12_);
         this.addChild(this.bl);
         (_loc12_ = new BitmapData(_loc3_,_loc10_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x1,this._y4,this._x2,_loc5_),_loc11_);
         this.bc = new Bitmap(_loc12_);
         this.addChild(this.bc);
         (_loc12_ = new BitmapData(_loc4_,_loc10_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x2,this._y4,_loc1_,_loc5_),_loc11_);
         this.br = new Bitmap(_loc12_);
         this.addChild(this.br);
      }
      
      public function redraw() : void
      {
         var _loc1_:Number = this._unscaledBitmapData.width - this._x2;
         var _loc2_:Number = this._width - (this._x1 + _loc1_);
         var _loc3_:Number = this._x1 + _loc2_;
         var _loc4_:Number = this._unscaledBitmapData.height - this._y2;
         var _loc5_:Number;
         var _loc6_:Number = _loc5_ = this._height - (this._y1 + (this._unscaledBitmapData.height - this._y4) + (this._y3 - this._y2)) >> 1;
         if(this._unscaledBitmapData.height % 2 == 1)
         {
            _loc6_ += 1;
         }
         var _loc7_:Number = this._y1 + _loc5_;
         var _loc8_:Number = this._y1 + _loc5_ + (this._y3 - this._y2);
         var _loc9_:Number = this._y1 + _loc5_ + (this._y3 - this._y2) + _loc6_;
         this.tl.x = 0;
         this.tl.y = 0;
         this.tc.x = this._x1;
         this.tc.width = _loc2_;
         this.tr.x = _loc3_;
         this.tml.x = 0;
         this.tml.y = this._y1;
         this.tml.height = _loc6_;
         this.tmc.x = this._x1;
         this.tmc.y = this._y1;
         this.tmc.width = _loc2_;
         this.tmc.height = _loc6_;
         this.tmr.x = _loc3_;
         this.tmr.y = this._y1;
         this.tmr.height = _loc6_;
         this.cl.y = _loc7_;
         this.cc.x = this._x1;
         this.cc.y = _loc7_;
         this.cc.width = _loc2_;
         this.cr.x = _loc3_;
         this.cr.y = _loc7_;
         this.bml.y = _loc8_;
         this.bml.height = _loc5_;
         this.bmc.x = this._x1;
         this.bmc.y = _loc8_;
         this.bmc.width = _loc2_;
         this.bmc.height = _loc5_;
         this.bmr.x = _loc3_;
         this.bmr.y = _loc8_;
         this.bmr.height = _loc5_;
         this.bl.x = 0;
         this.bl.y = _loc9_;
         this.bc.x = this._x1;
         this.bc.y = _loc9_;
         this.bc.width = _loc2_;
         this.br.x = _loc3_;
         this.br.y = _loc9_;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.redraw();
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
         this.redraw();
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         this._width = param1;
         this._height = param2;
         this.redraw();
      }
      
      public function clone() : DisplayObject
      {
         return new Scale15YBitmapLayer(this._unscaledBitmapData,this._x1,this._x2,this._y1,this._y2,this._y3,this._y4,this._width,this._height);
      }
      
      public function dispose() : void
      {
         this.tl.bitmapData.dispose();
         this.tc.bitmapData.dispose();
         this.tr.bitmapData.dispose();
         this.tl = null;
         this.tc = null;
         this.tr = null;
         this.tml.bitmapData.dispose();
         this.tmc.bitmapData.dispose();
         this.tmr.bitmapData.dispose();
         this.tml = null;
         this.tmc = null;
         this.tmr = null;
         this.cl.bitmapData.dispose();
         this.cc.bitmapData.dispose();
         this.cr.bitmapData.dispose();
         this.cl = null;
         this.cc = null;
         this.cr = null;
         this.bml.bitmapData.dispose();
         this.bmc.bitmapData.dispose();
         this.bmr.bitmapData.dispose();
         this.bml = null;
         this.bmc = null;
         this.bmr = null;
         this.bl.bitmapData.dispose();
         this.bc.bitmapData.dispose();
         this.br.bitmapData.dispose();
         this.bl = null;
         this.bc = null;
         this.br = null;
      }
   }
}
