package package_376
{
   import away3d.arcane;
   import flash.geom.Vector3D;
   import package_294.class_2133;
   import package_304.class_1766;
   import package_305.class_1767;
   import package_307.class_1772;
   import package_364.DirectionalLight;
   import package_364.PointLight;
   import package_364.class_2102;
   import package_364.class_2390;
   import package_371.class_2125;
   import package_371.class_2230;
   import package_372.class_2224;
   import package_377.class_2146;
   import package_377.class_2150;
   import package_377.class_2475;
   import package_377.class_2476;
   
   public class class_2145 extends class_2144
   {
       
      
      protected var var_2777:class_2133;
      
      protected var var_4346:class_2146;
      
      protected var var_293:class_2146;
      
      private var var_1406:class_2150;
      
      protected var var_4436:class_2476;
      
      protected var var_2645:class_2475;
      
      protected var var_1423:Vector.<class_2102>;
      
      private var var_1547:Vector.<DirectionalLight>;
      
      private var var_156:Vector.<PointLight>;
      
      private var var_3768:Vector.<class_2390>;
      
      protected var var_1564:uint;
      
      protected var var_612:uint;
      
      protected var var_3055:uint;
      
      protected var var_2042:uint;
      
      protected var var_116:class_1767;
      
      private var var_231:uint;
      
      private var var_1458:uint;
      
      private var var_1052:uint;
      
      protected var var_4823:Vector3D;
      
      private var var_3879:Vector.<class_2230>;
      
      private var var_1168:Vector.<class_2230>;
      
      private var var_4225:uint;
      
      public function class_2145()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.var_1423 = new Vector.<class_2102>();
         this.var_1547 = new Vector.<DirectionalLight>();
         this.var_156 = new Vector.<PointLight>();
         this.var_3768 = new Vector.<class_2390>();
         this.var_4436 = new class_2476();
         this.var_2645 = new class_2475();
      }
      
      public function get camera() : class_1767
      {
         return this.var_116;
      }
      
      public function set camera(param1:class_1767) : void
      {
         this.var_116 = param1;
         arcane::var_241 = this.var_116.method_3037;
         this.var_4823 = class_2125.method_5586(this.var_116.transform,this.var_4823);
         this.var_1168 = this.var_116.method_5756;
      }
      
      public function get method_4664() : Vector.<class_2230>
      {
         return this.var_3879;
      }
      
      public function set method_4664(param1:Vector.<class_2230>) : void
      {
         this.var_3879 = param1;
      }
      
      public function get method_5950() : uint
      {
         return this.var_2042;
      }
      
      public function get method_1346() : class_2133
      {
         return this.var_2777;
      }
      
      public function get method_6033() : class_2146
      {
         return this.var_4346;
      }
      
      public function set method_6033(param1:class_2146) : void
      {
         this.var_4346 = param1;
      }
      
      public function get method_51() : class_2146
      {
         return this.var_293;
      }
      
      public function set method_51(param1:class_2146) : void
      {
         this.var_293 = param1;
      }
      
      public function get method_5004() : class_2150
      {
         return this.var_1406;
      }
      
      public function get name_10() : Vector.<class_2102>
      {
         return this.var_1423;
      }
      
      public function get method_1935() : Vector.<DirectionalLight>
      {
         return this.var_1547;
      }
      
      public function get method_833() : Vector.<PointLight>
      {
         return this.var_156;
      }
      
      public function get method_1997() : Vector.<class_2390>
      {
         return this.var_3768;
      }
      
      public function clear() : void
      {
         if(this.var_116)
         {
            arcane::var_241 = this.var_116.method_3037;
            this.var_4823 = class_2125.method_5586(this.var_116.transform,this.var_4823);
         }
         this.var_1168 = !!this.var_3879 ? this.var_3879 : (!!this.var_116 ? this.var_116.method_5756 : null);
         this.var_4225 = !!this.var_1168 ? uint(this.var_1168.length) : 0;
         this.var_3055 = this.var_2042 = 0;
         this.var_293 = null;
         this.var_4346 = null;
         this.var_1406 = null;
         this.var_4436.method_3017();
         this.var_2645.method_3017();
         this.var_2777 = null;
         if(this.var_612 > 0)
         {
            this.var_1423.length = this.var_612 = 0;
         }
         if(this.var_231 > 0)
         {
            this.var_1547.length = this.var_231 = 0;
         }
         if(this.var_1458 > 0)
         {
            this.var_156.length = this.var_1458 = 0;
         }
         if(this.var_1052 > 0)
         {
            this.var_3768.length = this.var_1052 = 0;
         }
      }
      
      override public function method_4368(param1:class_2224) : Boolean
      {
         var _loc2_:Boolean = arcane::var_251 != param1.arcane::var_251 && Boolean(param1.method_3128(this.var_1168,this.var_4225));
         param1.arcane::var_251 = arcane::var_251;
         return _loc2_;
      }
      
      override public function method_2327(param1:class_2133) : void
      {
         this.var_2777 = param1;
      }
      
      override public function method_82(param1:class_2133) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc3_:class_1766 = param1.method_1409;
         if(param1.mouseEnabled)
         {
            ++this.var_2042;
         }
         this.var_3055 += param1.name_42;
         _loc2_ = param1.material;
         if(_loc2_)
         {
            (_loc4_ = this.var_4436.getItem()).var_3785 = param1;
            _loc4_.var_3099 = _loc2_.arcane::var_2727;
            _loc4_.var_1123 = _loc2_.arcane::var_60;
            _loc4_.var_474 = false;
            _loc5_ = _loc3_.method_3037;
            _loc6_ = 0 - _loc5_.x;
            _loc7_ = 0 - _loc5_.y;
            _loc8_ = 0 - _loc5_.z;
            _loc4_.var_2496 = _loc6_ * Number(this.var_4823.x) + _loc7_ * Number(this.var_4823.y) + _loc8_ * Number(this.var_4823.z) + _loc3_.zOffset;
            _loc4_.var_2920 = param1.method_846(this.var_116);
            if(_loc2_.method_4490)
            {
               _loc4_.next = this.var_293;
               this.var_293 = _loc4_;
            }
            else
            {
               _loc4_.next = this.var_4346;
               this.var_4346 = _loc4_;
            }
         }
      }
      
      override public function method_5920(param1:class_1766) : void
      {
         ++this.var_1564;
         var _loc2_:class_2150 = this.var_2645.getItem();
         _loc2_.entity = param1;
         _loc2_.next = this.var_1406;
         this.var_1406 = _loc2_;
      }
      
      override public function method_5654(param1:class_2102) : void
      {
         var _loc2_:* = this.var_612++;
         this.var_1423[_loc2_] = param1;
      }
      
      override public function method_2048(param1:DirectionalLight) : void
      {
         var _loc2_:* = this.var_612++;
         this.var_1423[_loc2_] = param1;
         var _loc3_:* = this.var_231++;
         this.var_1547[_loc3_] = param1;
      }
      
      override public function method_1287(param1:PointLight) : void
      {
         var _loc2_:* = this.var_612++;
         this.var_1423[_loc2_] = param1;
         var _loc3_:* = this.var_1458++;
         this.var_156[_loc3_] = param1;
      }
      
      override public function method_2774(param1:class_2390) : void
      {
         var _loc2_:* = this.var_612++;
         this.var_1423[_loc2_] = param1;
         var _loc3_:* = this.var_1052++;
         this.var_3768[_loc3_] = param1;
      }
      
      public function get name_42() : uint
      {
         return this.var_3055;
      }
      
      public function method_1140() : void
      {
      }
   }
}
