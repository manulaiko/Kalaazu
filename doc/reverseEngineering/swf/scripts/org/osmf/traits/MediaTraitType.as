package org.osmf.traits
{
   public final class MediaTraitType
   {
      
      public static const AUDIO:String = "audio";
      
      public static const BUFFER:String = "buffer";
      
      public static const DRM:String = "drm";
      
      public static const DYNAMIC_STREAM:String = "dynamicStream";
      
      public static const LOAD:String = "load";
      
      public static const PLAY:String = "play";
      
      public static const SEEK:String = "seek";
      
      public static const TIME:String = "time";
      
      public static const DISPLAY_OBJECT:String = "displayObject";
      
      public static const DVR:String = "dvr";
      
      public static const ALL_TYPES:Vector.<String> = Vector.<String>([AUDIO,BUFFER,DRM,DYNAMIC_STREAM,LOAD,PLAY,SEEK,TIME,DISPLAY_OBJECT,DVR]);
       
      
      public function MediaTraitType()
      {
         super();
      }
   }
}
