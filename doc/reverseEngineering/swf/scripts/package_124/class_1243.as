package package_124
{
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_37.class_170;
   import package_38.class_698;
   import package_75.class_355;
   
   public class class_1243 extends class_170
   {
       
      
      public function class_1243()
      {
         super();
      }
      
      public static function run(param1:class_698) : void
      {
         var _loc2_:class_90 = var_574.name_47.map;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:class_86 = _loc2_.method_1203().method_2455(param1.var_976);
         if(_loc3_ == null)
         {
            return;
         }
         _loc2_.effects.method_5084(new class_355(_loc3_,param1.timer,true));
      }
   }
}
