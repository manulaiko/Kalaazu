package flashx.textLayout.operations
{
   import flashx.textLayout.edit.SelectionState;
   import flashx.textLayout.elements.FlowElement;
   import flashx.textLayout.elements.FlowGroupElement;
   import flashx.textLayout.elements.InlineGraphicElement;
   import flashx.textLayout.tlf_internal;
   
   public class ModifyInlineGraphicOperation extends FlowTextOperation
   {
       
      
      private var _source:Object;
      
      private var imageWidth:Object;
      
      private var imageHeight:Object;
      
      private var _options:Object;
      
      private var oldImage:FlowElement;
      
      private var selPos:int = 0;
      
      public function ModifyInlineGraphicOperation(param1:SelectionState, param2:Object, param3:Object, param4:Object, param5:Object = null)
      {
         super(param1);
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
      
      override public function doOperation() : Boolean
      {
         this.selPos = absoluteStart;
         var _loc1_:InlineGraphicElement = textFlow.findLeaf(this.selPos) as InlineGraphicElement;
         if(_loc1_)
         {
            this.oldImage = _loc1_.shallowCopy(0,1);
            if(_loc1_.width != this.imageWidth)
            {
               _loc1_.width = this.imageWidth;
            }
            if(_loc1_.height != this.imageHeight)
            {
               _loc1_.height = this.imageHeight;
            }
            if(_loc1_.source != this._source)
            {
               _loc1_.source = this._source;
            }
            if(Boolean(this.options) && _loc1_.float != this.options.toString())
            {
               _loc1_.float = this.options.toString();
            }
         }
         return true;
      }
      
      override public function undo() : SelectionState
      {
         var _loc1_:FlowElement = textFlow.findLeaf(this.selPos);
         var _loc2_:FlowGroupElement = _loc1_.parent;
         var _loc3_:int = _loc1_.parent.getChildIndex(_loc1_);
         _loc2_.replaceChildren(_loc3_,_loc3_ + 1,this.oldImage);
         return originalSelectionState;
      }
   }
}
