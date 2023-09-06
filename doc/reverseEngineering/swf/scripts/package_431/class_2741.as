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
   import package_430.class_2758;
   
   public class class_2741 extends class_2406
   {
      
      arcane static const const_2288:uint = 0;
      
      arcane static const const_566:uint = 1;
      
      public static const const_2976:String = "OrbitVector3D";
       
      
      arcane var var_2244:Boolean;
      
      arcane var var_219:Boolean;
      
      arcane var var_81:Boolean;
      
      arcane var var_126:Number;
      
      arcane var var_872:Number;
      
      arcane var var_544:Number;
      
      arcane var var_2551:Vector3D;
      
      public function class_2741(param1:uint, param2:Boolean = true, param3:Boolean = false, param4:Boolean = false, param5:Number = 100, param6:Number = 1, param7:Number = 0, param8:Vector3D = null)
      {
         var _loc9_:int = 3;
         if(param4)
         {
            _loc9_++;
         }
         super("ParticleOrbit",param1,_loc9_);
         var_4797 = class_2758;
         this.arcane::var_2244 = param2;
         this.arcane::var_219 = param3;
         this.arcane::var_81 = param4;
         this.arcane::var_126 = param5;
         this.arcane::var_872 = param6;
         this.arcane::var_544 = param7;
         this.arcane::var_2551 = param8 || new Vector3D();
      }
      
      override public function method_2174(param1:class_1774, param2:class_2238) : String
      {
         param1 = param1;
         var _loc3_:class_2251 = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
         param2.method_5487(this,arcane::const_2288,_loc3_.index);
         var _loc4_:class_2251 = param2.method_5384();
         param2.method_5487(this,arcane::const_566,_loc4_.index);
         param2.method_5384();
         param2.method_5384();
         param2.method_5384();
         var _loc5_:class_2251 = param2.method_3118();
         param2.method_588(_loc5_,1);
         var _loc6_:class_2251 = new class_2251(_loc5_.method_3684,_loc5_.index);
         var _loc7_:class_2251 = param2.method_3118();
         var _loc8_:class_2251 = new class_2251(_loc7_.method_3684,_loc7_.index,0);
         var _loc9_:class_2251 = new class_2251(_loc7_.method_3684,_loc7_.index,1);
         var _loc10_:class_2251 = new class_2251(_loc7_.method_3684,_loc7_.index,2);
         param2.method_5694(_loc5_);
         var _loc11_:String = "";
         if(this.arcane::var_219)
         {
            _loc11_ += "mul " + _loc10_ + "," + param2.var_2838 + "," + _loc3_ + ".y\n";
            if(this.arcane::var_81)
            {
               _loc11_ += "add " + _loc10_ + "," + _loc10_ + "," + _loc3_ + ".w\n";
            }
         }
         else
         {
            _loc11_ += "mul " + _loc10_ + "," + param2.var_4785 + "," + _loc3_ + ".y\n";
         }
         _loc11_ = (_loc11_ = (_loc11_ = (_loc11_ = (_loc11_ += "cos " + _loc8_ + "," + _loc10_ + "\n") + ("sin " + _loc9_ + "," + _loc10_ + "\n")) + ("mul " + _loc6_ + ".x," + _loc8_ + "," + _loc3_ + ".x\n")) + ("mul " + _loc6_ + ".y," + _loc9_ + "," + _loc3_ + ".x\n")) + ("mov " + _loc6_ + ".wz" + param2.var_4178 + "\n");
         if(this.arcane::var_2244)
         {
            _loc11_ += "m44 " + _loc6_ + "," + _loc6_ + "," + _loc4_ + "\n";
         }
         _loc11_ += "add " + param2.var_1532 + ".xyz," + _loc6_ + ".xyz," + param2.var_1532 + ".xyz\n";
         if(param2.var_3696)
         {
            _loc11_ = (_loc11_ = (_loc11_ += "neg " + _loc6_ + ".x," + _loc9_ + "\n") + ("mov " + _loc6_ + ".y," + _loc8_ + "\n")) + ("mov " + _loc6_ + ".zw," + param2.var_4178 + "\n");
            if(this.arcane::var_2244)
            {
               _loc11_ += "m44 " + _loc6_ + "," + _loc6_ + "," + _loc4_ + "\n";
            }
            _loc11_ = (_loc11_ += "mul " + _loc6_ + "," + _loc6_ + "," + _loc3_ + ".z\n") + ("div " + _loc6_ + "," + _loc6_ + "," + _loc3_ + ".y\n");
            if(!this.arcane::var_219)
            {
               _loc11_ += "div " + _loc6_ + "," + _loc6_ + "," + param2.var_4785 + "\n";
            }
            _loc11_ += "add " + param2.var_1015 + ".xyz," + param2.var_1015 + ".xyz," + _loc6_ + ".xyz\n";
         }
         return _loc11_;
      }
      
      public function method_3412(param1:class_2120) : class_2758
      {
         return param1.method_3412(this) as class_2758;
      }
      
      override arcane function method_5880(param1:class_2580) : void
      {
         var _loc2_:Vector3D = param1[const_2976];
         if(!_loc2_)
         {
            throw new Error("there is no " + const_2976 + " in param!");
         }
         var_2599[0] = _loc2_.x;
         if(Boolean(this.arcane::var_219) && _loc2_.y <= 0)
         {
            throw new Error("the cycle duration must be greater than zero");
         }
         var_2599[1] = 0 / (!this.arcane::var_219 ? 1 : _loc2_.y);
         var_2599[2] = _loc2_.x * 0 * 2;
         if(this.arcane::var_81)
         {
            var_2599[3] = _loc2_.z * 0 / 180;
         }
      }
   }
}
