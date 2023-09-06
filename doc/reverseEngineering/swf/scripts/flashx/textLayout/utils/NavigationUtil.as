package flashx.textLayout.utils
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.engine.TextLine;
   import flash.text.engine.TextRotation;
   import flashx.textLayout.compose.IFlowComposer;
   import flashx.textLayout.compose.TextFlowLine;
   import flashx.textLayout.container.ContainerController;
   import flashx.textLayout.container.ScrollPolicy;
   import flashx.textLayout.elements.FlowLeafElement;
   import flashx.textLayout.elements.ParagraphElement;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.elements.TextRange;
   import flashx.textLayout.formats.BlockProgression;
   import flashx.textLayout.formats.Direction;
   import flashx.textLayout.tlf_internal;
   
   public final class NavigationUtil
   {
       
      
      public function NavigationUtil()
      {
         super();
      }
      
      private static function validateTextRange(param1:TextRange) : Boolean
      {
         return param1.textFlow != null && param1.anchorPosition != -1 && param1.activePosition != -1;
      }
      
      private static function doIncrement(param1:TextFlow, param2:int, param3:Function) : int
      {
         var _loc4_:ParagraphElement = param1.tlf_internal::findAbsoluteParagraph(param2);
         return param3(param1,_loc4_,param2,_loc4_.getAbsoluteStart());
      }
      
      private static function previousAtomHelper(param1:TextFlow, param2:ParagraphElement, param3:int, param4:int) : int
      {
         if(param3 - param4 == 0)
         {
            return param3 > 0 ? param3 - 1 : 0;
         }
         return param2.findPreviousAtomBoundary(param3 - param4) + param4;
      }
      
      public static function previousAtomPosition(param1:TextFlow, param2:int) : int
      {
         return doIncrement(param1,param2,previousAtomHelper);
      }
      
      private static function nextAtomHelper(param1:TextFlow, param2:ParagraphElement, param3:int, param4:int) : int
      {
         if(param3 - param4 == param2.textLength - 1)
         {
            return Math.min(param1.textLength,param3 + 1);
         }
         return param2.findNextAtomBoundary(param3 - param4) + param4;
      }
      
      public static function nextAtomPosition(param1:TextFlow, param2:int) : int
      {
         return doIncrement(param1,param2,nextAtomHelper);
      }
      
      public static function previousWordPosition(param1:TextFlow, param2:int) : int
      {
         if(isOverset(param1,param2))
         {
            return endOfLastController(param1);
         }
         var _loc3_:ParagraphElement = param1.tlf_internal::findAbsoluteParagraph(param2);
         var _loc4_:int = _loc3_.getAbsoluteStart();
         var _loc5_:int = param2 - _loc4_;
         var _loc6_:int = 0;
         if(param2 - _loc4_ == 0)
         {
            return param2 > 0 ? param2 - 1 : 0;
         }
         do
         {
            _loc6_ = _loc3_.findPreviousWordBoundary(_loc5_);
            if(_loc5_ == _loc6_)
            {
               _loc5_ = _loc3_.findPreviousWordBoundary(_loc5_ - 1);
            }
            else
            {
               _loc5_ = _loc6_;
            }
         }
         while(_loc5_ > 0 && CharacterUtil.isWhitespace(_loc3_.getCharCodeAtPosition(_loc5_)));
         
         return _loc5_ + _loc4_;
      }
      
      public static function nextWordPosition(param1:TextFlow, param2:int) : int
      {
         var _loc3_:ParagraphElement = param1.tlf_internal::findAbsoluteParagraph(param2);
         var _loc4_:int = _loc3_.getAbsoluteStart();
         var _loc5_:int = param2 - _loc4_;
         if(param2 - _loc4_ == _loc3_.textLength - 1)
         {
            return Math.min(param1.textLength,param2 + 1);
         }
         while((_loc5_ = _loc3_.findNextWordBoundary(_loc5_)) < _loc3_.textLength - 1 && CharacterUtil.isWhitespace(_loc3_.getCharCodeAtPosition(_loc5_)))
         {
         }
         return _loc5_ + _loc4_;
      }
      
      tlf_internal static function updateStartIfInReadOnlyElement(param1:TextFlow, param2:int) : int
      {
         return param2;
      }
      
      tlf_internal static function updateEndIfInReadOnlyElement(param1:TextFlow, param2:int) : int
      {
         return param2;
      }
      
      private static function moveForwardHelper(param1:TextRange, param2:Boolean, param3:Function) : Boolean
      {
         var _loc4_:TextFlow = param1.textFlow;
         var _loc5_:int = param1.anchorPosition;
         var _loc6_:int = param1.activePosition;
         if(param2)
         {
            _loc6_ = param3(_loc4_,_loc6_);
         }
         else if(_loc5_ == _loc6_)
         {
            _loc6_ = _loc5_ = param3(_loc4_,_loc5_);
         }
         else if(_loc6_ > _loc5_)
         {
            _loc5_ = _loc6_;
         }
         else
         {
            _loc6_ = _loc5_;
         }
         if(_loc5_ == _loc6_)
         {
            _loc5_ = tlf_internal::updateStartIfInReadOnlyElement(_loc4_,_loc5_);
            _loc6_ = tlf_internal::updateEndIfInReadOnlyElement(_loc4_,_loc6_);
         }
         else
         {
            _loc6_ = tlf_internal::updateEndIfInReadOnlyElement(_loc4_,_loc6_);
         }
         if(!param2 && param1.anchorPosition == _loc5_ && param1.activePosition == _loc6_)
         {
            if(_loc5_ < _loc6_)
            {
               _loc6_ = _loc5_ = Math.min(_loc6_ + 1,_loc4_.textLength - 1);
            }
            else
            {
               _loc5_ = _loc6_ = Math.min(_loc5_ + 1,_loc4_.textLength - 1);
            }
         }
         return param1.updateRange(_loc5_,_loc6_);
      }
      
      private static function moveBackwardHelper(param1:TextRange, param2:Boolean, param3:Function) : Boolean
      {
         var _loc4_:TextFlow = param1.textFlow;
         var _loc5_:int = param1.anchorPosition;
         var _loc6_:int = param1.activePosition;
         if(param2)
         {
            _loc6_ = param3(_loc4_,_loc6_);
         }
         else if(_loc5_ == _loc6_)
         {
            _loc6_ = _loc5_ = param3(_loc4_,_loc5_);
         }
         else if(_loc6_ > _loc5_)
         {
            _loc6_ = _loc5_;
         }
         else
         {
            _loc5_ = _loc6_;
         }
         if(_loc5_ == _loc6_)
         {
            _loc5_ = tlf_internal::updateEndIfInReadOnlyElement(_loc4_,_loc5_);
            _loc6_ = tlf_internal::updateStartIfInReadOnlyElement(_loc4_,_loc6_);
         }
         else
         {
            _loc6_ = tlf_internal::updateStartIfInReadOnlyElement(_loc4_,_loc6_);
         }
         if(!param2 && param1.anchorPosition == _loc5_ && param1.activePosition == _loc6_)
         {
            if(_loc5_ < _loc6_)
            {
               _loc5_ = _loc6_ = Math.max(_loc5_ - 1,0);
            }
            else
            {
               _loc6_ = _loc5_ = Math.max(_loc6_ - 1,0);
            }
         }
         return param1.updateRange(_loc5_,_loc6_);
      }
      
      public static function nextCharacter(param1:TextRange, param2:Boolean = false) : Boolean
      {
         if(validateTextRange(param1))
         {
            if(!adjustForOversetForward(param1))
            {
               moveForwardHelper(param1,param2,nextAtomPosition);
            }
            return true;
         }
         return false;
      }
      
      public static function previousCharacter(param1:TextRange, param2:Boolean = false) : Boolean
      {
         if(validateTextRange(param1))
         {
            if(!adjustForOversetBack(param1))
            {
               moveBackwardHelper(param1,param2,previousAtomPosition);
            }
            return true;
         }
         return false;
      }
      
      public static function nextWord(param1:TextRange, param2:Boolean = false) : Boolean
      {
         if(validateTextRange(param1))
         {
            if(!adjustForOversetForward(param1))
            {
               moveForwardHelper(param1,param2,nextWordPosition);
            }
            return true;
         }
         return false;
      }
      
      public static function previousWord(param1:TextRange, param2:Boolean = false) : Boolean
      {
         if(validateTextRange(param1))
         {
            if(!adjustForOversetBack(param1))
            {
               moveBackwardHelper(param1,param2,previousWordPosition);
            }
            return true;
         }
         return false;
      }
      
      tlf_internal static function computeEndIdx(param1:TextFlowLine, param2:TextFlowLine, param3:String, param4:Boolean, param5:Point) : int
      {
         var _loc6_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = false;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc7_:TextLine = param1.getTextLine(true);
         var _loc8_:TextLine;
         var _loc9_:* = (_loc8_ = param2.getTextLine(true)).getAtomBidiLevel(_loc10_) % 2 != 0;
         if(param1.controller == param2.controller)
         {
            if(param3 != BlockProgression.RL)
            {
               param5.y -= _loc8_.y - _loc7_.y;
            }
            else
            {
               param5.x += _loc7_.x - _loc8_.x;
            }
         }
         else
         {
            _loc11_ = _loc7_.getAtomBounds(0);
            (_loc12_ = new Point()).x = _loc11_.left;
            _loc12_.y = 0;
            _loc12_ = _loc7_.localToGlobal(_loc12_);
            if(param3 != BlockProgression.RL)
            {
               param5.x -= param2.controller.container.x;
               param5.y = _loc12_.y;
            }
            else
            {
               param5.x = _loc12_.x;
               param5.y -= param2.controller.container.y;
            }
         }
         if((_loc10_ = _loc7_.getAtomIndexAtPoint(param5.x,param5.y)) == -1)
         {
            if(param3 != BlockProgression.RL)
            {
               if(!_loc9_)
               {
                  _loc6_ = param5.x <= _loc7_.x ? param1.absoluteStart : param1.absoluteStart + param1.textLength - 1;
               }
               else
               {
                  _loc6_ = param5.x <= _loc7_.x ? param1.absoluteStart + param1.textLength - 1 : param1.absoluteStart;
               }
            }
            else if(!_loc9_)
            {
               _loc6_ = param5.y <= _loc7_.y ? param1.absoluteStart : param1.absoluteStart + param1.textLength - 1;
            }
            else
            {
               _loc6_ = param5.y <= _loc7_.y ? param1.absoluteStart + param1.textLength - 1 : param1.absoluteStart;
            }
         }
         else
         {
            _loc13_ = _loc7_.getAtomBounds(_loc10_);
            _loc14_ = false;
            if(_loc13_)
            {
               (_loc16_ = new Point()).x = _loc13_.x;
               _loc16_.y = _loc13_.y;
               _loc16_ = _loc7_.localToGlobal(_loc16_);
               if(param3 == BlockProgression.RL && _loc7_.getAtomTextRotation(_loc10_) != TextRotation.ROTATE_0)
               {
                  _loc14_ = param5.y > _loc16_.y + _loc13_.height / 2;
               }
               else
               {
                  _loc14_ = param5.x > _loc16_.x + _loc13_.width / 2;
               }
            }
            if(_loc7_.getAtomBidiLevel(_loc10_) % 2 != 0)
            {
               _loc15_ = _loc14_ ? _loc7_.getAtomTextBlockBeginIndex(_loc10_) : _loc7_.getAtomTextBlockEndIndex(_loc10_);
            }
            else if(param4)
            {
               if(_loc14_ == false && _loc10_ > 0)
               {
                  _loc15_ = _loc7_.getAtomTextBlockBeginIndex(_loc10_ - 1);
               }
               else
               {
                  _loc15_ = _loc7_.getAtomTextBlockBeginIndex(_loc10_);
               }
            }
            else
            {
               _loc15_ = _loc14_ ? _loc7_.getAtomTextBlockEndIndex(_loc10_) : _loc7_.getAtomTextBlockBeginIndex(_loc10_);
            }
            _loc6_ = param1.paragraph.getAbsoluteStart() + _loc15_;
         }
         return _loc6_;
      }
      
      public static function nextLine(param1:TextRange, param2:Boolean = false) : Boolean
      {
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:* = false;
         var _loc17_:* = null;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:Number = NaN;
         if(!validateTextRange(param1))
         {
            return false;
         }
         if(adjustForOversetForward(param1))
         {
            return true;
         }
         var _loc3_:TextFlow = param1.textFlow;
         var _loc4_:String = _loc3_.computedFormat.blockProgression;
         var _loc5_:int = param1.anchorPosition;
         var _loc6_:int = param1.activePosition;
         var _loc7_:int = endOfLastController(_loc3_);
         var _loc8_:int = _loc3_.flowComposer.findLineIndexAtPosition(_loc6_);
         var _loc9_:* = _loc3_.computedFormat.direction == Direction.RTL;
         if(_loc8_ < _loc3_.flowComposer.numLines - 1)
         {
            _loc11_ = (_loc10_ = _loc3_.flowComposer.getLineAt(_loc8_)).absoluteStart;
            _loc12_ = _loc6_ - _loc11_;
            _loc13_ = _loc10_.getTextLine(true);
            _loc14_ = _loc10_.paragraph;
            _loc15_ = _loc13_.getAtomIndexAtCharIndex(_loc6_ - _loc14_.getAbsoluteStart());
            _loc16_ = _loc13_.getAtomBidiLevel(_loc15_) % 2 != 0;
            _loc17_ = _loc13_.getAtomBounds(_loc15_);
            _loc18_ = _loc13_.x;
            _loc19_ = _loc17_.left;
            _loc20_ = _loc17_.right;
            if(_loc4_ == BlockProgression.RL)
            {
               _loc18_ = _loc13_.y;
               _loc19_ = _loc17_.top;
               _loc20_ = _loc17_.bottom;
            }
            _loc21_ = new Point();
            if(_loc4_ != BlockProgression.RL)
            {
               if(!_loc9_)
               {
                  _loc21_.x = _loc17_.left;
               }
               else
               {
                  _loc21_.x = _loc17_.right;
               }
               _loc21_.y = 0;
            }
            else
            {
               _loc21_.x = 0;
               if(!_loc9_)
               {
                  _loc21_.y = _loc17_.top;
               }
               else
               {
                  _loc21_.y = _loc17_.bottom;
               }
            }
            _loc21_ = _loc13_.localToGlobal(_loc21_);
            if((_loc22_ = _loc3_.flowComposer.getLineAt(_loc8_ + 1)).absoluteStart >= _loc7_)
            {
               if(!param2)
               {
                  param1.activePosition = param1.anchorPosition = _loc3_.textLength - 1;
               }
               else
               {
                  param1.activePosition = _loc3_.textLength;
               }
               return true;
            }
            _loc25_ = (_loc24_ = (_loc23_ = _loc3_.flowComposer.getControllerAt(_loc3_.flowComposer.numControllers - 1)).absoluteStart) + _loc23_.textLength;
            if(_loc22_.absoluteStart >= _loc24_ && _loc22_.absoluteStart < _loc25_)
            {
               if(_loc22_.tlf_internal::isDamaged())
               {
                  _loc3_.flowComposer.composeToPosition(_loc22_.absoluteStart + 1);
                  if((_loc22_ = _loc3_.flowComposer.getLineAt(_loc8_ + 1)).tlf_internal::isDamaged())
                  {
                     return false;
                  }
               }
               _loc26_ = _loc4_ == BlockProgression.TB ? _loc23_.horizontalScrollPosition : _loc23_.verticalScrollPosition;
               _loc23_.scrollToRange(_loc22_.absoluteStart,_loc22_.absoluteStart + _loc22_.textLength - 1);
               if(_loc4_ == BlockProgression.TB)
               {
                  _loc23_.horizontalScrollPosition = _loc26_;
               }
               else
               {
                  _loc23_.verticalScrollPosition = _loc26_;
               }
            }
            if((_loc6_ = tlf_internal::computeEndIdx(_loc22_,_loc10_,_loc4_,_loc9_,_loc21_)) >= _loc3_.textLength)
            {
               _loc6_ = _loc3_.textLength;
            }
         }
         else
         {
            _loc6_ = _loc3_.textLength;
         }
         if(!param2)
         {
            _loc5_ = _loc6_;
         }
         if(_loc5_ == _loc6_)
         {
            _loc5_ = tlf_internal::updateStartIfInReadOnlyElement(_loc3_,_loc5_);
            _loc6_ = tlf_internal::updateEndIfInReadOnlyElement(_loc3_,_loc6_);
         }
         else
         {
            _loc6_ = tlf_internal::updateEndIfInReadOnlyElement(_loc3_,_loc6_);
         }
         return param1.updateRange(_loc5_,_loc6_);
      }
      
      public static function previousLine(param1:TextRange, param2:Boolean = false) : Boolean
      {
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:Number = NaN;
         if(!validateTextRange(param1))
         {
            return false;
         }
         if(adjustForOversetBack(param1))
         {
            return true;
         }
         var _loc3_:TextFlow = param1.textFlow;
         var _loc4_:String = _loc3_.computedFormat.blockProgression;
         var _loc5_:int = param1.anchorPosition;
         var _loc6_:int = param1.activePosition;
         var _loc7_:int = _loc3_.flowComposer.findLineIndexAtPosition(_loc6_);
         var _loc8_:* = _loc3_.computedFormat.direction == Direction.RTL;
         if(_loc7_ > 0)
         {
            _loc10_ = (_loc9_ = _loc3_.flowComposer.getLineAt(_loc7_)).absoluteStart;
            _loc11_ = _loc6_ - _loc10_;
            _loc12_ = _loc9_.getTextLine(true);
            _loc13_ = _loc9_.paragraph;
            _loc14_ = _loc12_.getAtomIndexAtCharIndex(_loc6_ - _loc13_.getAbsoluteStart());
            _loc15_ = _loc12_.getAtomBounds(_loc14_);
            _loc16_ = _loc12_.x;
            _loc17_ = _loc15_.left;
            _loc18_ = _loc15_.right;
            if(_loc4_ == BlockProgression.RL)
            {
               _loc16_ = _loc12_.y;
               _loc17_ = _loc15_.top;
               _loc18_ = _loc15_.bottom;
            }
            _loc19_ = new Point();
            if(_loc4_ != BlockProgression.RL)
            {
               if(!_loc8_)
               {
                  _loc19_.x = _loc15_.left;
               }
               else
               {
                  _loc19_.x = _loc15_.right;
               }
               _loc19_.y = 0;
            }
            else
            {
               _loc19_.x = 0;
               if(!_loc8_)
               {
                  _loc19_.y = _loc15_.top;
               }
               else
               {
                  _loc19_.y = _loc15_.bottom;
               }
            }
            _loc19_ = _loc12_.localToGlobal(_loc19_);
            _loc20_ = _loc3_.flowComposer.getLineAt(_loc7_ - 1);
            _loc23_ = (_loc22_ = (_loc21_ = _loc3_.flowComposer.getControllerAt(_loc3_.flowComposer.numControllers - 1)).absoluteStart) + _loc21_.textLength;
            if(_loc20_.absoluteStart >= _loc22_ && _loc20_.absoluteStart < _loc23_)
            {
               _loc24_ = _loc4_ == BlockProgression.TB ? _loc21_.horizontalScrollPosition : _loc21_.verticalScrollPosition;
               _loc21_.scrollToRange(_loc20_.absoluteStart,_loc20_.absoluteStart + _loc20_.textLength - 1);
               if(_loc4_ == BlockProgression.TB)
               {
                  _loc21_.horizontalScrollPosition = _loc24_;
               }
               else
               {
                  _loc21_.verticalScrollPosition = _loc24_;
               }
            }
            _loc6_ = tlf_internal::computeEndIdx(_loc20_,_loc9_,_loc4_,_loc8_,_loc19_);
         }
         else
         {
            _loc6_ = 0;
         }
         if(!param2)
         {
            _loc5_ = _loc6_;
         }
         if(_loc5_ == _loc6_)
         {
            _loc5_ = tlf_internal::updateStartIfInReadOnlyElement(_loc3_,_loc5_);
            _loc6_ = tlf_internal::updateEndIfInReadOnlyElement(_loc3_,_loc6_);
         }
         else
         {
            _loc6_ = tlf_internal::updateEndIfInReadOnlyElement(_loc3_,_loc6_);
         }
         return param1.updateRange(_loc5_,_loc6_);
      }
      
      public static function nextPage(param1:TextRange, param2:Boolean = false) : Boolean
      {
         var _loc3_:* = null;
         var _loc12_:int = 0;
         var _loc15_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         if(!validateTextRange(param1))
         {
            return false;
         }
         var _loc5_:int;
         var _loc4_:TextFlow;
         if((_loc5_ = (_loc4_ = param1.textFlow).flowComposer.findControllerIndexAtPosition(param1.activePosition)) != _loc4_.flowComposer.numControllers - 1)
         {
            param1.activePosition = _loc4_.flowComposer.getControllerAt(_loc5_ + 1).absoluteStart;
            if(!param2)
            {
               param1.anchorPosition = param1.activePosition;
            }
            return true;
         }
         if(!isScrollable(_loc4_,param1.activePosition))
         {
            return false;
         }
         if(adjustForOversetForward(param1))
         {
            return true;
         }
         var _loc6_:int = param1.absoluteStart;
         var _loc7_:int = param1.absoluteEnd;
         var _loc8_:int = _loc4_.flowComposer.findLineIndexAtPosition(_loc7_);
         var _loc9_:TextFlowLine = _loc4_.flowComposer.getLineAt(_loc8_);
         var _loc10_:int = _loc4_.flowComposer.getLineAt(_loc8_).absoluteStart;
         var _loc11_:int = _loc7_ - _loc10_;
         var _loc13_:TextFlowLine = _loc9_;
         var _loc14_:* = _loc4_.computedFormat.blockProgression == BlockProgression.RL;
         _loc3_ = _loc4_.flowComposer.getControllerAt(_loc4_.flowComposer.numControllers - 1);
         if(_loc14_)
         {
            _loc15_ = _loc3_.compositionWidth * _loc4_.configuration.scrollPagePercentage;
         }
         else
         {
            _loc15_ = _loc3_.compositionHeight * _loc4_.configuration.scrollPagePercentage;
         }
         if(_loc14_)
         {
            _loc17_ = _loc3_.tlf_internal::contentWidth;
            if(_loc3_.horizontalScrollPosition - _loc15_ < -_loc17_)
            {
               _loc3_.horizontalScrollPosition = -_loc17_;
               _loc12_ = _loc4_.flowComposer.numLines - 1;
               _loc13_ = _loc4_.flowComposer.getLineAt(_loc12_);
            }
            else
            {
               _loc18_ = _loc3_.horizontalScrollPosition;
               _loc3_.horizontalScrollPosition -= _loc15_;
               _loc19_ = _loc3_.horizontalScrollPosition;
               if(_loc18_ == _loc19_)
               {
                  _loc12_ = _loc4_.flowComposer.numLines - 1;
                  _loc13_ = _loc4_.flowComposer.getLineAt(_loc12_);
               }
               else
               {
                  _loc12_ = _loc8_;
                  while(true)
                  {
                     if(_loc12_ < _loc4_.flowComposer.numLines - 1)
                     {
                        _loc12_++;
                        _loc13_ = _loc4_.flowComposer.getLineAt(_loc12_);
                        if(_loc9_.x - _loc13_.x < _loc18_ - _loc19_)
                        {
                           continue;
                        }
                     }
                  }
               }
            }
         }
         else
         {
            _loc20_ = _loc3_.tlf_internal::contentHeight;
            if(_loc3_.verticalScrollPosition + _loc15_ > _loc20_)
            {
               _loc3_.verticalScrollPosition = _loc20_;
               _loc12_ = _loc4_.flowComposer.numLines - 1;
               _loc13_ = _loc4_.flowComposer.getLineAt(_loc12_);
            }
            else
            {
               _loc21_ = _loc3_.verticalScrollPosition;
               _loc3_.verticalScrollPosition += _loc15_;
               if((_loc22_ = _loc3_.verticalScrollPosition) == _loc21_)
               {
                  _loc12_ = _loc4_.flowComposer.numLines - 1;
                  _loc13_ = _loc4_.flowComposer.getLineAt(_loc12_);
               }
               else
               {
                  _loc12_ = _loc8_;
                  while(_loc12_ < _loc4_.flowComposer.numLines - 1)
                  {
                     _loc12_++;
                     if((_loc13_ = _loc4_.flowComposer.getLineAt(_loc12_)).y - _loc9_.y >= _loc22_ - _loc21_)
                     {
                        break;
                     }
                  }
               }
            }
         }
         _loc7_ = _loc13_.absoluteStart + _loc11_;
         var _loc16_:int = _loc13_.absoluteStart + _loc13_.textLength - 1;
         if(_loc7_ > _loc16_)
         {
            _loc7_ = _loc16_;
         }
         if(!param2)
         {
            _loc6_ = _loc7_;
         }
         if(_loc6_ == _loc7_)
         {
            _loc6_ = tlf_internal::updateEndIfInReadOnlyElement(_loc4_,_loc6_);
            _loc7_ = tlf_internal::updateStartIfInReadOnlyElement(_loc4_,_loc7_);
         }
         else
         {
            _loc7_ = tlf_internal::updateStartIfInReadOnlyElement(_loc4_,_loc7_);
         }
         return param1.updateRange(_loc6_,_loc7_);
      }
      
      public static function previousPage(param1:TextRange, param2:Boolean = false) : Boolean
      {
         var _loc13_:int = 0;
         var _loc16_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         if(!validateTextRange(param1))
         {
            return false;
         }
         var _loc3_:TextFlow = param1.textFlow;
         var _loc4_:int = _loc3_.flowComposer.findControllerIndexAtPosition(param1.activePosition);
         var _loc5_:ContainerController = _loc3_.flowComposer.getControllerAt(_loc4_);
         var _loc6_:TextFlowLine = _loc3_.flowComposer.findLineAtPosition(_loc5_.absoluteStart);
         if(param1.activePosition <= _loc5_.absoluteStart + _loc6_.textLength)
         {
            if(_loc4_ == 0)
            {
               return false;
            }
            param1.activePosition = _loc3_.flowComposer.getControllerAt(_loc4_ - 1).absoluteStart;
            if(!param2)
            {
               param1.anchorPosition = param1.activePosition;
            }
            return true;
         }
         if(_loc4_ != _loc3_.flowComposer.numControllers - 1)
         {
            param1.activePosition = _loc5_.absoluteStart;
            if(!param2)
            {
               param1.anchorPosition = param1.activePosition;
            }
            return true;
         }
         if(!isScrollable(_loc3_,param1.activePosition))
         {
            return false;
         }
         if(adjustForOversetBack(param1))
         {
            return true;
         }
         var _loc7_:int = param1.absoluteStart;
         var _loc8_:int = param1.absoluteEnd;
         var _loc9_:int = _loc3_.flowComposer.findLineIndexAtPosition(_loc8_);
         var _loc10_:TextFlowLine = _loc3_.flowComposer.getLineAt(_loc9_);
         var _loc11_:int = _loc3_.flowComposer.getLineAt(_loc9_).absoluteStart;
         var _loc12_:int = _loc8_ - _loc11_;
         var _loc14_:TextFlowLine = _loc10_;
         var _loc15_:* = _loc3_.computedFormat.blockProgression == BlockProgression.RL;
         _loc5_ = _loc3_.flowComposer.getControllerAt(_loc3_.flowComposer.numControllers - 1);
         if(_loc15_)
         {
            _loc16_ = _loc5_.compositionWidth * _loc3_.configuration.scrollPagePercentage;
         }
         else
         {
            _loc16_ = _loc5_.compositionHeight * _loc3_.configuration.scrollPagePercentage;
         }
         if(_loc15_)
         {
            if(_loc5_.horizontalScrollPosition + _loc16_ + _loc5_.compositionWidth > 0)
            {
               _loc5_.horizontalScrollPosition = 0;
               _loc13_ = _loc3_.flowComposer.findLineIndexAtPosition(_loc5_.absoluteStart);
               _loc14_ = _loc3_.flowComposer.getLineAt(_loc13_);
            }
            else
            {
               _loc18_ = _loc5_.horizontalScrollPosition;
               _loc5_.horizontalScrollPosition += _loc16_;
               _loc19_ = _loc5_.horizontalScrollPosition;
               if(_loc18_ == _loc19_)
               {
                  _loc13_ = _loc3_.flowComposer.findLineIndexAtPosition(_loc5_.absoluteStart);
                  _loc14_ = _loc3_.flowComposer.getLineAt(_loc13_);
               }
               else
               {
                  _loc13_ = _loc9_;
                  while(true)
                  {
                     if(_loc13_ > 0)
                     {
                        continue;
                     }
                  }
               }
            }
         }
         else if(_loc5_.verticalScrollPosition - _loc16_ + _loc5_.compositionHeight < 0)
         {
            _loc5_.verticalScrollPosition = 0;
            _loc13_ = _loc3_.flowComposer.findLineIndexAtPosition(_loc5_.absoluteStart);
            _loc14_ = _loc3_.flowComposer.getLineAt(_loc13_);
         }
         else
         {
            _loc20_ = _loc5_.verticalScrollPosition;
            _loc5_.verticalScrollPosition -= _loc16_;
            _loc21_ = _loc5_.verticalScrollPosition;
            if(_loc20_ == _loc21_)
            {
               _loc13_ = _loc3_.flowComposer.findLineIndexAtPosition(_loc5_.absoluteStart);
               _loc14_ = _loc3_.flowComposer.getLineAt(_loc13_);
            }
            else
            {
               _loc13_ = _loc9_;
               while(_loc13_ > 0)
               {
                  _loc13_--;
                  _loc14_ = _loc3_.flowComposer.getLineAt(_loc13_);
                  if(_loc10_.y - _loc14_.y >= _loc20_ - _loc21_ || _loc14_.absoluteStart < _loc5_.absoluteStart)
                  {
                     break;
                  }
               }
            }
         }
         _loc8_ = _loc14_.absoluteStart + _loc12_;
         var _loc17_:int = _loc14_.absoluteStart + _loc14_.textLength - 1;
         if(_loc8_ > _loc17_)
         {
            _loc8_ = _loc17_;
         }
         if(!param2)
         {
            _loc7_ = _loc8_;
         }
         if(_loc7_ == _loc8_)
         {
            _loc7_ = tlf_internal::updateEndIfInReadOnlyElement(_loc3_,_loc7_);
            _loc8_ = tlf_internal::updateStartIfInReadOnlyElement(_loc3_,_loc8_);
         }
         else
         {
            _loc8_ = tlf_internal::updateStartIfInReadOnlyElement(_loc3_,_loc8_);
         }
         return param1.updateRange(_loc7_,_loc8_);
      }
      
      public static function endOfLine(param1:TextRange, param2:Boolean = false) : Boolean
      {
         if(!validateTextRange(param1))
         {
            return false;
         }
         var _loc3_:TextFlow = param1.textFlow;
         checkCompose(_loc3_.flowComposer,param1.absoluteEnd);
         var _loc4_:int = param1.anchorPosition;
         var _loc5_:int = param1.activePosition;
         var _loc6_:int = _loc3_.flowComposer.findLineIndexAtPosition(_loc5_);
         var _loc7_:int;
         var _loc8_:int = (_loc7_ = _loc3_.flowComposer.getLineAt(_loc6_).absoluteStart) + _loc3_.flowComposer.getLineAt(_loc6_).textLength - 1;
         var _loc9_:FlowLeafElement;
         var _loc10_:ParagraphElement = (_loc9_ = _loc3_.findLeaf(_loc5_)).getParagraph();
         if(CharacterUtil.isWhitespace(_loc10_.getCharCodeAtPosition(_loc8_ - _loc10_.getAbsoluteStart())))
         {
            _loc5_ = _loc8_;
         }
         else
         {
            _loc5_ = _loc8_ + 1;
         }
         if(!param2)
         {
            _loc4_ = _loc5_;
         }
         if(_loc4_ == _loc5_)
         {
            _loc4_ = tlf_internal::updateEndIfInReadOnlyElement(_loc3_,_loc4_);
            _loc5_ = tlf_internal::updateStartIfInReadOnlyElement(_loc3_,_loc5_);
         }
         else
         {
            _loc5_ = tlf_internal::updateStartIfInReadOnlyElement(_loc3_,_loc5_);
         }
         return param1.updateRange(_loc4_,_loc5_);
      }
      
      public static function startOfLine(param1:TextRange, param2:Boolean = false) : Boolean
      {
         if(!validateTextRange(param1))
         {
            return false;
         }
         var _loc3_:TextFlow = param1.textFlow;
         checkCompose(_loc3_.flowComposer,param1.absoluteEnd);
         var _loc4_:int = param1.anchorPosition;
         var _loc5_:int = param1.activePosition;
         var _loc6_:int = _loc3_.flowComposer.findLineIndexAtPosition(_loc5_);
         var _loc7_:int;
         _loc5_ = _loc7_ = _loc3_.flowComposer.getLineAt(_loc6_).absoluteStart;
         if(!param2)
         {
            _loc4_ = _loc5_;
         }
         if(_loc4_ == _loc5_)
         {
            _loc4_ = tlf_internal::updateEndIfInReadOnlyElement(_loc3_,_loc4_);
            _loc5_ = tlf_internal::updateStartIfInReadOnlyElement(_loc3_,_loc5_);
         }
         else
         {
            _loc5_ = tlf_internal::updateStartIfInReadOnlyElement(_loc3_,_loc5_);
         }
         return param1.updateRange(_loc4_,_loc5_);
      }
      
      public static function endOfDocument(param1:TextRange, param2:Boolean = false) : Boolean
      {
         if(!validateTextRange(param1))
         {
            return false;
         }
         var _loc3_:TextFlow = param1.textFlow;
         var _loc4_:int = param1.anchorPosition;
         var _loc5_:int = param1.activePosition;
         _loc5_ = _loc3_.textLength;
         if(!param2)
         {
            _loc4_ = _loc5_;
         }
         if(_loc4_ == _loc5_)
         {
            _loc4_ = tlf_internal::updateEndIfInReadOnlyElement(_loc3_,_loc4_);
            _loc5_ = tlf_internal::updateStartIfInReadOnlyElement(_loc3_,_loc5_);
         }
         else
         {
            _loc5_ = tlf_internal::updateStartIfInReadOnlyElement(_loc3_,_loc5_);
         }
         return param1.updateRange(_loc4_,_loc5_);
      }
      
      public static function startOfDocument(param1:TextRange, param2:Boolean = false) : Boolean
      {
         var _loc3_:int = param1.anchorPosition;
         var _loc4_:int = 0;
         if(!param2)
         {
            _loc3_ = _loc4_;
         }
         if(_loc3_ == _loc4_)
         {
            _loc3_ = tlf_internal::updateEndIfInReadOnlyElement(param1.textFlow,_loc3_);
            _loc4_ = tlf_internal::updateStartIfInReadOnlyElement(param1.textFlow,_loc4_);
         }
         else
         {
            _loc4_ = tlf_internal::updateStartIfInReadOnlyElement(param1.textFlow,_loc4_);
         }
         return param1.updateRange(_loc3_,_loc4_);
      }
      
      public static function startOfParagraph(param1:TextRange, param2:Boolean = false) : Boolean
      {
         var _loc3_:int = param1.anchorPosition;
         var _loc4_:int = param1.activePosition;
         var _loc6_:ParagraphElement;
         var _loc5_:FlowLeafElement;
         _loc4_ = (_loc6_ = (_loc5_ = param1.textFlow.findLeaf(_loc4_)).getParagraph()).getAbsoluteStart();
         if(!param2)
         {
            _loc3_ = _loc4_;
         }
         if(_loc3_ == _loc4_)
         {
            _loc3_ = tlf_internal::updateStartIfInReadOnlyElement(param1.textFlow,_loc3_);
            _loc4_ = tlf_internal::updateEndIfInReadOnlyElement(param1.textFlow,_loc4_);
         }
         else
         {
            _loc4_ = tlf_internal::updateEndIfInReadOnlyElement(param1.textFlow,_loc4_);
         }
         return param1.updateRange(_loc3_,_loc4_);
      }
      
      public static function endOfParagraph(param1:TextRange, param2:Boolean = false) : Boolean
      {
         if(!validateTextRange(param1))
         {
            return false;
         }
         var _loc3_:int = param1.anchorPosition;
         var _loc4_:int = param1.activePosition;
         var _loc6_:ParagraphElement;
         var _loc5_:FlowLeafElement;
         _loc4_ = (_loc6_ = (_loc5_ = param1.textFlow.findLeaf(_loc4_)).getParagraph()).getAbsoluteStart() + _loc6_.textLength - 1;
         if(!param2)
         {
            _loc3_ = _loc4_;
         }
         if(_loc3_ == _loc4_)
         {
            _loc3_ = tlf_internal::updateStartIfInReadOnlyElement(param1.textFlow,_loc3_);
            _loc4_ = tlf_internal::updateEndIfInReadOnlyElement(param1.textFlow,_loc4_);
         }
         else
         {
            _loc4_ = tlf_internal::updateEndIfInReadOnlyElement(param1.textFlow,_loc4_);
         }
         return param1.updateRange(_loc3_,_loc4_);
      }
      
      private static function adjustForOversetForward(param1:TextRange) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:IFlowComposer = param1.textFlow.flowComposer;
         var _loc3_:* = null;
         checkCompose(_loc2_,param1.absoluteEnd);
         if(param1.absoluteEnd > _loc2_.damageAbsoluteStart - 1)
         {
            clampToFit(param1,_loc2_.damageAbsoluteStart - 1);
            return true;
         }
         if(Boolean(_loc2_) && Boolean(_loc2_.numControllers))
         {
            if((_loc4_ = _loc2_.findControllerIndexAtPosition(param1.absoluteEnd)) >= 0)
            {
               _loc3_ = _loc2_.getControllerAt(_loc4_);
            }
            if(_loc4_ == _loc2_.numControllers - 1)
            {
               if(_loc3_.absoluteStart + _loc3_.textLength <= param1.absoluteEnd && _loc3_.absoluteStart + _loc3_.textLength != param1.textFlow.textLength)
               {
                  _loc3_ = null;
               }
            }
         }
         if(!_loc3_)
         {
            param1.anchorPosition = param1.textFlow.textLength;
            param1.activePosition = param1.anchorPosition;
            return true;
         }
         return false;
      }
      
      private static function clampToFit(param1:TextRange, param2:int) : void
      {
         if(param2 < 0)
         {
            param2 = 0;
         }
         param1.anchorPosition = Math.min(param1.anchorPosition,param2);
         param1.activePosition = Math.min(param1.activePosition,param2);
      }
      
      private static function adjustForOversetBack(param1:TextRange) : Boolean
      {
         var _loc2_:IFlowComposer = param1.textFlow.flowComposer;
         if(_loc2_)
         {
            checkCompose(_loc2_,param1.absoluteEnd);
            if(param1.absoluteEnd > _loc2_.damageAbsoluteStart - 1)
            {
               clampToFit(param1,_loc2_.damageAbsoluteStart - 1);
               return true;
            }
            if(_loc2_.findControllerIndexAtPosition(param1.absoluteEnd) == -1)
            {
               param1.anchorPosition = endOfLastController(param1.textFlow);
               param1.activePosition = param1.anchorPosition;
               return true;
            }
         }
         return false;
      }
      
      private static function checkCompose(param1:IFlowComposer, param2:int) : void
      {
         if(param1.damageAbsoluteStart <= param2)
         {
            param1.composeToPosition(param2);
         }
      }
      
      private static function endOfLastController(param1:TextFlow) : int
      {
         var _loc2_:IFlowComposer = param1.flowComposer;
         if(!_loc2_ || _loc2_.numControllers <= 0)
         {
            return 0;
         }
         var _loc3_:ContainerController = _loc2_.getControllerAt(_loc2_.numControllers - 1);
         return _loc3_.absoluteStart + Math.max(_loc3_.textLength - 1,0);
      }
      
      private static function isOverset(param1:TextFlow, param2:int) : Boolean
      {
         var _loc3_:IFlowComposer = param1.flowComposer;
         return !_loc3_ || _loc3_.findControllerIndexAtPosition(param2) == -1;
      }
      
      private static function isScrollable(param1:TextFlow, param2:int) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:IFlowComposer = param1.flowComposer;
         if(!_loc3_)
         {
            return false;
         }
         var _loc4_:int;
         if((_loc4_ = _loc3_.findControllerIndexAtPosition(param2)) >= 0)
         {
            return (_loc6_ = (_loc5_ = _loc3_.getControllerAt(_loc4_)).rootElement.computedFormat.blockProgression) == BlockProgression.TB && _loc5_.verticalScrollPolicy != ScrollPolicy.OFF || _loc6_ == BlockProgression.RL && _loc5_.horizontalScrollPolicy != ScrollPolicy.OFF;
         }
         return false;
      }
   }
}
