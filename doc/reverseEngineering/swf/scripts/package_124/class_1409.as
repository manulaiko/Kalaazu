package package_124
{
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_37.ICommand;
   import package_37.class_170;
   import package_38.class_810;
   import package_38.class_930;
   
   public class class_1409 extends class_170
   {
       
      
      public function class_1409()
      {
         super();
      }
      
      public static function run(param1:ICommand) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:class_810 = param1 as class_810;
         if(var_574.name_47.map)
         {
            _loc3_ = var_574.name_47.map.method_1203().method_2455(_loc2_.name_128);
            _loc4_ = _loc2_.var_704;
            _loc3_.info.name_155.value = _loc4_.type;
            _loc3_.info.name_32.value = _loc2_.name_45;
         }
      }
   }
}
