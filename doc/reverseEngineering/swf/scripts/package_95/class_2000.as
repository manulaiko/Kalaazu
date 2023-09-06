package package_95
{
   import flash.display.Stage3D;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_84.class_1134;
   
   public class class_2000 extends class_1134
   {
       
      
      public function class_2000()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         if(this.stage3D)
         {
            this.stage3D.addEventListener(Event.CONTEXT3D_CREATE,this.method_5211);
            this.stage3D.addEventListener(ErrorEvent.ERROR,this.method_4225);
            this.stage3D.requestContext3D();
         }
         else
         {
            Settings.driverInfo = "stage3D n/a";
            commandComplete();
         }
      }
      
      private function get stage3D() : Stage3D
      {
         return name_47.stage.stage3Ds.length > 0 ? name_47.stage.stage3Ds[0] : null;
      }
      
      private function method_4225(param1:ErrorEvent) : void
      {
         this.stage3D.removeEventListener(Event.CONTEXT3D_CREATE,this.method_5211);
         this.stage3D.removeEventListener(ErrorEvent.ERROR,this.method_4225);
         commandComplete();
      }
      
      private function method_5211(param1:Event) : void
      {
         this.stage3D.removeEventListener(Event.CONTEXT3D_CREATE,this.method_5211);
         this.stage3D.removeEventListener(ErrorEvent.ERROR,this.method_4225);
         if(this.stage3D.context3D)
         {
            Settings.driverInfo = this.stage3D.context3D.driverInfo;
            Settings.stage3DProfile = !!this.stage3D.context3D.hasOwnProperty("profile") ? this.stage3D.context3D["profile"] : "n/a";
            if(this.stage3D.context3D.dispose.length == 0)
            {
               this.stage3D.context3D.dispose();
            }
            else
            {
               this.stage3D.context3D.dispose(false);
            }
         }
         commandComplete();
      }
   }
}
