package package_430
{
   import away3d.animators.class_2120;
   import away3d.animators.class_2121;
   import com.greensock.easing.Quad;
   import package_294.class_2429;
   import package_431.class_2436;
   
   public class class_2442 extends class_2440 implements class_2441
   {
      
      private static const const_2482:Object = {};
      
      {
         const_2482[class_2436.const_1091] = null;
         const_2482[class_2436.const_1949] = Quad.easeIn;
         const_2482[class_2436.const_2452] = Quad.easeOut;
         const_2482[class_2436.const_21] = Quad.easeInOut;
      }
      
      private var var_147:Vector.<class_2437>;
      
      private var var_3686:class_2436;
      
      private var var_1867:class_2429;
      
      private var var_1214:class_2429;
      
      public function class_2442(param1:class_2120, param2:class_2436)
      {
         super(param1,param2);
         this.var_3686 = param2;
         this.var_147 = this.var_3686.frames;
      }
      
      public function get method_3221() : class_2429
      {
         if(var_3035)
         {
            this.method_1483();
         }
         return this.var_1867;
      }
      
      public function get method_790() : class_2429
      {
         if(var_3035)
         {
            this.method_1483();
         }
         return this.var_1214;
      }
      
      override protected function method_1483() : void
      {
         super.method_1483();
         this.var_1867 = this.var_147[var_1857].geometry;
         if(Boolean(this.var_3686.method_3310) && Boolean(this.var_3686.method_6520) && var_1424 > this.var_3686.lastFrame)
         {
            this.var_1214 = this.var_147[0].geometry;
            class_2121(_animator).dispatchCycleEvent();
         }
         else
         {
            this.var_1214 = this.var_147[Number(var_1424) % Number(this.var_147.length)].geometry;
         }
      }
      
      override protected function method_2295(param1:uint, param2:uint) : Number
      {
         var _loc3_:class_2437 = this.var_147[var_1857];
         var _loc4_:Function;
         if((_loc4_ = const_2482[_loc3_.var_4241] as Function) != null)
         {
            return _loc4_(param1,0,1,param2);
         }
         return super.method_2295(param1,param2);
      }
      
      override protected function method_1087() : void
      {
      }
   }
}
