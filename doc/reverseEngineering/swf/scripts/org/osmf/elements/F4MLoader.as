package org.osmf.elements
{
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import org.osmf.elements.f4mClasses.DRMAdditionalHeader;
   import org.osmf.elements.f4mClasses.Manifest;
   import org.osmf.elements.f4mClasses.ManifestParser;
   import org.osmf.elements.proxyClasses.LoadFromDocumentLoadTrait;
   import org.osmf.events.MediaError;
   import org.osmf.events.MediaErrorEvent;
   import org.osmf.media.DefaultMediaFactory;
   import org.osmf.media.MediaElement;
   import org.osmf.media.MediaFactory;
   import org.osmf.media.MediaResourceBase;
   import org.osmf.media.MediaTypeUtil;
   import org.osmf.media.URLResource;
   import org.osmf.traits.LoadState;
   import org.osmf.traits.LoadTrait;
   import org.osmf.traits.LoaderBase;
   import org.osmf.utils.URL;
   
   public class F4MLoader extends LoaderBase
   {
      
      public static const F4M_MIME_TYPE:String = "application/f4m+xml";
      
      private static const F4M_EXTENSION:String = "f4m";
       
      
      private var supportedMimeTypes:Vector.<String>;
      
      private var factory:MediaFactory;
      
      private var parser:ManifestParser;
      
      public function F4MLoader(param1:MediaFactory = null)
      {
         this.supportedMimeTypes = new Vector.<String>();
         super();
         this.supportedMimeTypes.push(F4M_MIME_TYPE);
         if(param1 == null)
         {
            param1 = new DefaultMediaFactory();
         }
         this.parser = new ManifestParser();
         this.factory = param1;
      }
      
      override public function canHandleResource(param1:MediaResourceBase) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:int = MediaTypeUtil.checkMetadataMatchWithResource(param1,new Vector.<String>(),this.supportedMimeTypes);
         if(_loc2_ == MediaTypeUtil.METADATA_MATCH_FOUND)
         {
            return true;
         }
         if(param1 is URLResource)
         {
            _loc3_ = URLResource(param1);
            return (_loc4_ = new URL(_loc3_.url).extension) == F4M_EXTENSION;
         }
         return false;
      }
      
      override protected function executeLoad(param1:LoadTrait) : void
      {
         var manifest:Manifest = null;
         var manifestLoader:URLLoader = null;
         var onError:Function = null;
         var onComplete:Function = null;
         var loadTrait:LoadTrait = param1;
         onError = function(param1:ErrorEvent):void
         {
            manifestLoader.removeEventListener(Event.COMPLETE,onComplete);
            manifestLoader.removeEventListener(IOErrorEvent.IO_ERROR,onError);
            manifestLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);
            updateLoadTrait(loadTrait,LoadState.LOAD_ERROR);
            loadTrait.dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR,false,false,new MediaError(0,param1.text)));
         };
         onComplete = function(param1:Event):void
         {
            var completionCallback:Function;
            var unfinishedLoads:Number = NaN;
            var item:DRMAdditionalHeader = null;
            var var_6:Event = param1;
            manifestLoader.removeEventListener(Event.COMPLETE,onComplete);
            manifestLoader.removeEventListener(IOErrorEvent.IO_ERROR,onError);
            manifestLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);
            try
            {
               manifest = parser.parse(var_6.target.data,getRootUrl(URLResource(loadTrait.resource).url));
            }
            catch(parseError:Error)
            {
               updateLoadTrait(loadTrait,LoadState.LOAD_ERROR);
               loadTrait.dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR,false,false,new MediaError(parseError.errorID,parseError.message)));
            }
            if(manifest != null)
            {
               unfinishedLoads = 0;
               for each(item in manifest.drmAdditionalHeaders)
               {
                  if(item.url != null)
                  {
                     completionCallback = function(param1:Boolean):void
                     {
                        if(param1)
                        {
                           --unfinishedLoads;
                        }
                        if(unfinishedLoads == 0)
                        {
                           finishLoad();
                        }
                     };
                     unfinishedLoads++;
                     loadAdditionalHeader(item,completionCallback,onError);
                  }
               }
               if(unfinishedLoads == 0)
               {
                  finishLoad();
               }
            }
         };
         var finishLoad:Function = function():void
         {
            var netResource:MediaResourceBase = null;
            var loadedElem:MediaElement = null;
            try
            {
               netResource = parser.createResource(manifest,URLResource(loadTrait.resource));
               loadedElem = factory.createMediaElement(netResource);
               if(loadedElem.hasOwnProperty("defaultDuration") && !isNaN(manifest.duration))
               {
                  loadedElem["defaultDuration"] = manifest.duration;
               }
               LoadFromDocumentLoadTrait(loadTrait).mediaElement = loadedElem;
               updateLoadTrait(loadTrait,LoadState.READY);
            }
            catch(error:Error)
            {
               updateLoadTrait(loadTrait,LoadState.LOAD_ERROR);
               loadTrait.dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR,false,false,new MediaError(error.errorID,error.message)));
            }
         };
         updateLoadTrait(loadTrait,LoadState.LOADING);
         manifestLoader = new URLLoader(new URLRequest(URLResource(loadTrait.resource).url));
         manifestLoader.addEventListener(Event.COMPLETE,onComplete);
         manifestLoader.addEventListener(IOErrorEvent.IO_ERROR,onError);
         manifestLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);
      }
      
      override protected function executeUnload(param1:LoadTrait) : void
      {
         updateLoadTrait(param1,LoadState.UNINITIALIZED);
      }
      
      private function loadAdditionalHeader(param1:DRMAdditionalHeader, param2:Function, param3:Function) : void
      {
         var onDRMLoadComplete:Function = null;
         var item:DRMAdditionalHeader = param1;
         var completionCallback:Function = param2;
         var onError:Function = param3;
         onDRMLoadComplete = function(param1:Event):void
         {
            param1.target.removeEventListener(Event.COMPLETE,onDRMLoadComplete);
            param1.target.removeEventListener(IOErrorEvent.IO_ERROR,onError);
            param1.target.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);
            item.data = URLLoader(param1.target).data;
            completionCallback(true);
         };
         var drmLoader:URLLoader = new URLLoader();
         drmLoader.dataFormat = URLLoaderDataFormat.BINARY;
         drmLoader.addEventListener(Event.COMPLETE,onDRMLoadComplete);
         drmLoader.addEventListener(IOErrorEvent.IO_ERROR,onError);
         drmLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);
         drmLoader.load(new URLRequest(item.url));
      }
      
      private function getRootUrl(param1:String) : String
      {
         return param1.substr(0,param1.lastIndexOf("/"));
      }
   }
}
