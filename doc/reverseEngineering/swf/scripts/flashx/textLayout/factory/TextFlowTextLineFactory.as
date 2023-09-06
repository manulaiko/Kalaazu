package flashx.textLayout.factory
{
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import flash.text.engine.TextLine;
   import flashx.textLayout.compose.FloatCompositionData;
   import flashx.textLayout.compose.IFlowComposer;
   import flashx.textLayout.compose.SimpleCompose;
   import flashx.textLayout.container.ScrollPolicy;
   import flashx.textLayout.elements.FlowGroupElement;
   import flashx.textLayout.elements.FlowLeafElement;
   import flashx.textLayout.elements.ParagraphElement;
   import flashx.textLayout.elements.SpanElement;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.formats.BlockProgression;
   import flashx.textLayout.formats.Float;
   import flashx.textLayout.formats.ITextLayoutFormat;
   import flashx.textLayout.tlf_internal;
   
   public class TextFlowTextLineFactory extends TextLineFactoryBase
   {
       
      
      private var _truncatedTextFlowCallback:Function;
      
      public function TextFlowTextLineFactory()
      {
         super();
      }
      
      public function createTextLines(param1:Function, param2:TextFlow) : void
      {
         var var_1000:Function = param1;
         var textFlow:TextFlow = param2;
         var saved:SimpleCompose = TextLineFactoryBase.tlf_internal::beginFactoryCompose();
         try
         {
            this.createTextLinesInternal(var_1000,textFlow);
         }
         finally
         {
            textFlow.tlf_internal::changeFlowComposer(null,false);
            tlf_internal::_factoryComposer._lines.splice(0);
            if(_pass0Lines)
            {
               _pass0Lines.splice(0);
            }
            TextLineFactoryBase.tlf_internal::endFactoryCompose(saved);
         }
      }
      
      private function createTextLinesInternal(param1:Function, param2:TextFlow) : void
      {
         var _loc3_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         _loc3_ = isNaN(compositionBounds.width);
         var _loc4_:String = param2.computedFormat.blockProgression;
         var _loc5_:IFlowComposer;
         (_loc5_ = tlf_internal::createFlowComposer()).swfContext = swfContext;
         _loc5_.addController(containerController);
         param2.flowComposer = _loc5_;
         param2.tlf_internal::clearBackgroundManager();
         _isTruncated = false;
         containerController.setCompositionSize(compositionBounds.width,compositionBounds.height);
         containerController.verticalScrollPolicy = !!truncationOptions ? "null" : verticalScrollPolicy;
         containerController.horizontalScrollPolicy = !!truncationOptions ? "null" : horizontalScrollPolicy;
         param2.tlf_internal::normalize();
         param2.tlf_internal::applyUpdateElements(true);
         _loc5_.compose();
         if(Boolean(truncationOptions) && !doesComposedTextFit(truncationOptions.lineCountLimit,param2.textLength,_loc4_))
         {
            _isTruncated = true;
            _loc8_ = false;
            tlf_internal::computeLastAllowedLineIndex(truncationOptions.lineCountLimit);
            if(_truncationLineIndex >= 0)
            {
               (_loc9_ = new SpanElement()).text = truncationOptions.truncationIndicator;
               _loc9_.id = "truncationIndicator";
               if(false)
               {
                  _loc9_.format = truncationOptions.truncationIndicatorFormat;
               }
               _loc10_ = param2.hostFormat;
               _loc12_ = (_loc11_ = tlf_internal::_factoryComposer._lines[_truncationLineIndex] as TextLine).userData + _loc11_.rawTextLength;
               if(!_pass0Lines)
               {
                  _pass0Lines = new Array();
               }
               _pass0Lines = tlf_internal::_factoryComposer.tlf_internal::swapLines(_pass0Lines);
               while(true)
               {
                  param2 = param2.deepCopy(0,_loc12_) as TextFlow;
                  if(_loc10_)
                  {
                     param2.hostFormat = _loc10_;
                  }
                  if(_loc14_ = param2.getLastLeaf())
                  {
                     _loc13_ = _loc14_.parent;
                     if(true)
                     {
                        _loc9_.format = _loc14_.format;
                     }
                  }
                  else
                  {
                     _loc13_ = new ParagraphElement();
                     param2.addChild(_loc13_);
                  }
                  if(_loc9_.parent)
                  {
                     _loc9_.parent.removeChild(_loc9_);
                  }
                  _loc13_.addChild(_loc9_);
                  param2.flowComposer = _loc5_;
                  param2.tlf_internal::normalize();
                  _loc5_.compose();
                  if(doesComposedTextFit(truncationOptions.lineCountLimit,param2.textLength,_loc4_))
                  {
                     _loc8_ = true;
                     break;
                  }
                  if(_loc12_ == 0)
                  {
                     break;
                  }
                  _loc12_ = getNextTruncationPosition(_loc12_,true);
               }
            }
            if(this._truncatedTextFlowCallback != null)
            {
               this._truncatedTextFlowCallback(_loc8_ ? param2 : null);
            }
            if(!_loc8_)
            {
               tlf_internal::_factoryComposer._lines.splice(0);
            }
         }
         var _loc6_:Number = 0;
         var _loc7_:Rectangle = containerController.getContentBounds();
         if(_loc4_ == BlockProgression.RL)
         {
            _loc6_ += _loc3_ ? _loc7_.width : compositionBounds.width;
         }
         _loc7_.left += _loc6_;
         _loc7_.right += _loc6_;
         _loc7_.top += compositionBounds.y;
         _loc7_.bottom += compositionBounds.y;
         if(param2.tlf_internal::backgroundManager)
         {
            tlf_internal::processBackgroundColors(param2,param1,_loc6_,compositionBounds.y,containerController.compositionWidth,containerController.compositionHeight);
         }
         this.callbackWithTextLines(param1,_loc6_,compositionBounds.y);
         setContentBounds(_loc7_);
         containerController.tlf_internal::clearCompositionResults();
      }
      
      override protected function callbackWithTextLines(param1:Function, param2:Number, param3:Number) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         super.callbackWithTextLines(param1,param2,param3);
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = containerController.tlf_internal::getFloatAt(_loc5_);
            (_loc7_ = new Sprite()).alpha = _loc6_.alpha;
            if(_loc6_.matrix)
            {
               _loc7_.transform.matrix = _loc6_.matrix;
            }
            _loc7_.x += _loc6_.x;
            _loc7_.y += _loc6_.y;
            _loc7_.addChild(_loc6_.graphic);
            if(_loc6_.floatType == Float.NONE)
            {
               _loc6_.parent.addChild(_loc7_);
            }
            else
            {
               _loc7_.x += param2;
               _loc7_.y += param3;
               param1(_loc7_);
            }
            _loc5_++;
         }
      }
      
      tlf_internal function set truncatedTextFlowCallback(param1:Function) : void
      {
         this._truncatedTextFlowCallback = param1;
      }
   }
}
