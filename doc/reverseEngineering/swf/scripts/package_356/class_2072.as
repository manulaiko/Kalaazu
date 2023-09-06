package package_356
{
   import net.bigpoint.darkorbit.map.model.traits.class_299;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_22.class_1080;
   import package_22.class_1088;
   import package_22.class_198;
   import package_36.class_1835;
   
   public class class_2072
   {
       
      
      public function class_2072(param1:class_1206, param2:class_1835)
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         super();
         if(Boolean(param2.attacker) && Boolean(param2.target))
         {
            _loc3_ = int(class_299(param2.attacker.method_1954(class_299)).laser.laserClassID);
            if(_loc3_ != -1)
            {
               if(_loc4_ = class_198.method_1337(_loc3_,param2.var_3196))
               {
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_.var_2701.length)
                  {
                     _loc6_ = _loc4_.var_2701[_loc5_];
                     param1.fxLayer.addChild(new class_2354(param2.attacker,param2.target,_loc6_,param2.var_1286,param2.var_2935,param1));
                     _loc5_++;
                  }
               }
            }
         }
      }
   }
}
