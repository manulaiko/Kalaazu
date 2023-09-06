package package_274
{
   import org.puremvc.as3.multicore.interfaces.ICommand;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_267.SectorControlProxy;
   import package_38.class_946;
   
   public class class_2308 extends SimpleCommand implements ICommand
   {
       
      
      public function class_2308()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         (facade.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy).method_88(param1.getBody() as Vector.<class_946>);
      }
   }
}
