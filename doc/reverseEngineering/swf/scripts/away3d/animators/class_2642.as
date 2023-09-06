package away3d.animators
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import package_198.class_1208;
   import package_309.class_1774;
   
   public class class_2642 extends class_2438 implements class_2234
   {
       
      
      private var var_1066:uint;
      
      public function class_2642(param1:uint = 4)
      {
         super();
         this.var_1066 = param1;
      }
      
      public function get method_3861() : uint
      {
         return this.var_1066;
      }
      
      public function method_2174(param1:class_1774, param2:Vector.<String>, param3:Vector.<String>, param4:String) : String
      {
         var _loc18_:* = null;
         var _loc19_:Number = 0;
         var _loc5_:uint = param2.length;
         var _loc6_:uint;
         var _loc7_:uint = (_loc6_ = uint(param1.method_1025)) + 1;
         var _loc8_:uint = _loc6_ + 2;
         var _loc9_:String = "va" + param1.method_1035;
         var _loc10_:String = "va" + (param1.method_1035 + 1);
         var _loc11_:Array = [_loc9_ + ".x",_loc9_ + ".y",_loc9_ + ".z",_loc9_ + ".w"];
         var _loc12_:Array = [_loc10_ + ".x",_loc10_ + ".y",_loc10_ + ".z",_loc10_ + ".w"];
         var _loc13_:String = method_1578(param3);
         var _loc14_:String = method_1578(param3,_loc13_);
         var _loc15_:String = "dp4";
         var _loc16_:String = "";
         var _loc17_:Number = 0;
         while(_loc17_ < _loc5_)
         {
            _loc18_ = param2[_loc17_];
            _loc19_ = 0;
            while(_loc19_ < this.var_1066)
            {
               _loc16_ += _loc15_ + " " + _loc13_ + ".x, " + _loc18_ + ", vc[" + _loc11_[_loc19_] + "+" + _loc6_ + "]\t\t\n" + _loc15_ + " " + _loc13_ + ".y, " + _loc18_ + ", vc[" + _loc11_[_loc19_] + "+" + _loc7_ + "]    \t\n" + _loc15_ + " " + _loc13_ + ".z, " + _loc18_ + ", vc[" + _loc11_[_loc19_] + "+" + _loc8_ + "]\t\t\n" + "mov " + _loc13_ + ".w, " + _loc18_ + ".w\t\t\n" + "mul " + _loc13_ + ", " + _loc13_ + ", " + _loc12_[_loc19_] + "\n";
               if(_loc19_ == 0)
               {
                  _loc16_ += "mov " + _loc14_ + ", " + _loc13_ + "\n";
               }
               else
               {
                  _loc16_ += "add " + _loc14_ + ", " + _loc14_ + ", " + _loc13_ + "\n";
               }
               _loc19_++;
            }
            _loc15_ = "dp3";
            _loc16_ += "mov " + param3[_loc17_] + ", " + _loc14_ + "\n";
            _loc17_++;
         }
         return _loc16_;
      }
      
      public function activate(param1:class_1208, param2:class_1774) : void
      {
      }
      
      public function deactivate(param1:class_1208, param2:class_1774) : void
      {
         var _loc3_:uint = uint(param2.method_1035);
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
