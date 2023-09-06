package package_431
{
   import away3d.animators.class_2120;
   import away3d.arcane;
   import flash.geom.Vector3D;
   import package_309.class_1774;
   import package_385.class_2251;
   import package_386.class_2238;
   import package_386.class_2578;
   import package_386.class_2580;
   import package_430.class_2747;
   
   public class class_2723 extends class_2406
   {
      
      arcane static const const_296:int = 0;
      
      arcane static const const_2188:int = 1;
      
      public static const const_292:String = "BezierControlVector3D";
      
      public static const const_212:String = "BezierEndVector3D";
       
      
      arcane var var_2734:Vector3D;
      
      arcane var var_4328:Vector3D;
      
      public function class_2723(param1:uint, param2:Vector3D = null, param3:Vector3D = null)
      {
         super("ParticleBezierCurve",param1,6);
         var_4797 = class_2747;
         this.arcane::var_2734 = param2 || new Vector3D();
         this.arcane::var_4328 = param3 || new Vector3D();
      }
      
      override public function method_2174(param1:class_1774, param2:class_2238) : String
      {
         param1 = param1;
         var _loc3_:class_2251 = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
         param2.method_5487(this,arcane::const_296,_loc3_.index);
         var _loc4_:class_2251 = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
         param2.method_5487(this,arcane::const_2188,_loc4_.index);
         var _loc5_:class_2251 = param2.method_3118();
         var _loc6_:class_2251 = new class_2251(_loc5_.method_3684,_loc5_.index,0);
         var _loc7_:class_2251 = new class_2251(_loc5_.method_3684,_loc5_.index,1);
         var _loc8_:class_2251 = new class_2251(_loc5_.method_3684,_loc5_.index,2);
         param2.method_588(_loc5_,1);
         var _loc9_:class_2251 = param2.method_3118();
         var _loc10_:class_2251 = new class_2251(_loc9_.method_3684,_loc9_.index);
         param2.method_5694(_loc5_);
         var _loc11_:String = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = "") + ("sub " + _loc6_ + "," + param2.var_748 + "," + param2.var_4785 + "\n")) + ("mul " + _loc7_ + "," + param2.var_4785 + "," + param2.var_4785 + "\n")) + ("mul " + _loc8_ + "," + param2.var_4785 + "," + _loc6_ + "\n")) + ("mul " + _loc8_ + "," + _loc8_ + "," + param2.var_4235 + "\n")) + ("mul " + _loc10_ + ".xyz," + _loc8_ + "," + _loc3_ + "\n")) + ("add " + param2.var_1532 + ".xyz," + _loc10_ + ".xyz," + param2.var_1532 + ".xyz\n")) + ("mul " + _loc10_ + ".xyz," + _loc7_ + "," + _loc4_ + "\n")) + ("add " + param2.var_1532 + ".xyz," + _loc10_ + ".xyz," + param2.var_1532 + ".xyz\n");
         if(param2.var_3696)
         {
            _loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ += "mul " + _loc7_ + "," + param2.var_4785 + "," + param2.var_4235 + "\n") + ("sub " + _loc8_ + "," + param2.var_748 + "," + _loc7_ + "\n")) + ("mul " + _loc8_ + "," + param2.var_4235 + "," + _loc8_ + "\n")) + ("mul " + _loc10_ + ".xyz," + _loc3_ + "," + _loc8_ + "\n")) + ("add " + param2.var_1015 + ".xyz," + _loc10_ + ".xyz," + param2.var_1015 + ".xyz\n")) + ("mul " + _loc10_ + ".xyz," + _loc4_ + "," + _loc7_ + "\n")) + ("add " + param2.var_1015 + ".xyz," + _loc10_ + ".xyz," + param2.var_1015 + ".xyz\n");
         }
         return _loc11_;
      }
      
      public function method_3412(param1:class_2120) : class_2747
      {
         return param1.method_3412(this) as class_2747;
      }
      
      override arcane function method_5880(param1:class_2580) : void
      {
         var _loc2_:Vector3D = param1[const_292];
         if(!_loc2_)
         {
            throw new Error("there is no " + const_292 + " in param!");
         }
         var _loc3_:Vector3D = param1[const_212];
         if(!_loc3_)
         {
            throw new Error("there is no " + const_212 + " in param!");
         }
         var_2599[0] = _loc2_.x;
         var_2599[1] = _loc2_.y;
         var_2599[2] = _loc2_.z;
         var_2599[3] = _loc3_.x;
         var_2599[4] = _loc3_.y;
         var_2599[5] = _loc3_.z;
      }
   }
}
