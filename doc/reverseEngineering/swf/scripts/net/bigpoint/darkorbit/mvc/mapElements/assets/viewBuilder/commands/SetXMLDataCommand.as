package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.commands
{
   import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.ViewCreateDTO;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   import package_11.class_262;
   
   public class SetXMLDataCommand extends AsyncCommand
   {
       
      
      public function SetXMLDataCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:* = null;
         super.execute(param1);
         var _loc2_:ViewCreateDTO = param1.getBody() as ViewCreateDTO;
         if(!_loc2_.xmlData)
         {
            _loc3_ = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
            _loc2_.xmlData = (_loc3_.getLib(_loc2_.xml) as class_262).method_4925();
         }
         commandComplete();
      }
   }
}
