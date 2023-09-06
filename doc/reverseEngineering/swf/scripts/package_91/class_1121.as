package package_91
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_263.TDMStatusProxy;
   import package_38.class_959;
   
   public class class_1121 extends SimpleCommand
   {
       
      
      public function class_1121()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:TDMStatusProxy = facade.retrieveProxy(TDMStatusProxy.NAME) as TDMStatusProxy;
         var _loc3_:class_959 = param1.getBody() as class_959;
         _loc2_.update(_loc3_);
      }
   }
}
