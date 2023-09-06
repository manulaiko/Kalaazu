package package_307
{
   import away3d.animators.class_2234;
   import away3d.arcane;
   import flash.display.BlendMode;
   import flash.display3D.Context3D;
   import flash.events.Event;
   import flash.geom.Matrix3D;
   import package_198.class_1208;
   import package_293.class_1749;
   import package_293.class_1751;
   import package_293.class_2131;
   import package_294.class_2113;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_309.class_1774;
   import package_309.class_2235;
   import package_309.class_2236;
   import package_363.class_2100;
   import package_376.class_2145;
   
   public class class_1772 extends class_1749 implements class_1751
   {
      
      private static var var_2945:uint = 0;
       
      
      public var extra:Object;
      
      arcane var var_1760:String;
      
      arcane var var_2727:uint;
      
      arcane var var_60:int;
      
      arcane var var_2666:int;
      
      private var var_1658:Boolean;
      
      private var var_1183:class_2234;
      
      private var var_2146:Vector.<class_2113>;
      
      private var var_3218:Boolean;
      
      private var _blendMode:String = "normal";
      
      protected var var_1988:uint;
      
      protected var var_746:Vector.<class_1774>;
      
      protected var var_2370:Boolean = true;
      
      protected var _smooth:Boolean = true;
      
      protected var _repeat:Boolean;
      
      protected var var_2616:class_2235;
      
      protected var var_4376:class_2236;
      
      protected var var_1149:class_2100;
      
      private var var_1996:Boolean;
      
      private var var_4718:String = "lessEqual";
      
      public function class_1772()
      {
         super();
         this.var_2146 = new Vector.<class_2113>();
         this.var_746 = new Vector.<class_1774>();
         this.var_2616 = new class_2235();
         this.var_4376 = new class_2236();
         this.var_2616.addEventListener(Event.CHANGE,this.method_5795);
         this.var_4376.addEventListener(Event.CHANGE,this.method_3102);
         this.alphaPremultiplied = true;
         this.arcane::var_2727 = var_2945++;
      }
      
      public function get assetType() : String
      {
         return class_2131.const_808;
      }
      
      public function get lightPicker() : class_2100
      {
         return this.var_1149;
      }
      
      public function set lightPicker(param1:class_2100) : void
      {
         var _loc2_:* = 0;
         var _loc3_:Number = 0;
         if(param1 != this.var_1149)
         {
            this.var_1149 = param1;
            _loc2_ = uint(this.var_746.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               this.var_746[_loc3_].arcane::lightPicker = this.var_1149;
               _loc3_++;
            }
         }
      }
      
      public function get mipmap() : Boolean
      {
         return this.var_2370;
      }
      
      public function set mipmap(param1:Boolean) : void
      {
         this.var_2370 = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1988)
         {
            this.var_746[_loc2_].mipmap = param1;
            _loc2_++;
         }
         this.var_2616.mipmap = param1;
         this.var_4376.mipmap = param1;
      }
      
      public function get smooth() : Boolean
      {
         return this._smooth;
      }
      
      public function set smooth(param1:Boolean) : void
      {
         this._smooth = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1988)
         {
            this.var_746[_loc2_].smooth = param1;
            _loc2_++;
         }
         this.var_2616.smooth = param1;
         this.var_4376.smooth = param1;
      }
      
      public function get depthCompareMode() : String
      {
         return this.var_4718;
      }
      
      public function set depthCompareMode(param1:String) : void
      {
         this.var_4718 = param1;
      }
      
      public function get repeat() : Boolean
      {
         return this._repeat;
      }
      
      public function set repeat(param1:Boolean) : void
      {
         this._repeat = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1988)
         {
            this.var_746[_loc2_].repeat = param1;
            _loc2_++;
         }
         this.var_2616.repeat = param1;
         this.var_4376.repeat = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:Number = 0;
         _loc1_ = 0;
         while(_loc1_ < this.var_1988)
         {
            this.var_746[_loc1_].dispose();
            _loc1_++;
         }
         this.var_2616.dispose();
         this.var_4376.dispose();
         this.var_2616.removeEventListener(Event.CHANGE,this.method_5795);
         this.var_4376.removeEventListener(Event.CHANGE,this.method_3102);
      }
      
      public function get bothSides() : Boolean
      {
         return this.var_1658;
      }
      
      public function set bothSides(param1:Boolean) : void
      {
         this.var_1658 = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1988)
         {
            this.var_746[_loc2_].bothSides = param1;
            _loc2_++;
         }
         this.var_2616.bothSides = param1;
         this.var_4376.bothSides = param1;
      }
      
      public function get blendMode() : String
      {
         return this._blendMode;
      }
      
      public function set blendMode(param1:String) : void
      {
         this._blendMode = param1;
      }
      
      public function get alphaPremultiplied() : Boolean
      {
         return this.var_3218;
      }
      
      public function set alphaPremultiplied(param1:Boolean) : void
      {
         this.var_3218 = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1988)
         {
            this.var_746[_loc2_].alphaPremultiplied = param1;
            _loc2_++;
         }
      }
      
      public function get method_4490() : Boolean
      {
         return this._blendMode != BlendMode.NORMAL;
      }
      
      public function get method_1231() : uint
      {
         return this.arcane::var_2727;
      }
      
      arcane function get numPasses() : uint
      {
         return this.var_1988;
      }
      
      arcane function method_2221() : Boolean
      {
         return this.var_2616.alphaThreshold > 0;
      }
      
      arcane function method_1463(param1:class_1208, param2:class_1767, param3:Boolean = false) : void
      {
         this.var_1996 = param3;
         if(param3)
         {
            this.var_4376.arcane::activate(param1,param2);
         }
         else
         {
            this.var_2616.arcane::activate(param1,param2);
         }
      }
      
      arcane function method_4073(param1:class_1208) : void
      {
         if(this.var_1996)
         {
            this.var_4376.arcane::deactivate(param1);
         }
         else
         {
            this.var_2616.arcane::deactivate(param1);
         }
      }
      
      arcane function method_4057(param1:class_2133, param2:class_1208, param3:class_1767, param4:Matrix3D) : void
      {
         if(this.var_1996)
         {
            if(param1.animator)
            {
               this.var_4376.arcane::method_545(param1,param2,param3);
            }
            this.var_4376.arcane::render(param1,param2,param3,param4);
         }
         else
         {
            if(param1.animator)
            {
               this.var_2616.arcane::method_545(param1,param2,param3);
            }
            this.var_2616.arcane::render(param1,param2,param3,param4);
         }
      }
      
      arcane function method_10(param1:uint) : Boolean
      {
         return this.var_746[param1].method_2502;
      }
      
      arcane function method_5696(param1:uint, param2:class_1208, param3:class_1767) : void
      {
         this.var_746[param1].arcane::activate(param2,param3);
      }
      
      arcane function method_3124(param1:uint, param2:class_1208) : void
      {
         this.var_746[param1].arcane::deactivate(param2);
      }
      
      arcane function method_3858(param1:uint, param2:class_2133, param3:class_1208, param4:class_2145, param5:Matrix3D) : void
      {
         if(this.var_1149)
         {
            this.var_1149.method_2281(param2,param4);
         }
         var _loc6_:class_1774 = this.var_746[param1];
         if(param2.animator)
         {
            _loc6_.arcane::method_545(param2,param3,param4.camera);
         }
         _loc6_.arcane::render(param2,param3,param4.camera,param5);
      }
      
      arcane function method_3466(param1:class_2113) : void
      {
         var _loc2_:int = 0;
         this.var_2146.push(param1);
         if(param1.animator)
         {
            if(Boolean(this.var_1183) && param1.animator.animationSet != this.var_1183)
            {
               throw new Error("A Material instance cannot be shared across renderables with different animator libraries");
            }
            if(this.var_1183 != param1.animator.animationSet)
            {
               this.var_1183 = param1.animator.animationSet;
               _loc2_ = 0;
               while(_loc2_ < this.var_1988)
               {
                  this.var_746[_loc2_].animationSet = this.var_1183;
                  _loc2_++;
               }
               this.var_2616.animationSet = this.var_1183;
               this.var_4376.animationSet = this.var_1183;
               this.arcane::method_6504(null);
            }
         }
      }
      
      arcane function method_4342(param1:class_2113) : void
      {
         var _loc2_:int = 0;
         this.var_2146.splice(this.var_2146.indexOf(param1),1);
         if(this.var_2146.length == 0)
         {
            this.var_1183 = null;
            _loc2_ = 0;
            while(_loc2_ < this.var_1988)
            {
               this.var_746[_loc2_].animationSet = this.var_1183;
               _loc2_++;
            }
            this.var_2616.animationSet = this.var_1183;
            this.var_4376.animationSet = this.var_1183;
            this.arcane::method_6504(null);
         }
      }
      
      arcane function get method_5999() : Vector.<class_2113>
      {
         return this.var_2146;
      }
      
      arcane function method_3403(param1:Context3D) : void
      {
      }
      
      arcane function deactivate(param1:class_1208) : void
      {
         this.var_746[this.var_1988 - 1].arcane::deactivate(param1);
      }
      
      arcane function method_6504(param1:class_1774) : void
      {
         var _loc2_:* = null;
         this.var_2616.arcane::method_220();
         this.var_4376.arcane::method_220();
         if(this.var_1183)
         {
            this.var_1183.method_4843();
            for each(_loc2_ in this.var_2146)
            {
               if(_loc2_.animator)
               {
                  _loc2_.animator.method_3058(this.var_2616);
                  _loc2_.animator.method_3058(this.var_4376);
               }
            }
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.var_1988)
         {
            if(this.var_746[_loc3_] != param1)
            {
               this.var_746[_loc3_].arcane::method_220(false);
            }
            if(this.var_1183)
            {
               for each(_loc2_ in this.var_2146)
               {
                  if(_loc2_.animator)
                  {
                     _loc2_.animator.method_3058(this.var_746[_loc3_]);
                  }
               }
            }
            _loc3_++;
         }
      }
      
      protected function method_5823(param1:class_1774) : void
      {
         this.var_746.splice(this.var_746.indexOf(param1),1);
         --this.var_1988;
      }
      
      protected function method_2800() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.var_1988)
         {
            this.var_746[_loc1_].removeEventListener(Event.CHANGE,this.method_6339);
            _loc1_++;
         }
         this.var_746.length = 0;
         this.var_1988 = 0;
      }
      
      protected function method_5388(param1:class_1774) : void
      {
         var _loc2_:* = this.var_1988++;
         this.var_746[_loc2_] = param1;
         param1.animationSet = this.var_1183;
         param1.alphaPremultiplied = this.var_3218;
         param1.mipmap = this.var_2370;
         param1.smooth = this._smooth;
         param1.repeat = this._repeat;
         param1.arcane::lightPicker = this.var_1149;
         param1.bothSides = this.var_1658;
         param1.addEventListener(Event.CHANGE,this.method_6339);
         this.arcane::method_6504(null);
      }
      
      private function method_6339(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:Number = 1;
         this.arcane::var_60 = 0;
         var _loc5_:int = 0;
         while(_loc5_ < this.var_1988)
         {
            _loc3_ = this.var_746[_loc5_].arcane::var_4423;
            _loc4_ = _loc3_.length;
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               if(_loc3_[_loc6_] != -1)
               {
                  this.arcane::var_60 += _loc2_ * _loc3_[_loc6_];
                  _loc6_ = _loc4_;
               }
               _loc6_++;
            }
            _loc2_ *= 1000;
            _loc5_++;
         }
      }
      
      private function method_3102(param1:Event) : void
      {
         var _loc2_:Vector.<int> = this.var_4376.arcane::var_4423;
         var _loc3_:uint = _loc2_.length;
         this.arcane::var_2666 = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] != -1)
            {
               this.arcane::var_2666 += _loc2_[_loc4_];
               _loc4_ = _loc3_;
            }
            _loc4_++;
         }
      }
      
      private function method_5795(param1:Event) : void
      {
         var _loc2_:Vector.<int> = this.var_2616.arcane::var_4423;
         var _loc3_:uint = _loc2_.length;
         this.arcane::var_2666 = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] != -1)
            {
               this.arcane::var_2666 += _loc2_[_loc4_];
               _loc4_ = _loc3_;
            }
            _loc4_++;
         }
      }
   }
}
