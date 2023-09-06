package package_210
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import net.bigpoint.darkorbit.mvc.common.view.components.LeaveGamePopUp;
   import org.puremvc.as3.multicore.interfaces.IMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_27.class_82;
   import package_58.SectorControlLeaveGamePopUpMediator;
   
   public class class_1992 extends SimpleCommand
   {
       
      
      public function class_1992()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         if(facade.hasMediator(SectorControlLeaveGamePopUpMediator.NAME))
         {
            facade.removeMediator(SectorControlLeaveGamePopUpMediator.NAME);
         }
         var _loc2_:LeaveGamePopUp = class_57.getInstance().createWindow(class_57.const_1042,class_57.const_2956) as LeaveGamePopUp;
         _loc2_.title = class_88.getItem("sectorcontrol_popup_leavegame_title");
         _loc2_.message = class_88.getItem("sectorcontrol_popup_leavegame_message");
         var _loc3_:IMediator = new SectorControlLeaveGamePopUpMediator(_loc2_);
         facade.registerMediator(_loc3_);
         class_82.playSoundEffect(class_126.const_1856);
      }
   }
}
