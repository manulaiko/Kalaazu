package package_124
{
   import flash.utils.setTimeout;
   import package_37.ICommand;
   import package_37.class_170;
   import package_37.class_363;
   import package_38.class_956;
   import package_39.class_100;
   
   public class class_1359 extends class_170
   {
       
      
      public function class_1359()
      {
         super();
      }
      
      public static function run(param1:class_956) : void
      {
         var _loc3_:* = null;
         var _loc2_:class_100 = class_100.getInstance();
         var_574.method_4489().method_5056(param1.var_3078,param1.var_2001,param1.var_2740);
         class_363.execute(param1.var_2490);
         for each(_loc3_ in param1.options)
         {
            class_363.execute(_loc3_);
         }
         setTimeout(_loc2_.method_3317,1);
      }
   }
}
