package package_409
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.fui.components.core.Container;
   import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_11.class_262;
   import package_326.PlagueWindowNotifications;
   import package_326.class_2679;
   import package_327.PlagueWindowProxy;
   import package_33.class_93;
   import package_46.class_131;
   import package_476.PlagueWindowMediator;
   import package_84.class_1134;
   
   public class class_2545 extends class_1134
   {
       
      
      public function class_2545()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         sendNotification(AssetNotifications.PRELOAD_LIST,"plague",AssetNotifications.TYPE_PRELOAD_LIST_TYPE_PATTERN_KEY);
         var _loc2_:class_131 = (!!guiManager.method_468(GuiConstants.PLAGUE_WINDOW) ? guiManager.method_468(GuiConstants.PLAGUE_WINDOW) : guiManager.createWindow(GuiConstants.PLAGUE_WINDOW)) as class_131;
         var _loc3_:class_93 = _loc2_.method_3694(0);
         var _loc4_:DisplayObjectContainer = new Sprite();
         _loc3_.addElement(_loc4_);
         UISystem.getInstance().loadAndBuildWithResKey(class_2679.const_194,_loc4_,this.method_2357,[_loc2_,_loc4_]);
      }
      
      private function method_2357(param1:class_131, param2:Sprite) : void
      {
         var _loc3_:Container = param2.getChildAt(0) as Container;
         registerMediator(new PlagueWindowMediator(_loc3_,param1,this.method_2110(class_2679.const_1894),this.method_2110(class_2679.const_2299),this.method_2110(class_2679.const_1268)));
         param1.autoSize();
         var _loc4_:PlagueWindowProxy;
         (_loc4_ = retrieveProxy(PlagueWindowProxy.NAME) as PlagueWindowProxy).updateView();
         registerCommand(PlagueWindowNotifications.CLEANUP,class_2680);
         commandComplete();
      }
      
      private function method_2110(param1:String) : Container
      {
         var _loc2_:XML = (assetsProxy.getLib(param1) as class_262).method_4925();
         var _loc3_:Sprite = new Sprite();
         UISystem.getInstance().build(_loc2_,_loc3_);
         return _loc3_.getChildAt(0) as Container;
      }
   }
}
