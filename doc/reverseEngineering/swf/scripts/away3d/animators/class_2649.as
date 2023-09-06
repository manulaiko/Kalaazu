package away3d.animators
{
   import away3d.arcane;
   import flash.display3D.Context3DProgramType;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import package_198.*;
   import package_294.*;
   import package_305.class_1767;
   import package_307.*;
   import package_309.*;
   import package_386.*;
   import package_430.class_2706;
   import package_430.class_2707;
   import package_487.class_2700;
   
   public class class_2649 extends class_2119 implements class_2120
   {
       
      
      private var var_1169:class_2706;
      
      private var var_4921:class_2665;
      
      private var _frame:class_2666;
      
      private var var_2822:Vector.<Number>;
      
      private var var_267:uint = 10;
      
      private var var_4023:uint = 100;
      
      private var var_1832:uint;
      
      private var var_848:Boolean;
      
      private var var_2044:Boolean;
      
      private var var_2738:Boolean;
      
      private var var_4101:Boolean;
      
      public function class_2649(param1:class_2665)
      {
         this._frame = new class_2666();
         super(param1);
         this.var_4921 = param1;
         this.var_2822 = new Vector.<Number>();
      }
      
      public function set fps(param1:uint) : void
      {
         this.var_4023 = 1000 / param1;
         this.var_267 = param1;
      }
      
      public function get fps() : uint
      {
         return this.var_267;
      }
      
      public function set reverse(param1:Boolean) : void
      {
         this.var_848 = param1;
         this.var_2738 = true;
      }
      
      public function get reverse() : Boolean
      {
         return this.var_848;
      }
      
      public function set backAndForth(param1:Boolean) : void
      {
         this.var_2044 = param1;
         this.var_2738 = true;
      }
      
      public function get backAndForth() : Boolean
      {
         return this.var_2044;
      }
      
      public function gotoAndPlay(param1:uint) : void
      {
         this.method_749(param1,true);
      }
      
      public function gotoAndStop(param1:uint) : void
      {
         this.method_749(param1,false);
      }
      
      public function get currentFrameNumber() : uint
      {
         return class_2707(var_1036).currentFrameNumber;
      }
      
      public function get totalFrames() : uint
      {
         return class_2707(var_1036).arcane::totalFrames;
      }
      
      public function setRenderState(param1:class_1208, param2:class_2133, param3:int, param4:int, param5:class_1767) : void
      {
         var _loc8_:Boolean = false;
         var _loc6_:class_1772;
         if(!(_loc6_ = param2.material) || !_loc6_ is class_1776)
         {
            return;
         }
         var _loc7_:class_2398;
         if(!(_loc7_ = param2 as class_2398))
         {
            return;
         }
         if(_loc6_ is class_2708 && Boolean(this.var_4101))
         {
            _loc8_ = Boolean(class_2708(_loc6_).arcane::swap(this._frame.mapID));
         }
         if(!_loc8_)
         {
            this.var_2822[0] = this._frame.name_131;
            this.var_2822[1] = this._frame.name_63;
            this.var_2822[2] = this._frame.name_38;
            this.var_2822[3] = this._frame.name_72;
         }
         param1.arcane::var_4582.setProgramConstantsFromVector(Context3DProgramType.VERTEX,param3,this.var_2822);
      }
      
      public function play(param1:String, param2:class_2700 = null, param3:Number = NaN) : void
      {
         param2 = param2;
         param3 = param3;
         if(var_203 == param1)
         {
            return;
         }
         var_203 = param1;
         if(!var_1183.method_294(param1))
         {
            throw new Error("Animation root node " + param1 + " not found!");
         }
         var_4381 = var_1183.method_1957(param1);
         var_1036 = method_3412(var_4381);
         this._frame = class_2707(var_1036).currentFrameData;
         this.var_1169 = var_1036 as class_2706;
         start();
      }
      
      override public function set time(param1:int) : void
      {
         if(this.var_2738)
         {
            class_2707(this.var_1169).reverse = this.var_848;
            class_2707(this.var_1169).backAndForth = this.var_2044;
            this.var_2738 = false;
         }
         super.time = param1;
         var _loc2_:int = getTimer();
         if(_loc2_ - Number(this.var_1832) > this.var_4023)
         {
            this.var_4101 = true;
            this.var_1169.time = param1;
            this._frame = class_2707(this.var_1169).currentFrameData;
            this.var_1832 = _loc2_;
         }
         else
         {
            this.var_4101 = false;
         }
      }
      
      public function method_3058(param1:class_1774) : void
      {
      }
      
      public function clone() : class_2120
      {
         return new class_2649(this.var_4921);
      }
      
      private function method_749(param1:uint, param2:Boolean) : void
      {
         if(!var_1036)
         {
            return;
         }
         class_2707(var_1036).currentFrameNumber = param1 == 0 ? param1 : param1 - 1;
         var _loc3_:uint = uint(this._frame.mapID);
         this._frame = class_2707(this.var_1169).currentFrameData;
         if(param2)
         {
            start();
         }
         else if(_loc3_ != this._frame.mapID)
         {
            this.var_4101 = true;
            setTimeout(stop,this.var_267);
         }
         else
         {
            stop();
         }
      }
   }
}
