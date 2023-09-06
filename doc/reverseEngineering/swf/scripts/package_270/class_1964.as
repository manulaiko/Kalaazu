package package_270
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_322.class_1808;
   import package_84.class_243;
   
   public class class_1964 extends class_243
   {
       
      
      public function class_1964()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:* = null;
         super.execute(param1);
         var _loc2_:Vector.<class_1808> = Vector.<class_1808>(map.method_5540(class_1808));
         for each(_loc3_ in _loc2_)
         {
            _loc3_.update();
         }
      }
   }
}
