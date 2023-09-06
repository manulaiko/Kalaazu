package mx.utils
{
   import flash.utils.Dictionary;
   import mx.core.mx_internal;
   
   public class XMLNotifier
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var instance:XMLNotifier;
       
      
      public function XMLNotifier(param1:XMLNotifierSingleton)
      {
         super();
      }
      
      public static function getInstance() : XMLNotifier
      {
         if(!instance)
         {
            instance = new XMLNotifier(new XMLNotifierSingleton());
         }
         return instance;
      }
      
      mx_internal static function initializeXMLForNotification() : Function
      {
         var notificationFunction:Function = function(param1:Object, param2:String, param3:Object, param4:Object, param5:Object):void
         {
            var _loc8_:* = null;
            var _loc7_:Dictionary;
            if((_loc7_ = arguments.callee.watched) != null)
            {
               for(_loc8_ in _loc7_)
               {
                  IXMLNotifiable(_loc8_).xmlNotification(param1,param2,param3,param4,param5);
               }
            }
         };
         return notificationFunction;
      }
      
      public function watchXML(param1:Object, param2:IXMLNotifiable, param3:String = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param1 is XMLList && param1.length() > 1)
         {
            for each(_loc4_ in param1)
            {
               this.watchXML(_loc4_,param2,param3);
            }
         }
         else
         {
            if(!((_loc6_ = (_loc5_ = XML(param1)).notification()) is Function))
            {
               _loc6_ = mx_internal::initializeXMLForNotification();
               _loc5_.setNotification(_loc6_ as Function);
               if(Boolean(param3) && _loc6_["uid"] == null)
               {
                  _loc6_["uid"] = param3;
               }
            }
            if(_loc6_["watched"] == undefined)
            {
               _loc6_["watched"] = _loc7_ = new Dictionary(true);
            }
            else
            {
               _loc7_ = _loc6_["watched"];
            }
            _loc7_[param2] = true;
         }
      }
      
      public function unwatchXML(param1:Object, param2:IXMLNotifiable) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param1 is XMLList && param1.length() > 1)
         {
            for each(_loc3_ in param1)
            {
               this.unwatchXML(_loc3_,param2);
            }
         }
         else
         {
            if(!((_loc5_ = (_loc4_ = XML(param1)).notification()) is Function))
            {
               return;
            }
            if(_loc5_["watched"] != undefined)
            {
               delete (_loc6_ = _loc5_["watched"])[param2];
            }
         }
      }
   }
}

class XMLNotifierSingleton
{
    
   
   function XMLNotifierSingleton()
   {
      super();
   }
}
