package package_87
{
   import flash.utils.ByteArray;
   import net.bigpoint.darkorbit.mvc.common.model.pattern.proxy.PatternManagerProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   
   public class class_1136 extends AsyncCommand
   {
      
      private static const const_703:Class = class_1677;
       
      
      public function class_1136()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PatternManagerProxy = facade.retrieveProxy(PatternManagerProxy.NAME) as PatternManagerProxy;
         var _loc3_:ByteArray = new const_703() as ByteArray;
         _loc2_.init(new XML(_loc3_.readUTFBytes(_loc3_.length)));
         commandComplete();
      }
   }
}
