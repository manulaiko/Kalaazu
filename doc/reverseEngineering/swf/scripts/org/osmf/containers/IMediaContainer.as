package org.osmf.containers
{
   import org.osmf.media.MediaElement;
   
   public interface IMediaContainer
   {
       
      
      function addMediaElement(param1:MediaElement) : MediaElement;
      
      function removeMediaElement(param1:MediaElement) : MediaElement;
      
      function containsMediaElement(param1:MediaElement) : Boolean;
   }
}
