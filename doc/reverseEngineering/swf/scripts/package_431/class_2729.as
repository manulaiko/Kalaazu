package package_431
{
   import away3d.animators.class_2120;
   import away3d.animators.class_2579;
   import away3d.arcane;
   import flash.geom.ColorTransform;
   import package_309.class_1774;
   import package_385.class_2251;
   import package_386.class_2238;
   import package_386.class_2578;
   import package_386.class_2580;
   import package_430.class_2751;
   
   public class class_2729 extends class_2406
   {
      
      arcane static const const_1461:uint = 0;
      
      arcane static const const_332:uint = 1;
      
      arcane static const const_1300:uint = 2;
      
      arcane static const const_2716:uint = 3;
      
      arcane static const const_119:uint = 4;
      
      public static const const_1540:String = "ColorStartColorTransform";
      
      public static const const_1523:String = "ColorEndColorTransform";
       
      
      arcane var var_291:Boolean;
      
      arcane var var_456:Boolean;
      
      arcane var var_219:Boolean;
      
      arcane var var_81:Boolean;
      
      arcane var var_2288:ColorTransform;
      
      arcane var var_148:ColorTransform;
      
      arcane var var_872:Number;
      
      arcane var var_544:Number;
      
      public function class_2729(param1:uint, param2:Boolean = true, param3:Boolean = true, param4:Boolean = false, param5:Boolean = false, param6:ColorTransform = null, param7:ColorTransform = null, param8:Number = 1, param9:Number = 0)
      {
         var_4797 = class_2751;
         this.arcane::var_291 = param2;
         this.arcane::var_456 = param3;
         this.arcane::var_219 = param4;
         this.arcane::var_81 = param5;
         this.arcane::var_2288 = param6 || new ColorTransform();
         this.arcane::var_148 = param7 || new ColorTransform();
         this.arcane::var_872 = param8;
         this.arcane::var_544 = param9;
         super("ParticleColor",param1,Boolean(this.arcane::var_291) && Boolean(this.arcane::var_456) ? 16 : 8,class_2579.const_717);
      }
      
      override public function method_2174(param1:class_1774, param2:class_2238) : String
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         param1 = param1;
         var _loc3_:String = "";
         if(param2.name_132)
         {
            _loc4_ = param2.method_3118();
            if(this.arcane::var_219)
            {
               _loc5_ = param2.method_5384();
               param2.method_5487(this,arcane::const_119,_loc5_.index);
               param2.method_588(_loc4_,1);
               _loc6_ = param2.method_2395();
               param2.method_5694(_loc4_);
               _loc3_ += "mul " + _loc6_ + "," + param2.var_2838 + "," + _loc5_ + ".x\n";
               if(this.arcane::var_81)
               {
                  _loc3_ += "add " + _loc6_ + "," + _loc6_ + "," + _loc5_ + ".y\n";
               }
               _loc3_ += "sin " + _loc6_ + "," + _loc6_ + "\n";
            }
            if(this.arcane::var_291)
            {
               _loc7_ = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
               _loc8_ = _mode == class_2578.name_100 ? param2.method_5384() : param2.method_723();
               param2.method_5487(this,arcane::const_1461,_loc7_.index);
               param2.method_5487(this,arcane::const_332,_loc8_.index);
               _loc3_ += "mul " + _loc4_ + "," + _loc8_ + "," + (!!this.arcane::var_219 ? _loc6_ : param2.var_4785) + "\n";
               _loc3_ += "add " + _loc4_ + "," + _loc4_ + "," + _loc7_ + "\n";
               _loc3_ += "mul " + param2.var_1404 + "," + _loc4_ + "," + param2.var_1404 + "\n";
            }
            if(this.arcane::var_456)
            {
               _loc9_ = _mode == class_2578.name_24 ? param2.method_723() : param2.method_5384();
               _loc10_ = _mode == class_2578.name_24 ? param2.method_723() : param2.method_5384();
               param2.method_5487(this,arcane::const_1300,_loc9_.index);
               param2.method_5487(this,arcane::const_2716,_loc10_.index);
               _loc3_ += "mul " + _loc4_ + "," + _loc10_ + "," + (!!this.arcane::var_219 ? _loc6_ : param2.var_4785) + "\n";
               _loc3_ += "add " + _loc4_ + "," + _loc4_ + "," + _loc9_ + "\n";
               _loc3_ += "add " + param2.var_3848 + "," + _loc4_ + "," + param2.var_3848 + "\n";
            }
         }
         return _loc3_;
      }
      
      public function method_3412(param1:class_2120) : class_2751
      {
         return param1.method_3412(this) as class_2751;
      }
      
      override arcane function method_2127(param1:class_2579) : void
      {
         if(this.arcane::var_291)
         {
            param1.var_3056 = true;
         }
         if(this.arcane::var_456)
         {
            param1.var_3262 = true;
         }
      }
      
      override arcane function method_5880(param1:class_2580) : void
      {
         var _loc4_:Number = 0;
         var _loc2_:ColorTransform = param1[const_1540];
         if(!_loc2_)
         {
            throw new Error("there is no " + const_1540 + " in param!");
         }
         var _loc3_:ColorTransform = param1[const_1523];
         if(!_loc3_)
         {
            throw new Error("there is no " + const_1523 + " in param!");
         }
         if(!this.arcane::var_219)
         {
            if(this.arcane::var_291)
            {
               var _loc5_:*;
               var_2599[_loc5_ = _loc4_++] = _loc2_.redMultiplier;
               var _loc6_:*;
               var_2599[_loc6_ = _loc4_++] = _loc2_.greenMultiplier;
               var _loc7_:*;
               var_2599[_loc7_ = _loc4_++] = _loc2_.blueMultiplier;
               var _loc8_:*;
               var_2599[_loc8_ = _loc4_++] = _loc2_.alphaMultiplier;
               var _loc9_:*;
               var_2599[_loc9_ = _loc4_++] = _loc3_.redMultiplier - _loc2_.redMultiplier;
               var _loc10_:*;
               var_2599[_loc10_ = _loc4_++] = _loc3_.greenMultiplier - _loc2_.greenMultiplier;
               var _loc11_:*;
               var_2599[_loc11_ = _loc4_++] = _loc3_.blueMultiplier - _loc2_.blueMultiplier;
               var _loc12_:*;
               var_2599[_loc12_ = _loc4_++] = _loc3_.alphaMultiplier - _loc2_.alphaMultiplier;
            }
            if(this.arcane::var_456)
            {
               var_2599[_loc5_ = _loc4_++] = _loc2_.redOffset / 255;
               var_2599[_loc6_ = _loc4_++] = _loc2_.greenOffset / 255;
               var_2599[_loc7_ = _loc4_++] = _loc2_.blueOffset / 255;
               var_2599[_loc8_ = _loc4_++] = _loc2_.alphaOffset / 255;
               var_2599[_loc9_ = _loc4_++] = (_loc3_.redOffset - _loc2_.redOffset) / 255;
               var_2599[_loc10_ = _loc4_++] = (_loc3_.greenOffset - _loc2_.greenOffset) / 255;
               var_2599[_loc11_ = _loc4_++] = (_loc3_.blueOffset - _loc2_.blueOffset) / 255;
               var_2599[_loc12_ = _loc4_++] = (_loc3_.alphaOffset - _loc2_.alphaOffset) / 255;
            }
         }
         else
         {
            if(this.arcane::var_291)
            {
               var_2599[_loc5_ = _loc4_++] = (_loc2_.redMultiplier + _loc3_.redMultiplier) / 2;
               var_2599[_loc6_ = _loc4_++] = (_loc2_.greenMultiplier + _loc3_.greenMultiplier) / 2;
               var_2599[_loc7_ = _loc4_++] = (_loc2_.blueMultiplier + _loc3_.blueMultiplier) / 2;
               var_2599[_loc8_ = _loc4_++] = (_loc2_.alphaMultiplier + _loc3_.alphaMultiplier) / 2;
               var_2599[_loc9_ = _loc4_++] = (_loc2_.redMultiplier - _loc3_.redMultiplier) / 2;
               var_2599[_loc10_ = _loc4_++] = (_loc2_.greenMultiplier - _loc3_.greenMultiplier) / 2;
               var_2599[_loc11_ = _loc4_++] = (_loc2_.blueMultiplier - _loc3_.blueMultiplier) / 2;
               var_2599[_loc12_ = _loc4_++] = (_loc2_.alphaMultiplier - _loc3_.alphaMultiplier) / 2;
            }
            if(this.arcane::var_456)
            {
               var_2599[_loc5_ = _loc4_++] = (_loc2_.redOffset + _loc3_.redOffset) / 510;
               var_2599[_loc6_ = _loc4_++] = (_loc2_.greenOffset + _loc3_.greenOffset) / 510;
               var_2599[_loc7_ = _loc4_++] = (_loc2_.blueOffset + _loc3_.blueOffset) / 510;
               var_2599[_loc8_ = _loc4_++] = (_loc2_.alphaOffset + _loc3_.alphaOffset) / 510;
               var_2599[_loc9_ = _loc4_++] = (_loc2_.redOffset - _loc3_.redOffset) / 510;
               var_2599[_loc10_ = _loc4_++] = (_loc2_.greenOffset - _loc3_.greenOffset) / 510;
               var_2599[_loc11_ = _loc4_++] = (_loc2_.blueOffset - _loc3_.blueOffset) / 510;
               var_2599[_loc12_ = _loc4_++] = (_loc2_.alphaOffset - _loc3_.alphaOffset) / 510;
            }
         }
      }
   }
}
