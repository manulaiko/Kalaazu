package net.bigpoint.darkorbit.fui.components.image
{
   import flash.events.Event;
   
   public class ImageSlideShowElementEvent extends Event
   {
      
      public static const FADED_IN:String = "fadedIn";
      
      public static const PLAYBACKTIME_OVER:String = "showTimerOver";
      
      public static const FADED_OUT:String = "fadedOut";
       
      
      public function ImageSlideShowElementEvent(param1:String)
      {
         super(param1);
      }
   }
}
