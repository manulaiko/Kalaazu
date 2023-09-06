package away3d.animators
{
   import away3d.*;
   import flash.display3D.*;
   import flash.utils.*;
   import package_198.*;
   import package_294.*;
   import package_305.*;
   import package_309.*;
   import package_386.*;
   import package_430.*;
   import package_431.*;
   
   public class class_2403 extends class_2119 implements class_2120
   {
       
      
      private var var_1222:class_2579;
      
      private var var_5051:Vector.<class_2401>;
      
      private var var_3467:Vector.<class_2401>;
      
      private var var_1101:Vector.<class_2401>;
      
      private var var_547:uint = 0;
      
      private var var_4204:Dictionary;
      
      public function class_2403(param1:class_2579)
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         this.var_5051 = new Vector.<class_2401>();
         this.var_3467 = new Vector.<class_2401>();
         this.var_1101 = new Vector.<class_2401>();
         this.var_4204 = new Dictionary(true);
         super(param1);
         this.var_1222 = param1;
         for each(_loc3_ in this.var_1222.method_3903)
         {
            _loc2_ = method_3412(_loc3_) as class_2401;
            if(_loc3_.mode == class_2578.name_117)
            {
               this.var_3467.push(_loc2_);
               _loc3_.arcane::var_4676 = this.var_547;
               this.var_547 += _loc3_.method_3305;
            }
            else
            {
               this.var_5051.push(_loc2_);
            }
            if(_loc2_.method_338)
            {
               this.var_1101.push(_loc2_);
            }
         }
      }
      
      public function clone() : class_2120
      {
         return new class_2403(this.var_1222);
      }
      
      public function setRenderState(param1:class_1208, param2:class_2133, param3:int, param4:int, param5:class_1767) : void
      {
         var _loc8_:* = null;
         var _loc6_:class_2238 = this.var_1222.arcane::var_1213;
         var _loc7_:class_2398;
         if(!(_loc7_ = param2 as class_2398))
         {
            throw new Error("Must be subMesh");
         }
         if(!_loc7_.var_1937)
         {
            this.var_1222.arcane::method_4865(_loc7_.arcane::method_4295);
         }
         var _loc9_:class_2575 = _loc7_.var_1937;
         for each(_loc8_ in this.var_5051)
         {
            _loc8_.setRenderState(param1,param2,_loc9_,_loc6_,param5);
         }
         if(!_loc7_.var_399 && Boolean(this.var_3467.length))
         {
            this.method_5719(_loc7_);
         }
         var _loc10_:class_2575 = _loc7_.var_399;
         for each(_loc8_ in this.var_3467)
         {
            _loc8_.setRenderState(param1,param2,_loc10_,_loc6_,param5);
         }
         param1.context3D.setProgramConstantsFromVector(Context3DProgramType.VERTEX,_loc6_.method_3046,_loc6_.var_1522,_loc6_.method_4877);
         if(_loc6_.method_952 > 0)
         {
            param1.context3D.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,_loc6_.method_2599,_loc6_.var_114,_loc6_.method_952);
         }
      }
      
      public function method_3058(param1:class_1774) : void
      {
      }
      
      override public function start() : void
      {
         var _loc1_:* = null;
         super.start();
         for each(_loc1_ in this.var_1101)
         {
            _loc1_.time = 0;
         }
      }
      
      override public function set time(param1:int) : void
      {
         var _loc2_:* = null;
         super.time = param1;
         for each(_loc2_ in this.var_1101)
         {
            _loc2_.time = param1;
         }
      }
      
      public function method_1819(param1:int = 0) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_1101)
         {
            _loc2_.time = 0;
         }
         this.time = time;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_4204)
         {
            _loc1_.dispose();
         }
      }
      
      private function method_5719(param1:class_2398) : void
      {
         var _loc2_:class_2425 = param1.subGeometry;
         var _loc3_:class_2575 = param1.var_399 = this.var_4204[_loc2_] = new class_2575();
         _loc3_.method_3092(_loc2_.numVertices,this.var_547);
         _loc3_.var_2059 = param1.var_1937.var_2059;
      }
   }
}
