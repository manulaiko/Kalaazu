package package_429
{
   import away3d.arcane;
   import flash.display3D.textures.TextureBase;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.geom.Matrix3D;
   import flash.geom.Rectangle;
   import package_295.class_2128;
   import package_299.class_1757;
   import package_299.class_2573;
   import package_300.class_2152;
   import package_305.class_1767;
   import package_371.class_2125;
   
   public class CascadeShadowMapper extends DirectionalShadowMapper implements IEventDispatcher
   {
       
      
      protected var var_3372:Vector.<Rectangle>;
      
      private var var_932:Boolean = true;
      
      private var var_1678:Vector.<Number>;
      
      private var var_4631:int;
      
      private var var_1178:Vector.<class_1767>;
      
      private var var_3947:Vector.<class_2573>;
      
      private var var_2011:Vector.<Number>;
      
      private var var_3688:Vector.<Number>;
      
      private var var_543:EventDispatcher;
      
      private var var_1849:Vector.<Number>;
      
      public function CascadeShadowMapper(param1:uint = 3)
      {
         super();
         if(param1 < 1 || param1 > 4)
         {
            throw new Error("numCascades must be an integer between 1 and 4");
         }
         this.var_4631 = param1;
         this.var_543 = new EventDispatcher(this);
         this.init();
      }
      
      public function method_3936(param1:uint) : Number
      {
         return this.var_1678[param1];
      }
      
      public function method_429(param1:uint, param2:Number) : void
      {
         if(param2 < 0)
         {
            param2 = 0;
         }
         else if(param2 > 1)
         {
            param2 = 1;
         }
         if(param1 >= this.var_4631)
         {
            throw new Error("index must be smaller than the number of cascades!");
         }
         this.var_1678[param1] = param2;
      }
      
      public function method_1836(param1:uint) : Matrix3D
      {
         return this.var_1178[param1].method_2785;
      }
      
      private function init() : void
      {
         this.var_1678 = new Vector.<Number>(this.var_4631,true);
         this.var_1849 = new Vector.<Number>(this.var_4631,true);
         var _loc1_:Number = 1;
         var _loc2_:int = this.var_4631 - 1;
         while(_loc2_ >= 0)
         {
            this.var_1678[_loc2_] = _loc1_;
            _loc1_ *= 0.4;
            _loc2_--;
         }
         this.var_2011 = new <Number>[-1,1,-1,1];
         this.var_3688 = new <Number>[1,1,-1,-1];
         this.var_3372 = new Vector.<Rectangle>(4,true);
         this.var_3947 = new Vector.<class_2573>();
         this.var_1178 = new Vector.<class_1767>();
         _loc2_ = 0;
         while(_loc2_ < this.var_4631)
         {
            this.var_3947[_loc2_] = new class_2573();
            this.var_1178[_loc2_] = new class_1767(this.var_3947[_loc2_]);
            _loc2_++;
         }
      }
      
      override public function set depthMapSize(param1:uint) : void
      {
         if(param1 == var_3256)
         {
            return;
         }
         super.depthMapSize = param1;
         this.method_6402();
      }
      
      private function method_6402() : void
      {
         this.var_932 = true;
      }
      
      public function get method_191() : int
      {
         return this.var_4631;
      }
      
      public function set method_191(param1:int) : void
      {
         if(param1 == this.var_4631)
         {
            return;
         }
         if(param1 < 1 || param1 > 4)
         {
            throw new Error("numCascades must be an integer between 1 and 4");
         }
         this.var_4631 = param1;
         this.method_6402();
         this.init();
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      override protected function method_2669(param1:TextureBase, param2:class_2128, param3:class_2152) : void
      {
         if(this.var_932)
         {
            this.method_4838();
         }
         var_3449.method_4664 = var_1168;
         var_3449.camera = var_1887;
         var_3449.clear();
         param2.method_2653(var_3449);
         param3.arcane::method_5201(var_3449,param1,this.var_4631,this.var_3372,this.var_1178);
         var_3449.method_1140();
      }
      
      private function method_4838() : void
      {
         var _loc1_:Number = Number(var_3256) * 0.5;
         this.var_3372[0] = new Rectangle(0,0,_loc1_,_loc1_);
         this.var_3372[1] = new Rectangle(_loc1_,0,_loc1_,_loc1_);
         this.var_3372[2] = new Rectangle(0,_loc1_,_loc1_,_loc1_);
         this.var_3372[3] = new Rectangle(_loc1_,_loc1_,_loc1_,_loc1_);
         this.var_932 = false;
      }
      
      override protected function method_873(param1:class_1767) : void
      {
         var _loc2_:* = null;
         var _loc3_:class_1757 = param1.lens;
         var _loc4_:Number = Number(_loc3_.method_5049);
         var _loc5_:Number = Number(_loc3_.method_1840) - _loc4_;
         method_5949(param1,param1.lens.method_2727,_matrix);
         _matrix.appendScale(0.96,0.96,1);
         var_1025.matrix = _matrix;
         method_631(param1);
         var _loc6_:int = 0;
         while(_loc6_ < this.var_4631)
         {
            _loc2_ = this.var_3947[_loc6_].matrix;
            this.var_1849[_loc6_] = _loc4_ + Number(this.var_1678[_loc6_]) * _loc5_;
            this.var_1178[_loc6_].transform = var_1887.transform;
            this.method_2481(_loc2_,this.var_1678[_loc6_],this.var_2011[_loc6_],this.var_3688[_loc6_]);
            this.var_3947[_loc6_].matrix = _loc2_;
            _loc6_++;
         }
      }
      
      private function method_2481(param1:Matrix3D, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc5_:Vector.<Number> = class_2125.const_2368;
         var _loc12_:Number = 0;
         var _loc13_:Number = 0;
         var _loc15_:Number = 0;
         var _loc16_:Number = 0;
         var _loc17_:Number = 0;
         var _loc18_:* = 0;
         while(_loc18_ < 12)
         {
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            _loc9_ = _loc6_ + (0 - _loc6_) * param2;
            _loc10_ = _loc7_ + (0 - _loc7_) * param2;
            _loc11_ = _loc8_ + (0 - _loc8_) * param2;
            if(_loc6_ < _loc12_)
            {
               _loc12_ = _loc6_;
            }
            if(_loc6_ > _loc15_)
            {
               _loc15_ = _loc6_;
            }
            if(_loc7_ < _loc13_)
            {
               _loc13_ = _loc7_;
            }
            if(_loc7_ > _loc16_)
            {
               _loc16_ = _loc7_;
            }
            if(_loc8_ > _loc17_)
            {
               _loc17_ = _loc8_;
            }
            if(_loc9_ < _loc12_)
            {
               _loc12_ = _loc9_;
            }
            if(_loc9_ > _loc15_)
            {
               _loc15_ = _loc9_;
            }
            if(_loc10_ < _loc13_)
            {
               _loc13_ = _loc10_;
            }
            if(_loc10_ > _loc16_)
            {
               _loc16_ = _loc10_;
            }
            if(_loc11_ > _loc17_)
            {
               _loc17_ = _loc11_;
            }
            _loc18_ += 3;
         }
         _loc14_ = 1;
         var _loc19_:Number = _loc15_ - _loc12_;
         var _loc20_:Number = _loc16_ - _loc13_;
         var _loc21_:Number = 1 / (_loc17_ - _loc14_);
         if(_loc12_ < 0)
         {
            _loc12_ -= var_4925;
         }
         if(_loc13_ < 0)
         {
            _loc13_ -= var_4925;
         }
         _loc12_ = int(_loc12_ / Number(var_4925)) * Number(var_4925);
         _loc13_ = int(_loc13_ / Number(var_4925)) * Number(var_4925);
         var _loc22_:Number = 2 * Number(var_4925);
         _loc19_ = int(_loc19_ / _loc22_ + 1) * _loc22_;
         _loc20_ = int(_loc20_ / _loc22_ + 1) * _loc22_;
         _loc15_ = _loc12_ + _loc19_;
         _loc16_ = _loc13_ + _loc20_;
         _loc19_ = 1 / _loc19_;
         _loc20_ = 1 / _loc20_;
         _loc5_[0] = 2 * _loc19_;
         _loc5_[5] = 2 * _loc20_;
         _loc5_[10] = _loc21_;
         _loc5_[12] = -(_loc15_ + _loc12_) * _loc19_;
         _loc5_[13] = -(_loc16_ + _loc13_) * _loc20_;
         _loc5_[14] = -_loc14_ * _loc21_;
         _loc5_[15] = 1;
         _loc5_[1] = _loc5_[2] = _loc5_[3] = _loc5_[4] = _loc5_[6] = _loc5_[7] = _loc5_[8] = _loc5_[9] = _loc5_[11] = 0;
         param1.copyRawDataFrom(_loc5_);
         param1.appendScale(0.96,0.96,1);
         param1.appendTranslation(param3,param4,0);
         param1.appendScale(0.5,0.5,1);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this.var_543.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this.var_543.removeEventListener(param1,param2,param3);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this.var_543.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this.var_543.hasEventListener(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this.var_543.willTrigger(param1);
      }
      
      arcane function get method_1145() : Vector.<Number>
      {
         return this.var_1849;
      }
   }
}
