package away3d.animators
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import flash.utils.Dictionary;
   import package_198.class_1208;
   import package_309.class_1774;
   
   public class class_2439 extends class_2438 implements class_2234
   {
       
      
      private var var_4847:Dictionary;
      
      public function class_2439()
      {
         this.var_4847 = new Dictionary(true);
         super();
      }
      
      public function method_2174(param1:class_1774, param2:Vector.<String>, param3:Vector.<String>, param4:String) : String
      {
         var _loc5_:String = "";
         var _loc6_:String = method_1578(param3);
         var _loc7_:String = method_1578(param3,_loc6_);
         var _loc8_:String = "vc" + param1.method_1025;
         var _loc9_:Boolean = Boolean(param2.length > 1);
         var _loc10_:Boolean = Boolean(param2.length > 2);
         var _loc11_:uint = uint(this.var_4847[param1] = param1.method_1035);
         _loc5_ = (_loc5_ = (_loc5_ = (_loc5_ += "mov " + _loc6_ + ", " + param2[0] + "\n") + ("mul " + _loc6_ + ", va" + _loc11_++ + ", " + _loc8_ + ".x\n")) + ("mul " + _loc7_ + ", va" + _loc11_++ + ", " + _loc8_ + ".y\n")) + ("add " + param3[0] + ", " + _loc6_ + ", " + _loc7_ + "\n");
         if(_loc9_)
         {
            _loc5_ += "mov " + param3[1] + ", " + param2[1] + "\n";
         }
         if(_loc10_)
         {
            _loc5_ += "dp3 " + _loc6_ + ".x, " + param2[uint(2)] + ", " + param3[uint(1)] + "\n" + "mul " + _loc6_ + ", " + param3[uint(1)] + ", " + _loc6_ + ".x\t\t\t \n" + "sub " + param3[uint(2)] + ", " + param2[uint(2)] + ", " + _loc6_ + "\n";
         }
         return _loc5_;
      }
      
      public function activate(param1:class_1208, param2:class_1774) : void
      {
      }
      
      public function deactivate(param1:class_1208, param2:class_1774) : void
      {
         var _loc3_:int = int(this.var_4847[param2]);
         var _loc4_:Context3D;
         (_loc4_ = param1.arcane::var_4582).setVertexBufferAt(_loc3_,null);
         _loc4_.setVertexBufferAt(_loc3_ + 1,null);
      }
      
      public function method_2535(param1:class_1774, param2:String, param3:String) : String
      {
         return "";
      }
      
      public function method_45(param1:class_1774, param2:String, param3:String) : String
      {
         return "mov " + param3 + "," + param2 + "\n";
      }
      
      public function method_5085(param1:class_1774) : void
      {
      }
   }
}
