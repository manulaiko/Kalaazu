package package_254
{
   import flash.display.DisplayObjectContainer;
   import org.puremvc.as3.multicore.interfaces.IMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   import package_342.class_1915;
   import package_343.class_1916;
   import package_97.class_257;
   
   public class StatsMediator extends Mediator implements IMediator
   {
      
      public static const NAME:String = "StatsMediator";
       
      
      private var var_4208:class_1915;
      
      public function StatsMediator(param1:Object)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.var_4208 = new class_1915();
         this.var_4208.init();
         this.view.addChild(this.var_4208);
         this.var_4208.hide();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [class_257.UPDATE,class_257.const_99];
      }
      
      override public function getViewComponent() : Object
      {
         return this.var_4208;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc3_:String = param1.getName();
         var _loc4_:Object = param1.getBody();
         switch(_loc3_)
         {
            case class_257.UPDATE:
               _loc2_ = _loc4_ as Array;
               _loc5_ = _loc2_[0] as class_1916;
               this.var_4208.update(_loc5_);
               break;
            case class_257.const_99:
               if(this.var_4208.visible == false)
               {
                  this.var_4208.show();
                  break;
               }
               this.var_4208.hide();
               break;
         }
      }
      
      private function get view() : DisplayObjectContainer
      {
         return viewComponent as DisplayObjectContainer;
      }
   }
}
