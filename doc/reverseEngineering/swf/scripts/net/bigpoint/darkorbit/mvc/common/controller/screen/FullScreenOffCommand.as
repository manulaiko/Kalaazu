package net.bigpoint.darkorbit.mvc.common.controller.screen
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_9.class_50;
   
   public class FullScreenOffCommand extends SimpleCommand
   {
       
      
      public function FullScreenOffCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         class_50.getInstance().method_6003();
      }
   }
}
