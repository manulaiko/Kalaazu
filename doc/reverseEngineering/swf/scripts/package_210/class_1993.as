package package_210
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_27.class_82;
   import package_58.SectorControlLeaveQueuePopUp;
   import package_58.SectorControlLeaveQueuePopUpMediator;
   
   public class class_1993 extends SimpleCommand
   {
       
      
      public function class_1993()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         if(facade.hasMediator(SectorControlLeaveQueuePopUpMediator.NAME))
         {
            facade.removeMediator(SectorControlLeaveQueuePopUpMediator.NAME);
         }
         var _loc2_:SectorControlLeaveQueuePopUp = class_57.getInstance().createWindow(class_57.const_1671,class_57.const_2956) as SectorControlLeaveQueuePopUp;
         _loc2_.title = class_88.getItem("title_sectorcontrol_ingame_status");
         _loc2_.message = class_88.getItem("sectorcontrol_lobby_window_popup_message");
         var _loc3_:uint = param1.getBody() as uint;
         var _loc4_:SectorControlLeaveQueuePopUpMediator;
         (_loc4_ = new SectorControlLeaveQueuePopUpMediator(_loc2_)).matchID = _loc3_;
         facade.registerMediator(_loc4_);
         class_82.playSoundEffect(class_126.const_1856);
      }
   }
}
