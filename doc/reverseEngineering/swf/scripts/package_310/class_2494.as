package package_310
{
   import away3d.arcane;
   import flash.events.EventDispatcher;
   import package_199.class_2253;
   
   public class class_2494 extends EventDispatcher
   {
       
      
      arcane var var_2959:class_2499;
      
      arcane var var_3212:class_2252;
      
      arcane var var_491:class_2242;
      
      arcane var var_1294:class_2252;
      
      arcane var var_2401:class_2239;
      
      arcane var var_4870:class_2252;
      
      arcane var var_2047:class_2245;
      
      arcane var var_1078:class_2252;
      
      arcane var var_2753:class_2246;
      
      arcane var var_2698:class_2252;
      
      arcane var var_1906:class_2241;
      
      arcane var var_3165:class_2252;
      
      arcane var var_1420:Vector.<class_2497>;
      
      public function class_2494()
      {
         super();
         this.arcane::var_1420 = new Vector.<class_2497>();
         this.arcane::var_491 = new class_2242();
         this.arcane::var_2401 = new class_2239();
         this.arcane::var_2753 = new class_2246();
         this.arcane::var_1906 = new class_2241();
         this.arcane::var_491.addEventListener(class_2253.const_3136,this.method_404);
         this.arcane::var_2753.addEventListener(class_2253.const_3136,this.method_404);
         this.arcane::var_1906.addEventListener(class_2253.const_3136,this.method_404);
         this.arcane::var_2401.addEventListener(class_2253.const_3136,this.method_404);
         this.arcane::var_1294 = this.arcane::var_491.arcane::method_4601();
         this.arcane::var_4870 = this.arcane::var_2401.arcane::method_4601();
         this.arcane::var_2698 = this.arcane::var_2753.arcane::method_4601();
         this.arcane::var_3165 = this.arcane::var_1906.arcane::method_4601();
      }
      
      private function method_404(param1:class_2253) : void
      {
         this.method_220();
      }
      
      private function method_220() : void
      {
         dispatchEvent(new class_2253(class_2253.const_3136));
      }
      
      public function get normalMethod() : class_2242
      {
         return this.arcane::var_491;
      }
      
      public function set normalMethod(param1:class_2242) : void
      {
         if(this.arcane::var_491)
         {
            this.arcane::var_491.removeEventListener(class_2253.const_3136,this.method_404);
         }
         if(param1)
         {
            if(this.arcane::var_491)
            {
               param1.copyFrom(this.arcane::var_491);
            }
            this.arcane::var_1294 = param1.arcane::method_4601();
            param1.addEventListener(class_2253.const_3136,this.method_404);
         }
         this.arcane::var_491 = param1;
         if(param1)
         {
            this.method_220();
         }
      }
      
      public function get ambientMethod() : class_2239
      {
         return this.arcane::var_2401;
      }
      
      public function set ambientMethod(param1:class_2239) : void
      {
         if(this.arcane::var_2401)
         {
            this.arcane::var_2401.removeEventListener(class_2253.const_3136,this.method_404);
         }
         if(param1)
         {
            if(this.arcane::var_2401)
            {
               param1.copyFrom(this.arcane::var_2401);
            }
            param1.addEventListener(class_2253.const_3136,this.method_404);
            this.arcane::var_4870 = param1.arcane::method_4601();
         }
         this.arcane::var_2401 = param1;
         if(param1)
         {
            this.method_220();
         }
      }
      
      public function get shadowMethod() : class_2245
      {
         return this.arcane::var_2047;
      }
      
      public function set shadowMethod(param1:class_2245) : void
      {
         if(this.arcane::var_2047)
         {
            this.arcane::var_2047.removeEventListener(class_2253.const_3136,this.method_404);
         }
         this.arcane::var_2047 = param1;
         if(this.arcane::var_2047)
         {
            this.arcane::var_2047.addEventListener(class_2253.const_3136,this.method_404);
            this.arcane::var_1078 = this.arcane::var_2047.arcane::method_4601();
         }
         else
         {
            this.arcane::var_1078 = null;
         }
         this.method_220();
      }
      
      public function get diffuseMethod() : class_2246
      {
         return this.arcane::var_2753;
      }
      
      public function set diffuseMethod(param1:class_2246) : void
      {
         if(this.arcane::var_2753)
         {
            this.arcane::var_2753.removeEventListener(class_2253.const_3136,this.method_404);
         }
         if(param1)
         {
            if(this.arcane::var_2753)
            {
               param1.copyFrom(this.arcane::var_2753);
            }
            param1.addEventListener(class_2253.const_3136,this.method_404);
            this.arcane::var_2698 = param1.arcane::method_4601();
         }
         this.arcane::var_2753 = param1;
         if(param1)
         {
            this.method_220();
         }
      }
      
      public function get specularMethod() : class_2241
      {
         return this.arcane::var_1906;
      }
      
      public function set specularMethod(param1:class_2241) : void
      {
         if(this.arcane::var_1906)
         {
            this.arcane::var_1906.removeEventListener(class_2253.const_3136,this.method_404);
            if(param1)
            {
               param1.copyFrom(this.arcane::var_1906);
            }
         }
         this.arcane::var_1906 = param1;
         if(this.arcane::var_1906)
         {
            this.arcane::var_1906.addEventListener(class_2253.const_3136,this.method_404);
            this.arcane::var_3165 = this.arcane::var_1906.arcane::method_4601();
         }
         else
         {
            this.arcane::var_3165 = null;
         }
         this.method_220();
      }
      
      arcane function get method_1245() : class_2499
      {
         return this.arcane::var_2959;
      }
      
      arcane function set method_1245(param1:class_2499) : void
      {
         if(this.arcane::var_2959 == param1)
         {
            return;
         }
         if(this.arcane::var_2959)
         {
            this.arcane::var_2959.removeEventListener(class_2253.const_3136,this.method_404);
         }
         if(!this.arcane::var_2959 || !param1)
         {
            this.method_220();
         }
         this.arcane::var_2959 = param1;
         if(this.arcane::var_2959)
         {
            this.arcane::var_2959.addEventListener(class_2253.const_3136,this.method_404);
            this.arcane::var_3212 = this.arcane::var_2959.arcane::method_4601();
         }
         else
         {
            this.arcane::var_3212 = null;
         }
      }
      
      public function dispose() : void
      {
         this.method_2069(this.arcane::var_491);
         this.method_2069(this.arcane::var_2753);
         this.method_2069(this.arcane::var_2047);
         this.method_2069(this.arcane::var_2401);
         this.method_2069(this.arcane::var_1906);
         var _loc1_:int = 0;
         while(_loc1_ < this.arcane::var_1420.length)
         {
            this.method_2069(this.arcane::var_1420[_loc1_].method);
            _loc1_++;
         }
         this.arcane::var_1420 = null;
      }
      
      private function method_2069(param1:class_1779) : void
      {
         if(param1)
         {
            param1.removeEventListener(class_2253.const_3136,this.method_404);
         }
      }
      
      public function addMethod(param1:class_1780) : void
      {
         this.arcane::var_1420.push(new class_2497(param1));
         param1.addEventListener(class_2253.const_3136,this.method_404);
         this.method_220();
      }
      
      public function method_4896(param1:class_1780) : Boolean
      {
         return this.method_640(param1) != null;
      }
      
      public function method_5104(param1:class_1780, param2:int) : void
      {
         this.arcane::var_1420.splice(param2,0,new class_2497(param1));
         param1.addEventListener(class_2253.const_3136,this.method_404);
         this.method_220();
      }
      
      public function method_2311(param1:int) : class_1780
      {
         if(param1 > this.arcane::var_1420.length - 1)
         {
            return null;
         }
         return this.arcane::var_1420[param1].method;
      }
      
      public function get method_3114() : int
      {
         return this.arcane::var_1420.length;
      }
      
      public function method_804(param1:class_1780) : void
      {
         var _loc3_:int = 0;
         var _loc2_:class_2497 = this.method_640(param1);
         if(_loc2_ != null)
         {
            _loc3_ = int(this.arcane::var_1420.indexOf(_loc2_));
            this.arcane::var_1420.splice(_loc3_,1);
            param1.removeEventListener(class_2253.const_3136,this.method_404);
            this.method_220();
         }
      }
      
      private function method_640(param1:class_1780) : class_2497
      {
         var _loc2_:int = int(this.arcane::var_1420.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.arcane::var_1420[_loc3_].method == param1)
            {
               return this.arcane::var_1420[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
   }
}
