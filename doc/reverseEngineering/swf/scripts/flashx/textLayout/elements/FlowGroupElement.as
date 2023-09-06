package flashx.textLayout.elements
{
   import flash.text.engine.ContentElement;
   import flash.text.engine.GroupElement;
   import flash.utils.getQualifiedClassName;
   import flashx.textLayout.compose.FlowDamageType;
   import flashx.textLayout.container.ContainerController;
   import flashx.textLayout.events.ModelChange;
   import flashx.textLayout.formats.FormatValue;
   import flashx.textLayout.formats.ITextLayoutFormat;
   import flashx.textLayout.tlf_internal;
   
   public class FlowGroupElement extends FlowElement
   {
       
      
      private var _childArray:Array;
      
      private var _singleChild:FlowElement;
      
      private var _numChildren:int;
      
      public function FlowGroupElement()
      {
         super();
         this._numChildren = 0;
      }
      
      private static function getNestedArgCount(param1:Object) : uint
      {
         return param1 is Array ? uint(param1.length) : 1;
      }
      
      private static function getNestedArg(param1:Object, param2:uint) : FlowElement
      {
         return (param1 is Array ? param1[param2] : param1) as FlowElement;
      }
      
      override public function deepCopy(param1:int = 0, param2:int = -1) : FlowElement
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param2 == -1)
         {
            param2 = textLength;
         }
         var _loc3_:FlowGroupElement = shallowCopy(param1,param2) as FlowGroupElement;
         var _loc5_:int = 0;
         while(_loc5_ < this._numChildren)
         {
            _loc6_ = this.getChildAt(_loc5_);
            if(param1 - _loc6_.parentRelativeStart < _loc6_.textLength && param2 - _loc6_.parentRelativeStart > 0)
            {
               _loc4_ = _loc6_.deepCopy(param1 - _loc6_.parentRelativeStart,param2 - _loc6_.parentRelativeStart);
               _loc3_.replaceChildren(_loc3_.numChildren,_loc3_.numChildren,_loc4_);
               if(_loc3_.numChildren > 1)
               {
                  if((_loc7_ = _loc3_.getChildAt(_loc3_.numChildren - 2)).textLength == 0)
                  {
                     _loc3_.replaceChildren(_loc3_.numChildren - 2,_loc3_.numChildren - 1);
                  }
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      override public function getText(param1:int = 0, param2:int = -1, param3:String = "\n") : String
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:String = super.getText();
         if(param2 == -1)
         {
            param2 = textLength;
         }
         var _loc5_:int = param1;
         var _loc6_:int = this.findChildIndexAtPosition(param1);
         while(_loc6_ < this._numChildren && _loc5_ < param2)
         {
            _loc7_ = this.getChildAt(_loc6_);
            _loc8_ = _loc5_ - _loc7_.parentRelativeStart;
            _loc9_ = Math.min(param2 - _loc7_.parentRelativeStart,_loc7_.textLength);
            _loc4_ += _loc7_.getText(_loc8_,_loc9_,param3);
            _loc5_ += _loc9_ - _loc8_;
            if(param3 && _loc7_ is ParagraphFormattedElement && _loc5_ < param2)
            {
               _loc4_ += param3;
            }
            _loc6_++;
         }
         return _loc4_;
      }
      
      override tlf_internal function formatChanged(param1:Boolean = true) : void
      {
         var _loc3_:* = null;
         super.tlf_internal::formatChanged(param1);
         var _loc2_:int = 0;
         while(_loc2_ < this._numChildren)
         {
            _loc3_ = this.getChildAt(_loc2_);
            _loc3_.tlf_internal::formatChanged(false);
            _loc2_++;
         }
      }
      
      override tlf_internal function styleSelectorChanged() : void
      {
         super.tlf_internal::styleSelectorChanged();
         this.tlf_internal::formatChanged(false);
      }
      
      public function get mxmlChildren() : Array
      {
         return this._numChildren == 0 ? null : (this._numChildren == 1 ? [this._singleChild] : this._childArray.slice());
      }
      
      public function set mxmlChildren(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         this.replaceChildren(0,this._numChildren);
         var _loc2_:* = {};
         for each(_loc3_ in param1)
         {
            if(_loc3_ is FlowElement)
            {
               if(_loc3_ is ParagraphFormattedElement)
               {
                  _loc2_ = {};
               }
               else if(_loc2_ is ContainerFormattedElement)
               {
                  _loc2_ = new ParagraphElement();
                  _loc2_.tlf_internal::impliedElement = true;
                  this.replaceChildren(this._numChildren,this._numChildren,_loc2_);
               }
               if(_loc3_ is SpanElement || _loc3_ is SubParagraphGroupElementBase)
               {
                  _loc3_.bindableElement = true;
               }
               _loc2_.replaceChildren(_loc2_.numChildren,_loc2_.numChildren,FlowElement(_loc3_));
            }
            else if(_loc3_ is String)
            {
               (_loc4_ = new SpanElement()).text = String(_loc3_);
               _loc4_.tlf_internal::bindableElement = true;
               _loc4_.tlf_internal::impliedElement = true;
               if(_loc2_ is ContainerFormattedElement)
               {
                  _loc2_ = new ParagraphElement();
                  this.replaceChildren(this._numChildren,this._numChildren,_loc2_);
                  _loc2_.tlf_internal::impliedElement = true;
               }
               _loc2_.replaceChildren(_loc2_.numChildren,_loc2_.numChildren,_loc4_);
            }
            else if(_loc3_ != null)
            {
               throw new TypeError(GlobalSettings.resourceStringFunction("badMXMLChildrenArgument",[getQualifiedClassName(_loc3_)]));
            }
         }
      }
      
      public function get numChildren() : int
      {
         return this._numChildren;
      }
      
      public function getChildIndex(param1:FlowElement) : int
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc2_:int = this._numChildren - 1;
         if(_loc2_ <= 0)
         {
            return this._singleChild == param1 ? 0 : -1;
         }
         var _loc3_:int = 0;
         while(_loc3_ <= _loc2_)
         {
            _loc4_ = (_loc3_ + _loc2_) / 2;
            if((_loc5_ = this._childArray[_loc4_]).parentRelativeStart == param1.parentRelativeStart)
            {
               if(_loc5_ == param1)
               {
                  return _loc4_;
               }
               if(_loc5_.textLength == 0)
               {
                  _loc6_ = _loc4_;
                  while(_loc6_ < this._numChildren)
                  {
                     if((_loc5_ = this._childArray[_loc6_]) == param1)
                     {
                        return _loc6_;
                     }
                     if(_loc5_.textLength != 0)
                     {
                        break;
                     }
                     _loc6_++;
                  }
               }
               while(_loc4_ > 0)
               {
                  _loc4_--;
                  if((_loc5_ = this._childArray[_loc4_]) == param1)
                  {
                     return _loc4_;
                  }
                  if(_loc5_.textLength != 0)
                  {
                     break;
                  }
               }
               return -1;
            }
            if(_loc5_.parentRelativeStart < param1.parentRelativeStart)
            {
               _loc3_ = _loc4_ + 1;
            }
            else
            {
               _loc2_ = _loc4_ - 1;
            }
         }
         return -1;
      }
      
      public function getChildAt(param1:int) : FlowElement
      {
         if(this._numChildren > 1)
         {
            return this._childArray[param1];
         }
         return param1 == 0 ? this._singleChild : null;
      }
      
      tlf_internal function getNextLeafHelper(param1:FlowGroupElement, param2:FlowElement) : FlowLeafElement
      {
         var _loc3_:int = this.getChildIndex(param2);
         if(_loc3_ == -1)
         {
            return null;
         }
         if(_loc3_ == this._numChildren - 1)
         {
            if(param1 == this || !parent)
            {
               return null;
            }
            return parent.tlf_internal::getNextLeafHelper(param1,this);
         }
         param2 = this.getChildAt(_loc3_ + 1);
         return param2 is FlowLeafElement ? FlowLeafElement(param2) : FlowGroupElement(param2).getFirstLeaf();
      }
      
      tlf_internal function getPreviousLeafHelper(param1:FlowGroupElement, param2:FlowElement) : FlowLeafElement
      {
         var _loc3_:int = this.getChildIndex(param2);
         if(_loc3_ == -1)
         {
            return null;
         }
         if(_loc3_ == 0)
         {
            if(param1 == this || !parent)
            {
               return null;
            }
            return parent.tlf_internal::getPreviousLeafHelper(param1,this);
         }
         param2 = this.getChildAt(_loc3_ - 1);
         return param2 is FlowLeafElement ? FlowLeafElement(param2) : FlowGroupElement(param2).getLastLeaf();
      }
      
      public function findLeaf(param1:int) : FlowLeafElement
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = this.findChildIndexAtPosition(param1);
         if(_loc3_ != -1)
         {
            while(_loc4_ = this.getChildAt(_loc3_++))
            {
               _loc5_ = param1 - _loc4_.parentRelativeStart;
               if(_loc4_ is FlowGroupElement)
               {
                  _loc2_ = FlowGroupElement(_loc4_).findLeaf(_loc5_);
               }
               else if(_loc5_ >= 0 && _loc5_ < _loc4_.textLength || _loc4_.textLength == 0 && this._numChildren == 1)
               {
                  _loc2_ = FlowLeafElement(_loc4_);
               }
               if(!(!_loc2_ && !_loc4_.textLength))
               {
                  break;
               }
            }
         }
         return _loc2_;
      }
      
      public function findChildIndexAtPosition(param1:int) : int
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = this._numChildren - 1;
         while(_loc2_ <= _loc3_)
         {
            _loc4_ = (_loc2_ + _loc3_) / 2;
            if((_loc5_ = this.getChildAt(_loc4_)).parentRelativeStart <= param1)
            {
               if(_loc5_.parentRelativeStart == param1)
               {
                  while(_loc4_ != 0)
                  {
                     if((_loc5_ = this.getChildAt(_loc4_ - 1)).textLength != 0)
                     {
                        break;
                     }
                     _loc4_--;
                  }
                  return _loc4_;
               }
               if(_loc5_.parentRelativeStart + _loc5_.textLength > param1)
               {
                  return _loc4_;
               }
               _loc2_ = _loc4_ + 1;
            }
            else
            {
               _loc3_ = _loc4_ - 1;
            }
         }
         return -1;
      }
      
      public function getFirstLeaf() : FlowLeafElement
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._numChildren > 1)
         {
            _loc1_ = 0;
            while(_loc1_ < this._numChildren)
            {
               _loc2_ = this._childArray[_loc1_];
               _loc3_ = _loc2_ is FlowGroupElement ? FlowGroupElement(_loc2_).getFirstLeaf() : FlowLeafElement(_loc2_);
               if(_loc3_)
               {
                  return _loc3_;
               }
               _loc1_++;
            }
            return null;
         }
         return this._numChildren == 0 ? null : (this._singleChild is FlowGroupElement ? FlowGroupElement(this._singleChild).getFirstLeaf() : FlowLeafElement(this._singleChild));
      }
      
      public function getLastLeaf() : FlowLeafElement
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._numChildren > 1)
         {
            _loc1_ = this._numChildren;
            while(_loc1_ != 0)
            {
               _loc2_ = this._childArray[_loc1_ - 1];
               _loc3_ = _loc2_ is FlowGroupElement ? FlowGroupElement(_loc2_).getLastLeaf() : FlowLeafElement(_loc2_);
               if(_loc3_)
               {
                  return _loc3_;
               }
               _loc1_--;
            }
            return null;
         }
         return this._numChildren == 0 ? null : (this._singleChild is FlowGroupElement ? FlowGroupElement(this._singleChild).getLastLeaf() : FlowLeafElement(this._singleChild));
      }
      
      override public function getCharAtPosition(param1:int) : String
      {
         var _loc2_:FlowLeafElement = this.findLeaf(param1);
         return !!_loc2_ ? _loc2_.getCharAtPosition(param1 - _loc2_.getElementRelativeStart(this)) : "";
      }
      
      override tlf_internal function applyFunctionToElements(param1:Function) : Boolean
      {
         if(param1(this))
         {
            return true;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this._numChildren)
         {
            if(this.getChildAt(_loc2_).tlf_internal::applyFunctionToElements(param1))
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      tlf_internal function removeBlockElement(param1:FlowElement, param2:ContentElement) : void
      {
      }
      
      tlf_internal function insertBlockElement(param1:FlowElement, param2:ContentElement) : void
      {
      }
      
      tlf_internal function hasBlockElement() : Boolean
      {
         return false;
      }
      
      tlf_internal function createContentAsGroup() : GroupElement
      {
         return null;
      }
      
      tlf_internal function addChildAfterInternal(param1:FlowElement, param2:FlowElement) : void
      {
         if(this._numChildren > 1)
         {
            this._childArray.splice(this._childArray.indexOf(param1) + 1,0,param2);
         }
         else
         {
            this._childArray = [this._singleChild,param2];
            this._singleChild = null;
         }
         ++this._numChildren;
         param2.tlf_internal::setParentAndRelativeStartOnly(this,param1.parentRelativeEnd);
      }
      
      tlf_internal function canOwnFlowElement(param1:FlowElement) : Boolean
      {
         return !(param1 is TextFlow) && !(param1 is FlowLeafElement) && !(param1 is SubParagraphGroupElementBase) && !(param1 is ListItemElement);
      }
      
      public function replaceChildren(param1:int, param2:int, ... rest) : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc17_:int = 0;
         var _loc18_:* = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         if(param1 > this._numChildren || param2 > this._numChildren)
         {
            throw RangeError(GlobalSettings.resourceStringFunction("badReplaceChildrenIndex"));
         }
         var _loc4_:int;
         var _loc5_:int = (_loc4_ = getAbsoluteStart()) + (param1 == this._numChildren ? textLength : this.getChildAt(param1).parentRelativeStart);
         var _loc6_:int = param1 == this._numChildren ? textLength : this.getChildAt(param1).parentRelativeStart;
         if(param1 < param2)
         {
            _loc14_ = 0;
            while(param1 < param2)
            {
               _loc13_ = this.getChildAt(param1);
               this.tlf_internal::modelChanged(ModelChange.ELEMENT_REMOVAL,_loc13_,_loc13_.parentRelativeStart,_loc13_.textLength);
               _loc14_ += _loc13_.textLength;
               _loc13_.tlf_internal::setParentAndRelativeStart(null,0);
               if(this._numChildren == 1)
               {
                  this._singleChild = null;
                  this._numChildren = 0;
               }
               else
               {
                  this._childArray.splice(param1,1);
                  --this._numChildren;
                  if(this._numChildren == 1)
                  {
                     this._singleChild = this._childArray[0];
                     this._childArray = null;
                  }
               }
               param2--;
            }
            if(_loc14_)
            {
               while(param2 < this._numChildren)
               {
                  _loc13_ = this.getChildAt(param2);
                  _loc13_.tlf_internal::setParentRelativeStart(_loc13_.parentRelativeStart - _loc14_);
                  param2++;
               }
               tlf_internal::updateLengths(_loc5_,-_loc14_,true);
               tlf_internal::deleteContainerText(_loc6_ + _loc14_,_loc14_);
            }
         }
         var _loc7_:int = 0;
         for each(_loc12_ in rest)
         {
            if(_loc12_)
            {
               _loc15_ = getNestedArgCount(_loc12_);
               _loc11_ = 0;
               while(_loc11_ < _loc15_)
               {
                  if(_loc10_ = getNestedArg(_loc12_,_loc11_))
                  {
                     if(_loc16_ = _loc10_.parent)
                     {
                        if(_loc16_ == this)
                        {
                           _loc17_ = this.getChildIndex(_loc10_);
                           _loc16_.removeChild(_loc10_);
                           _loc4_ = getAbsoluteStart();
                           if(_loc17_ <= param1)
                           {
                              param1--;
                              _loc5_ = _loc4_ + (param1 == this._numChildren ? textLength : this.getChildAt(param1).parentRelativeStart);
                              _loc6_ = param1 == this._numChildren ? textLength : this.getChildAt(param1).parentRelativeStart;
                           }
                        }
                        else
                        {
                           _loc16_.removeChild(_loc10_);
                           _loc5_ = (_loc4_ = getAbsoluteStart()) + (param1 == this._numChildren ? textLength : this.getChildAt(param1).parentRelativeStart);
                           _loc6_ = param1 == this._numChildren ? textLength : this.getChildAt(param1).parentRelativeStart;
                        }
                     }
                     if(!this.tlf_internal::canOwnFlowElement(_loc10_))
                     {
                        throw ArgumentError(GlobalSettings.resourceStringFunction("invalidChildType"));
                     }
                     if(_loc7_ == 0)
                     {
                        _loc9_ = _loc10_;
                     }
                     else if(_loc7_ == 1)
                     {
                        _loc8_ = [_loc9_,_loc10_];
                     }
                     else
                     {
                        _loc8_.push(_loc10_);
                     }
                     _loc7_++;
                  }
                  _loc11_++;
               }
            }
         }
         if(_loc7_)
         {
            _loc18_ = 0;
            _loc11_ = 0;
            while(_loc11_ < _loc7_)
            {
               _loc10_ = _loc7_ == 1 ? _loc9_ : _loc8_[_loc11_];
               if(this._numChildren == 0)
               {
                  this._singleChild = _loc10_;
               }
               else if(this._numChildren > 1)
               {
                  this._childArray.splice(param1,0,_loc10_);
               }
               else
               {
                  this._childArray = param1 == 0 ? [_loc10_,this._singleChild] : [this._singleChild,_loc10_];
                  this._singleChild = null;
               }
               ++this._numChildren;
               _loc10_.tlf_internal::setParentAndRelativeStart(this,_loc6_ + _loc18_);
               _loc18_ += _loc10_.textLength;
               param1++;
               _loc11_++;
            }
            if(_loc18_)
            {
               while(param1 < this._numChildren)
               {
                  _loc13_ = this.getChildAt(param1++);
                  _loc13_.tlf_internal::setParentRelativeStart(_loc13_.parentRelativeStart + _loc18_);
               }
               tlf_internal::updateLengths(_loc5_,_loc18_,true);
               if(_loc19_ = tlf_internal::getEnclosingController(_loc6_))
               {
                  ContainerController(_loc19_).tlf_internal::setTextLength(_loc19_.textLength + _loc18_);
               }
            }
            _loc11_ = 0;
            while(_loc11_ < _loc7_)
            {
               _loc10_ = _loc7_ == 1 ? _loc9_ : _loc8_[_loc11_];
               this.tlf_internal::modelChanged(ModelChange.ELEMENT_ADDED,_loc10_,_loc10_.parentRelativeStart,_loc10_.textLength);
               _loc11_++;
            }
         }
         else if((_loc20_ = getTextFlow()) != null)
         {
            if(param1 < this._numChildren)
            {
               _loc11_ = _loc4_ + this.getChildAt(param1).parentRelativeStart;
            }
            else if(param1 > 1)
            {
               _loc10_ = this.getChildAt(param1 - 1);
               _loc11_ = _loc4_ + _loc10_.parentRelativeStart + _loc10_.textLength - 1;
            }
            else if((_loc11_ = _loc4_) >= _loc20_.textLength)
            {
               _loc11_--;
            }
            _loc20_.tlf_internal::damage(_loc11_,1,FlowDamageType.INVALID,false);
         }
      }
      
      public function addChild(param1:FlowElement) : FlowElement
      {
         this.replaceChildren(this._numChildren,this._numChildren,param1);
         return param1;
      }
      
      public function addChildAt(param1:uint, param2:FlowElement) : FlowElement
      {
         this.replaceChildren(param1,param1,param2);
         return param2;
      }
      
      public function removeChild(param1:FlowElement) : FlowElement
      {
         var _loc2_:int = this.getChildIndex(param1);
         if(_loc2_ == -1)
         {
            throw ArgumentError(GlobalSettings.resourceStringFunction("badRemoveChild"));
         }
         this.removeChildAt(_loc2_);
         return param1;
      }
      
      public function removeChildAt(param1:uint) : FlowElement
      {
         var _loc2_:FlowElement = this.getChildAt(param1);
         this.replaceChildren(param1,param1 + 1);
         return _loc2_;
      }
      
      public function splitAtIndex(param1:int) : FlowGroupElement
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(param1 > this._numChildren)
         {
            throw RangeError(GlobalSettings.resourceStringFunction("invalidSplitAtIndex"));
         }
         var _loc2_:FlowGroupElement = shallowCopy() as FlowGroupElement;
         var _loc3_:int = this._numChildren - param1;
         if(_loc3_ == 1)
         {
            _loc2_.addChild(this.removeChildAt(param1));
         }
         else if(_loc3_ != 0)
         {
            _loc4_ = this._childArray.slice(param1);
            this.replaceChildren(param1,this._numChildren - 1);
            _loc2_.replaceChildren(0,0,_loc4_);
         }
         if(parent)
         {
            _loc5_ = parent.getChildIndex(this);
            parent.replaceChildren(_loc5_ + 1,_loc5_ + 1,_loc2_);
         }
         return _loc2_;
      }
      
      override public function splitAtPosition(param1:int) : FlowElement
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1 < 0 || param1 > textLength)
         {
            throw RangeError(GlobalSettings.resourceStringFunction("invalidSplitAtPosition"));
         }
         if(param1 == textLength)
         {
            _loc2_ = this._numChildren;
         }
         else
         {
            _loc2_ = this.findChildIndexAtPosition(param1);
            _loc3_ = this.getChildAt(_loc2_);
            if(_loc3_.parentRelativeStart != param1)
            {
               if(_loc3_ is FlowGroupElement)
               {
                  FlowGroupElement(_loc3_).splitAtPosition(param1 - _loc3_.parentRelativeStart);
               }
               else
               {
                  SpanElement(_loc3_).splitAtPosition(param1 - _loc3_.parentRelativeStart);
               }
               _loc2_++;
            }
         }
         return this.splitAtIndex(_loc2_);
      }
      
      override tlf_internal function normalizeRange(param1:uint, param2:uint) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:int = this.findChildIndexAtPosition(param1);
         if(_loc3_ != -1 && _loc3_ < this._numChildren)
         {
            _loc4_ = this.getChildAt(_loc3_);
            param1 -= _loc4_.parentRelativeStart;
            while(true)
            {
               _loc5_ = _loc4_.parentRelativeStart + _loc4_.textLength;
               _loc4_.tlf_internal::normalizeRange(param1,param2 - _loc4_.parentRelativeStart);
               _loc6_ = _loc4_.parentRelativeStart + _loc4_.textLength;
               param2 += _loc6_ - _loc5_;
               if(_loc4_.textLength == 0 && !_loc4_.tlf_internal::bindableElement)
               {
                  this.replaceChildren(_loc3_,_loc3_ + 1);
               }
               else
               {
                  _loc3_++;
               }
               if(_loc3_ == this._numChildren)
               {
                  break;
               }
               if((_loc4_ = this.getChildAt(_loc3_)).parentRelativeStart > param2)
               {
                  break;
               }
               param1 = 0;
            }
         }
      }
      
      override tlf_internal function applyWhiteSpaceCollapse(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = undefined;
         var _loc5_:* = null;
         if(param1 == null)
         {
            param1 = this.computedFormat.whiteSpaceCollapse;
         }
         else
         {
            _loc3_ = this.tlf_internal::formatForCascade;
            if((_loc4_ = !!_loc3_ ? _loc3_.whiteSpaceCollapse : undefined) !== undefined && _loc4_ != FormatValue.INHERIT)
            {
               param1 = _loc4_;
            }
         }
         var _loc2_:int = 0;
         while(_loc2_ < this._numChildren)
         {
            (_loc5_ = this.getChildAt(_loc2_)).tlf_internal::applyWhiteSpaceCollapse(param1);
            if(_loc5_.parent == this)
            {
               _loc2_++;
            }
         }
         if(textLength == 0 && Boolean(tlf_internal::impliedElement) && parent != null)
         {
            parent.removeChild(this);
         }
         super.tlf_internal::applyWhiteSpaceCollapse(param1);
      }
      
      override tlf_internal function appendElementsForDelayedUpdate(param1:TextFlow, param2:String) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._numChildren)
         {
            (_loc4_ = this.getChildAt(_loc3_)).tlf_internal::appendElementsForDelayedUpdate(param1,param2);
            _loc3_++;
         }
      }
   }
}
