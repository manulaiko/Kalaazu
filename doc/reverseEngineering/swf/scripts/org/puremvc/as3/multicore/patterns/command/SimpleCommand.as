package org.puremvc.as3.multicore.patterns.command
{
   import org.puremvc.as3.multicore.interfaces.ICommand;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.interfaces.INotifier;
   import org.puremvc.as3.multicore.patterns.observer.Notifier;
   
   public class SimpleCommand extends Notifier implements ICommand, INotifier
   {
       
      
      public function SimpleCommand()
      {
         super();
      }
      
      public function execute(param1:INotification) : void
      {
      }
   }
}
