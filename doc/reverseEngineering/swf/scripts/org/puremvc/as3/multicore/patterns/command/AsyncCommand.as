package org.puremvc.as3.multicore.patterns.command
{
   import org.puremvc.as3.multicore.interfaces.IAsyncCommand;
   
   public class AsyncCommand extends SimpleCommand implements IAsyncCommand
   {
       
      
      private var onComplete:Function;
      
      public function AsyncCommand()
      {
         super();
      }
      
      public function setOnComplete(param1:Function) : void
      {
         onComplete = param1;
      }
      
      protected function commandComplete() : void
      {
         onComplete();
      }
   }
}
