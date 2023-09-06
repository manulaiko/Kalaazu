package package_29
{
   import flash.utils.Dictionary;
   import package_19.class_68;
   import package_19.class_70;
   
   public class class_89
   {
      
      private static const const_257:Vector.<Class> = new Vector.<Class>();
       
      
      public const const_1154:class_68 = new class_70(Number);
      
      private var var_341:Vector.<class_85>;
      
      private var var_1634:Object;
      
      private var var_54:Dictionary;
      
      public function class_89()
      {
         var _loc1_:* = null;
         this.var_341 = new Vector.<class_85>();
         this.var_1634 = {};
         this.var_54 = new Dictionary();
         super();
         for each(_loc1_ in const_257)
         {
            this.var_54[_loc1_] = new class_84();
         }
      }
      
      public static function method_5405(param1:Class) : void
      {
         const_257.push(param1);
      }
      
      public function get method_1792() : Vector.<class_85>
      {
         return this.var_341.concat();
      }
      
      public function method_4903(param1:class_85) : class_85
      {
         var _loc3_:* = null;
         var _loc4_:* = undefined;
         var _loc5_:* = null;
         var _loc2_:int = !!param1 ? int(this.var_341.indexOf(param1)) : 0;
         if(_loc2_ == -1)
         {
            this.method_918(param1.id);
            this.var_341.push(param1);
            this.var_1634[param1.id] = param1;
            param1.name_110.add(this.name_110);
            param1.name_33.add(this.name_33);
            param1.method_125(this);
            for each(_loc3_ in param1.traits)
            {
               for(_loc4_ in this.var_54)
               {
                  if(_loc3_ is _loc4_)
                  {
                     (_loc5_ = this.var_54[_loc4_] as class_84).addTrait(_loc3_);
                  }
               }
            }
         }
         this.const_1154.dispatch(param1.id);
         return param1;
      }
      
      public function removeEntity(param1:class_85) : class_85
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:int = !!param1 ? int(this.var_341.indexOf(param1)) : -1;
         if(_loc2_ != -1)
         {
            param1.name_110.remove(this.name_110);
            param1.name_33.remove(this.name_33);
            _loc4_ = param1.traits.length - 1;
            while(_loc4_ >= 0)
            {
               _loc3_ = param1.traits[_loc4_];
               for each(_loc5_ in this.var_54)
               {
                  _loc5_.removeTrait(_loc3_);
               }
               _loc4_--;
            }
            this.var_341.splice(_loc2_,1);
            this.var_1634[param1.id] = null;
            delete this.var_1634[param1.id];
            param1.method_166();
         }
         return param1;
      }
      
      public function method_918(param1:int) : class_85
      {
         return this.removeEntity(this.method_327(param1));
      }
      
      public function method_2390(param1:int, param2:Class) : void
      {
         var _loc3_:class_85 = this.method_327(param1);
         if(_loc3_)
         {
            _loc3_.method_2049(param2);
         }
      }
      
      public function removeAll() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = null;
         for(_loc1_ in this.var_54)
         {
            class_84(this.var_54[_loc1_]).removeAllTraits();
         }
         while(this.var_341.length > 0)
         {
            _loc2_ = this.var_341.pop() as class_85;
            _loc2_.name_110.remove(this.name_110);
            _loc2_.name_33.remove(this.name_33);
            _loc2_.method_166();
         }
         this.var_1634 = {};
      }
      
      public function method_327(param1:int) : class_85
      {
         return this.var_1634[param1] as class_85;
      }
      
      public function method_5540(param1:Class) : Vector.<class_85>
      {
         var _loc4_:* = null;
         var _loc2_:Vector.<class_85> = new Vector.<class_85>();
         var _loc3_:uint = uint(this.var_341.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if((_loc4_ = this.var_341[_loc5_]) is param1)
            {
               _loc2_.push(_loc4_);
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function method_3044() : class_85
      {
         return this.var_341[int(Math.random() * Number(this.var_341.length))] as class_85;
      }
      
      public function method_3623(param1:Class) : class_85
      {
         var _loc2_:Vector.<class_267> = class_84(this.method_328(param1)).traits;
         return _loc2_.length > 0 ? _loc2_[int(Math.random() * _loc2_.length)].owner : null;
      }
      
      public function method_5806(param1:int, param2:Class) : class_267
      {
         var _loc3_:class_85 = this.method_327(param1);
         return !!_loc3_ ? _loc3_.method_1954(param2) : null;
      }
      
      public function method_2987(param1:int, param2:Class) : Vector.<class_267>
      {
         var _loc3_:class_85 = this.method_327(param1);
         return !!_loc3_ ? _loc3_.getTraits(param2) : null;
      }
      
      public function method_2677(param1:int, param2:class_267) : class_267
      {
         var _loc3_:class_85 = this.method_327(param1);
         return !!_loc3_ ? _loc3_.addTrait(param2) : null;
      }
      
      public function method_328(param1:*) : class_84
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:class_84 = this.var_54[param1];
         if(_loc2_ == null)
         {
            _loc2_ = this.var_54[param1] = new class_84();
            _loc5_ = this.var_341.length - 1;
            while(_loc5_ >= 0)
            {
               _loc3_ = this.var_341[_loc5_];
               _loc6_ = _loc3_.traits.length - 1;
               while(_loc6_ >= 0)
               {
                  if((_loc4_ = _loc3_.traits[_loc6_]) is param1)
                  {
                     _loc2_.addTrait(_loc4_);
                  }
                  _loc6_--;
               }
               _loc5_--;
            }
         }
         return _loc2_;
      }
      
      private function name_110(param1:class_267) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = null;
         for(_loc2_ in this.var_54)
         {
            if(param1 is _loc2_)
            {
               _loc3_ = this.var_54[_loc2_] as class_84;
               _loc3_.addTrait(param1);
            }
         }
      }
      
      private function name_33(param1:class_267) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = null;
         for(_loc2_ in this.var_54)
         {
            if(param1 is _loc2_)
            {
               _loc3_ = this.var_54[_loc2_] as class_84;
               _loc3_.removeTrait(param1);
            }
         }
      }
   }
}
