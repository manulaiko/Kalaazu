package package_125
{
   import net.bigpoint.darkorbit.map.model.traits.class_287;
   import net.bigpoint.darkorbit.map.model.traits.class_299;
   import package_29.class_85;
   import package_35.class_338;
   import package_36.class_1835;
   import package_37.class_170;
   import package_38.class_954;
   
   public class class_1370 extends class_170
   {
      
      private static var _effect:class_1835 = null;
       
      
      public function class_1370()
      {
         super();
      }
      
      public static function run(param1:class_954) : void
      {
         var _loc2_:int = int(param1.name_133);
         var _loc3_:int = int(param1.name_150);
         var _loc4_:int = int(param1.var_256);
         var _loc5_:Boolean = Boolean(param1.var_2527);
         var _loc6_:Boolean = Boolean(param1.var_2935);
         var _loc7_:class_299 = map.method_5806(_loc2_,class_299) as class_299;
         var _loc8_:class_85 = map.method_327(_loc3_);
         if(Boolean(_loc7_) && Boolean(_loc8_))
         {
            _loc7_.target = _loc8_.method_1954(class_287) as class_287;
            fire(_loc7_.owner,_loc8_,_loc4_,_loc5_,_loc6_);
            if(map.effects.method_4909(_loc2_,class_338.const_1105) != null)
            {
               fire(_loc8_,_loc7_.owner,7,false,false);
            }
         }
      }
      
      private static function fire(param1:class_85, param2:class_85, param3:int, param4:Boolean, param5:Boolean) : void
      {
         if(_effect == null)
         {
            _effect = new class_1835();
         }
         _effect.attacker = param1;
         _effect.target = param2;
         _effect.var_3196 = param3;
         _effect.var_1286 = param4;
         _effect.var_2935 = param5;
         map.effects.method_269(_effect);
      }
   }
}
