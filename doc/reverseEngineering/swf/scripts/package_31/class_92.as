package package_31
{
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.mvc.common.model.ConnectionProxy;
   import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
   import net.bigpoint.darkorbit.mvc.gui.model.GuiProxy;
   import org.puremvc.as3.multicore.interfaces.IMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.interfaces.IProxy;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   import package_11.class_38;
   import package_26.class_94;
   import package_9.ResourceManager;
   import package_9.class_50;
   
   public class class_92 extends Mediator
   {
       
      
      private var var_2750:Dictionary;
      
      public function class_92(param1:String = null, param2:Object = null)
      {
         this.var_2750 = new Dictionary();
         super(param1,param2);
         this.method_2187();
      }
      
      protected function method_2187() : void
      {
      }
      
      protected function method_2176(param1:String, param2:Function) : void
      {
         this.var_2750[param1] = param2;
      }
      
      protected function method_4104(param1:String) : void
      {
         if(this.var_2750[param1] != null)
         {
            this.var_2750[param1] = null;
            delete this.var_2750[param1];
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         var _loc2_:* = null;
         var _loc1_:* = [];
         for(_loc2_ in this.var_2750)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         var _loc2_:String = param1.getName();
         var _loc3_:Function = this.var_2750[_loc2_];
         if(_loc3_ != null)
         {
            _loc3_(param1);
         }
      }
      
      public function retrieveMediator(param1:String) : IMediator
      {
         return facade.retrieveMediator(param1);
      }
      
      public function retrieveProxy(param1:String) : IProxy
      {
         return facade.retrieveProxy(param1);
      }
      
      public function registerMediator(param1:IMediator) : void
      {
         facade.registerMediator(param1);
      }
      
      public function method_1635(param1:Boolean, param2:DisplayObject, param3:Number = 0.3) : void
      {
         if(param2)
         {
            TweenLite.killTweensOf(param2);
            TweenLite.to(param2,param3,{"autoAlpha":int(param1)});
         }
      }
      
      protected function get guiProxy() : GuiProxy
      {
         return this.retrieveProxy(GuiProxy.NAME) as GuiProxy;
      }
      
      protected function get connectionProxy() : ConnectionProxy
      {
         return this.retrieveProxy(ConnectionProxy.NAME) as ConnectionProxy;
      }
      
      protected function get assetsProxy() : AssetsProxy
      {
         return this.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
      }
      
      protected function getFinisher(param1:String) : class_38
      {
         return ResourceManager.name_15.getFinisher(param1);
      }
      
      protected function get method_3041() : class_94
      {
         return class_94.getInstance();
      }
      
      protected function get name_47() : class_50
      {
         return class_50.getInstance();
      }
      
      protected function get guiManager() : class_58
      {
         return class_58.instance;
      }
   }
}
