package package_399
{
   import com.bigpoint.utils.class_73;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.net.HeroNotifications;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   import package_26.class_94;
   import package_328.JackpotBattleNotification;
   import package_328.class_2278;
   import package_38.class_894;
   import package_398.class_2282;
   import package_400.class_2280;
   import package_454.class_2526;
   import package_70.SimpleWindowEvent;
   
   public class JackPotStatusUiMediator extends Mediator
   {
      
      public static var NAME:String = "JackPotStatusUiMediator";
       
      
      private var var_2587:Array;
      
      private var var_2199:int;
      
      public function JackPotStatusUiMediator(param1:Object = null)
      {
         this.var_2587 = [];
         this.method_460();
         super(NAME,param1);
      }
      
      private function method_460() : void
      {
         this.var_2587[class_894.const_1031] = this.method_6209;
         this.var_2587[class_894.COUNTDOWN] = this.method_119;
         this.var_2587[class_894.const_1469] = this.method_2055;
         this.var_2587[class_894.const_1125] = this.method_803;
         this.var_2587[class_894.const_2885] = this.method_6209;
         this.var_2587[class_894.DONE] = this.method_4569;
         this.var_2587[class_894.NONE] = this.method_5428;
         this.var_2587[class_894.const_2747] = this.method_5428;
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.addEventListeners();
         sendNotification(JackpotBattleNotification.START_UP);
      }
      
      override public function onRemove() : void
      {
         sendNotification(JackpotBattleNotification.CLEAN_UP);
         super.onRemove();
         this.removeEventListeners();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [HeroNotifications.UPDATE_USERNAME,JackpotBattleNotification.UPDATE_REMAINING_PLAYER,JackpotBattleNotification.SET_LABLES_VISIBILITY,JackpotBattleNotification.UPDATE_REMAINING_TIME,JackpotBattleNotification.SHOW_WARNING,JackpotBattleNotification.HIDE_WARNING];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case JackpotBattleNotification.SHOW_WARNING:
               this.method_6479();
               break;
            case JackpotBattleNotification.HIDE_WARNING:
               this.method_4623();
               break;
            case JackpotBattleNotification.UPDATE_REMAINING_TIME:
               this.view.method_1400.method_182(param1.getBody() as int);
               break;
            case JackpotBattleNotification.SET_LABLES_VISIBILITY:
               _loc2_ = param1.getBody() as Boolean;
               if(_loc2_)
               {
                  this.method_713();
                  break;
               }
               this.method_110();
               break;
            case JackpotBattleNotification.UPDATE_REMAINING_PLAYER:
               _loc3_ = param1.getBody() as class_73;
               if(this.view)
               {
                  this.view.method_4232.method_3607(_loc3_.x,_loc3_.y);
                  break;
               }
               break;
            case HeroNotifications.UPDATE_USERNAME:
               this.view.method_5770.method_487.method_1746(param1.getBody() as String);
         }
      }
      
      private function addEventListeners() : void
      {
         this.view.addEventListener(SimpleWindowEvent.ON_CLOSE,this.method_2519);
      }
      
      private function removeEventListeners() : void
      {
         this.view.removeEventListener(SimpleWindowEvent.ON_CLOSE,this.method_2519);
      }
      
      private function method_2519(param1:SimpleWindowEvent = null) : void
      {
         this.removeMediator();
      }
      
      public function set data(param1:class_2282) : void
      {
         this.var_2199 = param1.matchType;
         this.var_2587[param1.matchType]();
         this.view.method_5770.method_487.method_1746(param1.var_1877);
         this.view.method_5770.method_5919.method_1746(param1.var_4318);
         this.view.method_1400.method_182(param1.var_3175);
         this.method_3607(param1);
         this.view.method_4232.method_5421(param1.var_255);
      }
      
      private function method_3607(param1:class_2282) : void
      {
         this.view.method_4232.method_3607(param1.var_110,param1.var_2655);
         var _loc2_:Boolean = param1.var_110 >= 0 || param1.var_2655 >= 0;
         this.view.method_4232.method_6036.visible = _loc2_;
      }
      
      private function method_5535(param1:DisplayObject) : void
      {
         param1.width = class_2278.const_2492;
         param1.height = class_2278.const_2649;
      }
      
      private function removeMediator() : void
      {
         facade.removeMediator(getMediatorName());
      }
      
      private function method_6479() : void
      {
         this.view.method_1400.method_6050.visible = true;
      }
      
      private function method_4623() : void
      {
         this.view.method_1400.method_6050.visible = false;
      }
      
      private function method_110() : void
      {
         this.view.method_1400.method_4646.visible = false;
      }
      
      private function method_713() : void
      {
         this.view.method_1400.method_4646.visible = true;
      }
      
      private function get view() : class_2280
      {
         return viewComponent as class_2280;
      }
      
      private function method_417(param1:DisplayObject, param2:class_2526) : void
      {
         this.method_5535(param1);
         param2.method_852 = param1;
         param2.method_5835 = (Number(param2.width) - param1.width) * 0.5;
      }
      
      public function method_3121(param1:BitmapData) : void
      {
         this.view.method_5770.method_487.method_5108 = new Bitmap(param1);
         this.view.method_5770.method_5919.method_5108 = new Bitmap(param1);
      }
      
      public function method_116(param1:Bitmap) : void
      {
         this.view.method_5770.method_714 = param1;
      }
      
      public function method_2975(param1:DisplayObject) : void
      {
         this.method_417(param1,this.view.method_5770.method_5919);
         var _loc2_:class_94 = class_94.getInstance();
         _loc2_.method_4247(this.view.method_5770.method_5919);
         this.view.method_5770.method_714.visible = true;
      }
      
      public function method_927(param1:DisplayObject) : void
      {
         this.method_417(param1,this.view.method_5770.method_5919);
         var _loc2_:class_94 = class_94.getInstance();
         _loc2_.method_4247(this.view.method_5770.method_5919);
         _loc2_.method_1211(this.view.method_5770.method_5919,class_88.getItem("jackpot_status_window_avatar_unknown_ttip"));
         this.view.method_5770.method_714.visible = true;
      }
      
      public function method_3875(param1:DisplayObject) : void
      {
         this.method_417(param1,this.view.method_5770.method_5919);
         var _loc2_:class_94 = class_94.getInstance();
         _loc2_.method_4247(this.view.method_5770.method_5919);
         _loc2_.method_1211(this.view.method_5770.method_5919,class_88.getItem("jackpot_status_window_avatar_wildcard_ttip"));
         this.view.method_5770.method_714.visible = false;
         var _loc3_:int = this.var_2199 == class_894.DONE ? 0 : int(class_2280.const_1804);
         this.view.method_1400.method_4711(_loc3_);
      }
      
      public function method_6246(param1:DisplayObject) : void
      {
         this.method_417(param1,this.view.method_5770.method_487);
      }
      
      private function method_6209() : void
      {
         this.view.method_1400.method_4711(class_2280.const_1031);
         this.method_713();
         this.method_4623();
         this.view.flash();
      }
      
      private function method_2055() : void
      {
         this.view.method_1400.method_4711(class_2280.const_1469);
         this.method_4623();
         this.method_713();
         this.view.minimize();
      }
      
      private function method_119() : void
      {
         this.method_4623();
         this.method_110();
         this.view.minimize();
      }
      
      private function method_803() : void
      {
         this.view.method_1400.method_4711(class_2280.const_1469);
         this.method_713();
         this.method_6479();
         this.view.minimize();
      }
      
      private function method_4569() : void
      {
         this.view.method_1400.method_4711(class_2280.const_1804);
         this.method_713();
         this.method_4623();
         this.view.flash();
      }
      
      private function method_5428() : void
      {
      }
   }
}
