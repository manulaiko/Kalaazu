package net.bigpoint.darkorbit.fui.builder.xml.creators
{
   import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
   import net.bigpoint.darkorbit.fui.components.video.VideoPlayer;
   
   public class VideoPlayerCreator extends AbstractCreator
   {
       
      
      public function VideoPlayerCreator()
      {
         super();
      }
      
      public function create(param1:XML) : ICoreponent
      {
         var _loc2_:VideoPlayer = new VideoPlayer();
         mapXMLNodeAttributes(_loc2_,param1);
         return _loc2_;
      }
   }
}
