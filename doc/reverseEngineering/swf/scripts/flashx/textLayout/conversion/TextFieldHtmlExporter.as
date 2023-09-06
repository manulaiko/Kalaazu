package flashx.textLayout.conversion
{
   import flash.text.engine.FontPosture;
   import flash.text.engine.FontWeight;
   import flash.text.engine.Kerning;
   import flash.text.engine.TabAlignment;
   import flash.utils.getQualifiedClassName;
   import flashx.textLayout.elements.BreakElement;
   import flashx.textLayout.elements.DivElement;
   import flashx.textLayout.elements.FlowElement;
   import flashx.textLayout.elements.FlowGroupElement;
   import flashx.textLayout.elements.FlowLeafElement;
   import flashx.textLayout.elements.InlineGraphicElement;
   import flashx.textLayout.elements.LinkElement;
   import flashx.textLayout.elements.ListElement;
   import flashx.textLayout.elements.ListItemElement;
   import flashx.textLayout.elements.ParagraphElement;
   import flashx.textLayout.elements.SpanElement;
   import flashx.textLayout.elements.SubParagraphGroupElement;
   import flashx.textLayout.elements.SubParagraphGroupElementBase;
   import flashx.textLayout.elements.TCYElement;
   import flashx.textLayout.elements.TabElement;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.formats.Direction;
   import flashx.textLayout.formats.Float;
   import flashx.textLayout.formats.FormatValue;
   import flashx.textLayout.formats.ITextLayoutFormat;
   import flashx.textLayout.formats.LeadingModel;
   import flashx.textLayout.formats.TabStopFormat;
   import flashx.textLayout.formats.TextAlign;
   import flashx.textLayout.formats.TextDecoration;
   import flashx.textLayout.formats.TextLayoutFormat;
   import flashx.textLayout.tlf_internal;
   
   public class TextFieldHtmlExporter extends ConverterBase implements ITextExporter
   {
      
      tlf_internal static var _config:ImportExportConfiguration;
      
      tlf_internal static const brRegEx:RegExp = / /;
       
      
      public function TextFieldHtmlExporter()
      {
         super();
         if(!tlf_internal::_config)
         {
            tlf_internal::_config = new ImportExportConfiguration();
            tlf_internal::_config.addIEInfo(null,DivElement,null,this.tlf_internal::exportDiv);
            tlf_internal::_config.addIEInfo(null,ParagraphElement,null,this.tlf_internal::exportParagraph);
            tlf_internal::_config.addIEInfo(null,LinkElement,null,this.tlf_internal::exportLink);
            tlf_internal::_config.addIEInfo(null,TCYElement,null,this.tlf_internal::exportTCY);
            tlf_internal::_config.addIEInfo(null,SubParagraphGroupElement,null,this.tlf_internal::exportSPGE);
            tlf_internal::_config.addIEInfo(null,SpanElement,null,this.tlf_internal::exportSpan);
            tlf_internal::_config.addIEInfo(null,InlineGraphicElement,null,this.tlf_internal::exportImage);
            tlf_internal::_config.addIEInfo(null,TabElement,null,this.tlf_internal::exportTab);
            tlf_internal::_config.addIEInfo(null,BreakElement,null,this.tlf_internal::exportBreak);
            tlf_internal::_config.addIEInfo(null,ListElement,null,this.tlf_internal::exportList);
            tlf_internal::_config.addIEInfo(null,ListItemElement,null,this.tlf_internal::exportListItem);
         }
      }
      
      tlf_internal static function makeTaggedTypeName(param1:FlowElement, param2:String) : XML
      {
         if(param1.typeName == param1.tlf_internal::defaultTypeName)
         {
            return new XML("<" + param2 + "/>");
         }
         return new XML("<" + param1.typeName.toUpperCase() + "/>");
      }
      
      tlf_internal static function exportStyling(param1:FlowElement, param2:XML) : void
      {
         if(param1.id != null)
         {
            param2["id"] = param1.id;
         }
         if(param1.styleName != null)
         {
            param2["class"] = param1.styleName;
         }
      }
      
      tlf_internal static function getSpanTextReplacementXML(param1:String) : XML
      {
         return <BR/>;
      }
      
      tlf_internal static function nest(param1:XML, param2:Object) : XML
      {
         param1.setChildren(param2);
         return param1;
      }
      
      public function export(param1:TextFlow, param2:String) : Object
      {
         var _loc3_:XML = this.tlf_internal::exportToXML(param1);
         return param2 == ConversionType.STRING_TYPE ? BaseTextLayoutExporter.tlf_internal::convertXMLToString(_loc3_) : _loc3_;
      }
      
      tlf_internal function exportToXML(param1:TextFlow) : XML
      {
         var _loc3_:* = null;
         var _loc2_:XML = <HTML/>;
         if(param1.numChildren != 0)
         {
            if(param1.getChildAt(0).typeName != "BODY")
            {
               _loc3_ = <BODY/>;
               _loc2_.appendChild(_loc3_);
               this.tlf_internal::exportChildren(param1,_loc3_);
            }
            else
            {
               this.tlf_internal::exportChildren(param1,_loc2_);
            }
         }
         return _loc2_;
      }
      
      tlf_internal function exportChildren(param1:FlowGroupElement, param2:XML) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc4_ = param1.getChildAt(_loc3_);
            this.tlf_internal::exportElement(_loc4_,param2);
            _loc3_++;
         }
      }
      
      tlf_internal function exportList(param1:ListElement, param2:XML) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1.tlf_internal::isNumberedList())
         {
            _loc3_ = <OL/>;
         }
         else
         {
            _loc3_ = <UL/>;
         }
         tlf_internal::exportStyling(param1,_loc3_);
         this.tlf_internal::exportChildren(param1,_loc3_);
         if(param1.typeName != param1.tlf_internal::defaultTypeName)
         {
            (_loc4_ = new XML("<" + param1.typeName + "/>")).appendChild(_loc3_);
            param2.appendChild(_loc4_);
         }
         else
         {
            param2.appendChild(_loc3_);
         }
      }
      
      tlf_internal function exportListItem(param1:ListItemElement, param2:XML) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:XML = <LI/>;
         tlf_internal::exportStyling(param1,_loc3_);
         this.tlf_internal::exportChildren(param1,_loc3_);
         var _loc4_:XMLList;
         if((_loc4_ = _loc3_.children()).length() == 1)
         {
            if((_loc5_ = _loc4_[0]).name().localName == "P")
            {
               if((_loc6_ = _loc5_.children()).length() == 1)
               {
                  _loc3_ = <LI/>;
                  _loc3_.appendChild(_loc6_[0]);
               }
            }
         }
         param2.appendChild(_loc3_);
      }
      
      tlf_internal function exportDiv(param1:DivElement, param2:XML) : void
      {
         var _loc3_:XML = tlf_internal::makeTaggedTypeName(param1,"DIV");
         tlf_internal::exportStyling(param1,_loc3_);
         this.tlf_internal::exportChildren(param1,_loc3_);
         param2.appendChild(_loc3_);
      }
      
      tlf_internal function exportParagraph(param1:ParagraphElement, param2:XML) : void
      {
         var _loc3_:XML = tlf_internal::makeTaggedTypeName(param1,"P");
         tlf_internal::exportStyling(param1,_loc3_);
         var _loc4_:XML = this.tlf_internal::exportFont(param1.computedFormat);
         this.tlf_internal::exportSubParagraphChildren(param1,_loc4_);
         tlf_internal::nest(_loc3_,_loc4_);
         param2.appendChild(this.tlf_internal::exportParagraphFormat(_loc3_,param1));
      }
      
      tlf_internal function exportLink(param1:LinkElement, param2:XML) : void
      {
         var _loc3_:XML = <A/>;
         if(param1.href)
         {
            _loc3_.@HREF = param1.href;
         }
         if(param1.target)
         {
            _loc3_.@TARGET = param1.target;
         }
         else
         {
            _loc3_.@TARGET = "_blank";
         }
         this.tlf_internal::exportSubParagraphElement(param1,_loc3_,param2);
      }
      
      tlf_internal function exportTCY(param1:TCYElement, param2:XML) : void
      {
         var _loc3_:XML = <TCY/>;
         this.tlf_internal::exportSubParagraphElement(param1,_loc3_,param2);
      }
      
      tlf_internal function exportSPGE(param1:SubParagraphGroupElement, param2:XML) : void
      {
         var _loc3_:XML = param1.typeName != param1.tlf_internal::defaultTypeName ? new XML("<" + param1.typeName + "/>") : <SPAN/>;
         this.tlf_internal::exportSubParagraphElement(param1,_loc3_,param2,false);
      }
      
      tlf_internal function exportSubParagraphElement(param1:SubParagraphGroupElementBase, param2:XML, param3:XML, param4:Boolean = true) : void
      {
         var _loc9_:* = null;
         tlf_internal::exportStyling(param1,param2);
         this.tlf_internal::exportSubParagraphChildren(param1,param2);
         var _loc5_:ITextLayoutFormat = param1.computedFormat;
         var _loc6_:ITextLayoutFormat = param1.parent.computedFormat;
         var _loc7_:XML;
         var _loc8_:XML = !!(_loc7_ = this.tlf_internal::exportFont(_loc5_,_loc6_)) ? tlf_internal::nest(_loc7_,param2) : param2;
         if(param4 && param1.typeName != param1.tlf_internal::defaultTypeName)
         {
            (_loc9_ = new XML("<" + param1.typeName + "/>")).appendChild(_loc8_);
            param3.appendChild(_loc9_);
         }
         else
         {
            param3.appendChild(_loc8_);
         }
      }
      
      tlf_internal function exportSpan(param1:SpanElement, param2:XML) : void
      {
         var _loc4_:* = null;
         var _loc3_:XML = tlf_internal::makeTaggedTypeName(param1,"SPAN");
         tlf_internal::exportStyling(param1,_loc3_);
         BaseTextLayoutExporter.exportSpanText(_loc3_,param1,tlf_internal::brRegEx,tlf_internal::getSpanTextReplacementXML);
         if(param1.id == null && param1.styleName == null && param1.typeName == param1.tlf_internal::defaultTypeName)
         {
            if((_loc4_ = _loc3_.children()).length() == 1 && _loc4_[0].nodeKind() == "text")
            {
               _loc4_ = _loc3_.text()[0];
            }
            param2.appendChild(this.tlf_internal::exportSpanFormat(_loc4_,param1));
         }
         else
         {
            param2.appendChild(this.tlf_internal::exportSpanFormat(_loc3_,param1));
         }
      }
      
      tlf_internal function exportImage(param1:InlineGraphicElement, param2:XML) : void
      {
         var _loc4_:* = null;
         var _loc3_:XML = <IMG/>;
         tlf_internal::exportStyling(param1,_loc3_);
         if(param1.source)
         {
            _loc3_.@SRC = param1.source;
         }
         if(param1.width !== undefined && param1.width != FormatValue.AUTO)
         {
            _loc3_.@WIDTH = param1.width;
         }
         if(param1.height !== undefined && param1.height != FormatValue.AUTO)
         {
            _loc3_.@HEIGHT = param1.height;
         }
         if(param1.tlf_internal::computedFloat != Float.NONE)
         {
            _loc3_.@ALIGN = param1.float;
         }
         if(param1.typeName != param1.tlf_internal::defaultTypeName)
         {
            (_loc4_ = new XML("<" + param1.typeName + "/>")).appendChild(_loc3_);
            param2.appendChild(_loc4_);
         }
         else
         {
            param2.appendChild(_loc3_);
         }
      }
      
      tlf_internal function exportBreak(param1:BreakElement, param2:XML) : void
      {
         param2.appendChild(<BR/>);
      }
      
      tlf_internal function exportTab(param1:TabElement, param2:XML) : void
      {
         this.tlf_internal::exportSpan(param1,param2);
      }
      
      tlf_internal function exportTextFormatAttribute(param1:XML, param2:String, param3:*) : XML
      {
         if(!param1)
         {
            param1 = <TEXTFORMAT/>;
         }
         param1[param2] = param3;
         return param1;
      }
      
      tlf_internal function exportParagraphFormat(param1:XML, param2:ParagraphElement) : XML
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc8_:Number = NaN;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:ITextLayoutFormat = param2.computedFormat;
         switch(_loc3_.textAlign)
         {
            case TextAlign.START:
               _loc4_ = _loc3_.direction == Direction.LTR ? "null" : TextAlign.RIGHT;
               break;
            case TextAlign.END:
               _loc4_ = _loc3_.direction == Direction.LTR ? "null" : TextAlign.LEFT;
               break;
            default:
               _loc4_ = _loc3_.textAlign;
         }
         param1.@ALIGN = _loc4_;
         if(_loc3_.paragraphStartIndent != 0)
         {
            _loc5_ = this.tlf_internal::exportTextFormatAttribute(_loc5_,_loc3_.direction == Direction.LTR ? "LEFTMARGIN" : "RIGHTMARGIN",_loc3_.paragraphStartIndent);
         }
         if(_loc3_.paragraphEndIndent != 0)
         {
            _loc5_ = this.tlf_internal::exportTextFormatAttribute(_loc5_,_loc3_.direction == Direction.LTR ? "RIGHTMARGIN" : "LEFTMARGIN",_loc3_.paragraphEndIndent);
         }
         if(_loc3_.textIndent != 0)
         {
            _loc5_ = this.tlf_internal::exportTextFormatAttribute(_loc5_,"INDENT",_loc3_.textIndent);
         }
         if(_loc3_.leadingModel == LeadingModel.APPROXIMATE_TEXT_FIELD)
         {
            if(_loc7_ = param2.getFirstLeaf())
            {
               if((_loc8_ = TextLayoutFormat.lineHeightProperty.computeActualPropertyValue(_loc7_.computedFormat.lineHeight,_loc7_.tlf_internal::getEffectiveFontSize())) != 0)
               {
                  _loc5_ = this.tlf_internal::exportTextFormatAttribute(_loc5_,"LEADING",_loc8_);
               }
            }
         }
         var _loc6_:Array;
         if(_loc6_ = _loc3_.tabStops)
         {
            _loc9_ = "";
            for each(_loc10_ in _loc6_)
            {
               if(_loc10_.alignment != TabAlignment.START)
               {
                  break;
               }
               if(_loc9_.length)
               {
                  _loc9_ += ", ";
               }
               _loc9_ += _loc10_.position;
            }
            if(_loc9_.length)
            {
               _loc5_ = this.tlf_internal::exportTextFormatAttribute(_loc5_,"TABSTOPS",_loc9_);
            }
         }
         return !!_loc5_ ? tlf_internal::nest(_loc5_,param1) : param1;
      }
      
      tlf_internal function exportSpanFormat(param1:Object, param2:SpanElement) : Object
      {
         var _loc3_:ITextLayoutFormat = param2.computedFormat;
         var _loc4_:Object = param1;
         if(_loc3_.textDecoration.toString() == TextDecoration.UNDERLINE)
         {
            _loc4_ = tlf_internal::nest(<U/>,_loc4_);
         }
         if(_loc3_.fontStyle.toString() == FontPosture.ITALIC)
         {
            _loc4_ = tlf_internal::nest(<I/>,_loc4_);
         }
         if(_loc3_.fontWeight.toString() == FontWeight.BOLD)
         {
            _loc4_ = tlf_internal::nest(<B/>,_loc4_);
         }
         var _loc5_:FlowElement;
         if(!(_loc5_ = param2.getParentByType(LinkElement)))
         {
            _loc5_ = param2.getParagraph();
         }
         var _loc6_:XML;
         if(_loc6_ = this.tlf_internal::exportFont(_loc3_,_loc5_.computedFormat))
         {
            _loc4_ = tlf_internal::nest(_loc6_,_loc4_);
         }
         return _loc4_;
      }
      
      tlf_internal function exportFontAttribute(param1:XML, param2:String, param3:*) : XML
      {
         if(!param1)
         {
            param1 = <FONT/>;
         }
         param1[param2] = param3;
         return param1;
      }
      
      tlf_internal function exportFont(param1:ITextLayoutFormat, param2:ITextLayoutFormat = null) : XML
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!param2 || param2.fontFamily != param1.fontFamily)
         {
            _loc3_ = this.tlf_internal::exportFontAttribute(_loc3_,"FACE",param1.fontFamily);
         }
         if(!param2 || param2.fontSize != param1.fontSize)
         {
            _loc3_ = this.tlf_internal::exportFontAttribute(_loc3_,"SIZE",param1.fontSize);
         }
         if(!param2 || param2.color != param1.color)
         {
            _loc4_ = param1.color.toString(16);
            while(_loc4_.length < 6)
            {
               _loc4_ = "0" + _loc4_;
            }
            _loc4_ = "#" + _loc4_;
            _loc3_ = this.tlf_internal::exportFontAttribute(_loc3_,"COLOR",_loc4_);
         }
         if(!param2 || param2.trackingRight != param1.trackingRight)
         {
            _loc3_ = this.tlf_internal::exportFontAttribute(_loc3_,"LETTERSPACING",param1.trackingRight);
         }
         if(!param2 || param2.kerning != param1.kerning)
         {
            _loc3_ = this.tlf_internal::exportFontAttribute(_loc3_,"KERNING",param1.kerning == Kerning.OFF ? "0" : "1");
         }
         return _loc3_;
      }
      
      tlf_internal function exportElement(param1:FlowElement, param2:XML) : void
      {
         var _loc5_:* = null;
         var _loc3_:String = getQualifiedClassName(param1);
         var _loc4_:FlowElementInfo;
         if(_loc4_ = tlf_internal::_config.lookupByClass(_loc3_))
         {
            _loc4_.exporter(param1,param2);
         }
         else
         {
            _loc5_ = new XML("<" + param1.typeName.toUpperCase() + "/>");
            this.tlf_internal::exportChildren(param1 as FlowGroupElement,_loc5_);
            param2.appendChild(_loc5_);
         }
      }
      
      tlf_internal function exportSubParagraphChildren(param1:FlowGroupElement, param2:XML) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            this.tlf_internal::exportElement(param1.getChildAt(_loc3_),param2);
            _loc3_++;
         }
      }
   }
}
