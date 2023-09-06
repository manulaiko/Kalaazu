package package_124
{
   import package_37.ICommand;
   import package_37.class_170;
   import package_38.class_522;
   import package_75.class_369;
   import package_9.class_50;
   
   public class class_1256 extends class_170
   {
       
      
      public function class_1256()
      {
         super();
      }
      
      public static function run(param1:ICommand) : void
      {
         var _loc2_:class_522 = param1 as class_522;
         class_50.getInstance().map.effects.method_5084(new class_369(class_50.getInstance().map.method_1203().method_2455(_loc2_.uid)));
      }
   }
}
