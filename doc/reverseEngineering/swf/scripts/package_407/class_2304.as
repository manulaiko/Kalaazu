package package_407
{
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.common.model.external.ExternalLoadVo;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_184.class_1648;
   import package_184.class_1652;
   import package_258.class_1657;
   import package_31.class_92;
   import package_38.class_480;
   import package_38.class_545;
   import package_38.class_706;
   import package_76.class_2279;
   
   public class class_2304 extends class_92
   {
      
      public static const NAME:String = "TrainingGroundsWindowMediator";
       
      
      private var var_3925:int = -1;
      
      private var var_858:Boolean = false;
      
      public function class_2304(param1:String, param2:Object)
      {
         super(param1,param2);
         method_2176(class_1657.const_2570,this.method_3796);
         method_2176(class_1657.UPDATE_REGISTRATION_PHASE_INFO,this.method_3890);
         method_2176(class_1657.UPDATE_SEASON_TIME,this.method_6318);
         method_2176(class_1657.UPDATE_CONFIRMATION_PHASE_INFO,this.method_1257);
         method_2176(class_1657.UPDATE_PREPARATION_PHASE_INFO,this.method_4117);
         method_2176(class_1657.UPDATE_FIGHT_PHASE_INFO,this.method_2777);
         method_2176(class_1657.UPDATE_ROUND_NUMBER,this.method_439);
         method_2176(class_1657.UPDATE_PARTICIPANT_IN_COMBAT,this.method_544);
         method_2176(class_1657.UPDATE_DISABLED_REASON,this.method_2037);
         method_2176(class_1657.UPDATE_FIGHT_PHASE_COUNTDOWN,this.method_5250);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.method_601();
      }
      
      private function method_601() : void
      {
         this.view.addEventListener(class_2540.MATCH_CLICKED,this.method_1820);
         this.view.addEventListener(class_2540.CANCEL_CLICKED,this.method_6496);
         this.view.addEventListener(class_2540.FIGHT_CLICKED,this.method_5940);
      }
      
      private function get view() : TraininggroundsWindow
      {
         return viewComponent as TraininggroundsWindow;
      }
      
      private function method_1820(param1:class_2540) : void
      {
         sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_545());
      }
      
      private function method_6496(param1:class_2540) : void
      {
         sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_480());
      }
      
      private function method_5940(param1:class_2540) : void
      {
         sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_706());
      }
      
      private function method_3796(param1:INotification) : void
      {
         var _loc2_:int = param1.getBody() as int;
         this.view.method_2712(_loc2_);
      }
      
      private function method_6318(param1:INotification) : void
      {
         this.view.name_134(param1.getBody() as class_1648);
      }
      
      private function method_3890(param1:INotification) : void
      {
         this.view.method_3890(param1.getBody() as class_1648);
      }
      
      private function method_1257(param1:INotification) : void
      {
         this.view.method_1257(param1.getBody()[0],param1.getBody()[1] as Boolean);
      }
      
      private function method_4117(param1:INotification) : void
      {
         this.view.method_4117(param1.getBody()[0],param1.getBody()[1] as Boolean);
      }
      
      private function method_439(param1:INotification) : void
      {
         this.view.method_439(param1.getBody() as int);
      }
      
      private function method_2777(param1:INotification) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:class_1652 = param1.getBody() as class_1652;
         this.view.method_2777(_loc2_);
         if(_loc2_.name_152 != -1)
         {
            if(_loc2_.name_152 != this.var_3925)
            {
               _loc3_ = class_2279.method_1192(_loc2_.name_152,_loc2_.method_1237,Settings.dynamicHost);
               sendNotification(AssetNotifications.LOAD_EXTERNAL,new ExternalLoadVo(_loc3_,this.view.method_2975));
            }
            this.var_3925 = _loc2_.name_152;
         }
         if(!this.var_858)
         {
            _loc4_ = class_2279.method_1192(class_81.userID,Settings.instanceID,Settings.dynamicHost);
            sendNotification(AssetNotifications.LOAD_EXTERNAL,new ExternalLoadVo(_loc4_,this.view.method_6246));
            this.var_858 = true;
         }
         if(_loc2_.method_2714 != -1)
         {
            this.view.method_439(_loc2_.method_2714);
         }
         if(this.view.method_2439())
         {
         }
      }
      
      private function method_544(param1:INotification) : void
      {
         this.view.method_544(param1.getBody() as Boolean);
      }
      
      private function method_2037(param1:INotification) : void
      {
         this.view.method_323(param1.getBody() as String);
      }
      
      private function method_5250(param1:INotification) : void
      {
         this.view.method_4803(param1.getBody() as int);
      }
   }
}
