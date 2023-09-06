package package_403
{
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.common.KeyboardNotifications;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_259.class_1658;
   import package_260.class_1660;
   import package_260.class_1661;
   import package_31.class_92;
   import package_38.class_538;
   import package_86.class_1949;
   
   public class ContactsWindowMediator extends class_92
   {
      
      public static const NAME:String = "ContactsWindowMediator";
       
      
      public function ContactsWindowMediator(param1:class_2293)
      {
         super(NAME,param1);
         method_2176(class_1658.const_1350,this.method_4266);
         method_2176(class_1658.const_179,this.method_1837);
         method_2176(class_1658.const_18,this.method_373);
         method_2176(class_1658.const_3277,this.method_2467);
         method_2176(class_1658.const_2897,this.method_2389);
         method_2176(class_1658.const_2683,this.method_2726);
         method_2176(class_1658.const_1149,this.method_5232);
      }
      
      override public function setViewComponent(param1:Object) : void
      {
         this.method_4727();
         super.setViewComponent(param1);
         this.method_1309();
      }
      
      private function get method_6189() : class_2293
      {
         return viewComponent as class_2293;
      }
      
      private function method_1309() : void
      {
         this.method_6189.addEventListener(class_2292.INVITE_CLICKED,this.method_5024);
         this.method_6189.addEventListener(class_2292.REMOVE_CLICKED,this.method_115);
         this.method_6189.addEventListener(class_2292.BLOCK_CLICKED,this.method_2954);
         this.method_6189.addEventListener(class_2292.INVITE_TO_GROUP_CLICKED,this.method_6097);
         this.method_6189.addEventListener(class_2292.UNBLOCK_USER_CLICKED,this.method_637);
         this.method_6189.addEventListener(class_2292.ACCEPT_PENDING_REQUEST_CLICKED,this.method_3246);
         this.method_6189.addEventListener(class_2292.DECLINE_PENDING_REQUEST_CLICKED,this.method_1665);
         this.method_6189.addEventListener(class_2292.REMOVE_OUTGOING_REQUEST_CLICKED,this.method_4556);
         this.method_6189.addEventListener(class_2292.FILTER_CHECKBOX_STATE_CHANGED,this.method_4372);
         this.method_6189.addEventListener(class_2292.BLOCK_NOTIFICATIONS_CHECKBOX_STATE_CHANGED,this.method_5105);
         this.method_6189.addEventListener(class_2292.USERNAME_INPUTFIELD_GAINED_FOCUS,this.method_4412);
         this.method_6189.addEventListener(class_2292.USERNAME_INPUTFIELD_LOST_FOCUS,this.method_4537);
         this.method_6189.addEventListener(class_2292.CONTACT_CLICKED,this.method_5994);
      }
      
      private function method_4727() : void
      {
         if(this.method_6189)
         {
            this.method_6189.removeEventListener(class_2292.INVITE_CLICKED,this.method_5024);
            this.method_6189.removeEventListener(class_2292.REMOVE_CLICKED,this.method_115);
            this.method_6189.removeEventListener(class_2292.BLOCK_CLICKED,this.method_2954);
            this.method_6189.removeEventListener(class_2292.INVITE_TO_GROUP_CLICKED,this.method_6097);
            this.method_6189.removeEventListener(class_2292.UNBLOCK_USER_CLICKED,this.method_637);
            this.method_6189.removeEventListener(class_2292.ACCEPT_PENDING_REQUEST_CLICKED,this.method_3246);
            this.method_6189.removeEventListener(class_2292.DECLINE_PENDING_REQUEST_CLICKED,this.method_1665);
            this.method_6189.removeEventListener(class_2292.REMOVE_OUTGOING_REQUEST_CLICKED,this.method_4556);
            this.method_6189.removeEventListener(class_2292.FILTER_CHECKBOX_STATE_CHANGED,this.method_4372);
            this.method_6189.removeEventListener(class_2292.BLOCK_NOTIFICATIONS_CHECKBOX_STATE_CHANGED,this.method_5105);
            this.method_6189.removeEventListener(class_2292.USERNAME_INPUTFIELD_GAINED_FOCUS,this.method_4412);
            this.method_6189.removeEventListener(class_2292.USERNAME_INPUTFIELD_LOST_FOCUS,this.method_4537);
            this.method_6189.removeEventListener(class_2292.CONTACT_CLICKED,this.method_5994);
         }
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.method_1309();
      }
      
      override public function onRemove() : void
      {
         this.method_4727();
         facade.registerCommand(class_1658.CREATE_WINDOW,class_1949);
         super.onRemove();
      }
      
      private function method_5994(param1:class_2292) : void
      {
         sendNotification(class_1658.const_179,param1.params);
      }
      
      private function method_4537(param1:class_2292) : void
      {
         sendNotification(KeyboardNotifications.UNLOCK_KEYBOARD);
      }
      
      private function method_4412(param1:class_2292) : void
      {
         UISystem.getInstance().tooltipManager.attemptToRemoveTooltip();
         sendNotification(KeyboardNotifications.LOCK_KEYBOARD);
      }
      
      private function method_115(param1:class_2292) : void
      {
         if(this.method_6189)
         {
            sendNotification(class_1658.const_2233,this.method_6189.method_4715());
         }
      }
      
      private function method_2954(param1:class_2292) : void
      {
         if(this.method_6189)
         {
            sendNotification(class_1658.const_879,this.method_6189.method_4715());
         }
      }
      
      private function method_5105(param1:class_2292) : void
      {
         sendNotification(class_1658.const_926,param1.params[0]);
      }
      
      private function method_5024(param1:class_2292) : void
      {
         if(this.method_6189)
         {
            sendNotification(class_1658.const_1499,this.method_6189.method_4715());
         }
      }
      
      private function method_4556(param1:class_2292) : void
      {
         sendNotification(class_1658.const_2009,param1.params[0]);
      }
      
      private function method_1665(param1:class_2292) : void
      {
         sendNotification(class_1658.const_2310,param1.params[0]);
      }
      
      private function method_3246(param1:class_2292) : void
      {
         sendNotification(class_1658.const_2722,param1.params[0]);
      }
      
      private function method_637(param1:class_2292) : void
      {
         sendNotification(class_1658.const_243,param1.params[0]);
      }
      
      private function method_4372(param1:class_2292) : void
      {
         sendNotification(class_1658.const_1981,param1.params);
      }
      
      private function method_6097(param1:class_2292) : void
      {
         sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_538(param1.params[0]));
      }
      
      private function method_4266(param1:INotification) : void
      {
         var _loc2_:class_1660 = param1.getBody() as class_1660;
         this.method_6189.method_2903(_loc2_.method_1234);
      }
      
      private function method_1837(param1:INotification) : void
      {
         var _loc2_:String = (param1.getBody() as Array)[1];
         this.method_6189.method_1432(_loc2_);
      }
      
      private function method_373(param1:INotification) : void
      {
         var _loc2_:class_1661 = param1.getBody() as class_1661;
         this.method_6189.method_257(_loc2_);
      }
      
      private function method_2467(param1:INotification) : void
      {
         this.method_6189.method_5941(param1.getBody() as Boolean);
      }
      
      private function method_2389(param1:INotification) : void
      {
         this.method_6189.method_2448();
      }
      
      private function method_2726(param1:INotification) : void
      {
         this.method_6189.method_4037();
      }
      
      private function method_5232(param1:INotification) : void
      {
         var _loc2_:Array = param1.getBody() as Array;
         this.method_6189.method_3683(_loc2_);
      }
   }
}
