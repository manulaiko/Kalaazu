package package_216
{
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import package_329.class_1823;
   import package_329.class_1824;
   import package_329.class_1825;
   import package_329.class_1826;
   import package_329.class_1827;
   import package_329.class_1828;
   import package_329.class_1829;
   import package_329.class_1830;
   import package_329.class_1831;
   import package_329.class_1832;
   import package_329.class_1833;
   import package_37.class_170;
   import package_38.class_454;
   import package_80.QuestProxy;
   import package_81.class_237;
   
   public class class_1364 extends class_170
   {
       
      
      public function class_1364()
      {
         super();
      }
      
      public static function run(param1:class_454) : void
      {
         var _loc2_:QuestProxy = var_271.retrieveProxy(QuestProxy.NAME) as QuestProxy;
         if(!_loc2_)
         {
            var_271.registerProxy(new QuestProxy(QuestProxy.NAME));
            _loc2_ = var_271.retrieveProxy(QuestProxy.NAME) as QuestProxy;
            _loc2_.method_5755(var_574.method_6154());
            _loc2_.method_5808(var_574.method_2732());
            var_271.registerCommand(class_237.const_1272,class_1829);
            var_271.registerCommand(class_237.ACCEPT_QUEST,class_1825);
            var_271.registerCommand(class_237.ABORT_QUEST,class_1831);
            var_271.registerCommand(class_237.const_2749,class_1824);
            var_271.registerCommand(class_237.const_1661,class_1830);
            var_271.registerCommand(class_237.const_1678,class_1823);
            var_271.registerCommand(class_237.const_2967,class_1833);
            var_271.registerCommand(class_237.const_2117,class_1828);
            var_271.registerCommand(class_237.const_1919,class_1832);
            var_271.registerCommand(class_237.const_854,class_1827);
            var_271.registerCommand(NaN,class_1826);
         }
         _loc2_.method_593(param1);
      }
   }
}
