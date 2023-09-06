package package_86
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_260.class_1659;
   
   public class class_1958 extends class_245
   {
       
      
      public function class_1958()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Vector.<class_1659> = param1.getBody() as Vector.<class_1659>;
         method_435.method_4829(_loc2_);
      }
   }
}
