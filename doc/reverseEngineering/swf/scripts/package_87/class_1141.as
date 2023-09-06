package package_87
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_84.class_1134;
   
   public class class_1141 extends class_1134
   {
       
      
      public function class_1141()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         guiManager.method_3916(class_88.getItem("loadingClaim"),"quickloader");
         commandComplete();
      }
   }
}
