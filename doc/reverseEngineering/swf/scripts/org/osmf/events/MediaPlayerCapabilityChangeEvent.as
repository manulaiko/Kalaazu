package org.osmf.events
{
   import flash.events.Event;
   
   public class MediaPlayerCapabilityChangeEvent extends Event
   {
      
      public static const CAN_PLAY_CHANGE:String = "canPlayChange";
      
      public static const CAN_SEEK_CHANGE:String = "canSeekChange";
      
      public static const TEMPORAL_CHANGE:String = "temporalChange";
      
      public static const HAS_AUDIO_CHANGE:String = "hasAudioChange";
      
      public static const IS_DYNAMIC_STREAM_CHANGE:String = "isDynamicStreamChange";
      
      public static const CAN_LOAD_CHANGE:String = "canLoadChange";
      
      public static const CAN_BUFFER_CHANGE:String = "canBufferChange";
      
      public static const HAS_DRM_CHANGE:String = "hasDRMChange";
      
      public static const HAS_DISPLAY_OBJECT_CHANGE:String = "hasDisplayObjectChange";
       
      
      private var _enabled:Boolean;
      
      public function MediaPlayerCapabilityChangeEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3);
         this._enabled = param4;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      override public function clone() : Event
      {
         return new MediaPlayerCapabilityChangeEvent(type,bubbles,cancelable,this._enabled);
      }
   }
}
