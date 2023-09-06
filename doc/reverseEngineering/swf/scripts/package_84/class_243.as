package package_84
{
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.ship.class_109;
   import net.bigpoint.darkorbit.mvc.common.model.ConnectionProxy;
   import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
   import net.bigpoint.darkorbit.mvc.gui.model.GuiProxy;
   import org.puremvc.as3.multicore.interfaces.IMediator;
   import org.puremvc.as3.multicore.interfaces.IProxy;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_11.class_38;
   import package_184.TraininggroundsProxy;
   import package_9.ResourceManager;
   import package_9.class_50;
   import package_9.class_83;
   
   public class class_243 extends SimpleCommand
   {
       
      
      public function class_243()
      {
         super();
      }
      
      protected function registerCommand(param1:String, param2:Class) : void
      {
         facade.registerCommand(param1,param2);
      }
      
      protected function registerProxy(param1:IProxy) : void
      {
         facade.registerProxy(param1);
      }
      
      protected function registerMediator(param1:IMediator) : void
      {
         facade.registerMediator(param1);
      }
      
      protected function retrieveMediator(param1:String) : IMediator
      {
         return facade.retrieveMediator(param1);
      }
      
      protected function retrieveProxy(param1:String) : IProxy
      {
         return facade.retrieveProxy(param1);
      }
      
      protected function hasProxy(param1:String) : Boolean
      {
         return facade.hasProxy(param1);
      }
      
      protected function hasMediator(param1:String) : Boolean
      {
         return facade.hasMediator(param1);
      }
      
      protected function hasCommand(param1:String) : Boolean
      {
         return facade.hasCommand(param1);
      }
      
      protected function get assetsProxy() : AssetsProxy
      {
         return this.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
      }
      
      protected function get connectionProxy() : ConnectionProxy
      {
         return this.retrieveProxy(ConnectionProxy.NAME) as ConnectionProxy;
      }
      
      protected function get guiProxy() : GuiProxy
      {
         return this.retrieveProxy(GuiProxy.NAME) as GuiProxy;
      }
      
      protected function method_5237(param1:String) : class_38
      {
         return ResourceManager.name_15.getFinisher(param1) as class_38;
      }
      
      protected function get guiManager() : class_58
      {
         return class_58.instance;
      }
      
      protected function get method_1772() : class_83
      {
         return this.name_47.method_1772;
      }
      
      protected function get name_47() : class_50
      {
         return class_50.getInstance();
      }
      
      protected function get map() : class_90
      {
         return this.name_47.map;
      }
      
      protected function get method_1482() : UISystem
      {
         return UISystem.getInstance();
      }
      
      protected function get ships() : class_109
      {
         return this.map.method_1203();
      }
      
      protected function get method_4159() : TraininggroundsProxy
      {
         return this.retrieveProxy(TraininggroundsProxy.NAME) as TraininggroundsProxy;
      }
   }
}
