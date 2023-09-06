package org.osmf.events
{
   import flash.events.Event;
   
   public class MediaPlayerStateChangeEvent extends Event
   {
      
      public static const MEDIA_PLAYER_STATE_CHANGE:String = "mediaPlayerStateChange";
       
      
      private var _state:String;
      
      public function MediaPlayerStateChangeEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null)
      {
         super(param1,param2,param3);
         this._state = param4;
      }
      
      public function get state() : String
      {
         return this._state;
      }
      
      override public function clone() : Event
      {
         return new MediaPlayerStateChangeEvent(type,bubbles,cancelable,this._state);
      }
   }
}
