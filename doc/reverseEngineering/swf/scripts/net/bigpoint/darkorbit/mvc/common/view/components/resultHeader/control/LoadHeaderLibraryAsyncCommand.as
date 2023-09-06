package net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.control
{
   import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.model.ResultHeaderConstants;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   import package_11.class_39;
   import package_9.ResourceManager;
   
   public class LoadHeaderLibraryAsyncCommand extends AsyncCommand
   {
       
      
      public function LoadHeaderLibraryAsyncCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         ResourceManager.method_1412(ResultHeaderConstants.HEADER_LABLELIBRARY_NAME,this.handleLibraryLoaded,this.handleLibraryLoadError);
      }
      
      protected function handleLibraryLoaded(param1:class_39) : void
      {
         commandComplete();
      }
      
      protected function handleLibraryLoadError(param1:class_39) : void
      {
         commandComplete();
      }
   }
}
