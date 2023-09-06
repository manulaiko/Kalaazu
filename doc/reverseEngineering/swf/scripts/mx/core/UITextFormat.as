package mx.core
{
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   import mx.managers.ISystemManager;
   
   public class UITextFormat extends TextFormat
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var noEmbeddedFonts:Boolean;
      
      private static var _embeddedFontRegistry:IEmbeddedFontRegistry;
      
      private static var _textFieldFactory:ITextFieldFactory;
       
      
      private var systemManager:ISystemManager;
      
      public var antiAliasType:String;
      
      public var direction:String;
      
      public var gridFitType:String;
      
      public var locale:String;
      
      private var _moduleFactory:IFlexModuleFactory;
      
      public var sharpness:Number;
      
      public var thickness:Number;
      
      public var useFTE:Boolean = false;
      
      public function UITextFormat(param1:ISystemManager, param2:String = null, param3:Object = null, param4:Object = null, param5:Object = null, param6:Object = null, param7:Object = null, param8:String = null, param9:String = null, param10:String = null, param11:Object = null, param12:Object = null, param13:Object = null, param14:Object = null)
      {
         this.systemManager = param1;
         super(param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
      }
      
      private static function get embeddedFontRegistry() : IEmbeddedFontRegistry
      {
         if(!_embeddedFontRegistry && !noEmbeddedFonts)
         {
            try
            {
               _embeddedFontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
            }
            catch(e:Error)
            {
               noEmbeddedFonts = true;
            }
         }
         return _embeddedFontRegistry;
      }
      
      private static function get textFieldFactory() : ITextFieldFactory
      {
         if(!_textFieldFactory)
         {
            _textFieldFactory = ITextFieldFactory(Singleton.getInstance("mx.core::ITextFieldFactory"));
         }
         return _textFieldFactory;
      }
      
      public function get moduleFactory() : IFlexModuleFactory
      {
         return this._moduleFactory;
      }
      
      public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         this._moduleFactory = param1;
      }
      
      public function measureText(param1:String, param2:Boolean = true) : TextLineMetrics
      {
         return this.measure(param1,false,param2);
      }
      
      public function measureHTMLText(param1:String, param2:Boolean = true) : TextLineMetrics
      {
         return this.measure(param1,true,param2);
      }
      
      private function measure(param1:String, param2:Boolean, param3:Boolean) : TextLineMetrics
      {
         if(!param1)
         {
            param1 = "";
         }
         var _loc4_:* = false;
         var _loc5_:IFlexModuleFactory;
         _loc4_ = (_loc5_ = noEmbeddedFonts || !embeddedFontRegistry ? null : embeddedFontRegistry.getAssociatedModuleFactory(font,bold,italic,this,this.moduleFactory,this.systemManager,this.useFTE)) != null;
         if(_loc5_ == null)
         {
            _loc5_ = this.systemManager;
         }
         var _loc6_:Object = this.useFTE ? textFieldFactory.createFTETextField(_loc5_) : textFieldFactory.createTextField(_loc5_);
         if(param2)
         {
            _loc6_.htmlText = "";
         }
         else
         {
            _loc6_.text = "";
         }
         _loc6_.defaultTextFormat = this;
         _loc6_.embedFonts = _loc4_;
         if(!this.useFTE)
         {
            _loc6_.antiAliasType = this.antiAliasType;
            _loc6_.gridFitType = this.gridFitType;
            _loc6_.sharpness = this.sharpness;
            _loc6_.thickness = this.thickness;
         }
         else
         {
            _loc6_.direction = this.direction;
            _loc6_.locale = this.locale;
         }
         if(param2)
         {
            _loc6_.htmlText = param1;
         }
         else
         {
            _loc6_.text = param1;
         }
         var _loc7_:TextLineMetrics = _loc6_.getLineMetrics(0);
         if(indent != null)
         {
            _loc7_.width += indent;
         }
         if(param3)
         {
            _loc7_.width = Math.ceil(_loc7_.width);
            _loc7_.height = Math.ceil(_loc7_.height);
         }
         return _loc7_;
      }
      
      mx_internal function copyFrom(param1:TextFormat) : void
      {
         font = param1.font;
         size = param1.size;
         color = param1.color;
         bold = param1.bold;
         italic = param1.italic;
         underline = param1.underline;
         url = param1.url;
         target = param1.target;
         align = param1.align;
         leftMargin = param1.leftMargin;
         rightMargin = param1.rightMargin;
         indent = param1.indent;
         leading = param1.leading;
         letterSpacing = param1.letterSpacing;
         blockIndent = param1.blockIndent;
         bullet = param1.bullet;
         display = param1.display;
         indent = param1.indent;
         kerning = param1.kerning;
         tabStops = param1.tabStops;
      }
   }
}
