package spark.components.mediaClasses
{
   import flash.events.MouseEvent;
   import mx.events.FlexEvent;
   import spark.components.Button;
   
   public class MuteButton extends Button
   {
       
      
      private var _muted:Boolean = false;
      
      private var _volume:Number = 1;
      
      public function MuteButton()
      {
         super();
      }
      
      [Bindable("mutedChanged")]
      public function get muted() : Boolean
      {
         return this._muted;
      }
      
      public function set muted(param1:Boolean) : void
      {
         if(this._muted == param1)
         {
            return;
         }
         this._muted = param1;
         dispatchEvent(new FlexEvent(FlexEvent.MUTED_CHANGE));
      }
      
      [Bindable(event="valueCommit")]
      public function get volume() : Number
      {
         return this._volume;
      }
      
      public function set volume(param1:Number) : void
      {
         if(this._volume == param1)
         {
            return;
         }
         this._volume = param1;
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      override protected function clickHandler(param1:MouseEvent) : void
      {
         super.clickHandler(param1);
         this.muted = !this.muted;
         dispatchEvent(new FlexEvent(FlexEvent.MUTED_CHANGE));
      }
   }
}
