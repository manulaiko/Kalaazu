package package_304
{
   import away3d.animators.class_2120;
   import away3d.arcane;
   import package_199.*;
   import package_293.*;
   import package_294.*;
   import package_295.*;
   import package_307.*;
   import package_372.*;
   import package_441.class_2430;
   
   public class class_2114 extends class_1766 implements class_2113, class_1751
   {
       
      
      private var var_4324:Vector.<class_2398>;
      
      protected var name_69:class_2429;
      
      private var var_642:class_1772;
      
      private var _animator:class_2120;
      
      private var var_3249:Boolean = true;
      
      private var var_2167:Boolean = true;
      
      public var name_55:Object;
      
      public function class_2114(param1:class_2429, param2:class_1772 = null)
      {
         super();
         this.var_4324 = new Vector.<class_2398>();
         this.geometry = param1 || new class_2429();
         this.material = param2 || class_2430.method_782(this);
      }
      
      public function method_1273() : void
      {
         this.geometry.method_1695(transform);
         transform.identity();
      }
      
      override public function get assetType() : String
      {
         return class_2131.const_3013;
      }
      
      private function method_872(param1:class_2428) : void
      {
         method_1513();
      }
      
      public function get method_825() : Boolean
      {
         return this.var_3249;
      }
      
      public function set method_825(param1:Boolean) : void
      {
         this.var_3249 = param1;
      }
      
      public function get animator() : class_2120
      {
         return this._animator;
      }
      
      public function set animator(param1:class_2120) : void
      {
         var _loc4_:* = null;
         if(this._animator)
         {
            this._animator.method_4342(this);
         }
         this._animator = param1;
         var _loc2_:class_1772 = this.material;
         this.material = null;
         this.material = _loc2_;
         var _loc3_:uint = uint(this.var_4324.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = (_loc4_ = this.var_4324[_loc5_]).arcane::var_642;
            if(_loc2_)
            {
               _loc4_.material = null;
               _loc4_.material = _loc2_;
            }
            _loc5_++;
         }
         if(this._animator)
         {
            this._animator.method_3466(this);
         }
      }
      
      public function get geometry() : class_2429
      {
         return this.name_69;
      }
      
      public function set geometry(param1:class_2429) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:* = null;
         if(this.name_69)
         {
            this.name_69.removeEventListener(class_2428.const_125,this.method_872);
            this.name_69.removeEventListener(class_2428.const_1195,this.method_4013);
            this.name_69.removeEventListener(class_2428.const_2516,this.method_3532);
            _loc2_ = 0;
            while(_loc2_ < this.var_4324.length)
            {
               this.var_4324[_loc2_].dispose();
               _loc2_++;
            }
            this.var_4324.length = 0;
         }
         this.name_69 = param1;
         if(this.name_69)
         {
            this.name_69.addEventListener(class_2428.const_125,this.method_872);
            this.name_69.addEventListener(class_2428.const_1195,this.method_4013);
            this.name_69.addEventListener(class_2428.const_2516,this.method_3532);
            _loc3_ = this.name_69.subGeometries;
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               this.method_4311(_loc3_[_loc2_]);
               _loc2_++;
            }
         }
         if(this.var_642)
         {
            this.var_642.arcane::method_4342(this);
            this.var_642.arcane::method_3466(this);
         }
      }
      
      public function get material() : class_1772
      {
         return this.var_642;
      }
      
      public function set material(param1:class_1772) : void
      {
         if(param1 == this.var_642)
         {
            return;
         }
         if(this.var_642)
         {
            this.var_642.arcane::method_4342(this);
         }
         this.var_642 = param1;
         if(this.var_642)
         {
            this.var_642.arcane::method_3466(this);
         }
      }
      
      public function get method_3381() : Vector.<class_2398>
      {
         this.name_69.arcane::validate();
         return this.var_4324;
      }
      
      public function get shareAnimationGeometry() : Boolean
      {
         return this.var_2167;
      }
      
      public function set shareAnimationGeometry(param1:Boolean) : void
      {
         this.var_2167 = param1;
      }
      
      public function method_4840() : void
      {
         var _loc1_:int = int(this.var_4324.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.var_4324[_loc2_].var_1937 = null;
            _loc2_++;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.material = null;
         this.geometry = null;
      }
      
      public function method_718() : void
      {
         method_729();
         if(this._animator)
         {
            this._animator.dispose();
         }
      }
      
      override public function clone() : class_1750
      {
         var _loc1_:class_2114 = new class_2114(this.name_69,this.var_642);
         _loc1_.transform = transform;
         _loc1_.method_1773 = method_1773;
         _loc1_.method_4119 = method_4119;
         _loc1_.bounds = _bounds.clone();
         _loc1_.name = name;
         _loc1_.method_825 = this.method_825;
         _loc1_.shareAnimationGeometry = this.shareAnimationGeometry;
         _loc1_.mouseEnabled = this.mouseEnabled;
         _loc1_.mouseChildren = this.mouseChildren;
         _loc1_.extra = this.extra;
         var _loc2_:int = int(this.var_4324.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.var_4324[_loc3_].arcane::var_642 = this.var_4324[_loc3_].arcane::var_642;
            _loc3_++;
         }
         _loc2_ = int(numChildren);
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.addChild(class_1752(getChildAt(_loc3_).clone()));
            _loc3_++;
         }
         if(this._animator)
         {
            _loc1_.animator = this._animator.clone();
         }
         return _loc1_;
      }
      
      override protected function updateBounds() : void
      {
         _bounds.method_5132(this.name_69);
         var_2006 = false;
      }
      
      override protected function method_1737() : class_2225
      {
         return new class_2431(this);
      }
      
      private function method_4013(param1:class_2428) : void
      {
         this.method_4311(param1.subGeometry);
      }
      
      private function method_3532(param1:class_2428) : void
      {
         var _loc2_:* = null;
         var _loc5_:Number = 0;
         var _loc3_:class_2425 = param1.subGeometry;
         var _loc4_:int = int(this.var_4324.length);
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_4324[_loc5_];
            if(_loc2_.subGeometry == _loc3_)
            {
               _loc2_.dispose();
               this.var_4324.splice(_loc5_,1);
               break;
            }
            _loc5_++;
         }
         _loc4_--;
         while(_loc5_ < _loc4_)
         {
            this.var_4324[_loc5_].arcane::_index = _loc5_;
            _loc5_++;
         }
      }
      
      private function method_4311(param1:class_2425) : void
      {
         var _loc2_:class_2398 = new class_2398(param1,this,null);
         var _loc3_:uint = uint(this.var_4324.length);
         _loc2_.arcane::_index = _loc3_;
         this.var_4324[_loc3_] = _loc2_;
         method_1513();
      }
      
      public function method_241(param1:class_2427) : class_2398
      {
         return this.var_4324[this.name_69.subGeometries.indexOf(param1)];
      }
      
      override arcane function method_2840(param1:Number, param2:Boolean) : Boolean
      {
         var _loc5_:* = null;
         arcane::var_1365.method_2991(arcane::var_643.var_2096,arcane::var_643.var_2996);
         arcane::var_643.var_3785 = null;
         var _loc3_:int = int(this.var_4324.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this.var_4324[_loc4_];
            if(arcane::var_1365.method_827(_loc5_,arcane::var_643,param1))
            {
               param1 = 0;
               arcane::var_643.var_3785 = _loc5_;
               if(!param2)
               {
                  return true;
               }
            }
            _loc4_++;
         }
         return false;
      }
   }
}
