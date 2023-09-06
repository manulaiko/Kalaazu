package package_210
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import org.puremvc.as3.multicore.interfaces.IMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_38.class_658;
   import package_58.SectorControlDraftConfirmationPopUpMediator;
   import package_58.class_155;
   
   public class class_1242 extends SimpleCommand
   {
       
      
      public function class_1242()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:* = null;
         super.execute(param1);
         var _loc2_:class_658 = param1.getBody() as class_658;
         if(facade.hasMediator(SectorControlDraftConfirmationPopUpMediator.NAME))
         {
            facade.removeMediator(SectorControlDraftConfirmationPopUpMediator.NAME);
         }
         _loc3_ = class_57.getInstance().createWindow(class_57.const_1326,class_57.const_2956) as class_155;
         _loc3_.title = class_88.getItem("sectorcontrol_popup_participation_title");
         _loc3_.countDownText = class_88.getItem("sectorcontrol_popup_participation_message");
         _loc3_.method_5816 = class_88.getItem("label_no");
         _loc3_.method_6357 = class_88.getItem("label_yes");
         _loc3_.startTimer(_loc2_.seconds);
         var _loc4_:IMediator = new SectorControlDraftConfirmationPopUpMediator(_loc3_);
         facade.registerMediator(_loc4_);
      }
   }
}
