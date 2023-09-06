package package_32
{
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.mvc.hints.view.effects.class_332;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_11.class_39;
   import package_121.class_331;
   import package_31.class_92;
   import package_34.HintsNotifications;
   import package_34.class_330;
   import package_9.ResourceManager;
   import package_9.class_50;
   
   public class HintsMediator extends class_92
   {
      
      public static const NAME:String = "HintsMediator";
      
      private static const const_40:String = "hints";
       
      
      private var _hint:Sprite;
      
      public function HintsMediator(param1:Sprite)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [HintsNotifications.const_3303,HintsNotifications.const_1648,HintsNotifications.const_1365];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:String = String(param1.getBody());
         switch(param1.getName())
         {
            case HintsNotifications.const_3303:
               this.method_2725(_loc2_);
               break;
            case HintsNotifications.const_1648:
               this.method_3940(_loc2_);
               break;
            case HintsNotifications.const_1365:
               this.method_3900();
         }
      }
      
      private function method_2725(param1:String) : void
      {
         if(!assetsProxy.isLoaded(const_40))
         {
            assetsProxy.loadAndCall(const_40,this.method_2725,arguments);
            return;
         }
         var _loc3_:class_39 = ResourceManager.name_15.getFinisher(const_40) as class_39;
         this._hint = _loc3_.getEmbeddedMovieClip(param1);
         this._hint.alpha = 0;
         this._hint.visible = false;
         this._hint.mouseChildren = false;
         this._hint.mouseEnabled = false;
         this.view.addChild(this._hint);
         this.method_3900();
         var _loc4_:class_331;
         (_loc4_ = this.method_1812(param1)).show(this._hint);
      }
      
      private function method_1812(param1:String) : class_331
      {
         var _loc2_:String = class_330.const_2010[param1];
         switch(_loc2_)
         {
            case class_330.const_2066:
         }
         return new class_332();
      }
      
      private function method_3940(param1:String) : void
      {
         var _loc2_:class_331 = this.method_1812(param1);
         _loc2_.hide(this._hint,this.method_3561);
      }
      
      private function method_3561() : void
      {
         if(Boolean(this._hint) && Boolean(this.view.contains(this._hint)))
         {
            this.view.removeChild(this._hint);
         }
      }
      
      private function method_3900() : void
      {
         if(this._hint)
         {
            this._hint.y = 136;
            this._hint.x = Number(class_50.method_1849()) - Number(this._hint.width) * 0.5;
         }
      }
      
      private function get view() : Sprite
      {
         return viewComponent as Sprite;
      }
   }
}
