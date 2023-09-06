package package_205
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_332.EpicFightMessageProxy;
   import package_38.class_549;
   import package_84.class_243;
   
   public class class_1401 extends class_243
   {
       
      
      public function class_1401()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:EpicFightMessageProxy = facade.retrieveProxy(EpicFightMessageProxy.NAME) as EpicFightMessageProxy;
         _loc2_.method_4900(param1.getBody() as class_549);
      }
   }
}
