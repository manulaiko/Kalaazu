package net.bigpoint.darkorbit.mvc.common.controller.net
{
   import net.bigpoint.darkorbit.mvc.common.model.ConnectionProxy;
   import org.puremvc.as3.multicore.interfaces.ICommand;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class SendCommandCommand extends SimpleCommand implements ICommand
   {
       
      
      public function SendCommandCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:* = null;
         _loc2_ = param1.getBody() as Array;
         var _loc3_:String = String(_loc2_[0]);
         var _loc4_:Array = _loc2_[1];
         var _loc5_:ConnectionProxy;
         (_loc5_ = facade.retrieveProxy(ConnectionProxy.NAME) as ConnectionProxy).sendCommand(_loc3_,_loc4_);
      }
   }
}
