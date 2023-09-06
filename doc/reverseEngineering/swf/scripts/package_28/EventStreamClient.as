package package_28
{
   import com.adobe.serialization.json.JASON;
   import com.adobe.utils.StringUtil;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import package_110.Version;
   import package_111.class_304;
   import package_9.class_50;
   
   public class EventStreamClient
   {
      
      public static var VERSION:Number = 91;
      
      private static var _instance:EventStreamClient = null;
       
      
      public const const_3287:uint = 10;
      
      public var debug:Boolean = true;
      
      private var var_3194:ByteArray;
      
      private var var_2851:Function;
      
      private var _startTime:Number = 0;
      
      private var var_3590:Array;
      
      private var _context:Object = null;
      
      private var _stage:Stage = null;
      
      private var var_1792:Number = 0;
      
      private var var_2902:Number = 0;
      
      private var var_4118:Number = Infinity;
      
      private var var_1571:Number = 0;
      
      private var var_1543:Number = 0;
      
      private var var_3263:Number = 0;
      
      private var var_799:Number = 0;
      
      private var var_3246:Number = 0;
      
      private var var_3915:Number = 0;
      
      private var var_2127:Number = -1;
      
      private var var_3586:Number = 0;
      
      private var _urlRequest:URLRequest;
      
      private var _loader:URLLoader;
      
      private var var_3881:Number = 0;
      
      private var var_2442:String = "application/x-compressed-json";
      
      private var var_3731:Boolean;
      
      private var var_2780:int;
      
      private var var_4276:Number = 0;
      
      public function EventStreamClient(param1:String, param2:Stage, param3:Boolean = true, param4:Function = null)
      {
         this.var_3590 = [];
         this._urlRequest = new URLRequest();
         super();
         if(_instance == null)
         {
            _instance = this;
            this.var_3731 = param3;
            this.method_1370(param1);
            this.method_1176(param2);
            this.method_494(param4);
            this.var_3194 = new ByteArray();
            this._urlRequest = new URLRequest();
            this._urlRequest.method = URLRequestMethod.POST;
            this._urlRequest.contentType = "application/x-compressed-json";
            this._startTime = getTimer();
            this.var_2780 = getTimer();
            return;
         }
         throw new Error("EventStreamClient() error: Respect the singleton!");
      }
      
      public static function track(param1:String, param2:Object = null, param3:Boolean = false) : void
      {
         if(_instance != null)
         {
            _instance.method_727(param1,param2,param3);
         }
      }
      
      public function enterFrame() : void
      {
         var _loc1_:Number = getTimer();
         if(_loc1_ - Number(this.var_2780) > 10000)
         {
            this.var_2780 = _loc1_;
            this.flush();
         }
         if(_loc1_ > this.var_2902 + 1000)
         {
            this.var_2902 += 1000;
            this.var_4118 = Math.min(this.var_4118,this.var_1792);
            this.var_1571 += this.var_1792;
            ++this.var_1543;
            this.var_1792 = 0;
         }
         ++this.var_1792;
         var _loc2_:Number = 0;
         this.var_3263 = Math.max(this.var_3263,_loc2_);
         this.var_799 += _loc2_;
         ++this.var_3246;
         var _loc3_:Number = _loc2_ - 0;
         if(this.var_2127 == -1)
         {
            this.var_2127 = _loc3_;
         }
         this.var_3915 += Math.abs(Number(this.var_2127) - _loc3_);
         this.var_2127 = _loc3_;
         if(_loc1_ > this.var_4276)
         {
            this.method_727("flash.metrics",{
               "fpsMin":this.var_4118,
               "fpsAvg":Math.round(Number(this.var_1571) / Number(this.var_1543)),
               "totalMemMax":this.var_3263,
               "totalMemAvg":Math.round(Number(this.var_799) / Number(this.var_3246)),
               "usedMemDelta":Math.round(this.var_3915 / ((_loc1_ - Number(this.var_3586)) / 1000)),
               "playTime":Math.round((_loc1_ - Number(this._startTime)) / 1000)
            });
            this.var_4118 = Infinity;
            this.var_1571 = 0;
            this.var_1543 = 0;
            this.var_3263 = 0;
            this.var_799 = 0;
            this.var_3246 = 0;
            this.var_3915 = 0;
            this.var_3586 = _loc1_;
            if(_loc1_ - Number(this._startTime) < 60000)
            {
               this.var_4276 += 5000;
            }
            else
            {
               this.var_4276 += 30000;
            }
         }
      }
      
      private function method_727(param1:String, param2:Object = null, param3:Boolean = false) : void
      {
         var _loc4_:Object = param2 || true;
         this.append(_loc4_,"event",param1);
         this.append(_loc4_,"time",new Date().getTime());
         this.append(_loc4_,"build",Version.BUILD);
         this.append(_loc4_,"map_id",class_50.getInstance().map.mapID);
         this.append(_loc4_,"generator","as:" + VERSION);
         if(this.debug)
         {
            this.log("EventStreamClient: " + JASON.encode(_loc4_));
         }
         this.var_3590.push(_loc4_);
         if(param3)
         {
            this.flush();
         }
      }
      
      private function append(param1:Object, param2:String, param3:Object) : void
      {
         if(param2 in param1)
         {
            param1[param2] = param3 + " [" + param1[param2] + "]";
         }
         else
         {
            param1[param2] = param3;
         }
      }
      
      private function flush() : void
      {
         var request:class_304 = null;
         var url:String = null;
         try
         {
            if(this._loader != null)
            {
               return;
            }
            if(this.var_3590.length == 0)
            {
               return;
            }
            if(this._context == null)
            {
               if(this.var_3590.length > 1000)
               {
                  this.var_3590.length = 0;
               }
               return;
            }
            this.var_3590.length = 0;
         }
         catch(error:Error)
         {
            log("EventStreamClient.flushEvents: " + error);
         }
      }
      
      private function load() : void
      {
         if(Boolean(this._loader) && Boolean(this._urlRequest))
         {
            this._loader.load(this._urlRequest);
         }
      }
      
      private function method_1726(param1:Event) : void
      {
         var var_513:Object = null;
         var var_6:Event = param1;
         try
         {
            var_513 = JASON.decode(this._loader.data);
            if(!var_513.success)
            {
               this.log("EventStreamClient.flushEvents.NOSUCCESS: " + var_513.message);
            }
         }
         catch(error:Error)
         {
            log("EventStreamClient.flushEvents.COMPLETE: " + error);
         }
         this.method_25();
      }
      
      private function handleSecurityError(param1:SecurityErrorEvent) : void
      {
         this.method_25();
      }
      
      private function method_585(param1:IOErrorEvent) : void
      {
         if(this.var_3881 == 0)
         {
            this.log("EventStreamClient.flushEvents.IO_ERROR: retrying");
            ++this.var_3881;
            setTimeout(this.load,1000);
         }
         this.method_25();
      }
      
      private function method_25() : void
      {
         if(this._loader != null)
         {
            this._loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.handleSecurityError,false,0,true);
            this._loader.addEventListener(IOErrorEvent.IO_ERROR,this.method_585,false,0,true);
            this._loader.addEventListener(Event.COMPLETE,this.method_1726,false,0,true);
            this._loader = null;
         }
      }
      
      private function log(param1:String) : void
      {
         if(this.var_2851 != null)
         {
            this.var_2851(param1);
         }
      }
      
      private function method_494(param1:Function) : void
      {
         this.var_2851 = param1;
      }
      
      private function method_1370(param1:String) : void
      {
         var var_2207:uint = 0;
         var var_1:int = 0;
         var var_1992:String = param1;
         try
         {
            var_1992 = StringUtil.replace(var_1992,"-","+");
            var_1992 = StringUtil.replace(var_1992,"_","/");
            var_2207 = var_1992.length % 4;
            if(var_2207 > 0)
            {
               var_1 = 0;
               while(var_1 < 4 - var_2207)
               {
                  var_1992 += "=";
                  var_1++;
               }
            }
            var_1992 = class_303.decode(var_1992);
            this._context = JASON.decode(var_1992);
         }
         catch(error:Error)
         {
            log("EventStreamClient.setClientContext: " + error);
         }
      }
      
      private function method_1176(param1:Stage) : void
      {
         var var_1991:Object = null;
         var var_2581:Number = NaN;
         var var_3174:Stage = param1;
         this._stage = var_3174;
         try
         {
            var_1991 = {
               "vmVersion":System.vmVersion,
               "avHardwareDisable":Capabilities.avHardwareDisable,
               "cpuArchitecture":Capabilities["cpuArchitecture"],
               "hasAccessibility":Capabilities.hasAccessibility,
               "hasAudio":Capabilities.hasAudio,
               "hasAudioEncoder":Capabilities.hasAudioEncoder,
               "hasEmbeddedVideo":Capabilities.hasEmbeddedVideo,
               "hasIME":Capabilities.hasIME,
               "hasMP3":Capabilities.hasMP3,
               "hasPrinting":Capabilities.hasPrinting,
               "hasScreenBroadcast":Capabilities.hasScreenBroadcast,
               "hasScreenPlayback":Capabilities.hasScreenPlayback,
               "hasStreamingAudio":Capabilities.hasStreamingAudio,
               "hasStreamingVideo":Capabilities.hasStreamingVideo,
               "hasTLS":Capabilities.hasTLS,
               "hasVideoEncoder":Capabilities.hasVideoEncoder,
               "isDebugger":Capabilities.isDebugger,
               "isEmbeddedInAcrobat":Capabilities.isEmbeddedInAcrobat,
               "language":Capabilities.language,
               "localFileReadDisable":Capabilities.localFileReadDisable,
               "manufacturer":Capabilities.manufacturer,
               "maxLevelIDC":Capabilities.maxLevelIDC,
               "os":Capabilities.os,
               "pixelAspectRatio":Capabilities.pixelAspectRatio,
               "playerType":Capabilities.playerType,
               "screenColor":Capabilities.screenColor,
               "screenDPI":Capabilities.screenDPI,
               "screenResolutionX":Capabilities.screenResolutionX,
               "screenResolutionY":Capabilities.screenResolutionY,
               "supports32BitProcesses":Capabilities["supports32BitProcesses"],
               "supports64BitProcesses":Capabilities["supports64BitProcesses"],
               "touchscreenType":Capabilities["touchscreenType"],
               "version":Capabilities.version,
               "frameRate":this._stage.frameRate,
               "displayState":this._stage.displayState,
               "quality":this._stage.quality,
               "scaleMode":this._stage.scaleMode,
               "wmodeGPU":this._stage.wmodeGPU,
               "width":this._stage.width,
               "height":this._stage.height,
               "stageWidth":this._stage.stageWidth,
               "stageHeight":this._stage.stageHeight,
               "parameters":this._stage.loaderInfo.parameters
            };
            this.method_727("flash.capabilities",var_1991);
         }
         catch(error:Error)
         {
            log("EventStreamClient.setStage: systemInfo " + error);
         }
         try
         {
            var_2581 = getTimer();
            this.var_1792 = 0;
            this.var_2902 = var_2581;
            this.var_4276 = var_2581 + 5000;
            this.var_3586 = var_2581;
            if(this.var_3731)
            {
               this._stage.addEventListener(Event.ENTER_FRAME,this.handleEnterFrame,false,0,true);
            }
         }
         catch(error:Error)
         {
            log("EventStreamClient.setStage: enterFrame " + error);
         }
      }
      
      private function handleEnterFrame(param1:Event) : void
      {
         this.enterFrame();
      }
   }
}
