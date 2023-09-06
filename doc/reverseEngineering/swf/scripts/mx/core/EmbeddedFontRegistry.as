package mx.core
{
   import flash.system.Capabilities;
   import flash.text.FontStyle;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.engine.FontDescription;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import mx.managers.ISystemManager;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   public class EmbeddedFontRegistry implements IEmbeddedFontRegistry
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var fonts:Object = {};
      
      private static var cachedFontsForObjects:Dictionary = new Dictionary(true);
      
      private static var instance:IEmbeddedFontRegistry;
      
      private static var staticTextFormat:TextFormat = new TextFormat();
      
      private static var flaggedObjects:Dictionary = new Dictionary(true);
       
      
      private var _resourceManager:IResourceManager;
      
      public function EmbeddedFontRegistry()
      {
         super();
      }
      
      public static function getInstance() : IEmbeddedFontRegistry
      {
         if(!instance)
         {
            instance = new EmbeddedFontRegistry();
         }
         return instance;
      }
      
      private static function createFontKey(param1:EmbeddedFont) : String
      {
         return param1.fontName + param1.fontStyle;
      }
      
      private static function createEmbeddedFont(param1:String) : EmbeddedFont
      {
         var _loc2_:* = null;
         var _loc5_:int;
         if((_loc5_ = endsWith(param1,FontStyle.REGULAR)) > 0)
         {
            _loc2_ = param1.substring(0,_loc5_);
            return new EmbeddedFont(_loc2_,false,false);
         }
         if((_loc5_ = endsWith(param1,FontStyle.BOLD)) > 0)
         {
            _loc2_ = param1.substring(0,_loc5_);
            return new EmbeddedFont(_loc2_,true,false);
         }
         if((_loc5_ = endsWith(param1,FontStyle.BOLD_ITALIC)) > 0)
         {
            _loc2_ = param1.substring(0,_loc5_);
            return new EmbeddedFont(_loc2_,true,true);
         }
         if((_loc5_ = endsWith(param1,FontStyle.ITALIC)) > 0)
         {
            _loc2_ = param1.substring(0,_loc5_);
            return new EmbeddedFont(_loc2_,false,true);
         }
         return new EmbeddedFont("",false,false);
      }
      
      private static function endsWith(param1:String, param2:String) : int
      {
         var _loc3_:int = param1.lastIndexOf(param2);
         if(_loc3_ > 0 && _loc3_ + param2.length == param1.length)
         {
            return _loc3_;
         }
         return -1;
      }
      
      public static function registerFonts(param1:Object, param2:IFlexModuleFactory) : void
      {
         var fontRegistry:IEmbeddedFontRegistry = null;
         var f:Object = null;
         var fontObj:Object = null;
         var fieldIter:String = null;
         var bold:Boolean = false;
         var italic:Boolean = false;
         var fonts:Object = param1;
         var moduleFactory:IFlexModuleFactory = param2;
         try
         {
            fontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
         }
         catch(e:Error)
         {
            Singleton.registerClass("mx.core::IEmbeddedFontRegistry",EmbeddedFontRegistry);
            fontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
         }
         for(f in fonts)
         {
            fontObj = fonts[f];
            for(fieldIter in fontObj)
            {
               if(fontObj[fieldIter] != false)
               {
                  if(fieldIter == "regular")
                  {
                     bold = false;
                     italic = false;
                  }
                  else if(fieldIter == "boldItalic")
                  {
                     bold = true;
                     italic = true;
                  }
                  else if(fieldIter == "bold")
                  {
                     bold = true;
                     italic = false;
                  }
                  else if(fieldIter == "italic")
                  {
                     bold = false;
                     italic = true;
                  }
                  fontRegistry.registerFont(new EmbeddedFont(String(f),bold,italic),moduleFactory);
               }
            }
         }
      }
      
      private function get resourceManager() : IResourceManager
      {
         if(!this._resourceManager)
         {
            this._resourceManager = ResourceManager.getInstance();
         }
         return this._resourceManager;
      }
      
      public function getFontStyle(param1:Boolean, param2:Boolean) : String
      {
         var _loc3_:String = "null";
         if(param1 && param2)
         {
            _loc3_ = "null";
         }
         else if(param1)
         {
            _loc3_ = "null";
         }
         else if(param2)
         {
            _loc3_ = "null";
         }
         return _loc3_;
      }
      
      public function registerFont(param1:EmbeddedFont, param2:IFlexModuleFactory) : void
      {
         var _loc3_:String = createFontKey(param1);
         var _loc4_:Dictionary;
         if(!(_loc4_ = fonts[_loc3_]))
         {
            _loc4_ = new Dictionary(true);
            fonts[_loc3_] = _loc4_;
         }
         _loc4_[param2] = 1;
      }
      
      public function deregisterFont(param1:EmbeddedFont, param2:IFlexModuleFactory) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc3_:String = createFontKey(param1);
         var _loc4_:Dictionary;
         if((_loc4_ = fonts[_loc3_]) != null)
         {
            delete _loc4_[param2];
            _loc5_ = 0;
            for(_loc6_ in _loc4_)
            {
               _loc5_++;
            }
            if(_loc5_ == 0)
            {
               delete fonts[_loc3_];
            }
         }
      }
      
      public function isFontRegistered(param1:EmbeddedFont, param2:IFlexModuleFactory) : Boolean
      {
         var _loc3_:String = createFontKey(param1);
         var _loc4_:Dictionary;
         return (Boolean(_loc4_ = fonts[_loc3_])) && _loc4_[param2] == 1;
      }
      
      public function getFonts() : Array
      {
         var _loc2_:* = null;
         var _loc1_:* = [];
         for(_loc2_ in fonts)
         {
            _loc1_.push(createEmbeddedFont(_loc2_));
         }
         return _loc1_;
      }
      
      public function getAssociatedModuleFactory(param1:String, param2:Boolean, param3:Boolean, param4:Object, param5:IFlexModuleFactory, param6:ISystemManager, param7:* = undefined) : IFlexModuleFactory
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:Boolean = false;
         var _loc14_:* = null;
         if(!(_loc8_ = cachedFontsForObjects[param4]))
         {
            _loc8_ = new EmbeddedFont(param1,param2,param3);
            cachedFontsForObjects[param4] = _loc8_;
         }
         else if(_loc8_.fontName != param1 || _loc8_.bold != param2 || _loc8_.italic != param3)
         {
            _loc8_ = new EmbeddedFont(param1,param2,param3);
            cachedFontsForObjects[param4] = _loc8_;
         }
         var _loc10_:Dictionary;
         if(_loc10_ = fonts[createFontKey(_loc8_)])
         {
            if(_loc11_ = int(_loc10_[param5]))
            {
               _loc9_ = param5;
            }
            else
            {
               var _loc15_:int = 0;
               var _loc16_:* = _loc10_;
               for(_loc12_ in _loc16_)
               {
                  _loc9_ = _loc12_ as IFlexModuleFactory;
               }
            }
         }
         if(!_loc9_ && Boolean(param6))
         {
            staticTextFormat.font = param1;
            staticTextFormat.bold = param2;
            staticTextFormat.italic = param3;
            if(param6.isFontFaceEmbedded(staticTextFormat))
            {
               _loc9_ = param6;
            }
         }
         if(_loc9_ && param7 != undefined && false)
         {
            if(!(_loc13_ = !!param7 ? _loc9_.callInContext(FontDescription.isFontCompatible,null,[param1,param2 ? "bold" : "normal",param3 ? "italic" : "normal"]) : _loc9_.callInContext(TextField.isFontCompatible,null,[param1,this.getFontStyle(param2,param3)])))
            {
               if(true)
               {
                  _loc14_ = (_loc14_ = getQualifiedClassName(param4)) + ("name" in param4 && param4.name != null ? " (" + param4.name + ") " : "");
                  trace(this.resourceManager.getString("core","fontIncompatible",[param1,_loc14_,param7]));
                  flaggedObjects[param4] = true;
               }
            }
         }
         return _loc9_;
      }
   }
}
