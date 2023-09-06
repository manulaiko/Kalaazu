package net.bigpoint.darkorbit.mvc.gui.highlights.controller
{
   import net.bigpoint.darkorbit.mvc.gui.highlights.HighLightItemNotification;
   import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_84.class_243;
   
   public class InitHighlightingSystemCommand extends class_243
   {
       
      
      public function InitHighlightingSystemCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         registerProxy(new HighlightProxy());
         registerCommand(HighLightItemNotification.ADD_HIGHLIGHT,AddItemHighlightCommand);
         registerCommand(HighLightItemNotification.REMOVE_HIGHLIGHT,RemoveItemHighlightCommand);
         registerCommand(HighLightItemNotification.REMOVE_HIGHLIGHT_BY_CATEGORY,RemoveHighlightByCategoryCommand);
         registerCommand(HighLightItemNotification.CLEANUP_ITEMS_CONTROL_HIGHLIGHTS,RemoveAllItemsControlHighlights);
         registerCommand(HighLightItemNotification.CLEANUP,RemoveAllHighlights);
      }
   }
}
