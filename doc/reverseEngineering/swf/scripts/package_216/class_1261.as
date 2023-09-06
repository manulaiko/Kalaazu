package package_216
{
   import package_37.class_170;
   import package_38.class_770;
   import package_80.QuestProxy;
   
   public class class_1261 extends class_170
   {
       
      
      public function class_1261()
      {
         super();
      }
      
      public static function run(param1:class_770) : void
      {
         var _loc2_:int = int(param1.var_1775);
         var _loc3_:int = int(var_574.method_2732().method_5524(_loc2_));
         if(_loc3_ < 0)
         {
            return;
         }
         var _loc4_:int = int(param1.state.currentValue);
         var _loc5_:Boolean = Boolean(param1.state.active);
         var _loc6_:Boolean = Boolean(param1.state.completed);
         var_574.method_6154().method_4689.method_3002(_loc3_,_loc2_,_loc4_,_loc5_,_loc6_);
         if(method_3605)
         {
            method_3605.method_4836(_loc2_,_loc4_,_loc5_,_loc6_);
         }
      }
      
      private static function get method_3605() : QuestProxy
      {
         return var_271.retrieveProxy(QuestProxy.NAME) as QuestProxy;
      }
   }
}
