package package_181
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class class_1104 extends Sprite
   {
      
      public static const const_628:uint = 0;
      
      public static const const_1450:uint = 1;
      
      public static const const_2360:uint = 2;
      
      protected static var cache:Array = [];
      
      private static var var_4917:Array = [];
       
      
      protected var var_2191:Array;
      
      protected var _frame:int;
      
      protected var var_267:int = 25;
      
      protected var var_317:String;
      
      private var var_3573:MovieClip;
      
      protected var var_3412:Rectangle;
      
      protected var var_522:Boolean;
      
      protected var var_2961:Point;
      
      protected var currentTime:int;
      
      protected var var_444:Bitmap;
      
      private var var_2109:int;
      
      protected var var_4815:int;
      
      protected var var_4199:int;
      
      var var_2352:Boolean;
      
      var remove:Boolean;
      
      protected var frames:int = 1;
      
      protected var _colorTransform:ColorTransform;
      
      protected var var_1559:int;
      
      private var var_591:Boolean;
      
      private var var_45:Boolean = true;
      
      private var var_1762:uint = 0;
      
      private var var_2717:Boolean;
      
      public function class_1104(param1:MovieClip, param2:String, param3:int = 25, param4:Boolean = false, param5:Boolean = false, param6:int = 1, param7:int = -1, param8:ColorTransform = null)
      {
         this.var_2191 = [];
         this.var_2961 = new Point();
         this.var_444 = new Bitmap();
         super();
         this.var_3573 = param1;
         this.var_317 = param2;
         this.fps = param3;
         this.var_522 = param4;
         this.var_2352 = param5;
         this.var_4815 = param6;
         this.var_4199 = param7;
         this._colorTransform = param8;
         this.addChild(this.var_444);
         this.mouseEnabled = false;
         this.mouseChildren = false;
         if(this.var_3573 != null)
         {
            this.var_1559 = this.var_3573.framesLoaded;
            this.init();
         }
         this.addEventListener(Event.ADDED_TO_STAGE,this.method_396,false,0,true);
      }
      
      protected static function method_501(param1:String, param2:class_1573) : void
      {
         cache[param1] = param2;
      }
      
      protected static function search(param1:String) : Boolean
      {
         if(false)
         {
            return true;
         }
         return false;
      }
      
      public static function clearCache() : void
      {
         cache = [];
      }
      
      public function get playbackMode() : uint
      {
         return this.var_1762;
      }
      
      public function set playbackMode(param1:uint) : void
      {
         this.var_1762 = param1;
         switch(this.var_1762)
         {
            case const_628:
               this.var_45 = true;
               break;
            case const_2360:
               this.var_45 = false;
               this._frame = this.var_2191.length - 1;
         }
         this.method_3565();
      }
      
      private function method_396(param1:Event) : void
      {
         class_1574.method_3266(this.stage);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.method_396);
         if(this.var_591)
         {
            this.var_591 = false;
            this.play();
         }
      }
      
      private function init() : void
      {
         if(this.var_3573 == null)
         {
            throw new Error("BitmapClip needs a valid movieClip Object!");
         }
         if(this.method_3735())
         {
            if(this.var_2352)
            {
               this.method_482();
            }
            this.method_1609(this.var_3573,this.var_317);
         }
      }
      
      public function clone() : Object
      {
         var _loc1_:class_1104 = new class_1104(this.var_3573,this.var_317,this.var_267,this.var_522,this.var_2352,this.var_4815,this.var_4199);
         _loc1_.mouseEnabled = this.mouseEnabled;
         _loc1_.mouseChildren = this.mouseChildren;
         _loc1_.playbackMode = this.playbackMode;
         return _loc1_;
      }
      
      protected function method_5281(param1:Event) : void
      {
         this.stop();
      }
      
      private function method_1609(param1:MovieClip, param2:String = null) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(param1 is MovieClip)
         {
            if(this.var_4199 != -1)
            {
               if(this.var_4199 < this.var_4815)
               {
                  throw new Error("endframe is smaller than starframe!");
               }
               this.frames = this.var_4199;
            }
            else
            {
               this.frames = MovieClip(param1).totalFrames;
            }
            MovieClip(param1).gotoAndStop(this.var_4815);
         }
         var _loc3_:int = this.var_4815 - 1;
         while(_loc3_ < this.frames)
         {
            if(search(param2 + "_" + _loc3_))
            {
               this.var_2191[_loc3_] = cache[param2 + "_" + _loc3_];
            }
            else
            {
               if(_loc3_ > 0)
               {
                  MovieClip(param1).gotoAndStop(_loc3_ + 1);
               }
               this.var_3412 = param1.getBounds(param1);
               _loc4_ = Math.ceil(this.var_3412.width);
               _loc5_ = Math.ceil(this.var_3412.height);
               _loc6_ = Math.ceil(this.var_3412.x);
               _loc7_ = Math.ceil(this.var_3412.y);
               _loc8_ = new class_1573(_loc4_,_loc5_,true,0);
               (_loc9_ = new Matrix()).translate(-_loc6_,-_loc7_);
               _loc8_.draw(param1,_loc9_,this._colorTransform);
               _loc8_.offset.x = _loc6_;
               _loc8_.offset.y = _loc7_;
               this.var_2191[_loc3_] = _loc8_;
               if(param2 != null)
               {
                  method_501(param2 + "_" + _loc3_,_loc8_);
               }
            }
            _loc3_++;
         }
         this._frame = this.var_4815 - 1;
         this.method_3565();
      }
      
      public function get framesLoaded() : int
      {
         return this.var_2191.length;
      }
      
      protected function method_3565() : void
      {
         var _loc1_:class_1573 = this.var_2191[this._frame];
         if(_loc1_ != null)
         {
            this.var_444.x = _loc1_.offset.x;
            this.var_444.y = _loc1_.offset.y;
            super.x = this.var_2961.x;
            super.y = this.var_2961.y;
            this.var_444.bitmapData = _loc1_;
         }
      }
      
      override public function get numChildren() : int
      {
         return super.numChildren - 1;
      }
      
      override public function getChildAt(param1:int) : DisplayObject
      {
         return super.getChildAt(param1 + 1);
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         return super.getChildIndex(param1) - 1;
      }
      
      public function gotoAndStop(param1:int) : void
      {
         this.stop();
         this._frame = param1 - 1;
         if(this._frame > this.var_2191.length - 1)
         {
            throw new Error("frameIndex is not valid! 1");
         }
         this.method_3565();
      }
      
      public function gotoAndPlay(param1:int) : void
      {
         this._frame = param1 - 1;
         if(this._frame > this.var_2191.length - 1)
         {
            throw new Error("frameIndex is not valid! 2");
         }
         this.play();
      }
      
      public function set frame(param1:int) : void
      {
         this.gotoAndStop(param1);
      }
      
      public function get frame() : int
      {
         return this._frame + 1;
      }
      
      private function nextFrame() : void
      {
         if(this.var_45)
         {
            this._frame += 1;
            if(this._frame > this.var_2191.length - 1)
            {
               if(this.var_1762 == const_628 && Boolean(this.var_522))
               {
                  this.stop();
                  if(parent != null)
                  {
                     parent.removeChild(this);
                  }
                  return;
               }
               if(this.var_1762 == const_1450)
               {
                  this._frame = Number(this.var_2191.length) - 2;
                  this.var_45 = false;
               }
               else if(this.var_2717)
               {
                  this.remove = true;
               }
               else
               {
                  this._frame = this.var_4815 - 1;
               }
            }
         }
         else
         {
            this._frame = this._frame - 1;
            if(this._frame < this.var_4815 - 1)
            {
               if(this.var_522)
               {
                  this.stop();
                  if(parent != null)
                  {
                     parent.removeChild(this);
                  }
                  return;
               }
               if(this.var_1762 == const_1450)
               {
                  this._frame = this.var_4815;
                  this.var_45 = true;
               }
               else if(this.var_2717)
               {
                  this.remove = true;
               }
               else
               {
                  this._frame = this.var_2191.length - 1;
               }
            }
         }
         this.method_3565();
      }
      
      public function play() : void
      {
         if(parent != null)
         {
            this.remove = false;
            if(this.var_2191.length > 0)
            {
               if(!this.hasEventListener(Event.REMOVED_FROM_STAGE))
               {
                  this.addEventListener(Event.REMOVED_FROM_STAGE,this.method_5281);
               }
               class_1574.method_3612(this);
               class_1574.method_2859();
            }
         }
         else
         {
            this.var_591 = true;
         }
      }
      
      public function method_4572() : void
      {
         this.var_2717 = true;
         this.play();
      }
      
      public function stop() : void
      {
         this.removeEventListener(Event.REMOVED_FROM_STAGE,this.method_5281);
         this.remove = true;
      }
      
      function update(param1:int) : void
      {
         this.currentTime += param1;
         while(this.currentTime > this.var_2109)
         {
            this.currentTime -= this.var_2109;
            this.nextFrame();
         }
      }
      
      override public function set x(param1:Number) : void
      {
         this.var_2961.x = param1;
         this.method_3565();
      }
      
      override public function set y(param1:Number) : void
      {
         this.var_2961.y = param1;
         this.method_3565();
      }
      
      override public function get x() : Number
      {
         return this.var_2961.x;
      }
      
      override public function get y() : Number
      {
         return this.var_2961.y;
      }
      
      public function get method_4949() : String
      {
         return this.var_317;
      }
      
      function method_2225() : void
      {
         if(false)
         {
            --var_4917[this.var_317];
            if(false)
            {
               this.method_4851();
            }
         }
      }
      
      protected function method_482() : void
      {
         if(true)
         {
            var_4917[this.var_317] = 0;
         }
         ++var_4917[this.var_317];
      }
      
      private function method_4851() : void
      {
         var _loc2_:* = null;
         delete var_4917[this.var_317];
         var _loc1_:int = this.var_4815 - 1;
         while(_loc1_ < this.frames)
         {
            _loc2_ = this.method_4949 + "_" + _loc1_;
            (cache[_loc2_] as class_1573).dispose();
            delete cache[_loc2_];
            _loc1_++;
         }
      }
      
      public function set fps(param1:int) : void
      {
         this.var_267 = param1;
         this.var_2109 = 1000 / Number(this.var_267);
      }
      
      public function get fps() : int
      {
         return this.var_267;
      }
      
      public function set method_693(param1:Boolean) : void
      {
         this.var_522 = param1;
      }
      
      public function get method_693() : Boolean
      {
         return this.var_522;
      }
      
      protected function method_3735() : Boolean
      {
         if(this.var_4199 > this.var_1559)
         {
            throw new Error("endFrame exceeds total frames of the movieclip!");
         }
         if(this.var_4815 < 1)
         {
            throw new Error("startFrame must be 1 or higher!");
         }
         if(this.var_317 == null || this.var_317.length == 0)
         {
            throw new Error("BitmapClip needs a valid cacheID");
         }
         return true;
      }
   }
}
