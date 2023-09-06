package mx.core
{
   import flash.display.Loader;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import mx.events.RSLEvent;
   import mx.utils.LoaderUtil;
   
   public class RSLItem
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public var urlRequest:URLRequest;
      
      public var total:uint = 0;
      
      public var loaded:uint = 0;
      
      public var rootURL:String;
      
      protected var chainedProgressHandler:Function;
      
      protected var chainedCompleteHandler:Function;
      
      protected var chainedIOErrorHandler:Function;
      
      protected var chainedSecurityErrorHandler:Function;
      
      protected var chainedRSLErrorHandler:Function;
      
      private var completed:Boolean = false;
      
      private var errorText:String;
      
      protected var moduleFactory:IFlexModuleFactory;
      
      protected var url:String;
      
      public function RSLItem(param1:String, param2:String = null, param3:IFlexModuleFactory = null)
      {
         super();
         this.url = param1;
         this.rootURL = param2;
         this.moduleFactory = param3;
      }
      
      public function load(param1:Function, param2:Function, param3:Function, param4:Function, param5:Function) : void
      {
         this.chainedProgressHandler = param1;
         this.chainedCompleteHandler = param2;
         this.chainedIOErrorHandler = param3;
         this.chainedSecurityErrorHandler = param4;
         this.chainedRSLErrorHandler = param5;
         var _loc6_:Loader = new Loader();
         var _loc7_:LoaderContext = new LoaderContext();
         this.urlRequest = new URLRequest(LoaderUtil.createAbsoluteURL(this.rootURL,this.url));
         _loc6_.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.itemProgressHandler);
         _loc6_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.itemCompleteHandler);
         _loc6_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.itemErrorHandler);
         _loc6_.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.itemErrorHandler);
         if(this.moduleFactory != null)
         {
            _loc7_.applicationDomain = this.moduleFactory.info()["currentDomain"];
         }
         else
         {
            _loc7_.applicationDomain = ApplicationDomain.currentDomain;
         }
         _loc6_.load(this.urlRequest,_loc7_);
      }
      
      public function itemProgressHandler(param1:ProgressEvent) : void
      {
         this.loaded = param1.bytesLoaded;
         this.total = param1.bytesTotal;
         if(this.chainedProgressHandler != null)
         {
            this.chainedProgressHandler(param1);
         }
      }
      
      public function itemCompleteHandler(param1:Event) : void
      {
         this.completed = true;
         if(this.chainedCompleteHandler != null)
         {
            this.chainedCompleteHandler(param1);
         }
      }
      
      public function itemErrorHandler(param1:ErrorEvent) : void
      {
         this.errorText = decodeURI(param1.text);
         this.completed = true;
         this.loaded = 0;
         this.total = 0;
         trace(this.errorText);
         if(param1.type == IOErrorEvent.IO_ERROR && this.chainedIOErrorHandler != null)
         {
            this.chainedIOErrorHandler(param1);
         }
         else if(param1.type == SecurityErrorEvent.SECURITY_ERROR && this.chainedSecurityErrorHandler != null)
         {
            this.chainedSecurityErrorHandler(param1);
         }
         else if(param1.type == RSLEvent.RSL_ERROR && this.chainedRSLErrorHandler != null)
         {
            this.chainedRSLErrorHandler(param1);
         }
      }
   }
}
