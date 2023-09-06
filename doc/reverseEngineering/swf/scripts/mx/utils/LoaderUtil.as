package mx.utils
{
   import flash.display.DisplayObject;
   import flash.display.LoaderInfo;
   import flash.system.Capabilities;
   import flash.utils.Dictionary;
   import mx.core.ApplicationDomainTarget;
   import mx.core.IFlexModuleFactory;
   import mx.core.RSLData;
   import mx.core.mx_internal;
   import mx.events.Request;
   import mx.managers.SystemManagerGlobals;
   
   public class LoaderUtil
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      mx_internal static var urlFilters:Array = [{
         "searchString":"/[[DYNAMIC]]/",
         "filterFunction":dynamicURLFilter
      },{
         "searchString":"/[[IMPORT]]/",
         "filterFunction":importURLFilter
      }];
       
      
      public function LoaderUtil()
      {
         super();
      }
      
      public static function normalizeURL(param1:LoaderInfo) : String
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:String = param1.url;
         var _loc6_:uint = LoaderUtil.mx_internal::urlFilters.length;
         var _loc7_:Number = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_ = LoaderUtil.mx_internal::urlFilters[_loc7_].searchString;
            if((_loc3_ = _loc2_.indexOf(_loc4_)) != -1)
            {
               _loc2_ = (_loc5_ = LoaderUtil.mx_internal::urlFilters[_loc7_].filterFunction)(_loc2_,_loc3_);
            }
            _loc7_++;
         }
         if(isMac())
         {
            return encodeURI(_loc2_);
         }
         return _loc2_;
      }
      
      public static function createAbsoluteURL(param1:String, param2:String) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:String = param2;
         if(Boolean(param1) && !(param2.indexOf(":") > -1 || param2.indexOf("/") == 0 || param2.indexOf("\\") == 0))
         {
            if((_loc4_ = param1.indexOf("?")) != -1)
            {
               param1 = param1.substring(0,_loc4_);
            }
            if((_loc4_ = param1.indexOf("#")) != -1)
            {
               param1 = param1.substring(0,_loc4_);
            }
            _loc5_ = Math.max(param1.lastIndexOf("\\"),param1.lastIndexOf("/"));
            if(param2.indexOf("./") == 0)
            {
               param2 = param2.substring(2);
            }
            else
            {
               while(param2.indexOf("../") == 0)
               {
                  param2 = param2.substring(3);
                  _loc5_ = Math.max(param1.lastIndexOf("\\",_loc5_ - 1),param1.lastIndexOf("/",_loc5_ - 1));
               }
            }
            if(_loc5_ != -1)
            {
               _loc3_ = param1.substr(0,_loc5_ + 1) + param2;
            }
         }
         return _loc3_;
      }
      
      mx_internal static function processRequiredRSLs(param1:IFlexModuleFactory, param2:Array) : Array
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc3_:* = [];
         var _loc4_:IFlexModuleFactory;
         var _loc5_:IFlexModuleFactory = _loc4_ = SystemManagerGlobals.topLevelSystemManagers[0];
         var _loc6_:* = null;
         var _loc7_:Dictionary = new Dictionary();
         var _loc8_:int = 0;
         var _loc9_:Dictionary = new Dictionary();
         var _loc10_:int = 0;
         var _loc11_:* = null;
         while(_loc5_ != param1)
         {
            _loc12_ = param2.length;
            _loc13_ = 0;
            while(_loc13_ < _loc12_)
            {
               _loc14_ = param2[_loc13_];
               if(!_loc7_[_loc14_])
               {
                  if(isRSLLoaded(_loc5_,_loc14_[0].digest))
                  {
                     _loc7_[_loc14_] = 1;
                     _loc8_++;
                     if(_loc5_ != _loc4_)
                     {
                        if((_loc15_ = _loc3_.indexOf(_loc14_)) != -1)
                        {
                           _loc3_.splice(_loc15_,1);
                        }
                     }
                  }
                  else if(_loc3_.indexOf(_loc14_) == -1)
                  {
                     _loc3_.push(_loc14_);
                  }
               }
               if(!_loc7_[_loc14_] && _loc9_[_loc14_] == null)
               {
                  if(!_loc6_ && RSLData(_loc14_[0]).applicationDomainTarget == ApplicationDomainTarget.PARENT)
                  {
                     _loc6_ = getParentModuleFactory(param1);
                  }
                  if(resolveApplicationDomainTarget(_loc14_,param1,_loc5_,_loc6_,_loc4_))
                  {
                     _loc9_[_loc14_] = 1;
                     _loc10_++;
                  }
               }
               _loc13_++;
            }
            if(_loc8_ + _loc10_ >= param2.length)
            {
               break;
            }
            if(!_loc11_)
            {
               _loc11_ = [param1];
               _loc5_ = param1;
               while(_loc5_ != _loc4_)
               {
                  if(!(_loc5_ = getParentModuleFactory(_loc5_)))
                  {
                     break;
                  }
                  if(_loc5_ != _loc4_)
                  {
                     _loc11_.push(_loc5_);
                  }
                  if(!_loc6_)
                  {
                     _loc6_ = _loc5_;
                  }
               }
            }
            _loc5_ = _loc11_.pop();
         }
         return _loc3_;
      }
      
      mx_internal static function isLocal(param1:String) : Boolean
      {
         return param1.indexOf("file:") == 0 || param1.indexOf(":") == 1;
      }
      
      mx_internal static function OSToPlayerURI(param1:String, param2:Boolean) : String
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc5_:String;
         if((_loc3_ = (_loc5_ = param1).indexOf("?")) != -1)
         {
            _loc5_ = _loc5_.substring(0,_loc3_);
         }
         if((_loc4_ = _loc5_.indexOf("#")) != -1)
         {
            _loc5_ = _loc5_.substring(0,_loc4_);
         }
         try
         {
            _loc5_ = decodeURI(_loc5_);
         }
         catch(e:Error)
         {
         }
         var _loc6_:* = null;
         if(_loc3_ != -1 || _loc4_ != -1)
         {
            _loc7_ = _loc3_;
            if(_loc3_ == -1 || _loc4_ != -1 && _loc4_ < _loc3_)
            {
               _loc7_ = _loc4_;
            }
            _loc6_ = param1.substr(_loc7_);
         }
         if(param2 && false)
         {
            if(_loc6_)
            {
               return _loc5_ + _loc6_;
            }
            return _loc5_;
         }
         if(_loc6_)
         {
            return encodeURI(_loc5_) + _loc6_;
         }
         return encodeURI(_loc5_);
      }
      
      private static function getParentModuleFactory(param1:IFlexModuleFactory) : IFlexModuleFactory
      {
         var _loc2_:Request = new Request(Request.GET_PARENT_FLEX_MODULE_FACTORY_REQUEST);
         DisplayObject(param1).dispatchEvent(_loc2_);
         return _loc2_.value as IFlexModuleFactory;
      }
      
      private static function resolveApplicationDomainTarget(param1:Array, param2:IFlexModuleFactory, param3:IFlexModuleFactory, param4:IFlexModuleFactory, param5:IFlexModuleFactory) : Boolean
      {
         var _loc6_:Boolean = false;
         var _loc7_:* = null;
         var _loc8_:String = param1[0].applicationDomainTarget;
         if(isLoadedIntoTopLevelApplicationDomain(param2))
         {
            _loc7_ = param5;
         }
         else if(_loc8_ == ApplicationDomainTarget.DEFAULT)
         {
            if(hasPlaceholderRSL(param3,param1[0].digest))
            {
               _loc7_ = param3;
            }
         }
         else if(_loc8_ == ApplicationDomainTarget.TOP_LEVEL)
         {
            _loc7_ = param5;
         }
         else if(_loc8_ == ApplicationDomainTarget.CURRENT)
         {
            _loc6_ = true;
         }
         else if(_loc8_ == ApplicationDomainTarget.PARENT)
         {
            _loc7_ = param4;
         }
         else
         {
            _loc6_ = true;
         }
         if(_loc6_ || Boolean(_loc7_))
         {
            if(_loc7_)
            {
               updateRSLModuleFactory(param1,_loc7_);
            }
            return true;
         }
         return false;
      }
      
      private static function isRSLLoaded(param1:IFlexModuleFactory, param2:String) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:Dictionary = param1.preloadedRSLs;
         if(_loc3_)
         {
            for each(_loc4_ in _loc3_)
            {
               _loc5_ = int(_loc4_.length);
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  if(_loc4_[_loc6_].digest == param2)
                  {
                     return true;
                  }
                  _loc6_++;
               }
            }
         }
         return false;
      }
      
      private static function hasPlaceholderRSL(param1:IFlexModuleFactory, param2:String) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:Array = param1.info()["placeholderRsls"];
         if(_loc3_)
         {
            _loc4_ = _loc3_.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc7_ = int((_loc6_ = _loc3_[_loc5_]).length);
               _loc8_ = 0;
               while(_loc8_ < _loc7_)
               {
                  if(_loc6_[_loc8_].digest == param2)
                  {
                     return true;
                  }
                  _loc8_++;
               }
               _loc5_++;
            }
         }
         return false;
      }
      
      private static function isLoadedIntoTopLevelApplicationDomain(param1:IFlexModuleFactory) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 is DisplayObject)
         {
            _loc2_ = DisplayObject(param1);
            _loc3_ = _loc2_.loaderInfo;
            if(_loc3_ && _loc3_.applicationDomain && _loc3_.applicationDomain.parentDomain == null)
            {
               return true;
            }
         }
         return false;
      }
      
      private static function updateRSLModuleFactory(param1:Array, param2:IFlexModuleFactory) : void
      {
         var _loc3_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            param1[_loc4_].moduleFactory = param2;
            _loc4_++;
         }
      }
      
      private static function isMac() : Boolean
      {
         return Capabilities.os.substring(0,3) == "Mac";
      }
      
      private static function dynamicURLFilter(param1:String, param2:int) : String
      {
         return param1.substring(0,param2);
      }
      
      private static function importURLFilter(param1:String, param2:int) : String
      {
         var _loc3_:int = param1.indexOf("://");
         return param1.substring(0,_loc3_ + 3) + param1.substring(param2 + 12);
      }
   }
}
