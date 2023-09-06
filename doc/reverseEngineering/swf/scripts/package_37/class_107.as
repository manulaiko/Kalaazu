package package_37
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.Endian;
   import package_28.EventStreamClient;
   
   public class class_107 extends EventDispatcher
   {
      
      public static const CONNECTION_LOST:String = "CONNECTION_LOST";
      
      public static const CONNECTION_ERROR:String = "CONNECTION_ERROR";
      
      public static const CONNECTION_SUCCESS:String = "CONNECTION_SUCCESS";
       
      
      public var var_3090:Socket;
      
      private var port:int;
      
      private var host:String;
      
      private var handler:class_362;
      
      private var var_1398:Boolean = false;
      
      private var var_3796:Boolean = false;
      
      public function class_107()
      {
         super();
         this.handler = new class_362();
         this.handler.var_1767 = class_363.execute;
         class_363.init();
      }
      
      public function disable() : void
      {
         this.var_3796 = true;
      }
      
      public function method_1776(param1:ICommand) : void
      {
         if(this.method_282())
         {
            this.handler.method_1776(param1);
         }
      }
      
      public function connect(param1:String, param2:int) : void
      {
         if(this.var_1398)
         {
            return;
         }
         this.var_1398 = true;
         this.host = param1;
         this.port = param2;
         EventStreamClient.track("flash_socket_connect",{
            "url":param1,
            "port":param2
         });
         this.method_4611(param1,param2,this.method_5122);
      }
      
      private function method_4611(param1:String, param2:int, param3:Function) : void
      {
         var var_4599:String = param1;
         var var_3945:int = param2;
         var var_1000:Function = param3;
         if(this.var_3090 != null && Boolean(this.var_3090.connected))
         {
            this.method_25();
            this.method_3777();
         }
         this.var_3090 = null;
         try
         {
            this.var_3090 = new Socket(var_4599,var_3945);
            this.var_3090.endian = Endian.BIG_ENDIAN;
         }
         catch(error:Error)
         {
            var_3090.close();
            throw new Error("initSocket create new socket " + error.message);
         }
         finally
         {
            this.initHandler();
            this.addListeners();
         }
      }
      
      private function method_5122() : void
      {
         this.var_3090.connect(this.host,this.port);
      }
      
      private function initHandler() : void
      {
         this.handler.method_4429(this.var_3090);
      }
      
      public function method_4095() : void
      {
         this.connect(this.host,this.port);
      }
      
      public function method_3777() : void
      {
         this.var_3090.close();
         this.method_25();
      }
      
      public function method_282() : Boolean
      {
         if(this.var_3090 == null)
         {
            return false;
         }
         return this.var_3090.connected;
      }
      
      private function method_2529(param1:ProgressEvent) : void
      {
         if(!this.var_3796)
         {
            this.handler.readData();
         }
      }
      
      private function method_2192(param1:Event = null) : void
      {
         EventStreamClient.track("flash_socket_connectionLost");
         dispatchEvent(new Event(CONNECTION_LOST));
      }
      
      private function method_585(param1:IOErrorEvent) : void
      {
         EventStreamClient.track("flash_socket_ioError");
         this.var_1398 = false;
         dispatchEvent(new Event(CONNECTION_ERROR));
      }
      
      private function handleSecurityError(param1:SecurityErrorEvent) : void
      {
         EventStreamClient.track("flash_socket_securityError");
         this.var_1398 = false;
         dispatchEvent(new Event(CONNECTION_ERROR));
      }
      
      private function method_5375(param1:Event) : void
      {
         EventStreamClient.track("flash_socket_connected");
         this.var_1398 = false;
         this.method_2946.reset();
         dispatchEvent(new Event(CONNECTION_SUCCESS));
      }
      
      private function addListeners() : void
      {
         if(!this.var_3090.hasEventListener(Event.CONNECT))
         {
            this.var_3090.addEventListener(Event.CONNECT,this.method_5375);
            this.var_3090.addEventListener(ProgressEvent.SOCKET_DATA,this.method_2529);
            this.var_3090.addEventListener(Event.CLOSE,this.method_2192);
            this.var_3090.addEventListener(IOErrorEvent.IO_ERROR,this.method_585);
            this.var_3090.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.handleSecurityError);
         }
      }
      
      private function method_25() : void
      {
         if(this.var_3090.hasEventListener(Event.CONNECT))
         {
            this.var_3090.removeEventListener(Event.CONNECT,this.method_5375);
            this.var_3090.removeEventListener(ProgressEvent.SOCKET_DATA,this.method_2529);
            this.var_3090.removeEventListener(Event.CLOSE,this.method_2192);
            this.var_3090.removeEventListener(IOErrorEvent.IO_ERROR,this.method_585);
            this.var_3090.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.handleSecurityError);
         }
      }
      
      public function method_3345(param1:ICommand) : void
      {
      }
      
      public function get method_2946() : class_362
      {
         return this.handler;
      }
   }
}
