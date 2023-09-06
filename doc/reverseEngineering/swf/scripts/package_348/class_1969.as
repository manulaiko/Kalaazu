package package_348
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_17.class_62;
   import package_33.class_93;
   import package_404.class_2294;
   import package_404.class_2295;
   import package_404.class_2297;
   import package_404.class_2298;
   import package_404.class_2299;
   import package_404.class_2301;
   import package_405.SettingsWindowFUIMediator;
   import package_405.class_2296;
   import package_405.class_2300;
   import package_406.SettingsWindowFUIProxy;
   import package_406.class_2302;
   import package_46.class_131;
   import package_73.class_196;
   import package_84.class_1134;
   
   public class class_1969 extends class_1134
   {
       
      
      public function class_1969()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_131 = (!!guiManager.method_468(GuiConstants.SETTINGS_WINDOW) ? guiManager.method_468(GuiConstants.SETTINGS_WINDOW) : guiManager.createWindow(GuiConstants.SETTINGS_WINDOW)) as class_131;
         var _loc3_:class_93 = _loc2_.method_3694(0);
         var _loc4_:DisplayObjectContainer = new Sprite();
         _loc3_.addElement(_loc4_);
         UISystem.getInstance().loadAndBuildWithResKey(class_2300.const_194,_loc4_,this.method_2357,[_loc2_,_loc4_]);
      }
      
      private function method_2357(param1:class_131, param2:Sprite) : void
      {
         var _loc3_:Coreponent = param2.getChildAt(0) as Coreponent;
         var _loc4_:SettingsWindowFUIMediator = new SettingsWindowFUIMediator(new class_2296(_loc3_),param1);
         class_62.getInstance().registerMediator(_loc4_);
         param1.autoSize();
         var _loc5_:SettingsWindowFUIProxy = new SettingsWindowFUIProxy(new class_2302());
         class_62.getInstance().registerProxy(_loc5_);
         class_62.getInstance().registerCommand(class_196.SETTINGS_WINDOW_FUI_SAVE_SETTINGS,class_2297);
         class_62.getInstance().registerCommand(class_196.SETTINGS_WINDOW_FUI_APPLY_MODEL_CHANGES,class_2301);
         class_62.getInstance().registerCommand(class_196.SETTINGS_WINDOW_FUI_SAVE_SETTINGS_USER_REQUEST,class_2298);
         class_62.getInstance().registerCommand(class_196.SETTINGS_WINDOW_FUI_SETTING_CHANGED,class_2299);
         class_62.getInstance().registerCommand(class_196.SETTINGS_WINDOW_FUI_CANCEL_SETTINGS,class_2295);
         class_62.getInstance().registerCommand(class_196.SETTINGS_WINDOW_FUI_APPLY_SETTINGS_FROM_SERVER,class_2294);
         _loc5_.method_4606();
      }
   }
}
