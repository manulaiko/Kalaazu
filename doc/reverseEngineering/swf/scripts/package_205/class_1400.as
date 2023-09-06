package package_205
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_184.TraininggroundsProxy;
   import package_258.class_1657;
   import package_38.class_609;
   import package_84.class_243;
   
   public class class_1400 extends class_243
   {
       
      
      public function class_1400()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         facade.sendNotification(class_1657.CREATE_WINDOW);
         var _loc2_:TraininggroundsProxy = facade.retrieveProxy(TraininggroundsProxy.NAME) as TraininggroundsProxy;
         if(_loc2_)
         {
            _loc2_.method_3230(param1.getBody() as class_609);
         }
      }
   }
}
