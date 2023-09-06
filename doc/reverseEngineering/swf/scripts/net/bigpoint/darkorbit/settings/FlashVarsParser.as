package net.bigpoint.darkorbit.settings
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.class_9;
   
   public class FlashVarsParser
   {
       
      
      public function FlashVarsParser()
      {
         super();
      }
      
      public static function parseVars(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for(_loc2_ in param1)
         {
            _loc3_ = String(param1[_loc2_]);
            switch(_loc2_)
            {
               case "host":
               case "dynamicHost":
                  Settings.dynamicHost = "http://" + _loc3_ + "/";
                  break;
               case "userID":
                  class_81.userID = int(_loc3_);
                  break;
               case "factionID":
                  class_81.factionID = int(_loc3_);
                  break;
               case "sessionID":
                  class_81.sessionID = _loc3_;
                  break;
               case "useDeviceFonts":
                  Settings.useEmbeddedFonts = _loc3_ != "1";
                  break;
               case "mapID":
                  Settings.mapID = int(_loc3_);
                  break;
               case "basePath":
                  Settings.basePath = _loc3_;
                  if(Settings.basePath.charAt(Settings.basePath.length) != "/")
                  {
                     Settings.basePath = "undefined/";
                  }
                  break;
               case "cdn":
                  Settings.staticHost = _loc3_;
                  break;
               case "lang":
                  Settings.language = _loc3_.split("_")[0];
                  break;
               case "pid":
               case "projectID":
                  Settings.instanceID = int(_loc3_);
                  break;
               case "boardLink":
                  Settings.boardLink = _loc3_;
                  break;
               case "helpLink":
                  class_9.helpLink = _loc3_;
                  break;
               case "loadingClaim":
                  class_88.method_4884("loadingClaim",decodeURIComponent(_loc3_));
                  break;
               case "localGS":
               case "localGs":
                  if(!(_loc3_.length == 0 || _loc3_ == "0"))
                  {
                     if(_loc3_ != "1")
                     {
                        Settings.defaultGameServer = _loc3_;
                     }
                     else
                     {
                        Settings.defaultGameServer = "localhost";
                     }
                  }
                  break;
               case "chatHost":
                  Settings.chatHost = _loc3_;
                  break;
               case "autoStartEnabled":
               case "autostartEnabled":
                  Settings.singleSessionAutoStartEnabled = Boolean(int(_loc3_));
                  break;
               case "allowChat":
                  Settings.createChat = Boolean(int(_loc3_));
                  break;
               case "showAdvertisingHint":
                  Settings.advertisingHintEnabled = Boolean(int(_loc3_));
                  break;
               case "browser":
                  Settings.browser = _loc3_;
                  break;
               case "profileXmlHash":
                  Settings.profileXMLHash = _loc3_;
                  break;
               case "gameXmlHash":
                  Settings.gameXMLHash = _loc3_;
                  break;
               case "resourcesXmlHash":
                  Settings.resourceXMLHash = _loc3_;
                  break;
               case "eventStreamContext":
                  Settings.eventStreamContext = _loc3_;
                  break;
               case "languageXmlHash":
                  Settings.languageXMLHash = _loc3_;
                  break;
               case "display2d":
                  Settings.userType = int(_loc3_);
                  break;
            }
         }
      }
   }
}
