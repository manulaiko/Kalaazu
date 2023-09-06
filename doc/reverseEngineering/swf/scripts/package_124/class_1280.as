package package_124
{
   import net.bigpoint.darkorbit.map.model.ship.class_378;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_37.ICommand;
   import package_37.class_170;
   import package_38.class_858;
   
   public class class_1280 extends class_170
   {
       
      
      public function class_1280()
      {
         super();
      }
      
      public static function run(param1:ICommand) : void
      {
         var _loc2_:class_858 = param1 as class_858;
         class_378.method_58(_loc2_.var_2565,map.method_327(_loc2_.var_4071) as class_86);
      }
   }
}
