package org.osmf.traits
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import org.osmf.events.AudioEvent;
   import org.osmf.events.BufferEvent;
   import org.osmf.events.DRMEvent;
   import org.osmf.events.DVREvent;
   import org.osmf.events.DisplayObjectEvent;
   import org.osmf.events.DynamicStreamEvent;
   import org.osmf.events.LoadEvent;
   import org.osmf.events.MediaElementEvent;
   import org.osmf.events.PlayEvent;
   import org.osmf.events.SeekEvent;
   import org.osmf.events.TimeEvent;
   import org.osmf.media.MediaElement;
   
   public class TraitEventDispatcher extends EventDispatcher
   {
      
      private static var eventMaps:Dictionary;
       
      
      private var _mediaElement:MediaElement;
      
      public function TraitEventDispatcher()
      {
         super();
         if(eventMaps == null)
         {
            eventMaps = new Dictionary();
            eventMaps[TimeEvent.DURATION_CHANGE] = MediaTraitType.TIME;
            eventMaps[TimeEvent.COMPLETE] = MediaTraitType.TIME;
            eventMaps[PlayEvent.PLAY_STATE_CHANGE] = MediaTraitType.PLAY;
            eventMaps[PlayEvent.CAN_PAUSE_CHANGE] = MediaTraitType.PLAY;
            eventMaps[AudioEvent.VOLUME_CHANGE] = MediaTraitType.AUDIO;
            eventMaps[AudioEvent.MUTED_CHANGE] = MediaTraitType.AUDIO;
            eventMaps[AudioEvent.PAN_CHANGE] = MediaTraitType.AUDIO;
            eventMaps[SeekEvent.SEEKING_CHANGE] = MediaTraitType.SEEK;
            eventMaps[DynamicStreamEvent.SWITCHING_CHANGE] = MediaTraitType.DYNAMIC_STREAM;
            eventMaps[DynamicStreamEvent.AUTO_SWITCH_CHANGE] = MediaTraitType.DYNAMIC_STREAM;
            eventMaps[DynamicStreamEvent.NUM_DYNAMIC_STREAMS_CHANGE] = MediaTraitType.DYNAMIC_STREAM;
            eventMaps[DisplayObjectEvent.DISPLAY_OBJECT_CHANGE] = MediaTraitType.DISPLAY_OBJECT;
            eventMaps[DisplayObjectEvent.MEDIA_SIZE_CHANGE] = MediaTraitType.DISPLAY_OBJECT;
            eventMaps[LoadEvent.LOAD_STATE_CHANGE] = MediaTraitType.LOAD;
            eventMaps[LoadEvent.BYTES_LOADED_CHANGE] = MediaTraitType.LOAD;
            eventMaps[LoadEvent.BYTES_TOTAL_CHANGE] = MediaTraitType.LOAD;
            eventMaps[BufferEvent.BUFFERING_CHANGE] = MediaTraitType.BUFFER;
            eventMaps[BufferEvent.BUFFER_TIME_CHANGE] = MediaTraitType.BUFFER;
            eventMaps[DRMEvent.DRM_STATE_CHANGE] = MediaTraitType.DRM;
            eventMaps[DVREvent.IS_RECORDING_CHANGE] = MediaTraitType.DVR;
         }
      }
      
      public function get media() : MediaElement
      {
         return this._mediaElement;
      }
      
      public function set media(param1:MediaElement) : void
      {
         var _loc2_:* = null;
         if(param1 != this._mediaElement)
         {
            if(this._mediaElement != null)
            {
               this._mediaElement.removeEventListener(MediaElementEvent.TRAIT_ADD,this.onTraitAdd);
               this._mediaElement.removeEventListener(MediaElementEvent.TRAIT_REMOVE,this.onTraitRemove);
               for each(_loc2_ in this._mediaElement.traitTypes)
               {
                  this.onTraitChanged(_loc2_,false);
               }
            }
            this._mediaElement = param1;
            if(this._mediaElement != null)
            {
               this._mediaElement.addEventListener(MediaElementEvent.TRAIT_ADD,this.onTraitAdd);
               this._mediaElement.addEventListener(MediaElementEvent.TRAIT_REMOVE,this.onTraitRemove);
               for each(_loc2_ in this._mediaElement.traitTypes)
               {
                  this.onTraitChanged(_loc2_,true);
               }
            }
         }
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var _loc6_:Boolean = hasEventListener(param1);
         super.addEventListener(param1,param2,param3,param4,param5);
         if(this._mediaElement && !_loc6_ && eventMaps[param1] != undefined)
         {
            this.changeListeners(true,eventMaps[param1],param1);
         }
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         if(this._mediaElement && !hasEventListener(param1) && eventMaps[param1] != undefined)
         {
            this.changeListeners(false,eventMaps[param1],param1);
         }
      }
      
      private function onTraitAdd(param1:MediaElementEvent) : void
      {
         this.onTraitChanged(param1.traitType,true);
      }
      
      private function onTraitRemove(param1:MediaElementEvent) : void
      {
         this.onTraitChanged(param1.traitType,false);
      }
      
      private function onTraitChanged(param1:String, param2:Boolean) : void
      {
         switch(param1)
         {
            case MediaTraitType.TIME:
               this.changeListeners(param2,param1,TimeEvent.DURATION_CHANGE);
               this.changeListeners(param2,param1,TimeEvent.COMPLETE);
               break;
            case MediaTraitType.PLAY:
               this.changeListeners(param2,param1,PlayEvent.PLAY_STATE_CHANGE);
               this.changeListeners(param2,param1,PlayEvent.CAN_PAUSE_CHANGE);
               break;
            case MediaTraitType.AUDIO:
               this.changeListeners(param2,param1,AudioEvent.VOLUME_CHANGE);
               this.changeListeners(param2,param1,AudioEvent.MUTED_CHANGE);
               this.changeListeners(param2,param1,AudioEvent.PAN_CHANGE);
               break;
            case MediaTraitType.SEEK:
               this.changeListeners(param2,param1,SeekEvent.SEEKING_CHANGE);
               break;
            case MediaTraitType.DYNAMIC_STREAM:
               this.changeListeners(param2,param1,DynamicStreamEvent.SWITCHING_CHANGE);
               this.changeListeners(param2,param1,DynamicStreamEvent.AUTO_SWITCH_CHANGE);
               this.changeListeners(param2,param1,DynamicStreamEvent.NUM_DYNAMIC_STREAMS_CHANGE);
               break;
            case MediaTraitType.DISPLAY_OBJECT:
               this.changeListeners(param2,param1,DisplayObjectEvent.DISPLAY_OBJECT_CHANGE);
               this.changeListeners(param2,param1,DisplayObjectEvent.MEDIA_SIZE_CHANGE);
               break;
            case MediaTraitType.LOAD:
               this.changeListeners(param2,param1,LoadEvent.LOAD_STATE_CHANGE);
               this.changeListeners(param2,param1,LoadEvent.BYTES_TOTAL_CHANGE);
               this.changeListeners(param2,param1,LoadEvent.BYTES_LOADED_CHANGE);
               break;
            case MediaTraitType.BUFFER:
               this.changeListeners(param2,param1,BufferEvent.BUFFERING_CHANGE);
               this.changeListeners(param2,param1,BufferEvent.BUFFER_TIME_CHANGE);
               break;
            case MediaTraitType.DRM:
               this.changeListeners(param2,param1,DRMEvent.DRM_STATE_CHANGE);
               break;
            case MediaTraitType.DVR:
               this.changeListeners(param2,param1,DVREvent.IS_RECORDING_CHANGE);
         }
      }
      
      private function changeListeners(param1:Boolean, param2:String, param3:String) : void
      {
         if(this._mediaElement.getTrait(param2) != null)
         {
            if(param1 && hasEventListener(param3))
            {
               this._mediaElement.getTrait(param2).addEventListener(param3,this.redispatchEvent);
            }
            else
            {
               this._mediaElement.getTrait(param2).removeEventListener(param3,this.redispatchEvent);
            }
         }
      }
      
      private function redispatchEvent(param1:Event) : void
      {
         dispatchEvent(param1.clone());
      }
   }
}
