package package_221
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.model.vo.LogMessageVO;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_220.class_1270;
   import package_38.class_430;
   
   public class class_1428 extends class_1270
   {
       
      
      public function class_1428()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_430 = param1.getBody() as class_430;
         var _loc3_:class_126 = class_126.instance;
         sendNotification(GuiNotifications.WRITE_TO_LOG,new LogMessageVO(class_88.getItem(_loc3_.method_2351[_loc2_.error])));
         switch(_loc2_.error)
         {
            case class_430.const_512:
            case class_430.const_1836:
            case class_430.const_1366:
               method_2479.method_6350(_loc2_.var_3814,_loc2_.var_5058);
         }
      }
   }
}
