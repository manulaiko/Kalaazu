package package_187
{
   import flash.geom.Point;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_108.GroupProxy;
   import package_264.GroupSystemMediator;
   import package_278.class_1688;
   import package_44.GroupSystemNotification;
   import package_46.class_131;
   import package_84.class_243;
   
   public class class_1664 extends class_243
   {
       
      
      public function class_1664()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         this.method_1327();
      }
      
      private function method_1327() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!facade.hasMediator(GroupSystemMediator.NAME))
         {
            _loc1_ = guiProxy.getWindowById(GuiConstants.GROUP_SYSTEM_WINDOW);
            if(!_loc1_)
            {
               sendNotification(GuiNotifications.CREATE_WINDOW,GuiConstants.GROUP_SYSTEM_WINDOW);
               _loc1_ = guiProxy.getWindowById(GuiConstants.GROUP_SYSTEM_WINDOW);
            }
            _loc2_ = new class_1688();
            _loc1_.method_1655(_loc2_);
            _loc2_.method_5942(new Point(15,30));
            _loc2_.method_558();
            _loc2_.method_2590 = _loc1_;
            facade.registerMediator(new GroupSystemMediator(_loc2_));
            _loc3_ = facade.retrieveProxy(GroupProxy.NAME) as GroupProxy;
            sendNotification(GroupSystemNotification.UPDATE_UI,_loc3_.getData());
         }
      }
   }
}
