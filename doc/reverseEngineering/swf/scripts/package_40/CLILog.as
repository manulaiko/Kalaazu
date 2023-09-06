package package_40
{
   import fl.controls.TextArea;
   import fl.controls.TextInput;
   import flash.errors.EOFError;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.NetStatusEvent;
   import flash.net.SharedObject;
   import flash.net.SharedObjectFlushStatus;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import mx.logging.ILogger;
   import mx.logging.Log;
   import mx.utils.StringUtil;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.class_9;
   import package_17.class_62;
   import package_178.LocalCMDNotifications;
   import package_178.ShowCoordinatsCommand;
   import package_178.class_1097;
   import package_179.class_1098;
   import package_180.class_1099;
   import package_33.class_1100;
   import package_33.class_1101;
   import package_33.class_93;
   
   public class CLILog extends class_93 implements class_210
   {
      
      private static const const_1775:String = "open_sound";
      
      private static const THROW_ERROR:String = "throw_error";
      
      private static const POI_DEBUG_ON:String = "poi_debug_on";
      
      private static const POI_DEBUG_OFF:String = "poi_debug_off";
      
      private static const SHOW_COORDINATES:String = "show_coordinates";
      
      private static const SHOW_HERO_LASER_POSITIONS:String = "show_laser_positions";
      
      private static const HELP:String = "help";
      
      private static const const_1494:ILogger = Log.getLogger("CLILog");
       
      
      private var var_574:class_9;
      
      private var var_4969:TextArea;
      
      private var var_372:TextInput;
      
      private var var_1555:class_1101;
      
      private var var_1386:class_1101;
      
      private var var_4197:class_1101;
      
      private var var_4061:SharedObject;
      
      private var var_4899:String;
      
      private var var_1948:Dictionary;
      
      private var var_2649:Dictionary;
      
      private var var_271:class_62;
      
      public function CLILog(param1:class_9)
      {
         this.var_1948 = new Dictionary();
         this.var_2649 = new Dictionary();
         super(param1.method_4489(),class_93.const_1948);
         this.var_574 = param1;
         this.var_271 = class_62.getInstance();
         this.var_4969 = new TextArea();
         addChild(this.var_4969);
         this.var_372 = new TextInput();
         addChild(this.var_372);
         this.var_4899 = "doclilogundefined";
         this.method_5791();
      }
      
      private function method_5791() : void
      {
         this.var_1948[const_1775] = class_1098.SHOW_SOUND_CONFIGURATION;
         this.var_1948[THROW_ERROR] = LocalCMDNotifications.THROW_ERROR;
         this.var_1948[POI_DEBUG_ON] = LocalCMDNotifications.POI_DEBUG_ON;
         this.var_1948[POI_DEBUG_OFF] = LocalCMDNotifications.POI_DEBUG_OFF;
         this.var_1948[SHOW_COORDINATES] = LocalCMDNotifications.SHOW_COORDINATES;
         this.var_1948[HELP] = LocalCMDNotifications.HELP;
         this.var_1948[SHOW_HERO_LASER_POSITIONS] = LocalCMDNotifications.SHOW_HERO_LASER_POSITIONS;
         this.var_271.registerCommand(class_1098.SHOW_SOUND_CONFIGURATION,class_1099);
         this.var_271.registerCommand(LocalCMDNotifications.THROW_ERROR,class_1097);
         this.var_271.registerCommand(LocalCMDNotifications.SHOW_COORDINATES,ShowCoordinatsCommand);
         this.var_271.registerCommand(LocalCMDNotifications.HELP,class_1100);
      }
      
      public function method_5969() : void
      {
         this.var_4061 = SharedObject.getLocal(this.var_4899,"/");
         if(this.var_4061.size != 0)
         {
            if(this.var_4061.data.commands != undefined)
            {
               this.method_6192(ByteArray(this.var_4061.data.commands));
            }
         }
         else
         {
            this.method_6192();
         }
      }
      
      private function method_6192(param1:ByteArray = null) : void
      {
         var var_926:String = null;
         var var_562:ByteArray = param1;
         this.var_1555 = null;
         this.var_1555 = new class_1101();
         this.var_1386 = null;
         this.var_1386 = new class_1101();
         this.var_1555.next = this.var_1386;
         this.var_1386.var_2964 = this.var_1555;
         this.var_4197 = this.var_1386;
         if(var_562 != null)
         {
            while(var_562.bytesAvailable)
            {
               var_926 = "";
               try
               {
                  var_926 = var_562.readUTF();
                  if(var_926 != "\n")
                  {
                     this.method_3712(var_926,false);
                  }
               }
               catch(e:EOFError)
               {
                  writeOutput("EOFError " + e.message);
                  continue;
               }
            }
         }
      }
      
      public function method_4476(param1:TextArea) : void
      {
         if(this.var_4969 != null && Boolean(contains(this.var_4969)))
         {
            removeChild(this.var_4969);
         }
         this.var_4969 = param1;
         this.var_4969.editable = false;
         this.var_4969.focusEnabled = false;
         this.var_4969.textField.selectable = true;
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.color = 8947848;
         _loc2_.size = 12;
         _loc2_.font = "Courier New";
         this.var_4969.setStyle("textFormat",_loc2_);
         addChild(this.var_4969);
      }
      
      public function method_4440(param1:TextInput) : void
      {
         if(this.var_372 != null && Boolean(contains(this.var_372)))
         {
            removeChild(this.var_372);
         }
         this.var_372 = param1;
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.color = 1118481;
         _loc2_.size = 12;
         _loc2_.font = "Courier New";
         _loc2_.bold = true;
         this.var_372.setStyle("textFormat",_loc2_);
         this.var_372.addEventListener(FocusEvent.FOCUS_IN,this.method_896);
         addChild(this.var_372);
      }
      
      private function method_5318(param1:FocusEvent) : void
      {
         this.var_372.addEventListener(FocusEvent.FOCUS_IN,this.method_896);
         this.var_372.removeEventListener(FocusEvent.FOCUS_OUT,this.method_5318);
         this.var_372.removeEventListener(Event.CHANGE,this.method_3476);
         this.var_372.removeEventListener(KeyboardEvent.KEY_DOWN,this.handleKeyDown);
         this.var_372.removeEventListener(KeyboardEvent.KEY_UP,this.method_3365);
      }
      
      private function method_896(param1:FocusEvent) : void
      {
         this.var_372.removeEventListener(FocusEvent.FOCUS_IN,this.method_896);
         this.var_372.addEventListener(FocusEvent.FOCUS_OUT,this.method_5318);
         this.var_372.addEventListener(Event.CHANGE,this.method_3476);
         this.var_372.addEventListener(KeyboardEvent.KEY_DOWN,this.handleKeyDown);
         this.var_372.addEventListener(KeyboardEvent.KEY_UP,this.method_3365);
      }
      
      private function handleKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:int = param1.keyCode;
         switch(_loc2_)
         {
            case Keyboard.DOWN:
               this.method_6287();
               break;
            case Keyboard.UP:
               this.method_2899();
               break;
            case Keyboard.ENTER:
               this.method_190(this.var_372.text);
               this.var_372.text = "";
         }
      }
      
      private function method_3365(param1:KeyboardEvent) : void
      {
         var _loc2_:int = param1.keyCode;
         switch(_loc2_)
         {
            case Keyboard.DOWN:
            case Keyboard.UP:
               this.var_372.setSelection(this.var_372.text.length,this.var_372.text.length);
         }
      }
      
      private function method_2899() : void
      {
         if(this.var_4197 == this.var_1386)
         {
            this.var_4197.value = this.var_372.text;
         }
         if(this.var_4197.var_2964 != null)
         {
            this.var_4197 = this.var_4197.var_2964;
         }
         this.var_372.text = this.var_4197.value;
      }
      
      private function method_6287() : void
      {
         if(this.var_4197.next != null)
         {
            this.var_4197 = this.var_4197.next;
         }
         this.var_372.text = this.var_4197.value;
      }
      
      private function method_190(param1:String) : void
      {
         param1 = StringUtil.trim(param1);
         if(param1.length == 0)
         {
            return;
         }
         if(this.var_1948[param1])
         {
            this.var_271.sendNotification(this.var_1948[param1]);
         }
         if(param1.charAt(0) == "+")
         {
            param1 = param1.substring(1,param1.length);
            this.method_449(param1.split(","));
         }
         else if(param1.charAt(0) == "-")
         {
            param1 = param1.substring(1,param1.length);
            this.method_2088(param1.split(","));
         }
         else if(param1.charAt(0) == ":")
         {
            param1 = param1.substring(1,param1.length);
            switch(param1)
            {
               case "reset":
               case "clear":
                  this.method_2066();
            }
         }
         else
         {
            this.var_574.method_6154().sendCommand(param1);
            this.writeOutput(param1);
            if(this.var_4197.var_2964.value == param1)
            {
               const_1494.fatal("list stays untouched " + param1);
            }
            else if(this.var_1386.value == this.var_1386.var_2964.value)
            {
               this.var_1386.value = "";
            }
            else
            {
               this.method_3712(param1);
            }
         }
      }
      
      private function method_3712(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:class_1101 = new class_1101();
         _loc3_.value = param1;
         _loc3_.next = this.var_1386;
         this.var_1386.var_2964.next = _loc3_;
         _loc3_.var_2964 = this.var_1386.var_2964;
         this.var_1386.var_2964 = _loc3_;
         this.var_4197 = this.var_1386;
         if(param2)
         {
            this.method_3998();
         }
      }
      
      private function method_2088(param1:Array) : void
      {
      }
      
      private function method_449(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            this.var_2649[_loc2_] = true;
         }
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         this.var_4969.width = param1;
         this.var_4969.height = param2 - 20;
         this.var_372.width = param1;
         this.var_372.height = 20;
         this.var_372.y = param2 - 20;
      }
      
      public function writeOutput(param1:String) : void
      {
         this.var_4969.text += param1 + "\n";
         this.var_4969.verticalScrollPosition = this.var_4969.maxVerticalScrollPosition;
      }
      
      public function method_1891(param1:String) : void
      {
      }
      
      private function method_3476(param1:Event) : void
      {
         this.var_4197 = this.var_1386;
         this.var_4197.value = this.var_372.text;
      }
      
      private function method_3998() : void
      {
         var var_1733:String = null;
         var var_1162:ByteArray = new ByteArray();
         var var_2330:class_1101 = this.var_1555;
         while(var_2330.next != null)
         {
            if(var_2330.value != "")
            {
               var_1162.writeUTF(var_2330.value);
               var_1162.writeUTF("\n");
            }
            var_2330 = var_2330.next;
         }
         this.var_4061.data.commands = var_1162;
         try
         {
            var_1733 = this.var_4061.flush(10000);
         }
         catch(error:Error)
         {
            writeOutput("Error...Could not write SharedObject to disk");
         }
         if(var_1733 != null)
         {
            switch(var_1733)
            {
               case SharedObjectFlushStatus.PENDING:
                  this.writeOutput("Requesting permission to save cookie...\n");
                  this.var_4061.addEventListener(NetStatusEvent.NET_STATUS,this.method_5901);
                  break;
               case SharedObjectFlushStatus.FLUSHED:
            }
         }
      }
      
      private function method_2066() : void
      {
         this.var_4061.clear();
         this.writeOutput("History cleared");
         this.method_6192();
      }
      
      private function method_5901(param1:NetStatusEvent) : void
      {
         this.writeOutput("User closed permission dialog...\n");
         switch(param1.info.code)
         {
            case "SharedObject.Flush.Success":
               this.writeOutput("User granted permission -- cookie saved.\n");
               break;
            case "SharedObject.Flush.Failed":
               this.writeOutput("User denied permission -- cookie not saved.\n");
         }
         this.var_4061.removeEventListener(NetStatusEvent.NET_STATUS,this.method_5901);
      }
      
      public function passFullInCommand(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         for(_loc3_ in this.var_2649)
         {
            _loc2_ = int(this.var_2649[_loc3_]);
            if(param1.substring(0,_loc2_) == "0|" + _loc3_)
            {
               this.writeOutput(param1.substring(2,param1.length));
            }
         }
      }
      
      public function get method_2143() : Dictionary
      {
         return this.var_1948;
      }
      
      public function get method_1037() : TextArea
      {
         return this.var_4969;
      }
   }
}
