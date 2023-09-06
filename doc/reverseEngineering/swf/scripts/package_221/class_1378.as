package package_221
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.model.vo.LogMessageVO;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_38.class_567;
   
   public class class_1378 extends SimpleCommand
   {
       
      
      public function class_1378()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_567 = param1.getBody() as class_567;
         switch(_loc2_.type)
         {
            case class_567.const_3014:
            case class_567.const_297:
               sendNotification(GuiNotifications.WRITE_TO_LOG,new LogMessageVO(class_88.getItem("label_grp_follow_impossible")));
               break;
            case class_567.const_1695:
            case class_567.const_512:
         }
      }
   }
}
