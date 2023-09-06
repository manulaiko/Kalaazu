package net.bigpoint.darkorbit.managers.hotkeysHandlers
{
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.getTimer;
   import package_106.class_290;
   import package_28.EventStreamClient;
   
   public class class_295 extends class_290
   {
      
      private static var _instance:class_295;
       
      
      private var var_3678:Object;
      
      public function class_295()
      {
         this.var_3678 = {};
         super();
      }
      
      public static function get instance() : class_295
      {
         if(_instance == null)
         {
            _instance = new class_295();
         }
         return _instance;
      }
      
      override public function method_1553(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.W:
            case Keyboard.A:
            case Keyboard.S:
            case Keyboard.D:
               this.var_3678[param1.keyCode] = getTimer();
               if(int(this.method_2025(Keyboard.W)) + int(this.method_2025(Keyboard.A)) + int(this.method_2025(Keyboard.S)) + int(this.method_2025(Keyboard.D)) >= 2)
               {
                  EventStreamClient.track("wasd_attempt");
                  break;
               }
         }
      }
      
      private function method_2025(param1:uint) : Boolean
      {
         return getTimer() - int(this.var_3678[param1] || false) < 3000;
      }
   }
}
