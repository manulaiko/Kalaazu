package package_87
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   import package_13.class_51;
   import package_42.SystemManagerProxy;
   
   public class class_1138 extends AsyncCommand
   {
       
      
      public function class_1138()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_51 = param1.getBody() as class_51;
         this.method_4448(_loc2_);
         commandComplete();
      }
      
      private function method_4448(param1:class_51) : void
      {
         var _loc2_:SystemManagerProxy = facade.retrieveProxy(SystemManagerProxy.NAME) as SystemManagerProxy;
         _loc2_.initialize(param1);
      }
   }
}
