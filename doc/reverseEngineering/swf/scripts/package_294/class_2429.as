package package_294
{
   import away3d.arcane;
   import flash.geom.Matrix3D;
   import package_199.class_2428;
   import package_293.class_1749;
   import package_293.class_1751;
   import package_293.class_2131;
   
   public class class_2429 extends class_1749 implements class_1751
   {
       
      
      private var var_2579:Vector.<class_2425>;
      
      public function class_2429()
      {
         super();
         this.var_2579 = new Vector.<class_2425>();
      }
      
      public function get assetType() : String
      {
         return class_2131.GEOMETRY;
      }
      
      public function get subGeometries() : Vector.<class_2425>
      {
         return this.var_2579;
      }
      
      public function method_1695(param1:Matrix3D) : void
      {
         var _loc2_:uint = uint(this.var_2579.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_2579[_loc3_].method_1695(param1);
            _loc3_++;
         }
      }
      
      public function method_1586(param1:class_2425) : void
      {
         this.var_2579.push(param1);
         param1.method_747 = this;
         if(hasEventListener(class_2428.const_1195))
         {
            dispatchEvent(new class_2428(class_2428.const_1195,param1));
         }
         this.arcane::method_1513(param1);
      }
      
      public function method_4957(param1:class_2425) : void
      {
         this.var_2579.splice(this.var_2579.indexOf(param1),1);
         param1.method_747 = null;
         if(hasEventListener(class_2428.const_2516))
         {
            dispatchEvent(new class_2428(class_2428.const_2516,param1));
         }
         this.arcane::method_1513(param1);
      }
      
      public function clone() : class_2429
      {
         var _loc1_:class_2429 = new class_2429();
         var _loc2_:uint = uint(this.var_2579.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.method_1586(this.var_2579[_loc3_].clone());
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function scale(param1:Number) : void
      {
         var _loc2_:uint = uint(this.var_2579.length);
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_2579[_loc3_].scale(param1);
            _loc3_++;
         }
      }
      
      public function dispose() : void
      {
         var _loc3_:* = null;
         var _loc1_:uint = uint(this.var_2579.length);
         var _loc2_:Number = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.var_2579[0];
            this.method_4957(_loc3_);
            _loc3_.dispose();
            _loc2_++;
         }
      }
      
      public function method_3965(param1:Number = 1, param2:Number = 1) : void
      {
         var _loc3_:uint = uint(this.var_2579.length);
         var _loc4_:Number = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_2579[_loc4_].method_3965(param1,param2);
            _loc4_++;
         }
      }
      
      public function method_91() : void
      {
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = int(this.var_2579.length);
         var _loc3_:Vector.<class_2602> = new Vector.<class_2602>();
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc1_ = this.var_2579[_loc4_];
            if(!(_loc1_ is class_2427))
            {
               _loc3_.push(_loc1_);
               this.method_1586(_loc1_.method_1677());
            }
            _loc4_++;
         }
         for each(_loc5_ in _loc3_)
         {
            this.method_4957(_loc5_);
            _loc5_.dispose();
         }
      }
      
      arcane function validate() : void
      {
      }
      
      arcane function method_1513(param1:class_2425) : void
      {
         if(hasEventListener(class_2428.const_125))
         {
            dispatchEvent(new class_2428(class_2428.const_125,param1));
         }
      }
   }
}
