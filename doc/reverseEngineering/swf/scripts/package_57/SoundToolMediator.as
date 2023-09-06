package package_57
{
   import flash.events.Event;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   import package_179.class_1098;
   import package_180.class_1099;
   import package_22.class_198;
   
   public class SoundToolMediator extends Mediator
   {
      
      public static const NAME:String = "SoundToolMediator";
       
      
      public function SoundToolMediator()
      {
         var _loc1_:class_153 = class_57.getInstance().createWindow(class_57.const_615) as class_153;
         super(NAME,_loc1_);
      }
      
      private function get method_4724() : class_153
      {
         return viewComponent as class_153;
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.method_4724.addEventListener(DOWindow.CLOSE_WINDOW_CLICKED,this.method_234);
         this.method_4724.addEventListener(class_153.LOAD_ALL_SOUNDS,this.method_4453);
         this.method_4724.addEventListener(class_153.TEST_ALL_SOUNDS,this.method_5873);
         this.method_4724.setData(class_198.var_3286);
         this.method_4724.method_6174(class_198.var_4756);
      }
      
      override public function onRemove() : void
      {
         facade.registerCommand(class_1098.SHOW_SOUND_CONFIGURATION,class_1099);
         this.method_4724.removeEventListener(DOWindow.CLOSE_WINDOW_CLICKED,this.method_234);
         this.method_4724.removeEventListener(class_153.LOAD_ALL_SOUNDS,this.method_4453);
         this.method_4724.removeEventListener(class_153.TEST_ALL_SOUNDS,this.method_5873);
         super.onRemove();
      }
      
      private function method_4453(param1:Event) : void
      {
         sendNotification(class_1098.PRE_TEST_SOUND_CONFIGURATION);
      }
      
      private function method_5873(param1:Event) : void
      {
         sendNotification(class_1098.TEST_SOUND_CONFIGURATION);
      }
      
      private function method_234(param1:Event) : void
      {
         facade.removeMediator(getMediatorName());
      }
      
      public function writeToLog(param1:String) : void
      {
         this.method_4724.output.appendText(param1);
      }
      
      public function method_4199() : void
      {
         this.method_4724.output.text = "";
      }
   }
}
