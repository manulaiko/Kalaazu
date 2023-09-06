package org.osmf.elements.audioClasses
{
   import flash.events.Event;
   import org.osmf.traits.PlayState;
   import org.osmf.traits.PlayTrait;
   
   public class AudioPlayTrait extends PlayTrait
   {
       
      
      private var lastPlayFailed:Boolean = false;
      
      private var soundAdapter:SoundAdapter;
      
      public function AudioPlayTrait(param1:SoundAdapter)
      {
         super();
         this.soundAdapter = param1;
         param1.addEventListener(Event.COMPLETE,this.onPlaybackComplete,false,1,true);
      }
      
      override protected function playStateChangeStart(param1:String) : void
      {
         if(param1 == PlayState.PLAYING)
         {
            this.lastPlayFailed = !this.soundAdapter.play();
         }
         else if(param1 == PlayState.PAUSED)
         {
            this.soundAdapter.pause();
         }
         else if(param1 == PlayState.STOPPED)
         {
            this.soundAdapter.stop();
         }
      }
      
      override protected function playStateChangeEnd() : void
      {
         if(this.lastPlayFailed)
         {
            stop();
            this.lastPlayFailed = false;
         }
         else
         {
            super.playStateChangeEnd();
         }
      }
      
      private function onPlaybackComplete(param1:Event) : void
      {
         stop();
      }
   }
}
