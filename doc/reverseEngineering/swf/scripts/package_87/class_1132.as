package package_87
{
   import flash.display.LoaderInfo;
   import flash.display.Stage;
   import flash.external.ExternalInterface;
   import flash.system.Security;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.class_60;
   import net.bigpoint.darkorbit.gui.class_21;
   import net.bigpoint.darkorbit.net.class_59;
   import net.bigpoint.darkorbit.settings.FlashVarsParser;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   import package_13.class_51;
   
   public class class_1132 extends AsyncCommand
   {
       
      
      public function class_1132()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_51 = param1.getBody() as class_51;
         this.init(_loc2_);
      }
      
      private function init(param1:class_51) : void
      {
         this.method_5704(param1.stage);
         if(false)
         {
            class_60.initialize();
         }
         else
         {
            class_18.useDeviceFonts();
         }
         commandComplete();
      }
      
      private function method_5704(param1:Stage) : void
      {
         var var_1419:Object = null;
         var var_4940:Stage = param1;
         try
         {
            var_1419 = LoaderInfo(var_4940.loaderInfo).parameters;
            FlashVarsParser.parseVars(var_1419);
            if(false && Settings.staticHost.length > 0)
            {
               Security.allowDomain(Settings.staticHost);
            }
            else
            {
               Settings.staticHost = Settings.dynamicHost;
            }
            Settings.instantLogViewConfig = new class_21();
            Security.allowDomain(Settings.dynamicHost);
            Security.allowDomain("package_1");
            if(false)
            {
               Settings.isPepperFlashPlayer = ExternalInterface.call(class_59.const_1040) as Boolean;
            }
         }
         catch(error:Error)
         {
         }
      }
   }
}
