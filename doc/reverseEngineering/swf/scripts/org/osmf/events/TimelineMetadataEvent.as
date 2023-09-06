package org.osmf.events
{
   import flash.events.Event;
   import org.osmf.metadata.TimelineMarker;
   
   public class TimelineMetadataEvent extends MetadataEvent
   {
      
      public static const MARKER_TIME_REACHED:String = "markerTimeReached";
      
      public static const MARKER_DURATION_REACHED:String = "markerDurationReached";
      
      public static const MARKER_ADD:String = "markerAdd";
      
      public static const MARKER_REMOVE:String = "markerRemove";
       
      
      private var _marker:TimelineMarker;
      
      public function TimelineMetadataEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:TimelineMarker = null)
      {
         super(param1,param2,param3,"" + param4.time,param4);
         this._marker = param4;
      }
      
      public function get marker() : TimelineMarker
      {
         return this._marker;
      }
      
      override public function clone() : Event
      {
         return new TimelineMetadataEvent(type,bubbles,cancelable,this._marker);
      }
   }
}
