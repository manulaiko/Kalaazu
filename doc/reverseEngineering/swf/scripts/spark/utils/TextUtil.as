package spark.utils
{
   import flash.text.engine.FontDescription;
   import flash.text.engine.FontLookup;
   import flash.text.engine.TextLine;
   import flash.text.engine.TextLineValidity;
   import flashx.textLayout.compose.ISWFContext;
   import flashx.textLayout.compose.TextLineRecycler;
   import flashx.textLayout.formats.ITextLayoutFormat;
   import mx.core.EmbeddedFont;
   import mx.core.IEmbeddedFontRegistry;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   public class TextUtil
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function TextUtil()
      {
         super();
      }
      
      public static function getResourceString(param1:String, param2:Array = null) : String
      {
         var _loc3_:IResourceManager = ResourceManager.getInstance();
         return _loc3_.getString("textLayout",param1,param2);
      }
      
      public static function resolveFontLookup(param1:ISWFContext, param2:ITextLayoutFormat) : String
      {
         var _loc3_:* = null;
         var _loc4_:* = false;
         var _loc5_:* = false;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(Boolean(param1 as IFlexModuleFactory) && param2.fontLookup == FontLookup.EMBEDDED_CFF)
         {
            _loc3_ = param2.fontFamily;
            _loc4_ = param2.fontWeight == "bold";
            _loc5_ = param2.fontStyle == "italic";
            _loc6_ = new EmbeddedFont(_loc3_,_loc4_,_loc5_);
            if((Boolean(_loc7_ = UIComponent.mx_internal::embeddedFontRegistry)) && Boolean(_loc7_.isFontRegistered(_loc6_,IFlexModuleFactory(param1))))
            {
               return FontLookup.EMBEDDED_CFF;
            }
            if(param1.callInContext(FontDescription.isFontCompatible,FontDescription,[_loc3_,param2.fontWeight,param2.fontStyle]))
            {
               return FontLookup.EMBEDDED_CFF;
            }
         }
         else if(FontDescription.isFontCompatible(param2.fontFamily,param2.fontWeight,param2.fontStyle))
         {
            return FontLookup.EMBEDDED_CFF;
         }
         return FontLookup.DEVICE;
      }
      
      public static function recycleTextLine(param1:TextLine) : void
      {
         if(param1)
         {
            if(param1.validity != TextLineValidity.INVALID && param1.validity != TextLineValidity.STATIC)
            {
               param1.validity = TextLineValidity.INVALID;
            }
            param1.userData = null;
            TextLineRecycler.addLineForReuse(param1);
         }
      }
   }
}
