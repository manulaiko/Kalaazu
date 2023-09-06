package package_431
{
   import away3d.animators.class_2120;
   import away3d.animators.class_2579;
   import away3d.arcane;
   import flash.geom.Vector3D;
   import package_309.class_1774;
   import package_385.class_2251;
   import package_386.class_2238;
   import package_386.class_2578;
   import package_386.class_2580;
   import package_430.class_2749;
   
   public class class_2727 extends class_2406
   {
      
      arcane static const const_836:uint = 0;
      
      public static const name_100:uint = 1;
      
      public static const const_3169:String = "x";
      
      public static const const_1335:String = "y";
      
      public static const const_1024:int = 1;
      
      public static const const_1737:int = 2;
      
      public static const const_1313:String = "UVCycle";
      
      public static const const_1575:String = "UVSclae";
       
      
      arcane var var_3340:Vector3D;
      
      arcane var var_860:Number;
      
      arcane var _scale:Number;
      
      arcane var var_613:String;
      
      arcane var var_1003:int;
      
      public function class_2727(param1:uint, param2:Number = 1, param3:Number = 1, param4:String = "x", param5:int = 1)
      {
         super("ParticleUV",param1,2,NaN);
         var_4797 = class_2749;
         this.arcane::var_860 = param2;
         this.arcane::_scale = param3;
         this.arcane::var_613 = param4;
         this.arcane::var_1003 = param5;
      }
      
      override public function method_45(param1:class_1774, param2:class_2238) : String
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:* = null;
         var _loc7_:* = null;
         param1 = param1;
         var _loc3_:String = "";
         if(param2.name_26)
         {
            _loc4_ = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
            param2.method_5487(this,arcane::const_836,_loc4_.index);
            _loc5_ = this.arcane::var_613 == "x" ? 0 : (this.arcane::var_613 == "y" ? 1 : 2);
            _loc6_ = new class_2251(param2.var_741.method_3684,param2.var_741.index,_loc5_);
            _loc7_ = param2.method_2395();
            if(this.arcane::_scale != 1)
            {
               _loc3_ += "mul " + _loc6_ + "," + _loc6_ + "," + _loc4_ + ".y\n";
            }
            switch(this.arcane::var_1003)
            {
               case const_1737:
                  _loc3_ += "mul " + _loc7_ + "," + param2.var_2838 + "," + _loc4_ + ".x\n";
                  _loc3_ += "sin " + _loc7_ + "," + _loc7_ + "\n";
                  break;
               case const_1024:
               default:
                  _loc3_ += "mul " + _loc7_ + "," + param2.var_2838 + "," + _loc4_ + ".x\n";
            }
            _loc3_ += "add " + _loc6_ + "," + _loc6_ + "," + _loc7_ + "\n";
         }
         return _loc3_;
      }
      
      public function method_3412(param1:class_2120) : class_2749
      {
         return param1.method_3412(this) as class_2749;
      }
      
      override arcane function method_2127(param1:class_2579) : void
      {
         param1.var_4176 = true;
      }
      
      override arcane function method_5880(param1:class_2580) : void
      {
         if(!param1.hasOwnProperty(const_1313) || !(param1[const_1313] is Number))
         {
            throw new Error("there is no " + const_1313 + " in param!");
         }
         var _loc2_:Number = Number(param1[const_1313]);
         var _loc3_:Number = 1;
         if(Boolean(param1.hasOwnProperty(const_1575)) && param1[const_1575] is Number)
         {
            _loc3_ = Number(param1[const_1575]);
         }
         switch(this.arcane::var_1003)
         {
            case const_1737:
               var_2599[0] = 0 / _loc2_;
               break;
            case const_1024:
            default:
               var_2599[0] = 1 / _loc2_;
         }
         var_2599[1] = _loc3_;
      }
   }
}
