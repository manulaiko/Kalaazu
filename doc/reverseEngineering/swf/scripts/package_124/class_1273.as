package package_124
{
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_37.ICommand;
   import package_37.class_170;
   import package_38.class_768;
   
   public class class_1273 extends class_170
   {
       
      
      public function class_1273()
      {
         super();
      }
      
      public static function run(param1:ICommand) : void
      {
         var _loc3_:* = null;
         var _loc2_:class_768 = param1 as class_768;
         if(var_574.name_47.map)
         {
            _loc3_ = var_574.name_47.map.method_1203().method_2455(_loc2_.name_128);
            _loc3_.info.name_32.value = _loc2_.name_45;
            _loc3_.info.name_145.value = _loc2_.name_145;
         }
         if(_loc2_.name_128 == class_81.userID)
         {
            class_81.name_145 = _loc2_.name_145;
            class_81.name_32 = _loc2_.name_45;
         }
      }
   }
}
