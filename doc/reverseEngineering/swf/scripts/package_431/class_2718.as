package package_431
{
   import away3d.animators.class_2579;
   import away3d.arcane;
   import flash.geom.ColorTransform;
   import package_309.class_1774;
   import package_385.class_2251;
   import package_386.class_2238;
   import package_386.class_2578;
   import package_386.class_2717;
   import package_430.class_2743;
   
   public class class_2718 extends class_2406
   {
      
      arcane static const const_1461:uint = 0;
      
      arcane static const const_1300:uint = 1;
      
      arcane static const const_2163:uint = 2;
       
      
      arcane var var_291:Boolean;
      
      arcane var var_456:Boolean;
      
      arcane var var_2288:ColorTransform;
      
      arcane var var_148:ColorTransform;
      
      arcane var var_865:int;
      
      arcane var var_1248:Vector.<class_2717>;
      
      public function class_2718(param1:Boolean, param2:Boolean, param3:int, param4:ColorTransform, param5:ColorTransform, param6:Vector.<class_2717>)
      {
         var_4797 = class_2743;
         super("ParticleSegmentedColor",class_2578.name_100,0,class_2579.const_717);
         if(param3 > 4)
         {
            throw new Error("the numSegmentPoint must be less or equal 4");
         }
         this.arcane::var_291 = param1;
         this.arcane::var_456 = param2;
         this.arcane::var_865 = param3;
         this.arcane::var_2288 = param4;
         this.arcane::var_148 = param5;
         this.arcane::var_1248 = param6;
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
      
      override public function method_2174(param1:class_1774, param2:class_2238) : String
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         param1 = param1;
         var _loc3_:String = "";
         if(param2.name_132)
         {
            if(this.arcane::var_291)
            {
               _loc4_ = param2.method_3118();
               param2.method_588(_loc4_,1);
            }
            _loc5_ = param2.method_3118();
            param2.method_588(_loc5_,1);
            _loc6_ = param2.method_3118();
            _loc7_ = new class_2251(_loc6_.method_3684,_loc6_.index,0);
            _loc8_ = new class_2251(_loc6_.method_3684,_loc6_.index,1);
            if(this.arcane::var_291)
            {
               param2.method_5694(_loc4_);
            }
            param2.method_5694(_loc5_);
            _loc9_ = param2.method_5384();
            param2.method_5487(this,arcane::const_2163,_loc9_.index);
            if(this.arcane::var_291)
            {
               _loc11_ = param2.method_5384();
               param2.method_5487(this,arcane::const_1461,_loc11_.index);
               _loc12_ = new Vector.<class_2251>();
               _loc10_ = 0;
               while(_loc10_ < this.arcane::var_865 + 1)
               {
                  _loc12_.push(param2.method_5384());
                  _loc10_++;
               }
            }
            if(this.arcane::var_456)
            {
               _loc13_ = param2.method_5384();
               param2.method_5487(this,arcane::const_1300,_loc13_.index);
               _loc14_ = new Vector.<class_2251>();
               _loc10_ = 0;
               while(_loc10_ < this.arcane::var_865 + 1)
               {
                  _loc14_.push(param2.method_5384());
                  _loc10_++;
               }
            }
            if(this.arcane::var_291)
            {
               _loc3_ += "mov " + _loc4_ + "," + _loc11_ + "\n";
            }
            if(this.arcane::var_456)
            {
               _loc3_ += "add " + param2.var_3848 + "," + param2.var_3848 + "," + _loc13_ + "\n";
            }
            _loc10_ = 0;
            while(_loc10_ < this.arcane::var_865)
            {
               switch(_loc10_)
               {
                  case 0:
                     _loc3_ += "min " + _loc8_ + "," + param2.var_4785 + "," + _loc9_ + ".x\n";
                     break;
                  case 1:
                     _loc3_ += "sub " + _loc7_ + "," + param2.var_4785 + "," + _loc9_ + ".x\n";
                     _loc3_ += "max " + _loc8_ + "," + _loc7_ + "," + param2.var_4178 + "\n";
                     _loc3_ += "min " + _loc8_ + "," + _loc8_ + "," + _loc9_ + ".y\n";
                     break;
                  case 2:
                     _loc3_ += "sub " + _loc7_ + "," + _loc7_ + "," + _loc9_ + ".y\n";
                     _loc3_ += "max " + _loc8_ + "," + _loc7_ + "," + param2.var_4178 + "\n";
                     _loc3_ += "min " + _loc8_ + "," + _loc8_ + "," + _loc9_ + ".z\n";
                     break;
                  case 3:
                     _loc3_ += "sub " + _loc7_ + "," + _loc7_ + "," + _loc9_ + ".z\n";
                     _loc3_ += "max " + _loc8_ + "," + _loc7_ + "," + param2.var_4178 + "\n";
                     _loc3_ += "min " + _loc8_ + "," + _loc8_ + "," + _loc9_ + ".w\n";
                     break;
               }
               if(this.arcane::var_291)
               {
                  _loc3_ += "mul " + _loc5_ + "," + _loc8_ + "," + _loc12_[_loc10_] + "\n";
                  _loc3_ += "add " + _loc4_ + "," + _loc4_ + "," + _loc5_ + "\n";
               }
               if(this.arcane::var_456)
               {
                  _loc3_ += "mul " + _loc5_ + "," + _loc8_ + "," + _loc14_[_loc10_] + "\n";
                  _loc3_ += "add " + param2.var_3848 + "," + param2.var_3848 + "," + _loc5_ + "\n";
               }
               _loc10_++;
            }
            if(this.arcane::var_865 == 0)
            {
               _loc8_ = param2.var_4785;
            }
            else
            {
               switch(this.arcane::var_865)
               {
                  case 1:
                     _loc3_ += "sub " + _loc7_ + "," + param2.var_4785 + "," + _loc9_ + ".x\n";
                     break;
                  case 2:
                     _loc3_ += "sub " + _loc7_ + "," + _loc7_ + "," + _loc9_ + ".y\n";
                     break;
                  case 3:
                     _loc3_ += "sub " + _loc7_ + "," + _loc7_ + "," + _loc9_ + ".z\n";
                     break;
                  case 4:
                     _loc3_ += "sub " + _loc7_ + "," + _loc7_ + "," + _loc9_ + ".w\n";
               }
               _loc3_ += "max " + _loc8_ + "," + _loc7_ + "," + param2.var_4178 + "\n";
            }
            if(this.arcane::var_291)
            {
               _loc3_ += "mul " + _loc5_ + "," + _loc8_ + "," + _loc12_[this.arcane::var_865] + "\n";
               _loc3_ += "add " + _loc4_ + "," + _loc4_ + "," + _loc5_ + "\n";
               _loc3_ += "mul " + param2.var_1404 + "," + param2.var_1404 + "," + _loc4_ + "\n";
            }
            if(this.arcane::var_456)
            {
               _loc3_ += "mul " + _loc5_ + "," + _loc8_ + "," + _loc14_[this.arcane::var_865] + "\n";
               _loc3_ += "add " + param2.var_3848 + "," + param2.var_3848 + "," + _loc5_ + "\n";
            }
         }
         return _loc3_;
      }
   }
}
