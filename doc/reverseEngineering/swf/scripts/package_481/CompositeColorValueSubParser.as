package package_481
{
   import package_437.class_2592;
   import package_438.class_2421;
   import package_465.class_2594;
   import package_466.class_2595;
   import package_466.class_2598;
   import package_491.class_2730;
   
   public class CompositeColorValueSubParser extends class_2421
   {
       
      
      private var var_3426:class_2421;
      
      private var var_4562:class_2421;
      
      private var var_1696:class_2421;
      
      private var var_4275:class_2421;
      
      private var var_2449:class_2421;
      
      private var var_1482:class_2421;
      
      private var var_3140:class_2421;
      
      private var var_983:class_2421;
      
      public var usesMultiplier:Boolean;
      
      public var usesOffset:Boolean;
      
      public function CompositeColorValueSubParser(param1:String)
      {
         super(param1,const_1615);
      }
      
      public static function get identifier() : *
      {
         return class_2598.CompositeColorValueSubParser;
      }
      
      override protected function method_196() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(var_117)
         {
            if(_loc4_ = _data.redMultiplierValue)
            {
               this.usesMultiplier = true;
               _loc1_ = _loc4_.id;
               _loc2_ = _loc4_.data;
               _loc3_ = class_2592.method_6525(_loc1_,class_2595.const_2681);
               if(!_loc3_)
               {
                  method_444("Unknown value");
               }
               this.var_3426 = new _loc3_(null);
               method_4558(this.var_3426);
               this.var_3426.method_5169(_loc2_);
               _loc1_ = (_loc4_ = _data.greenMultiplierValue).id;
               _loc2_ = _loc4_.data;
               _loc3_ = class_2592.method_6525(_loc1_,class_2595.const_2681);
               if(!_loc3_)
               {
                  method_444("Unknown value");
               }
               this.var_4562 = new _loc3_(null);
               method_4558(this.var_4562);
               this.var_4562.method_5169(_loc2_);
               _loc1_ = (_loc4_ = _data.blueMultiplierValue).id;
               _loc2_ = _loc4_.data;
               _loc3_ = class_2592.method_6525(_loc1_,class_2595.const_2681);
               if(!_loc3_)
               {
                  method_444("Unknown value");
               }
               this.var_1696 = new _loc3_(null);
               method_4558(this.var_1696);
               this.var_1696.method_5169(_loc2_);
               _loc1_ = (_loc4_ = _data.alphaMultiplierValue).id;
               _loc2_ = _loc4_.data;
               _loc3_ = class_2592.method_6525(_loc1_,class_2595.const_2681);
               if(!_loc3_)
               {
                  method_444("Unknown value");
               }
               this.var_4275 = new _loc3_(null);
               method_4558(this.var_4275);
               this.var_4275.method_5169(_loc2_);
            }
            if(_loc4_ = _data.redOffsetValue)
            {
               this.usesOffset = true;
               _loc1_ = _loc4_.id;
               _loc2_ = _loc4_.data;
               _loc3_ = class_2592.method_6525(_loc1_,class_2595.const_2681);
               if(!_loc3_)
               {
                  method_444("Unknown value");
               }
               this.var_2449 = new _loc3_(null);
               method_4558(this.var_2449);
               this.var_2449.method_5169(_loc2_);
               _loc1_ = (_loc4_ = _data.greenOffsetValue).id;
               _loc2_ = _loc4_.data;
               _loc3_ = class_2592.method_6525(_loc1_,class_2595.const_2681);
               if(!_loc3_)
               {
                  method_444("Unknown value");
               }
               this.var_1482 = new _loc3_(null);
               method_4558(this.var_1482);
               this.var_1482.method_5169(_loc2_);
               _loc1_ = (_loc4_ = _data.blueOffsetValue).id;
               _loc2_ = _loc4_.data;
               _loc3_ = class_2592.method_6525(_loc1_,class_2595.const_2681);
               if(!_loc3_)
               {
                  method_444("Unknown value");
               }
               this.var_3140 = new _loc3_(null);
               method_4558(this.var_3140);
               this.var_3140.method_5169(_loc2_);
               _loc1_ = (_loc4_ = _data.alphaOffsetValue).id;
               _loc2_ = _loc4_.data;
               _loc3_ = class_2592.method_6525(_loc1_,class_2595.const_2681);
               if(!_loc3_)
               {
                  method_444("Unknown value");
               }
               this.var_983 = new _loc3_(null);
               method_4558(this.var_983);
               this.var_983.method_5169(_loc2_);
            }
         }
         if(super.method_196() == const_2361)
         {
            this.method_383();
            return const_2361;
         }
         return const_2971;
      }
      
      private function method_383() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(this.usesMultiplier)
         {
            _loc1_ = this.var_3426.setter;
            _loc2_ = this.var_4562.setter;
            _loc3_ = this.var_1696.setter;
            _loc4_ = this.var_4275.setter;
         }
         if(this.usesOffset)
         {
            _loc5_ = this.var_2449.setter;
            _loc6_ = this.var_1482.setter;
            _loc7_ = this.var_3140.setter;
            _loc8_ = this.var_983.setter;
         }
         if((!this.usesMultiplier || this.var_3426.method_5046 == const_376 && this.var_4562.method_5046 == const_376 && this.var_1696.method_5046 == const_376 && this.var_4275.method_5046 == const_376) && (!this.usesOffset || this.var_2449.method_5046 == const_376 && this.var_1482.method_5046 == const_376 && this.var_3140.method_5046 == const_376 && this.var_983.method_5046 == const_376))
         {
            var_3843 = const_376;
         }
         else
         {
            var_3843 = const_1615;
         }
         var_4689 = new class_2730(var_78,_loc1_,_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
   }
}
