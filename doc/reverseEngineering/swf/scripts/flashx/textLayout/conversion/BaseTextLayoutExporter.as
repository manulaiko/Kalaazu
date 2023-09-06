package flashx.textLayout.conversion
{
   import flash.system.System;
   import flash.utils.getQualifiedClassName;
   import flashx.textLayout.TextLayoutVersion;
   import flashx.textLayout.elements.Configuration;
   import flashx.textLayout.elements.ContainerFormattedElement;
   import flashx.textLayout.elements.FlowElement;
   import flashx.textLayout.elements.FlowGroupElement;
   import flashx.textLayout.elements.ParagraphFormattedElement;
   import flashx.textLayout.elements.SpanElement;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.formats.TextLayoutFormat;
   import flashx.textLayout.formats.WhiteSpaceCollapse;
   import flashx.textLayout.tlf_internal;
   
   class BaseTextLayoutExporter extends ConverterBase implements ITextExporter
   {
      
      private static const brRegEx:RegExp = / /;
       
      
      private var _config:ImportExportConfiguration;
      
      private var _rootTag:XML;
      
      private var _ns:Namespace;
      
      function BaseTextLayoutExporter(param1:Namespace, param2:XML, param3:ImportExportConfiguration)
      {
         super();
         this._config = param3;
         this._ns = param1;
         this._rootTag = param2;
      }
      
      tlf_internal static function convertXMLToString(param1:XML) : String
      {
         var var_5:String = null;
         var originalSettings:Object = null;
         var var_228:XML = param1;
         originalSettings = XML.settings();
         try
         {
            XML.ignoreProcessingInstructions = false;
            XML.ignoreWhitespace = false;
            XML.prettyPrinting = false;
            var_5 = var_228.toXMLString();
            if(false)
            {
               System["disposeXML"](var_228);
            }
            XML.setSettings(originalSettings);
         }
         catch(e:Error)
         {
            XML.setSettings(originalSettings);
            throw e;
         }
         return var_5;
      }
      
      public static function exportFlowElement(param1:BaseTextLayoutExporter, param2:FlowElement) : XMLList
      {
         return param1.exportFlowElement(param2);
      }
      
      public static function exportSpanText(param1:XML, param2:SpanElement, param3:RegExp, param4:Function) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc6_:Array;
         var _loc5_:String;
         if(_loc6_ = (_loc5_ = param2.text).match(param3))
         {
            while(_loc6_ != null)
            {
               _loc8_ = int(_loc6_.index);
               if((_loc9_ = _loc5_.substr(0,_loc8_)).length > 0)
               {
                  (_loc7_ = <dummy/>).appendChild(_loc9_);
                  param1.appendChild(_loc7_.text()[0]);
               }
               _loc10_ = param4(_loc5_.charAt(_loc8_));
               param1.appendChild(_loc10_);
               if(!(_loc6_ = (_loc5_ = _loc5_.slice(_loc8_ + 1,_loc5_.length)).match(param3)) && _loc5_.length > 0)
               {
                  (_loc7_ = <dummy/>).appendChild(_loc5_);
                  param1.appendChild(_loc7_.text()[0]);
               }
            }
         }
         else
         {
            param1.appendChild(_loc5_);
         }
      }
      
      public static function exportSpan(param1:BaseTextLayoutExporter, param2:SpanElement) : XMLList
      {
         var _loc3_:XMLList = exportFlowElement(param1,param2);
         exportSpanText(_loc3_[0],param2,param1.spanTextReplacementRegex,param1.getSpanTextReplacementXML);
         return _loc3_;
      }
      
      public static function exportFlowGroupElement(param1:BaseTextLayoutExporter, param2:FlowGroupElement) : XMLList
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:XMLList = exportFlowElement(param1,param2);
         var _loc4_:int = 0;
         while(_loc4_ < param2.numChildren)
         {
            _loc5_ = param2.getChildAt(_loc4_);
            if(_loc6_ = param1.exportChild(_loc5_))
            {
               _loc3_.appendChild(_loc6_);
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function exportParagraphFormattedElement(param1:BaseTextLayoutExporter, param2:ParagraphFormattedElement) : XMLList
      {
         return param1.exportParagraphFormattedElement(param2);
      }
      
      public static function exportList(param1:BaseTextLayoutExporter, param2:ParagraphFormattedElement) : XMLList
      {
         return param1.exportList(param2);
      }
      
      public static function exportListItem(param1:BaseTextLayoutExporter, param2:ParagraphFormattedElement) : XMLList
      {
         return param1.exportListItem(param2);
      }
      
      public static function exportContainerFormattedElement(param1:BaseTextLayoutExporter, param2:ContainerFormattedElement) : XMLList
      {
         return param1.exportContainerFormattedElement(param2);
      }
      
      public static function exportTextFlow(param1:BaseTextLayoutExporter, param2:TextFlow) : XMLList
      {
         var _loc3_:XMLList = exportContainerFormattedElement(param1,param2);
         _loc3_[TextLayoutFormat.whiteSpaceCollapseProperty.name] = WhiteSpaceCollapse.PRESERVE;
         _loc3_["version"] = TextLayoutVersion.tlf_internal::getVersionString(TextLayoutVersion.CURRENT_VERSION);
         return _loc3_;
      }
      
      public function export(param1:TextFlow, param2:String) : Object
      {
         tlf_internal::clear();
         var _loc3_:XML = this.exportToXML(param1);
         return param2 == ConversionType.STRING_TYPE ? tlf_internal::convertXMLToString(_loc3_) : _loc3_;
      }
      
      protected function exportToXML(param1:TextFlow) : XML
      {
         var _loc2_:* = null;
         if(this._rootTag)
         {
            _loc2_ = new XML(this._rootTag);
            _loc2_.addNamespace(this._ns);
            _loc2_.appendChild(this.exportChild(param1));
         }
         else
         {
            _loc2_ = XML(exportTextFlow(this,param1));
            _loc2_.addNamespace(this._ns);
         }
         return _loc2_;
      }
      
      protected function exportFlowElement(param1:FlowElement) : XMLList
      {
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:String = this._config.lookupName(_loc2_);
         var _loc4_:XML;
         (_loc4_ = new XML("<" + _loc3_ + "/>")).setNamespace(this._ns);
         return XMLList(_loc4_);
      }
      
      protected function get spanTextReplacementRegex() : RegExp
      {
         return brRegEx;
      }
      
      protected function getSpanTextReplacementXML(param1:String) : XML
      {
         var _loc2_:XML = <br/>;
         _loc2_.setNamespace(this.flowNS);
         return _loc2_;
      }
      
      protected function exportParagraphFormattedElement(param1:FlowElement) : XMLList
      {
         var _loc4_:* = null;
         var _loc2_:XMLList = this.exportFlowElement(param1);
         var _loc3_:int = 0;
         while(_loc3_ < ParagraphFormattedElement(param1).numChildren)
         {
            _loc4_ = ParagraphFormattedElement(param1).getChildAt(_loc3_);
            _loc2_.appendChild(this.exportChild(_loc4_));
            _loc3_++;
         }
         return _loc2_;
      }
      
      protected function exportList(param1:FlowElement) : XMLList
      {
         var _loc4_:* = null;
         var _loc2_:XMLList = this.exportFlowElement(param1);
         var _loc3_:int = 0;
         while(_loc3_ < FlowGroupElement(param1).numChildren)
         {
            _loc4_ = FlowGroupElement(param1).getChildAt(_loc3_);
            _loc2_.appendChild(this.exportChild(_loc4_));
            _loc3_++;
         }
         return _loc2_;
      }
      
      protected function exportListItem(param1:FlowElement) : XMLList
      {
         var _loc4_:* = null;
         var _loc2_:XMLList = this.exportFlowElement(param1);
         var _loc3_:int = 0;
         while(_loc3_ < FlowGroupElement(param1).numChildren)
         {
            _loc4_ = FlowGroupElement(param1).getChildAt(_loc3_);
            _loc2_.appendChild(this.exportChild(_loc4_));
            _loc3_++;
         }
         return _loc2_;
      }
      
      protected function exportContainerFormattedElement(param1:FlowElement) : XMLList
      {
         return this.exportParagraphFormattedElement(param1);
      }
      
      public function exportChild(param1:FlowElement) : XMLList
      {
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:FlowElementInfo = this._config.lookupByClass(_loc2_);
         if(_loc3_ != null)
         {
            return _loc3_.exporter(this,param1);
         }
         return null;
      }
      
      protected function exportStyles(param1:XMLList, param2:Array) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         param2.sortOn("xmlName");
         for each(_loc3_ in param2)
         {
            _loc4_ = _loc3_.xmlVal;
            if(!(!useClipboardAnnotations && _loc3_.xmlName == ConverterBase.MERGE_TO_NEXT_ON_PASTE))
            {
               if(_loc4_ is String)
               {
                  param1[_loc3_.xmlName] = _loc4_;
               }
               else if(_loc4_ is XMLList)
               {
                  param1.appendChild(_loc4_);
               }
            }
         }
      }
      
      function get flowNS() : Namespace
      {
         return this._ns;
      }
      
      protected function get formatDescription() : Object
      {
         return null;
      }
   }
}
