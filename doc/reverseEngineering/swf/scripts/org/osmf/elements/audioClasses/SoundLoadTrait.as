package org.osmf.elements.audioClasses
{
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import org.osmf.events.LoadEvent;
   import org.osmf.media.MediaResourceBase;
   import org.osmf.traits.LoadState;
   import org.osmf.traits.LoadTrait;
   import org.osmf.traits.LoaderBase;
   
   public class SoundLoadTrait extends LoadTrait
   {
       
      
      private var lastBytesTotal:Number;
      
      private var _sound:Sound;
      
      public function SoundLoadTrait(param1:LoaderBase, param2:MediaResourceBase)
      {
         super(param1,param2);
      }
      
      public function get sound() : Sound
      {
         return this._sound;
      }
      
      public function set sound(param1:Sound) : void
      {
         this._sound = param1;
      }
      
      override protected function loadStateChangeStart(param1:String) : void
      {
         if(param1 == LoadState.READY)
         {
            if(this._sound != null)
            {
               this._sound.addEventListener(Event.OPEN,this.bytesTotalCheckingHandler,false,0,true);
               this._sound.addEventListener(ProgressEvent.PROGRESS,this.bytesTotalCheckingHandler,false,0,true);
            }
         }
         else if(param1 == LoadState.UNINITIALIZED)
         {
            this._sound = null;
         }
      }
      
      override public function get bytesLoaded() : Number
      {
         return !!this._sound ? this._sound.bytesLoaded : NaN;
      }
      
      override public function get bytesTotal() : Number
      {
         return !!this._sound ? this._sound.bytesTotal : NaN;
      }
      
      private function bytesTotalCheckingHandler(param1:Event) : void
      {
         var _loc2_:* = null;
         if(this.lastBytesTotal != this._sound.bytesTotal)
         {
            _loc2_ = new LoadEvent(LoadEvent.BYTES_TOTAL_CHANGE,false,false,null,this._sound.bytesTotal);
            this.lastBytesTotal = this._sound.bytesTotal;
            dispatchEvent(_loc2_);
         }
      }
   }
}
