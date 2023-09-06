package org.osmf.traits
{
   import flash.errors.IllegalOperationError;
   import org.osmf.events.DynamicStreamEvent;
   import org.osmf.utils.OSMFStrings;
   
   public class DynamicStreamTrait extends MediaTraitBase
   {
       
      
      private var _autoSwitch:Boolean;
      
      private var _currentIndex:int = 0;
      
      private var _maxAllowedIndex:int = 0;
      
      private var _numDynamicStreams:int;
      
      private var _switching:Boolean;
      
      public function DynamicStreamTrait(param1:Boolean = true, param2:int = 0, param3:int = 1)
      {
         super(MediaTraitType.DYNAMIC_STREAM);
         this._autoSwitch = param1;
         this._currentIndex = param2;
         this._numDynamicStreams = param3;
         this._maxAllowedIndex = param3 - 1;
         this._switching = false;
      }
      
      public function get autoSwitch() : Boolean
      {
         return this._autoSwitch;
      }
      
      public final function set autoSwitch(param1:Boolean) : void
      {
         if(this.autoSwitch != param1)
         {
            this.autoSwitchChangeStart(param1);
            this._autoSwitch = param1;
            this.autoSwitchChangeEnd();
         }
      }
      
      public function get numDynamicStreams() : int
      {
         return this._numDynamicStreams;
      }
      
      public function get currentIndex() : int
      {
         return this._currentIndex;
      }
      
      public function get maxAllowedIndex() : int
      {
         return this._maxAllowedIndex;
      }
      
      public final function set maxAllowedIndex(param1:int) : void
      {
         if(param1 < 0 || param1 > this._numDynamicStreams - 1)
         {
            throw new RangeError(OSMFStrings.getString(OSMFStrings.STREAMSWITCH_INVALID_INDEX));
         }
         if(this.maxAllowedIndex != param1)
         {
            this.maxAllowedIndexChangeStart(param1);
            this._maxAllowedIndex = param1;
            this.maxAllowedIndexChangeEnd();
         }
      }
      
      public function getBitrateForIndex(param1:int) : Number
      {
         if(param1 > this._numDynamicStreams - 1 || param1 < 0)
         {
            throw new RangeError(OSMFStrings.getString(OSMFStrings.STREAMSWITCH_INVALID_INDEX));
         }
         return 0;
      }
      
      public function get switching() : Boolean
      {
         return this._switching;
      }
      
      public function switchTo(param1:int) : void
      {
         if(this.autoSwitch)
         {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.STREAMSWITCH_STREAM_NOT_IN_MANUAL_MODE));
         }
         if(param1 != this.currentIndex)
         {
            if(param1 < 0 || param1 > this.maxAllowedIndex)
            {
               throw new RangeError(OSMFStrings.getString(OSMFStrings.STREAMSWITCH_INVALID_INDEX));
            }
            this.setSwitching(true,param1);
         }
      }
      
      protected final function setNumDynamicStreams(param1:int) : void
      {
         if(param1 != this._numDynamicStreams)
         {
            this._numDynamicStreams = param1;
            if(this.maxAllowedIndex >= this._numDynamicStreams)
            {
               this.maxAllowedIndex = Math.max(0,this._numDynamicStreams - 1);
            }
            dispatchEvent(new DynamicStreamEvent(DynamicStreamEvent.NUM_DYNAMIC_STREAMS_CHANGE));
         }
      }
      
      protected final function setCurrentIndex(param1:int) : void
      {
         this._currentIndex = param1;
      }
      
      protected final function setSwitching(param1:Boolean, param2:int) : void
      {
         if(param1 != this._switching)
         {
            this.switchingChangeStart(param1,param2);
            this._switching = param1;
            if(param1 == false)
            {
               this.setCurrentIndex(param2);
            }
            this.switchingChangeEnd(param2);
         }
      }
      
      protected function autoSwitchChangeStart(param1:Boolean) : void
      {
      }
      
      protected function autoSwitchChangeEnd() : void
      {
         dispatchEvent(new DynamicStreamEvent(DynamicStreamEvent.AUTO_SWITCH_CHANGE,false,false,false,this._autoSwitch));
      }
      
      protected function switchingChangeStart(param1:Boolean, param2:int) : void
      {
      }
      
      protected function switchingChangeEnd(param1:int) : void
      {
         dispatchEvent(new DynamicStreamEvent(DynamicStreamEvent.SWITCHING_CHANGE,false,false,this.switching));
      }
      
      protected function maxAllowedIndexChangeStart(param1:int) : void
      {
      }
      
      protected function maxAllowedIndexChangeEnd() : void
      {
      }
   }
}
