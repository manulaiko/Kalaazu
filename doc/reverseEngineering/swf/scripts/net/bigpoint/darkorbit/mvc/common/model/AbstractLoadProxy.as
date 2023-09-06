package net.bigpoint.darkorbit.mvc.common.model
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class AbstractLoadProxy extends AbstractSettingsProxy
   {
      
      public static const NAME:String = "AbstractLoadProxy";
      
      public static const LOAD_STATUS__UNDEFINED:int = 0;
      
      public static const LOAD_STATUS__NOT_LOADED:int = 1;
      
      public static const LOAD_STATUS__PROGRESS:int = 2;
      
      public static const LOAD_STATUS__LOADED:int = 3;
      
      public static const LOAD_STATUS__ERROR:int = 4;
       
      
      protected var loadState:int = 1;
      
      protected var loadCallback:Function;
      
      protected var loadURL:String = "NOT DEFINED";
      
      private var urlLoader:URLLoader;
      
      private var percentLoaded:Number;
      
      public function AbstractLoadProxy(param1:String = null, param2:Object = null)
      {
         super(param1,param2);
      }
      
      override public function onRegister() : void
      {
         this.createLoader();
      }
      
      override public function onRemove() : void
      {
         this.removeLoader();
      }
      
      protected function createLoader() : void
      {
         this.loadState = LOAD_STATUS__NOT_LOADED;
         if(this.urlLoader == null)
         {
            this.urlLoader = new URLLoader();
            this.urlLoader.addEventListener(Event.COMPLETE,this.handleLoaded,false,0,true);
            this.urlLoader.addEventListener(ProgressEvent.PROGRESS,this.handleLoadProgress,false,0,true);
            this.urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.handleLoadError,false,0,true);
            this.urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.handleLoadError,false,0,true);
         }
      }
      
      protected function removeLoader() : void
      {
         this.loadState = LOAD_STATUS__UNDEFINED;
         if(this.urlLoader != null)
         {
            this.urlLoader.removeEventListener(Event.COMPLETE,this.handleLoaded);
            this.urlLoader.removeEventListener(ProgressEvent.PROGRESS,this.handleLoadProgress);
            this.urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.handleLoadError);
            this.urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.handleLoadError);
            this.urlLoader = null;
         }
      }
      
      public function load(param1:String, param2:Function = null) : void
      {
         this.loadURL = param1;
         this.loadState = LOAD_STATUS__PROGRESS;
         this.loadCallback = param2;
         var _loc3_:URLRequest = new URLRequest(this.loadURL);
         this.urlLoader.load(_loc3_);
      }
      
      protected function handleLoadProgress(param1:ProgressEvent) : void
      {
         this.percentLoaded = param1.bytesLoaded / param1.bytesTotal;
      }
      
      protected function handleLoaded(param1:Event) : void
      {
         this.loadState = LOAD_STATUS__LOADED;
      }
      
      protected function handleLoadError(param1:Event) : void
      {
         this.loadState = LOAD_STATUS__ERROR;
      }
      
      protected function executeCallback() : void
      {
         if(this.loadCallback != null)
         {
            this.loadCallback();
            this.loadCallback = null;
         }
      }
   }
}
