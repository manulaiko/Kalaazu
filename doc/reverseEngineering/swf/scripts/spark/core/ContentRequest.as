package spark.core
{
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import mx.core.mx_internal;
   import spark.events.LoaderInvalidationEvent;
   
   public class ContentRequest extends EventDispatcher
   {
       
      
      private var _shared:Boolean;
      
      protected var _content:Object;
      
      private var _complete:Boolean;
      
      public function ContentRequest(param1:IContentLoader, param2:*, param3:Boolean = false, param4:Boolean = false)
      {
         super();
         this.content = param2;
         this._shared = param3;
         this._complete = param4;
         param1.addEventListener("invalidateLoader",this.mx_internal::contentLoader_invalidateLoaderHandler,false,0,true);
      }
      
      public function get content() : Object
      {
         return this._content;
      }
      
      public function set content(param1:Object) : void
      {
         this.removeLoaderListeners();
         this._content = param1;
         this.addLoaderListeners();
      }
      
      public function get complete() : Boolean
      {
         if(Boolean(this._content) && this._content is LoaderInfo)
         {
            return this._complete;
         }
         return this._content != null;
      }
      
      private function addLoaderListeners() : void
      {
         var _loc1_:* = null;
         if(Boolean(this._content) && this._content is LoaderInfo)
         {
            _loc1_ = LoaderInfo(this._content);
            _loc1_.addEventListener(Event.COMPLETE,this.mx_internal::content_completeHandler,false,0,true);
            _loc1_.addEventListener(IOErrorEvent.IO_ERROR,this.mx_internal::content_ioErrorHandler,false,0,true);
            _loc1_.addEventListener(ProgressEvent.PROGRESS,dispatchEvent,false,0,true);
            _loc1_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,dispatchEvent,false,0,true);
            _loc1_.addEventListener(HTTPStatusEvent.HTTP_STATUS,dispatchEvent,false,0,true);
         }
      }
      
      private function removeLoaderListeners() : void
      {
         var _loc1_:* = null;
         if(Boolean(this._content) && this._content is LoaderInfo)
         {
            _loc1_ = LoaderInfo(this._content);
            _loc1_.removeEventListener(Event.COMPLETE,this.mx_internal::content_completeHandler);
            _loc1_.removeEventListener(IOErrorEvent.IO_ERROR,this.mx_internal::content_ioErrorHandler);
            _loc1_.removeEventListener(ProgressEvent.PROGRESS,dispatchEvent);
            _loc1_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,dispatchEvent);
            _loc1_.removeEventListener(HTTPStatusEvent.HTTP_STATUS,dispatchEvent);
         }
      }
      
      mx_internal function content_completeHandler(param1:Event) : void
      {
         if(param1.target == this._content)
         {
            this._complete = true;
            dispatchEvent(param1);
            this.removeLoaderListeners();
         }
      }
      
      mx_internal function content_ioErrorHandler(param1:Event) : void
      {
         if(param1.target == this._content)
         {
            if(hasEventListener(IOErrorEvent.IO_ERROR))
            {
               dispatchEvent(param1);
            }
         }
      }
      
      mx_internal function contentLoader_invalidateLoaderHandler(param1:LoaderInvalidationEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this._shared)
         {
            if(this._content == param1.content)
            {
               this._shared = false;
               _loc2_ = new Loader();
               _loc3_ = new LoaderContext();
               _loc4_ = this._content.url;
               _loc5_ = _loc2_.contentLoaderInfo;
               _loc3_.checkPolicyFile = true;
               _loc2_.load(new URLRequest(_loc4_),_loc3_);
            }
         }
      }
   }
}
