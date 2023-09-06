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
   import package_430.class_2752;
   
   public class class_2731 extends class_2406
   {
      
      arcane static const const_641:uint = 0;
      
      public static const const_441:String = "ScaleVector3D";
       
      
      arcane var var_219:Boolean;
      
      arcane var var_81:Boolean;
      
      arcane var var_446:Number;
      
      arcane var var_1704:Number;
      
      arcane var var_872:Number;
      
      arcane var var_544:Number;
      
      public function class_2731(param1:uint, param2:Boolean, param3:Boolean, param4:Number = 1, param5:Number = 1, param6:Number = 1, param7:Number = 0)
      {
         var _loc8_:int = 2;
         if(param2)
         {
            _loc8_++;
         }
         if(param3)
         {
            _loc8_++;
         }
         super("ParticleScale",param1,_loc8_,3);
         var_4797 = class_2752;
         this.arcane::var_219 = param2;
         this.arcane::var_81 = param3;
         this.arcane::var_446 = param4;
         this.arcane::var_1704 = param5;
         this.arcane::var_872 = param6;
         this.arcane::var_544 = param7;
      }
      
      override public function method_2174(param1:class_1774, param2:class_2238) : String
      {
         param1 = param1;
         var _loc3_:String = "";
         var _loc4_:class_2251 = param2.method_2395();
         var _loc5_:class_2251 = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
         param2.method_5487(this,arcane::const_641,_loc5_.index);
         if(this.arcane::var_219)
         {
            _loc3_ += "mul " + _loc4_ + "," + param2.var_2838 + "," + _loc5_ + ".z\n";
            if(this.arcane::var_81)
            {
               _loc3_ += "add " + _loc4_ + "," + _loc4_ + "," + _loc5_ + ".w\n";
            }
            _loc3_ += "sin " + _loc4_ + "," + _loc4_ + "\n";
         }
         _loc3_ += "mul " + _loc4_ + "," + _loc5_ + ".y," + (!!this.arcane::var_219 ? _loc4_ : param2.var_4785) + "\n";
         _loc3_ += "add " + _loc4_ + "," + _loc5_ + ".x," + _loc4_ + "\n";
         return _loc3_ + ("mul " + param2.var_705 + ".xyz," + param2.var_705 + ".xyz," + _loc4_ + "\n");
      }
      
      public function method_3412(param1:class_2120) : class_2752
      {
         return param1.method_3412(this) as class_2752;
      }
      
      override arcane function method_5880(param1:class_2580) : void
      {
         var _loc2_:Vector3D = param1[const_441];
         if(!_loc2_)
         {
            throw new Error("there is no " + const_441 + " in param!");
         }
         if(this.arcane::var_219)
         {
            var_2599[0] = (_loc2_.x + _loc2_.y) / 2;
            var_2599[1] = Math.abs(_loc2_.x - _loc2_.y) / 2;
            if(_loc2_.z <= 0)
            {
               throw new Error("the cycle duration must be greater than zero");
            }
            var_2599[2] = 0 / _loc2_.z;
            if(this.arcane::var_81)
            {
               var_2599[3] = _loc2_.w * 0 / 180;
            }
         }
         else
         {
            var_2599[0] = _loc2_.x;
            var_2599[1] = _loc2_.y - _loc2_.x;
         }
      }
   }
}
