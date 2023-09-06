package net.bigpoint.darkorbit.mvc.common.controller.assets
{
   import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
   import net.bigpoint.darkorbit.mvc.common.model.external.ExternalLoadVo;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LoadExternalCommand extends SimpleCommand
   {
       
      
      public function LoadExternalCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:* = null;
         super.execute(param1);
         var _loc2_:ExternalLoadVo = param1.getBody() as ExternalLoadVo;
         if(_loc2_)
         {
            _loc3_ = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
            _loc3_.loaderExternal(_loc2_.url,_loc2_.callback);
         }
      }
   }
}
