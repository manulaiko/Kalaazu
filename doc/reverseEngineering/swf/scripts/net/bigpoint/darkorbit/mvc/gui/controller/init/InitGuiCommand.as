package net.bigpoint.darkorbit.mvc.gui.controller.init
{
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.controller.ParseWindowsXmlData;
   import net.bigpoint.darkorbit.mvc.gui.controller.SaveBarsSettingsCommand;
   import net.bigpoint.darkorbit.mvc.gui.controller.logic.ChangeWindowsPositionsCommand;
   import net.bigpoint.darkorbit.mvc.gui.controller.logic.CloseKillscreenCommand;
   import net.bigpoint.darkorbit.mvc.gui.controller.logic.ToggleAllWindowsCommand;
   import net.bigpoint.darkorbit.mvc.gui.controller.requests.SendWindowUpdateRequest;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller.logic.ToggleWindowCommand;
   import net.bigpoint.darkorbit.mvc.gui.model.GuiProxy;
   import net.bigpoint.darkorbit.mvc.gui.view.GuiMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_13.class_51;
   import package_84.class_243;
   
   public class InitGuiCommand extends class_243
   {
       
      
      public function InitGuiCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_51 = param1.getBody() as class_51;
         registerCommand(GuiNotifications.PARSE_WINDOWS_XML_DATA,ParseWindowsXmlData);
         registerCommand(GuiNotifications.CLOSE_KILLSCREEN,CloseKillscreenCommand);
         registerCommand(GuiNotifications.SAVE_BARS_SETTINGS,SaveBarsSettingsCommand);
         registerCommand(GuiNotifications.UPDATE_WINDOWS_POSITIONS,ChangeWindowsPositionsCommand);
         registerCommand(GuiNotifications.SEND_WINDOW_UPDATE_REQUEST,SendWindowUpdateRequest);
         registerCommand(GuiNotifications.TOGGLE_WINDOW_BY_ID,ToggleWindowCommand);
         registerCommand(GuiNotifications.TOGGLE_ALL_WINDOWS,ToggleAllWindowsCommand);
         facade.registerProxy(new GuiProxy());
         registerMediator(new GuiMediator(_loc2_.main));
      }
   }
}
