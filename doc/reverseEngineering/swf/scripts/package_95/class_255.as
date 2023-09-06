package package_95
{
   import net.bigpoint.darkorbit.mvc.common.controller.assets.init.InitAssetsProxyCommand;
   import net.bigpoint.darkorbit.mvc.gui.controller.init.InitGuiCommand;
   import net.bigpoint.darkorbit.mvc.mapElements.common.controller.MapAssetSystemStartup;
   import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
   import package_87.class_1127;
   import package_87.class_1128;
   import package_87.class_1129;
   import package_87.class_1130;
   import package_87.class_1132;
   import package_87.class_1133;
   import package_87.class_1135;
   import package_87.class_1136;
   import package_87.class_1138;
   import package_87.class_1139;
   import package_87.class_1140;
   import package_87.class_1141;
   import package_87.class_1142;
   import package_87.class_1143;
   import package_87.class_1144;
   import package_87.class_1145;
   import package_87.class_247;
   
   public class class_255 extends AsyncMacroCommand
   {
       
      
      public function class_255()
      {
         super();
      }
      
      override protected function initializeAsyncMacroCommand() : void
      {
         addSubCommand(class_1126);
         addSubCommand(MapAssetSystemStartup);
         addSubCommand(class_1132);
         addSubCommand(class_1138);
         addSubCommand(class_1142);
         addSubCommand(class_1140);
         addSubCommand(class_1135);
         addSubCommand(class_1130);
         addSubCommand(class_1129);
         addSubCommand(class_1144);
         addSubCommand(class_247);
         addSubCommand(class_1136);
         addSubCommand(InitGuiCommand);
         addSubCommand(class_1141);
         addSubCommand(class_1133);
         addSubCommand(InitAssetsProxyCommand);
         addSubCommand(class_1145);
         addSubCommand(class_1143);
         addSubCommand(class_1128);
         addSubCommand(class_1127);
         addSubCommand(class_1137);
         addSubCommand(class_1131);
         addSubCommand(class_1139);
      }
   }
}
