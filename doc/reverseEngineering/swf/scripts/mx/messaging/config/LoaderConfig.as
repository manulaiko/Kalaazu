package mx.messaging.config
{
   import flash.display.DisplayObject;
   import mx.core.mx_internal;
   import mx.utils.LoaderUtil;
   
   public class LoaderConfig
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      mx_internal static var _parameters:Object;
      
      mx_internal static var _swfVersion:uint;
      
      mx_internal static var _url:String = null;
       
      
      public function LoaderConfig()
      {
         super();
      }
      
      public static function init(param1:DisplayObject) : void
      {
         if(!mx_internal::_url)
         {
            mx_internal::_url = LoaderUtil.normalizeURL(param1.loaderInfo);
            mx_internal::_parameters = param1.loaderInfo.parameters;
            mx_internal::_swfVersion = param1.loaderInfo.swfVersion;
         }
      }
      
      public static function get parameters() : Object
      {
         return mx_internal::_parameters;
      }
      
      public static function get swfVersion() : uint
      {
         return mx_internal::_swfVersion;
      }
      
      public static function get url() : String
      {
         return mx_internal::_url;
      }
   }
}
