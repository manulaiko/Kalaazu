package flashx.textLayout.conversion
{
   import flash.system.System;
   import flashx.textLayout.TextLayoutVersion;
   import flashx.textLayout.elements.BreakElement;
   import flashx.textLayout.elements.Configuration;
   import flashx.textLayout.elements.ContainerFormattedElement;
   import flashx.textLayout.elements.FlowElement;
   import flashx.textLayout.elements.FlowGroupElement;
   import flashx.textLayout.elements.FlowLeafElement;
   import flashx.textLayout.elements.GlobalSettings;
   import flashx.textLayout.elements.IConfiguration;
   import flashx.textLayout.elements.ListElement;
   import flashx.textLayout.elements.ListItemElement;
   import flashx.textLayout.elements.ParagraphElement;
   import flashx.textLayout.elements.ParagraphFormattedElement;
   import flashx.textLayout.elements.SpanElement;
   import flashx.textLayout.elements.TabElement;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.property.Property;
   import flashx.textLayout.tlf_internal;
   
   class BaseTextLayoutImporter extends ConverterBase implements ITextImporter
   {
      
      private static const anyPrintChar:RegExp = /[^\t\n\r ]/g;
      
      private static const dblSpacePattern:RegExp = /[ ]{2,}/g;
      
      private static const tabNewLinePattern:RegExp = /[\t\n\r]/g;
       
      
      private var _ns:Namespace;
      
      private var _textFlowNamespace:Namespace;
      
      protected var _config:ImportExportConfiguration;
      
      protected var _textFlowConfiguration:IConfiguration = null;
      
      protected var _importVersion:uint;
      
      private var _impliedPara:ParagraphElement = null;
      
      function BaseTextLayoutImporter(param1:Namespace, param2:ImportExportConfiguration)
      {
         super();
         this._ns = param1;
         this._config = param2;
      }
      
      protected static function stripWhitespace(param1:String) : String
      {
         return param1.replace(tabNewLinePattern," ");
      }
      
      public static function parseTextFlow(param1:BaseTextLayoutImporter, param2:XML, param3:Object = null) : TextFlow
      {
         return param1.createTextFlowFromXML(param2,null);
      }
      
      public static function parsePara(param1:BaseTextLayoutImporter, param2:XML, param3:FlowGroupElement) : void
      {
         var _loc4_:ParagraphElement = param1.createParagraphFromXML(param2);
         if(param1.tlf_internal::addChild(param3,_loc4_))
         {
            param1.parseFlowGroupElementChildren(param2,_loc4_);
            if(_loc4_.numChildren == 0)
            {
               _loc4_.addChild(new SpanElement());
            }
         }
      }
      
      protected static function copyAllStyleProps(param1:FlowLeafElement, param2:FlowLeafElement) : void
      {
         param1.format = param2.format;
         param1.typeName = param2.typeName;
         param1.id = param2.id;
      }
      
      public static function parseSpan(param1:BaseTextLayoutImporter, param2:XML, param3:FlowGroupElement) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc4_:SpanElement = param1.createSpanFromXML(param2);
         var _loc5_:XMLList;
         if((_loc5_ = param2[0].children()).length() == 0)
         {
            param1.tlf_internal::addChild(param3,_loc4_);
            return;
         }
         for each(_loc6_ in _loc5_)
         {
            if((_loc7_ = !!_loc6_.name() ? _loc6_.name().localName : null) == null)
            {
               if(_loc4_.parent == null)
               {
                  _loc4_.text = _loc6_.toString();
                  param1.tlf_internal::addChild(param3,_loc4_);
               }
               else
               {
                  _loc8_ = new SpanElement();
                  copyAllStyleProps(_loc8_,_loc4_);
                  _loc8_.text = _loc6_.toString();
                  param1.tlf_internal::addChild(param3,_loc8_);
               }
            }
            else if(_loc7_ == "br")
            {
               if(_loc9_ = param1.createBreakFromXML(_loc6_))
               {
                  copyAllStyleProps(_loc9_,_loc4_);
                  param1.tlf_internal::addChild(param3,_loc9_);
               }
               else
               {
                  param1.tlf_internal::reportError(GlobalSettings.resourceStringFunction("unexpectedXMLElementInSpan",[_loc7_]));
               }
            }
            else if(_loc7_ == "tab")
            {
               if(_loc10_ = param1.createTabFromXML(_loc6_))
               {
                  copyAllStyleProps(_loc10_,_loc4_);
                  param1.tlf_internal::addChild(param3,_loc10_);
               }
               else
               {
                  param1.tlf_internal::reportError(GlobalSettings.resourceStringFunction("unexpectedXMLElementInSpan",[_loc7_]));
               }
            }
            else
            {
               param1.tlf_internal::reportError(GlobalSettings.resourceStringFunction("unexpectedXMLElementInSpan",[_loc7_]));
            }
         }
      }
      
      public static function parseBreak(param1:BaseTextLayoutImporter, param2:XML, param3:FlowGroupElement) : void
      {
         var _loc4_:BreakElement = param1.createBreakFromXML(param2);
         param1.tlf_internal::addChild(param3,_loc4_);
      }
      
      public static function parseTab(param1:BaseTextLayoutImporter, param2:XML, param3:FlowGroupElement) : void
      {
         var _loc4_:TabElement;
         if(_loc4_ = param1.createTabFromXML(param2))
         {
            param1.tlf_internal::addChild(param3,_loc4_);
         }
      }
      
      public static function parseList(param1:BaseTextLayoutImporter, param2:XML, param3:FlowGroupElement) : void
      {
         var _loc4_:ListElement = param1.createListFromXML(param2);
         if(param1.tlf_internal::addChild(param3,_loc4_))
         {
            param1.parseFlowGroupElementChildren(param2,_loc4_);
         }
      }
      
      public static function parseListItem(param1:BaseTextLayoutImporter, param2:XML, param3:FlowGroupElement) : void
      {
         var _loc4_:ListItemElement = param1.createListItemFromXML(param2);
         if(param1.tlf_internal::addChild(param3,_loc4_))
         {
            param1.parseFlowGroupElementChildren(param2,_loc4_);
            if(_loc4_.numChildren == 0)
            {
               _loc4_.addChild(new ParagraphElement());
            }
         }
      }
      
      protected static function extractAttributesHelper(param1:Object, param2:TLFormatImporter) : Object
      {
         if(param1 == null)
         {
            return param2.result;
         }
         if(param2.result == null)
         {
            return param1;
         }
         var _loc3_:Object = new param2.classType(param1);
         _loc3_.apply(param2.result);
         return _loc3_;
      }
      
      override tlf_internal function clear() : void
      {
         super.tlf_internal::clear();
         this._textFlowNamespace = null;
         this._impliedPara = null;
      }
      
      public function importToFlow(param1:Object) : TextFlow
      {
         var rslt:TextFlow;
         var savedErrorHandler:Function;
         var source:Object = param1;
         this.tlf_internal::clear();
         if(throwOnError)
         {
            return this.importToFlowCanThrow(source);
         }
         rslt = null;
         savedErrorHandler = Property.errorHandler;
         try
         {
            Property.errorHandler = this.importPropertyErrorHandler;
            rslt = this.importToFlowCanThrow(source);
         }
         catch(e:Error)
         {
            tlf_internal::reportError(e.toString());
         }
         Property.errorHandler = savedErrorHandler;
         return rslt;
      }
      
      public function get configuration() : IConfiguration
      {
         return this._textFlowConfiguration;
      }
      
      public function set configuration(param1:IConfiguration) : void
      {
         this._textFlowConfiguration = param1;
      }
      
      protected function importPropertyErrorHandler(param1:Property, param2:Object) : void
      {
         tlf_internal::reportError(Property.createErrorString(param1,param2));
      }
      
      private function importToFlowCanThrow(param1:Object) : TextFlow
      {
         if(param1 is String)
         {
            return this.importFromString(String(param1));
         }
         if(param1 is XML)
         {
            return this.importFromXML(XML(param1));
         }
         return null;
      }
      
      protected function importFromString(param1:String) : TextFlow
      {
         var textFlow:TextFlow;
         var xmlTree:XML = null;
         var source:String = param1;
         var originalSettings:Object = XML.settings();
         try
         {
            XML.ignoreProcessingInstructions = false;
            XML.ignoreWhitespace = false;
            xmlTree = new XML(source);
         }
         finally
         {
            XML.setSettings(originalSettings);
         }
         textFlow = this.importFromXML(xmlTree);
         if(false)
         {
            System["disposeXML"](xmlTree);
         }
         return textFlow;
      }
      
      protected function importFromXML(param1:XML) : TextFlow
      {
         return this.parseContent(param1[0]);
      }
      
      protected function parseContent(param1:XML) : TextFlow
      {
         var _loc2_:XML = param1..TextFlow[0];
         if(_loc2_)
         {
            return parseTextFlow(this,param1);
         }
         return null;
      }
      
      public function get ns() : Namespace
      {
         return this._ns;
      }
      
      protected function checkNamespace(param1:XML) : Boolean
      {
         var _loc2_:Namespace = param1.namespace();
         if(!this._textFlowNamespace)
         {
            if(_loc2_ != this.ns)
            {
               tlf_internal::reportError(GlobalSettings.resourceStringFunction("unexpectedNamespace",[_loc2_.toString()]));
               return false;
            }
            this._textFlowNamespace = _loc2_;
         }
         else if(_loc2_ != this._textFlowNamespace)
         {
            tlf_internal::reportError(GlobalSettings.resourceStringFunction("unexpectedNamespace",[_loc2_.toString()]));
            return false;
         }
         return true;
      }
      
      public function parseAttributes(param1:XML, param2:Array) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         for each(_loc3_ in param2)
         {
            _loc3_.reset();
         }
         if(!param1)
         {
            return;
         }
         for each(_loc4_ in param1.attributes())
         {
            _loc5_ = _loc4_.name().localName;
            _loc6_ = _loc4_.toString();
            _loc7_ = false;
            if(param1.localName() == "TextFlow")
            {
               if(_loc5_ == "version")
               {
                  continue;
               }
            }
            else if(this._importVersion < TextLayoutVersion.VERSION_2_0 && (_loc5_ == "paddingLeft" || _loc5_ == "paddingTop" || _loc5_ == "paddingRight" || _loc5_ == "paddingBottom"))
            {
               continue;
            }
            for each(_loc3_ in param2)
            {
               if(_loc3_.importOneFormat(_loc5_,_loc6_))
               {
                  _loc7_ = true;
                  break;
               }
            }
            if(!_loc7_)
            {
               this.handleUnknownAttribute(param1.name().localName,_loc5_);
            }
         }
      }
      
      public function createTextFlowFromXML(param1:XML, param2:TextFlow = null) : TextFlow
      {
         return null;
      }
      
      public function createParagraphFromXML(param1:XML) : ParagraphElement
      {
         return null;
      }
      
      public function createSpanFromXML(param1:XML) : SpanElement
      {
         return null;
      }
      
      public function createBreakFromXML(param1:XML) : BreakElement
      {
         this.parseAttributes(param1,null);
         return new BreakElement();
      }
      
      public function createListFromXML(param1:XML) : ListElement
      {
         return null;
      }
      
      public function createListItemFromXML(param1:XML) : ListItemElement
      {
         return null;
      }
      
      public function createTabFromXML(param1:XML) : TabElement
      {
         this.parseAttributes(param1,null);
         return new TabElement();
      }
      
      public function parseFlowChildren(param1:XML, param2:FlowGroupElement) : void
      {
         this.parseFlowGroupElementChildren(param1,param2);
      }
      
      public function parseFlowGroupElementChildren(param1:XML, param2:FlowGroupElement, param3:Object = null, param4:Boolean = false) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = false;
         for each(_loc5_ in param1.children())
         {
            if(_loc5_.nodeKind() == "element")
            {
               this.tlf_internal::parseObject(_loc5_.name().localName,_loc5_,param2,param3);
            }
            else if(_loc5_.nodeKind() == "text")
            {
               _loc6_ = _loc5_.toString();
               _loc7_ = false;
               if(param2 is ContainerFormattedElement)
               {
                  _loc7_ = _loc6_.search(anyPrintChar) == -1;
               }
               if(!_loc7_)
               {
                  this.tlf_internal::addChild(param2,this.createImpliedSpan(_loc6_));
               }
            }
         }
         if(!param4 && param2 is ContainerFormattedElement)
         {
            this.tlf_internal::resetImpliedPara();
         }
      }
      
      public function createImpliedSpan(param1:String) : SpanElement
      {
         var _loc2_:SpanElement = new SpanElement();
         _loc2_.text = param1;
         return _loc2_;
      }
      
      public function createParagraphFlowFromXML(param1:XML, param2:TextFlow = null) : TextFlow
      {
         return null;
      }
      
      tlf_internal function parseObject(param1:String, param2:XML, param3:FlowGroupElement, param4:Object = null) : void
      {
         if(!this.checkNamespace(param2))
         {
            return;
         }
         var _loc5_:FlowElementInfo;
         if(!(_loc5_ = this._config.lookup(param1)))
         {
            if(param4 == null || param4[param1] === undefined)
            {
               this.handleUnknownElement(param1,param2,param3);
            }
         }
         else
         {
            _loc5_.parser(this,param2,param3);
         }
      }
      
      protected function handleUnknownElement(param1:String, param2:XML, param3:FlowGroupElement) : void
      {
         tlf_internal::reportError(GlobalSettings.resourceStringFunction("unknownElement",[param1]));
      }
      
      protected function handleUnknownAttribute(param1:String, param2:String) : void
      {
         tlf_internal::reportError(GlobalSettings.resourceStringFunction("unknownAttribute",[param2,param1]));
      }
      
      protected function getElementInfo(param1:XML) : FlowElementInfo
      {
         return this._config.lookup(param1.name().localName);
      }
      
      protected function GetClass(param1:XML) : Class
      {
         var _loc2_:FlowElementInfo = this._config.lookup(param1.name().localName);
         return !!_loc2_ ? _loc2_.flowClass : null;
      }
      
      tlf_internal function createImpliedParagraph() : ParagraphElement
      {
         return this.createParagraphFromXML(<p/>);
      }
      
      tlf_internal function addChild(param1:FlowGroupElement, param2:FlowElement) : Boolean
      {
         var parent:FlowGroupElement = param1;
         var child:FlowElement = param2;
         if(child is ParagraphFormattedElement)
         {
            this.tlf_internal::resetImpliedPara();
         }
         else if(parent is ContainerFormattedElement)
         {
            if(!this._impliedPara)
            {
               this._impliedPara = this.tlf_internal::createImpliedParagraph();
               parent.addChild(this._impliedPara);
            }
            parent = this._impliedPara;
         }
         if(throwOnError)
         {
            parent.addChild(child);
         }
         else
         {
            try
            {
               parent.addChild(child);
            }
            catch(e:*)
            {
               tlf_internal::reportError(e);
               return false;
            }
         }
         return true;
      }
      
      tlf_internal function resetImpliedPara() : void
      {
         if(this._impliedPara)
         {
            this.onResetImpliedPara(this._impliedPara);
            this._impliedPara = null;
         }
      }
      
      protected function onResetImpliedPara(param1:ParagraphElement) : void
      {
      }
   }
}
