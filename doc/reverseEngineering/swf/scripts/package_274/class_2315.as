package package_274
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_267.SectorControlProxy;
   
   public class class_2315 extends SimpleCommand
   {
       
      
      public function class_2315()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:SectorControlProxy = facade.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy;
         _loc2_.method_5895();
      }
   }
}
