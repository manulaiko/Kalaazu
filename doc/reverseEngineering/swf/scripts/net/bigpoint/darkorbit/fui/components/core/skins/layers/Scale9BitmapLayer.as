package net.bigpoint.darkorbit.fui.components.core.skins.layers
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Scale9BitmapLayer extends Sprite implements ISkinLayer
   {
       
      
      protected var _width:Number;
      
      protected var _height:Number;
      
      protected var _unscaledBitmapData:BitmapData;
      
      protected var _x1:Number = 0;
      
      protected var _x2:Number = 0;
      
      protected var _y1:Number = 0;
      
      protected var _y2:Number = 0;
      
      protected var tl:Bitmap;
      
      protected var tc:Bitmap;
      
      protected var tr:Bitmap;
      
      protected var cl:Bitmap;
      
      protected var cc:Bitmap;
      
      protected var cr:Bitmap;
      
      protected var bl:Bitmap;
      
      protected var bc:Bitmap;
      
      protected var br:Bitmap;
      
      public function Scale9BitmapLayer(param1:BitmapData, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number = 100, param7:Number = 100)
      {
         super();
         if(param2 > param4 || param3 > param5)
         {
            throw new Error("Wrong scale9 grid definitions x1>x2 | y1>y2. [" + param2 + ":" + param4 + "," + param3 + ":" + param5);
         }
         if(param1 == null)
         {
            throw new Error("So geht´s nicht! At least this class needs a bitmapData !!");
         }
         this._unscaledBitmapData = param1;
         this._x1 = param2;
         this._x2 = param4;
         this._y1 = param3;
         this._y2 = param5;
         this._width = param6;
         this._height = param7;
         this.createSegments();
         this.redraw();
      }
      
      protected function createSegments() : void
      {
         var _loc2_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc6_:* = null;
         var _loc1_:Number = this._x2 - this._x1;
         _loc2_ = this._unscaledBitmapData.width - this._x2;
         var _loc3_:Number = this._y2 - this._y1;
         _loc4_ = this._unscaledBitmapData.height - this._y2;
         var _loc5_:Point = new Point(0,0);
         (_loc6_ = new BitmapData(this._x1,this._y1,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(0,0,this._x1,this._y1),_loc5_);
         this.tl = new Bitmap(_loc6_);
         this.addChild(this.tl);
         (_loc6_ = new BitmapData(_loc1_,this._y1,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x1,0,this._x2,this._y1),_loc5_);
         this.tc = new Bitmap(_loc6_);
         this.addChild(this.tc);
         (_loc6_ = new BitmapData(_loc2_,this._y1,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x2,0,this._width,this._y1),_loc5_);
         this.tr = new Bitmap(_loc6_);
         this.addChild(this.tr);
         (_loc6_ = new BitmapData(this._x1,_loc3_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(0,this._y1,this._x1,this._y2),_loc5_);
         this.cl = new Bitmap(_loc6_);
         this.addChild(this.cl);
         (_loc6_ = new BitmapData(_loc1_,_loc3_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x1,this._y1,this._x2,this._y2),_loc5_);
         this.cc = new Bitmap(_loc6_);
         this.addChild(this.cc);
         (_loc6_ = new BitmapData(_loc2_,_loc3_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x2,this._y1,this._width,this._y2),_loc5_);
         this.cr = new Bitmap(_loc6_);
         this.addChild(this.cr);
         var _loc7_:Number = this._unscaledBitmapData.height;
         (_loc6_ = new BitmapData(this._x1,_loc4_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(0,this._y2,this._x1,_loc7_),_loc5_);
         this.bl = new Bitmap(_loc6_);
         this.addChild(this.bl);
         (_loc6_ = new BitmapData(_loc1_,_loc4_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x1,this._y2,this._x2,_loc7_),_loc5_);
         this.bc = new Bitmap(_loc6_);
         this.addChild(this.bc);
         (_loc6_ = new BitmapData(_loc2_,_loc4_,true,0)).copyPixels(this._unscaledBitmapData,new Rectangle(this._x2,this._y2,this._width,_loc7_),_loc5_);
         this.br = new Bitmap(_loc6_);
         this.addChild(this.br);
      }
      
      public function redraw() : void
      {
         scaleX = 1;
         scaleY = 1;
         var _loc1_:Number = this._unscaledBitmapData.width - this._x2;
         var _loc2_:Number = this._unscaledBitmapData.height - this._y2;
         var _loc3_:Number = this._width - (this._x1 + _loc1_);
         var _loc4_:Number = this._height - (this._y1 + _loc2_);
         var _loc5_:Number = this._x1 + _loc3_;
         var _loc6_:Number = this._y1 + _loc4_;
         this.tl.x = 0;
         this.tl.y = 0;
         this.tc.x = this._x1;
         this.tc.width = _loc3_;
         this.tr.x = _loc5_;
         this.cl.y = this._y1;
         this.cl.height = _loc4_;
         this.cc.x = this._x1;
         this.cc.y = this._y1;
         this.cc.width = _loc3_;
         this.cc.height = _loc4_;
         this.cr.x = _loc5_;
         this.cr.y = this._y1;
         this.cr.height = _loc4_;
         this.bl.x = 0;
         this.bl.y = _loc6_;
         this.bc.x = this._x1;
         this.bc.y = _loc6_;
         this.bc.width = _loc3_;
         this.br.x = _loc5_;
         this.br.y = _loc6_;
         if(super.width > this._width)
         {
            scaleX = this._width / super.width;
         }
         if(super.height > this._height)
         {
            scaleX = this._height / super.height;
         }
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
         return new Scale9BitmapLayer(this._unscaledBitmapData,this._x1,this._y1,this._x2,this._y2,this._width,this._height);
      }
      
      public function dispose() : void
      {
         this.tl.bitmapData.dispose();
         this.tc.bitmapData.dispose();
         this.tr.bitmapData.dispose();
         this.tl = null;
         this.tc = null;
         this.tr = null;
         this.cl.bitmapData.dispose();
         this.cc.bitmapData.dispose();
         this.cr.bitmapData.dispose();
         this.cl = null;
         this.cc = null;
         this.cr = null;
         this.bl.bitmapData.dispose();
         this.bc.bitmapData.dispose();
         this.br.bitmapData.dispose();
         this.bl = null;
         this.bc = null;
         this.br = null;
      }
   }
}
