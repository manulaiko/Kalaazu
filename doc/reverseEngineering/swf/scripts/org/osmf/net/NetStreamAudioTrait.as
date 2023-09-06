package org.osmf.net
{
   import flash.media.SoundTransform;
   import flash.net.NetStream;
   import org.osmf.traits.AudioTrait;
   
   public class NetStreamAudioTrait extends AudioTrait
   {
       
      
      private var netStream:NetStream;
      
      public function NetStreamAudioTrait(param1:NetStream)
      {
         super();
         this.netStream = param1;
      }
      
      override protected function volumeChangeStart(param1:Number) : void
      {
         var _loc2_:SoundTransform = this.netStream.soundTransform;
         _loc2_.volume = muted ? 0 : param1;
         this.netStream.soundTransform = _loc2_;
      }
      
      override protected function mutedChangeStart(param1:Boolean) : void
      {
         var _loc2_:SoundTransform = this.netStream.soundTransform;
         _loc2_.volume = param1 ? 0 : volume;
         this.netStream.soundTransform = _loc2_;
      }
      
      override protected function panChangeStart(param1:Number) : void
      {
         var _loc2_:SoundTransform = this.netStream.soundTransform;
         _loc2_.pan = param1;
         this.netStream.soundTransform = _loc2_;
      }
   }
}
