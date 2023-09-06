package package_408
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_321.InfluenceWindowProxy;
   import package_84.class_243;
   
   public class class_2677 extends class_243
   {
       
      
      public function class_2677()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:InfluenceWindowProxy = retrieveProxy(InfluenceWindowProxy.NAME) as InfluenceWindowProxy;
         _loc2_.updateView();
      }
   }
}
