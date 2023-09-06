package flashx.textLayout.operations
{
   import flashx.textLayout.edit.ElementRange;
   import flashx.textLayout.edit.ParaEdit;
   import flashx.textLayout.edit.PointFormat;
   import flashx.textLayout.edit.SelectionState;
   import flashx.textLayout.elements.FlowElement;
   import flashx.textLayout.elements.FlowGroupElement;
   import flashx.textLayout.elements.FlowLeafElement;
   import flashx.textLayout.elements.InlineGraphicElement;
   import flashx.textLayout.elements.SubParagraphGroupElementBase;
   import flashx.textLayout.formats.ITextLayoutFormat;
   import flashx.textLayout.tlf_internal;
   
   public class InsertInlineGraphicOperation extends FlowTextOperation
   {
       
      
      private var delSelOp:DeleteTextOperation;
      
      private var _source:Object;
      
      private var imageWidth:Object;
      
      private var imageHeight:Object;
      
      private var _options:Object;
      
      private var selPos:int = 0;
      
      private var _inlineGraphicElement:InlineGraphicElement;
      
      public function InsertInlineGraphicOperation(param1:SelectionState, param2:Object, param3:Object, param4:Object, param5:Object = null)
      {
         super(param1);
         if(absoluteStart != absoluteEnd)
         {
            this.delSelOp = new DeleteTextOperation(param1);
         }
         this._source = param2;
         this._options = param5;
         this.imageWidth = param3;
         this.imageHeight = param4;
      }
      
      public function get source() : Object
      {
         return this._source;
      }
      
      public function set source(param1:Object) : void
      {
         this._source = param1;
      }
      
      public function get width() : Object
      {
         return this.imageWidth;
      }
      
      public function set width(param1:Object) : void
      {
         this.imageWidth = param1;
      }
      
      public function get height() : Object
      {
         return this.imageHeight;
      }
      
      public function set height(param1:Object) : void
      {
         this.imageHeight = param1;
      }
      
      public function get options() : Object
      {
         return this._options;
      }
      
      public function set options(param1:Object) : void
      {
         this._options = param1;
      }
      
      public function get newInlineGraphicElement() : InlineGraphicElement
      {
         return this._inlineGraphicElement;
      }
      
      override public function doOperation() : Boolean
      {
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         this.selPos = absoluteStart;
         if(this.delSelOp)
         {
            _loc5_ = textFlow.findLeaf(absoluteStart);
            _loc6_ = new PointFormat(textFlow.findLeaf(absoluteStart).format);
            if(this.delSelOp.doOperation())
            {
               _loc1_ = _loc6_;
            }
         }
         else
         {
            _loc1_ = originalSelectionState.pointFormat;
         }
         var _loc2_:ElementRange = ElementRange.createElementRange(textFlow,this.selPos,this.selPos);
         var _loc3_:FlowElement = _loc2_.firstLeaf;
         var _loc4_:FlowGroupElement = _loc3_.parent;
         while(_loc4_ is SubParagraphGroupElementBase)
         {
            if(!((_loc7_ = this.selPos - _loc4_.getAbsoluteStart()) == 0 && !(_loc4_ as SubParagraphGroupElementBase).tlf_internal::acceptTextBefore() || _loc7_ == _loc4_.textLength && !(_loc4_ as SubParagraphGroupElementBase).tlf_internal::acceptTextAfter()))
            {
               break;
            }
            _loc4_ = _loc4_.parent;
         }
         this._inlineGraphicElement = ParaEdit.createImage(_loc4_,this.selPos - _loc4_.getAbsoluteStart(),this._source,this.imageWidth,this.imageHeight,this.options,_loc1_);
         if(false)
         {
            textFlow.interactionManager.notifyInsertOrDelete(absoluteStart,1);
         }
         return true;
      }
      
      override public function undo() : SelectionState
      {
         var _loc1_:FlowElement = textFlow.findLeaf(this.selPos);
         var _loc2_:FlowGroupElement = _loc1_.parent;
         var _loc3_:int = _loc1_.parent.getChildIndex(_loc1_);
         _loc2_.replaceChildren(_loc3_,_loc3_ + 1,null);
         if(false)
         {
            textFlow.interactionManager.notifyInsertOrDelete(absoluteStart,-1);
         }
         return !!this.delSelOp ? this.delSelOp.undo() : originalSelectionState;
      }
      
      override public function redo() : SelectionState
      {
         this.doOperation();
         return new SelectionState(textFlow,this.selPos + 1,this.selPos + 1,null);
      }
   }
}
