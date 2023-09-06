package org.osmf.elements.proxyClasses
{
   import org.osmf.events.LoadEvent;
   import org.osmf.media.MediaElement;
   import org.osmf.media.MediaResourceBase;
   import org.osmf.traits.LoadTrait;
   import org.osmf.traits.LoaderBase;
   
   public class LoadFromDocumentLoadTrait extends LoadTrait
   {
       
      
      private var _mediaElement:MediaElement;
      
      public function LoadFromDocumentLoadTrait(param1:LoaderBase, param2:MediaResourceBase)
      {
         super(param1,param2);
      }
      
      override protected function loadStateChangeEnd() : void
      {
         dispatchEvent(new LoadEvent(LoadEvent.LOAD_STATE_CHANGE,false,false,loadState));
      }
      
      public function set mediaElement(param1:MediaElement) : void
      {
         this._mediaElement = param1;
      }
      
      public function get mediaElement() : MediaElement
      {
         return this._mediaElement;
      }
   }
}
