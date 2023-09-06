package flashx.textLayout.operations
{
   import flashx.textLayout.edit.SelectionState;
   import flashx.textLayout.elements.FlowElement;
   import flashx.textLayout.elements.FlowGroupElement;
   import flashx.textLayout.elements.SpanElement;
   import flashx.textLayout.tlf_internal;
   
   public class FlowElementOperation extends FlowTextOperation
   {
       
      
      private var nestLevel:int;
      
      private var absStart:int;
      
      private var absEnd:int;
      
      private var origAbsStart:int;
      
      private var origAbsEnd:int;
      
      private var firstTime:Boolean = true;
      
      private var splitAtStart:Boolean = false;
      
      private var splitAtEnd:Boolean = false;
      
      private var _relStart:int = 0;
      
      private var _relEnd:int = -1;
      
      public function FlowElementOperation(param1:SelectionState, param2:FlowElement, param3:int = 0, param4:int = -1)
      {
         super(param1);
         this.initialize(param2,param3,param4);
      }
      
      private function initialize(param1:FlowElement, param2:int, param3:int) : void
      {
         this.targetElement = param1;
         this.relativeEnd = param3;
         this.relativeStart = param2;
         if(param3 == -1)
         {
            param3 = param1.textLength;
         }
         if(param1 is SpanElement && Boolean(SpanElement(param1).tlf_internal::hasParagraphTerminator) && param3 == param1.textLength - 1)
         {
            param3 += 1;
         }
         var _loc4_:* = param1.getAbsoluteStart() + param2;
         this.absStart = param1.getAbsoluteStart() + param2;
         this.origAbsStart = _loc4_;
         _loc4_ = this.absStart - param2 + param3;
         this.absEnd = this.absStart - param2 + param3;
         this.origAbsEnd = _loc4_;
      }
      
      public function get targetElement() : FlowElement
      {
         var _loc3_:* = null;
         var _loc1_:FlowElement = originalSelectionState.textFlow;
         var _loc2_:int = this.nestLevel;
         while(_loc2_ > 0)
         {
            _loc3_ = _loc1_ as FlowGroupElement;
            _loc1_ = _loc3_.getChildAt(_loc3_.findChildIndexAtPosition(this.absStart - _loc1_.getAbsoluteStart()));
            _loc2_--;
         }
         return _loc1_;
      }
      
      public function set targetElement(param1:FlowElement) : void
      {
         this.nestLevel = 0;
         var _loc2_:FlowElement = param1;
         while(_loc2_.parent != null)
         {
            ++this.nestLevel;
            _loc2_ = _loc2_.parent;
         }
      }
      
      public function get relativeStart() : int
      {
         return this._relStart;
      }
      
      public function set relativeStart(param1:int) : void
      {
         this._relStart = param1;
      }
      
      public function get relativeEnd() : int
      {
         return this._relEnd;
      }
      
      public function set relativeEnd(param1:int) : void
      {
         this._relEnd = param1;
      }
      
      protected function getTargetElement() : FlowElement
      {
         var _loc3_:* = null;
         var _loc1_:FlowElement = this.targetElement;
         var _loc2_:int = _loc1_.getAbsoluteStart();
         if(this.absEnd != _loc2_ + _loc1_.textLength)
         {
            _loc3_ = _loc1_.splitAtPosition(this.absEnd - _loc2_);
            if(this.firstTime && _loc3_ != _loc1_)
            {
               this.splitAtEnd = true;
            }
         }
         if(this.absStart != _loc2_)
         {
            _loc3_ = _loc1_.splitAtPosition(this.absStart - _loc2_);
            if(_loc3_ != _loc1_)
            {
               if(this.firstTime)
               {
                  this.splitAtStart = true;
               }
               _loc1_ = _loc3_;
            }
         }
         this.firstTime = false;
         return _loc1_;
      }
      
      protected function adjustForDoOperation(param1:FlowElement) : void
      {
         this.absStart = param1.getAbsoluteStart();
         this.absEnd = this.absStart + param1.textLength;
      }
      
      protected function adjustForUndoOperation(param1:FlowElement) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if((this.splitAtEnd || this.splitAtStart) && param1 is FlowGroupElement)
         {
            _loc2_ = param1.parent.getChildIndex(param1);
            if(this.splitAtEnd)
            {
               _loc3_ = param1.parent.getChildAt(_loc2_ + 1) as FlowGroupElement;
               while(_loc3_.numChildren)
               {
                  _loc4_ = _loc3_.getChildAt(0);
                  _loc3_.removeChildAt(0);
                  FlowGroupElement(param1).addChild(_loc4_);
               }
               param1.parent.removeChildAt(_loc2_ + 1);
            }
            if(this.splitAtStart)
            {
               _loc3_ = param1.parent.getChildAt(_loc2_ - 1) as FlowGroupElement;
               while(FlowGroupElement(param1).numChildren)
               {
                  _loc4_ = FlowGroupElement(param1).getChildAt(0);
                  FlowGroupElement(param1).removeChildAt(0);
                  _loc3_.addChild(_loc4_);
               }
               param1.parent.removeChildAt(_loc2_);
            }
         }
         this.absStart = this.origAbsStart;
         this.absEnd = this.origAbsEnd;
      }
   }
}
