package org.osmf.traits
{
   import flash.errors.IllegalOperationError;
   import org.osmf.events.LoadEvent;
   import org.osmf.events.LoaderEvent;
   import org.osmf.media.MediaResourceBase;
   import org.osmf.utils.OSMFStrings;
   
   public class LoadTrait extends MediaTraitBase
   {
       
      
      private var loader:LoaderBase;
      
      private var _resource:MediaResourceBase;
      
      private var _loadState:String;
      
      private var _bytesLoaded:Number;
      
      private var _bytesTotal:Number;
      
      public function LoadTrait(param1:LoaderBase, param2:MediaResourceBase)
      {
         super(MediaTraitType.LOAD);
         this.loader = param1;
         this._resource = param2;
         this._loadState = LoadState.UNINITIALIZED;
         if(param1 != null)
         {
            param1.addEventListener(LoaderEvent.LOAD_STATE_CHANGE,this.onLoadStateChange,false,int.MAX_VALUE,true);
         }
      }
      
      public function get resource() : MediaResourceBase
      {
         return this._resource;
      }
      
      public function get loadState() : String
      {
         return this._loadState;
      }
      
      public function load() : void
      {
         if(this.loader)
         {
            if(this._loadState == LoadState.READY)
            {
               throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.ALREADY_READY));
            }
            if(this._loadState == LoadState.LOADING)
            {
               throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.ALREADY_LOADING));
            }
            this.loader.load(this);
            return;
         }
         throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.MUST_SET_LOADER));
      }
      
      public function unload() : void
      {
         if(this.loader)
         {
            if(this._loadState == LoadState.UNLOADING)
            {
               throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.ALREADY_UNLOADING));
            }
            if(this._loadState == LoadState.UNINITIALIZED)
            {
               throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.ALREADY_UNLOADED));
            }
            this.loader.unload(this);
            return;
         }
         throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.MUST_SET_LOADER));
      }
      
      public function get bytesLoaded() : Number
      {
         return this._bytesLoaded;
      }
      
      public function get bytesTotal() : Number
      {
         return this._bytesTotal;
      }
      
      protected final function setLoadState(param1:String) : void
      {
         if(this._loadState != param1)
         {
            this.loadStateChangeStart(param1);
            this._loadState = param1;
            this.loadStateChangeEnd();
         }
      }
      
      protected final function setBytesLoaded(param1:Number) : void
      {
         if(isNaN(param1) || param1 > this.bytesTotal || param1 < 0)
         {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
         }
         if(param1 != this._bytesLoaded)
         {
            this.bytesLoadedChangeStart(param1);
            this._bytesLoaded = param1;
            this.bytesLoadedChangeEnd();
         }
      }
      
      protected final function setBytesTotal(param1:Number) : void
      {
         if(param1 < this._bytesLoaded || param1 < 0)
         {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
         }
         if(param1 != this._bytesTotal)
         {
            this.bytesTotalChangeStart(param1);
            this._bytesTotal = param1;
            this.bytesTotalChangeEnd();
         }
      }
      
      protected function bytesLoadedChangeStart(param1:Number) : void
      {
      }
      
      protected function bytesLoadedChangeEnd() : void
      {
      }
      
      protected function bytesTotalChangeStart(param1:Number) : void
      {
      }
      
      protected function bytesTotalChangeEnd() : void
      {
         dispatchEvent(new LoadEvent(LoadEvent.BYTES_TOTAL_CHANGE,false,false,null,this._bytesTotal));
      }
      
      protected function loadStateChangeStart(param1:String) : void
      {
      }
      
      protected function loadStateChangeEnd() : void
      {
         dispatchEvent(new LoadEvent(LoadEvent.LOAD_STATE_CHANGE,false,false,this._loadState));
      }
      
      private function onLoadStateChange(param1:LoaderEvent) : void
      {
         if(param1.loadTrait == this)
         {
            this.setLoadState(param1.newState);
         }
      }
   }
}
