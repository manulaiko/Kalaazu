package package_349
{
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_184.class_2283;
   import package_27.class_82;
   import package_31.class_92;
   import package_401.EpicFightNotifications;
   import package_76.class_215;
   import package_9.class_50;
   
   public class EpicFightMessageMediator extends class_92
   {
      
      public static const NAME:String = "EpicFightMessageMediator";
       
      
      private var var_2833:uint;
      
      public function EpicFightMessageMediator(param1:String, param2:Object)
      {
         super(param1,param2);
         method_2176(EpicFightNotifications.SHOW_MESSAGE,this.method_567);
      }
      
      private function get view() : class_1972
      {
         return viewComponent as class_1972;
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
      }
      
      override public function onRemove() : void
      {
         class_215.removeDisplayObject(this.view);
         super.onRemove();
      }
      
      private function method_567(param1:INotification) : void
      {
         if(!this.view.parent)
         {
            class_50.method_4278().addChild(this.view);
         }
         var _loc2_:class_2283 = param1.getBody() as class_2283;
         this.view.method_567(_loc2_.message);
         this.view.x = 0 - 0.5 * Number(this.view.width);
         this.view.y = 0;
         clearTimeout(this.var_2833);
         this.var_2833 = setTimeout(this.view.method_3536,_loc2_.duration);
         if(_loc2_.soundID != -1)
         {
            class_82.playSoundEffect(_loc2_.soundID);
         }
      }
   }
}
