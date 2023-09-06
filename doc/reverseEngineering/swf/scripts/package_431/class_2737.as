package package_431
{
   import away3d.arcane;
   import flash.geom.Vector3D;
   import package_309.class_1774;
   import package_385.class_2251;
   import package_386.class_2238;
   import package_386.class_2578;
   import package_430.class_2755;
   
   public class class_2737 extends class_2406
   {
      
      arcane static const const_2910:uint = 0;
       
      
      arcane var var_2685:Vector3D;
      
      arcane var var_71:Vector3D;
      
      arcane var var_865:int;
      
      arcane var var_2368:Vector.<Vector3D>;
      
      public function class_2737(param1:int, param2:Vector3D, param3:Vector3D, param4:Vector.<Vector3D>)
      {
         var_4797 = class_2755;
         super("ParticleSegmentedScale",class_2578.name_100,0,3);
         this.arcane::var_865 = param1;
         this.arcane::var_2685 = param2;
         this.arcane::var_71 = param3;
         this.arcane::var_2368 = param4;
      }
      
      override public function method_2174(param1:class_1774, param2:class_2238) : String
      {
         var _loc4_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         param1 = param1;
         var _loc3_:String = "";
         _loc4_ = param2.method_3118();
         param2.method_588(_loc4_,1);
         var _loc5_:class_2251 = param2.method_3118();
         param2.method_588(_loc5_,1);
         var _loc6_:class_2251 = param2.method_3118();
         var _loc7_:class_2251 = new class_2251(_loc6_.method_3684,_loc6_.index,0);
         var _loc8_:class_2251 = new class_2251(_loc6_.method_3684,_loc6_.index,1);
         param2.method_5694(_loc4_);
         param2.method_5694(_loc5_);
         _loc10_ = param2.method_5384();
         param2.method_5487(this,arcane::const_2910,_loc10_.index);
         _loc11_ = new Vector.<class_2251>();
         _loc9_ = 0;
         while(_loc9_ < this.arcane::var_865 + 1)
         {
            _loc11_.push(param2.method_5384());
            _loc9_++;
         }
         _loc3_ += "mov " + _loc4_ + "," + _loc10_ + "\n";
         _loc9_ = 0;
         while(_loc9_ < this.arcane::var_865)
         {
            switch(_loc9_)
            {
               case 0:
                  _loc3_ += "min " + _loc8_ + "," + param2.var_4785 + "," + _loc11_[_loc9_] + ".w\n";
                  break;
               case 1:
                  _loc3_ += "sub " + _loc7_ + "," + param2.var_4785 + "," + _loc11_[_loc9_ - 1] + ".w\n";
                  _loc3_ += "max " + _loc8_ + "," + _loc7_ + "," + param2.var_4178 + "\n";
                  _loc3_ += "min " + _loc8_ + "," + _loc8_ + "," + _loc11_[_loc9_] + ".w\n";
                  break;
               default:
                  _loc3_ += "sub " + _loc7_ + "," + _loc7_ + "," + _loc11_[_loc9_ - 1] + ".w\n";
                  _loc3_ += "max " + _loc8_ + "," + _loc7_ + "," + param2.var_4178 + "\n";
                  _loc3_ += "min " + _loc8_ + "," + _loc8_ + "," + _loc11_[_loc9_] + ".w\n";
                  break;
            }
            _loc3_ += "mul " + _loc5_ + "," + _loc8_ + "," + _loc11_[_loc9_] + "\n";
            _loc3_ += "add " + _loc4_ + "," + _loc4_ + "," + _loc5_ + "\n";
            _loc9_++;
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
                  _loc3_ += "sub " + _loc7_ + "," + param2.var_4785 + "," + _loc11_[this.arcane::var_865 - 1] + ".w\n";
                  break;
               default:
                  _loc3_ += "sub " + _loc7_ + "," + _loc7_ + "," + _loc11_[this.arcane::var_865 - 1] + ".w\n";
            }
            _loc3_ += "max " + _loc8_ + "," + _loc7_ + "," + param2.var_4178 + "\n";
         }
         _loc3_ += "mul " + _loc5_ + "," + _loc8_ + "," + _loc11_[this.arcane::var_865] + "\n";
         _loc3_ += "add " + _loc4_ + "," + _loc4_ + "," + _loc5_ + "\n";
         return _loc3_ + ("mul " + param2.var_705 + ".xyz," + param2.var_705 + ".xyz," + _loc4_ + ".xyz\n");
      }
   }
}
