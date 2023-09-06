package package_302
{
   import package_120.class_431;
   import package_193.class_1197;
   import package_193.class_1692;
   import package_304.class_2114;
   import package_307.class_1772;
   import package_436.CylinderGeometry;
   
   public class class_2138 extends class_2136
   {
       
      
      private var var_394:class_1197;
      
      public function class_2138(param1:class_1692)
      {
         this.var_394 = param1.owner as class_1197;
         super(param1.owner as class_431);
      }
      
      override protected function method_224(param1:class_1772) : void
      {
         while(this.numChildren > 0)
         {
            removeChildAt(0);
         }
         var _loc2_:int = int(this.var_394.radius.value);
         var _loc3_:CylinderGeometry = new CylinderGeometry(_loc2_,0,0,64);
         x = this.var_394.method_1474;
         y = this.var_394.method_1121;
         z = this.var_394.method_6123;
         if(this.var_394.name_149)
         {
            _loc3_.topClosed = false;
            _loc3_.bottomClosed = false;
            _loc3_.bottomRadius = _loc2_ + this.var_394.method_4219.value;
         }
         var _loc4_:class_2114 = new class_2114(_loc3_,param1);
         this.addChild(_loc4_);
      }
   }
}
