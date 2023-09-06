package package_106
{
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.map.model.class_90;
   import package_17.class_62;
   import package_9.class_50;
   
   public class class_290 implements class_289
   {
       
      
      protected const name_20:class_62 = class_62.getInstance();
      
      public function class_290()
      {
         super();
      }
      
      protected function get map() : class_90
      {
         return class_50.getInstance().map;
      }
      
      protected function method_5861(param1:uint) : void
      {
      }
      
      protected function method_4966(param1:uint) : void
      {
      }
      
      protected function method_5728(param1:uint) : void
      {
         switch(param1)
         {
            case Keyboard.SPACE:
               UISystem.VISUAL_DEBUG = true;
               break;
            case Keyboard.F1:
               this.method_828();
         }
      }
      
      public function method_1553(param1:KeyboardEvent) : void
      {
         if(param1.shiftKey)
         {
            this.method_5861(param1.keyCode);
         }
         if(param1.ctrlKey)
         {
            this.method_4966(param1.keyCode);
         }
         if(param1.shiftKey && param1.ctrlKey)
         {
            this.method_4966(param1.keyCode);
         }
      }
      
      private function method_828() : void
      {
      }
   }
}
