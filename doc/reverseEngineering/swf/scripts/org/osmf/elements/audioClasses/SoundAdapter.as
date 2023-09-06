package org.osmf.elements.audioClasses
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import org.osmf.events.MediaError;
   import org.osmf.events.MediaErrorCodes;
   import org.osmf.events.MediaErrorEvent;
   import org.osmf.media.MediaElement;
   
   public class SoundAdapter extends EventDispatcher
   {
      
      public static const DOWNLOAD_COMPLETE:String = "downloadComplete";
       
      
      private var owner:MediaElement;
      
      private var _soundTransform:SoundTransform;
      
      private var sound:Sound;
      
      private var playing:Boolean = false;
      
      private var channel:SoundChannel;
      
      private var lastStartTime:Number = 0;
      
      public function SoundAdapter(param1:MediaElement, param2:Sound)
      {
         super();
         this.owner = param1;
         this.sound = param2;
         this._soundTransform = new SoundTransform();
         param2.addEventListener(Event.COMPLETE,this.onDownloadComplete,false,0,true);
         param2.addEventListener(ProgressEvent.PROGRESS,this.onProgress,false,0,true);
         param2.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError,false,0,true);
      }
      
      public function get currentTime() : Number
      {
         return this.channel != null ? this.channel.position / 1000 : this.lastStartTime / 1000;
      }
      
      public function get estimatedDuration() : Number
      {
         return this.sound.length / (1000 * this.sound.bytesLoaded / this.sound.bytesTotal);
      }
      
      public function get soundTransform() : SoundTransform
      {
         return this._soundTransform;
      }
      
      public function set soundTransform(param1:SoundTransform) : void
      {
         this._soundTransform = param1;
         if(this.channel != null)
         {
            this.channel.soundTransform = param1;
         }
      }
      
      public function play(param1:Number = -1) : Boolean
      {
         var var_2581:Number = param1;
         var success:Boolean = false;
         if(this.channel == null)
         {
            try
            {
               this.channel = this.sound.play(var_2581 != -1 ? var_2581 : this.lastStartTime);
            }
            catch(error:ArgumentError)
            {
               channel = null;
            }
            if(this.channel != null)
            {
               this.playing = true;
               this.channel.soundTransform = this._soundTransform;
               this.channel.addEventListener(Event.SOUND_COMPLETE,this.onSoundComplete);
               success = true;
            }
            else
            {
               this.owner.dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR,false,false,new MediaError(MediaErrorCodes.SOUND_PLAY_FAILED)));
            }
         }
         return success;
      }
      
      public function pause() : void
      {
         if(this.channel != null)
         {
            this.lastStartTime = this.channel.position;
            this.clearChannel();
            this.playing = false;
         }
      }
      
      public function stop() : void
      {
         if(this.channel != null)
         {
            this.lastStartTime = 0;
            this.clearChannel();
            this.playing = false;
         }
      }
      
      public function seek(param1:Number) : void
      {
         var _loc2_:Boolean = this.playing;
         if(this.channel != null)
         {
            this.clearChannel();
         }
         this.play(param1 * 1000);
         if(_loc2_ == false)
         {
            this.pause();
         }
      }
      
      private function clearChannel() : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.onSoundComplete);
            this.channel.stop();
            this.channel = null;
         }
      }
      
      private function onSoundComplete(param1:Event) : void
      {
         this.lastStartTime = this.channel.position;
         this.clearChannel();
         this.playing = false;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function onDownloadComplete(param1:Event) : void
      {
         dispatchEvent(new Event(DOWNLOAD_COMPLETE));
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         this.owner.dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR,false,false,new MediaError(MediaErrorCodes.IO_ERROR)));
      }
   }
}
