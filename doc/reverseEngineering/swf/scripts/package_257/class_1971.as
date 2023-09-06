package package_257
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_184.TraininggroundsProxy;
   import package_184.class_1653;
   import package_84.class_243;
   
   public class class_1971 extends class_243
   {
       
      
      public function class_1971()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:TraininggroundsProxy = retrieveProxy(TraininggroundsProxy.NAME) as TraininggroundsProxy;
         var _loc3_:class_1653 = _loc2_.method_6141;
         if(_loc3_)
         {
            _loc3_.const_3243.value = param1.getBody();
         }
      }
   }
}
