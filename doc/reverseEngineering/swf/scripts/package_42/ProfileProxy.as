package package_42
{
   import flash.events.Event;
   import flash.net.URLLoader;
   import net.bigpoint.darkorbit.mvc.common.model.AbstractLoadProxy;
   import net.bigpoint.darkorbit.settings.Profiler;
   import net.bigpoint.darkorbit.settings.Settings;
   
   public class ProfileProxy extends AbstractLoadProxy
   {
      
      public static const NAME:String = "ProfileProxy";
       
      
      private var var_3233:XML;
      
      private var var_1850:Profiler;
      
      public function ProfileProxy()
      {
         super(NAME);
      }
      
      override protected function handleLoaded(param1:Event) : void
      {
         super.handleLoaded(param1);
         var _loc2_:* = (param1.currentTarget as URLLoader).data;
         this.init(_loc2_);
         executeCallback();
         Settings.displayNotifications.changed.add(this.method_3753);
         Settings.allowAutoQuality.changed.add(this.method_3753);
      }
      
      private function method_3753() : void
      {
         if(Settings.displayNotifications.value || Settings.allowAutoQuality.value)
         {
            this.getProfiler().start();
         }
      }
      
      protected function init(param1:Object) : void
      {
         var _loc2_:* = null;
         this.var_3233 = new XML(param1);
         if(this.var_3233.qualityLowLimit != "")
         {
            Profiler.QUALITY_LOW_LIMIT = int(this.var_3233.qualityLowLimit);
         }
         if(this.var_3233.intervalLength != "")
         {
            Profiler.INTERVAL_LENGTH = int(this.var_3233.intervalLength);
         }
         if(XMLList(this.var_3233.notificationSteps).length() > 0)
         {
            Profiler.NOTIFICATION_STEPS = [];
            for each(_loc2_ in this.var_3233.notificationSteps.notificationStep)
            {
               if(_loc2_.@value > 0)
               {
                  Profiler.NOTIFICATION_STEPS.push(int(_loc2_.@value));
               }
            }
         }
         if(this.var_3233.autoQualityLowerBoundFPS != "")
         {
            Profiler.AUTO_QUALITY_LOWER_BOUND_FPS = int(this.var_3233.autoQualityLowerBoundFPS);
         }
         if(this.var_3233.autoQualityUpperBoundFPS != "")
         {
            Profiler.AUTO_QUALITY_UPPER_BOUND_FPS = int(this.var_3233.autoQualityUpperBoundFPS);
         }
         if(this.var_3233.autoQualityLowerBoundIntervalsTillChange != "")
         {
            Profiler.AUTO_QUALITY_LOWER_BOUND_INTERVALS_TILL_CHANGE = int(this.var_3233.autoQualityLowerBoundIntervalsTillChange);
         }
         if(this.var_3233.autoQualityUpperBoundIntervalsTillChange != "")
         {
            Profiler.AUTO_QUALITY_UPPER_BOUND_INTERVALS_TILL_CHANGE = int(this.var_3233.autoQualityUpperBoundIntervalsTillChange);
         }
      }
      
      public function method_1137(param1:Profiler) : void
      {
         this.var_1850 = param1;
      }
      
      public function getProfiler() : Profiler
      {
         return this.var_1850;
      }
   }
}
