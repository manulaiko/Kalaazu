package package_372
{
   import away3d.arcane;
   import flash.geom.Vector3D;
   import package_304.class_1766;
   import package_371.class_2230;
   import package_376.class_2144;
   import package_436.class_2489;
   
   public class class_2224
   {
       
      
      arcane var _parent:class_2224;
      
      protected var var_3269:Vector.<class_2224>;
      
      protected var var_163:uint;
      
      protected var var_3554:class_2489;
      
      arcane var var_1564:int;
      
      arcane var var_251:uint;
      
      public function class_2224()
      {
         super();
         this.var_3269 = new Vector.<class_2224>();
      }
      
      public function get method_2528() : Boolean
      {
         return this.var_3554 != null;
      }
      
      public function set method_2528(param1:Boolean) : void
      {
         if(Boolean(this.var_3554) == param1)
         {
            return;
         }
         if(param1)
         {
            this.var_3554 = this.method_4809();
         }
         else
         {
            this.var_3554.dispose();
            this.var_3554 = null;
         }
         var _loc2_:Number = 0;
         while(_loc2_ < this.var_163)
         {
            this.var_3269[_loc2_].method_2528 = param1;
            _loc2_++;
         }
      }
      
      public function get parent() : class_2224
      {
         return this.arcane::_parent;
      }
      
      arcane function method_2249(param1:class_2224) : void
      {
         param1.arcane::_parent = this;
         this.arcane::var_1564 += param1.arcane::var_1564;
         var _loc3_:* = this.var_163++;
         this.var_3269[_loc3_] = param1;
         param1.method_2528 = this.var_3554 != null;
         var _loc2_:int = int(param1.arcane::var_1564);
         param1 = {};
         do
         {
            param1.arcane::var_1564 += _loc2_;
         }
         while((param1 = param1.arcane::_parent) != null);
         
      }
      
      arcane function removeNode(param1:class_2224) : void
      {
         var _loc2_:uint = uint(this.var_3269.indexOf(param1));
         this.var_3269[_loc2_] = this.var_3269[--this.var_163];
         this.var_3269.pop();
         var _loc3_:int = int(param1.arcane::var_1564);
         param1 = {};
         do
         {
            param1.arcane::var_1564 -= _loc3_;
         }
         while((param1 = param1.arcane::_parent) != null);
         
      }
      
      public function method_3128(param1:Vector.<class_2230>, param2:int) : Boolean
      {
         param1 = param1;
         param2 = param2;
         return true;
      }
      
      public function method_4598(param1:Vector3D, param2:Vector3D) : Boolean
      {
         param1 = param1;
         param2 = param2;
         return true;
      }
      
      public function method_4072(param1:class_1766) : class_2224
      {
         param1 = param1;
         return this;
      }
      
      public function method_2995(param1:class_2144) : void
      {
         var _loc2_:Number = 0;
         if(this.arcane::var_1564 == 0 && !this.var_3554)
         {
            return;
         }
         if(param1.method_4368(this))
         {
            while(_loc2_ < this.var_163)
            {
               this.var_3269[_loc2_++].method_2995(param1);
            }
            if(this.var_3554)
            {
               param1.method_82(this.var_3554);
            }
         }
      }
      
      protected function method_4809() : class_2489
      {
         return null;
      }
      
      protected function get method_5441() : int
      {
         return this.arcane::var_1564;
      }
      
      protected function method_2385(param1:int) : void
      {
         var _loc2_:int = param1 - Number(this.arcane::var_1564);
         var _loc3_:* = {};
         do
         {
            _loc3_.arcane::var_1564 += _loc2_;
         }
         while((_loc3_ = _loc3_.arcane::_parent) != null);
         
      }
   }
}
