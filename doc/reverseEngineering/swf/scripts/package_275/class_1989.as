package package_275
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.model.vo.VideoWindowVO;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_330.VideoWindowNotification;
   import package_38.class_440;
   import package_38.class_642;
   import package_38.class_705;
   
   public class class_1989 extends SimpleCommand
   {
       
      
      public function class_1989()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:String = param1.getName();
         switch(_loc2_)
         {
            case VideoWindowNotification.const_177:
               _loc3_ = class_126.getInstance();
               _loc4_ = param1.getBody() as class_440;
               _loc5_ = uint(_loc3_.method_2994(_loc4_.var_1328));
               this.createVideoWindow(_loc4_,_loc5_);
               break;
            case VideoWindowNotification.const_480:
               _loc6_ = param1.getBody() as class_642;
               this.method_603(_loc6_);
               break;
            case VideoWindowNotification.const_12:
               _loc7_ = param1.getBody() as class_705;
               this.removeVideoWindow(_loc7_);
         }
      }
      
      private function createVideoWindow(param1:class_440, param2:uint) : void
      {
         sendNotification(GuiNotifications.CREATE_VIDEO_WINDOW,new VideoWindowVO(param1.languageKeys,param1.name_85,param1.var_1822,param2,param1.showButtons,param1.var_5049));
      }
      
      private function removeVideoWindow(param1:class_705) : void
      {
         sendNotification(GuiNotifications.REMOVE_VIDEO_WINDOW,param1.name_85);
      }
      
      private function method_603(param1:class_642) : void
      {
         sendNotification(GuiNotifications.SHOW_NEXT_PAGE_OF_VIDEO_WINDOW,param1.name_85);
      }
   }
}
