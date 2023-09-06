package package_70
{
   import flash.events.Event;
   
   public class SimpleWindowEvent extends Event
   {
      
      private static const NAME:String = "SimpleWindowEvent";
      
      public static const const_402:String = NAME + "zoomIn";
      
      public static const const_705:String = NAME + "zoomOut";
      
      public static const const_749:String = NAME + "resizeStart";
      
      public static const const_1979:String = NAME + "resizeStop";
      
      public static const const_1674:String = NAME + "onResize";
      
      public static const const_940:String = NAME + "onMaximized";
      
      public static const const_1770:String = NAME + "onMinimized";
      
      public static const const_2430:String = NAME + "onMinimize";
      
      public static const const_328:String = NAME + "onMaximizeClicked";
      
      public static const const_2300:String = NAME + "onMinimizeClicked";
      
      public static const const_1645:String = NAME + "SaveWindowSettings";
      
      public static const const_1791:String = NAME + "SaveAudioSettings";
      
      public static const const_1954:String = NAME + "SaveQualitySettings";
      
      public static const const_308:String = NAME + "SaveDisplaySettings";
      
      public static const const_1564:String = NAME + "SaveGameplaySettings";
      
      public static const const_2654:String = NAME + "SaveShipSettings";
      
      public static const BG_FADE_OUT:String = NAME + "BG_FADE_OUT";
      
      public static const BG_FADE_IN:String = NAME + "BG_FADE_IN";
      
      public static const SHOW_POPUP:String = NAME + "SHOW_POPUP";
      
      public static const HIDE_POPUP:String = NAME + "HIDE_POPUP";
      
      public static const ON_CLOSE:String = NAME + "ON_CLOSE";
       
      
      public function SimpleWindowEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
      }
   }
}
