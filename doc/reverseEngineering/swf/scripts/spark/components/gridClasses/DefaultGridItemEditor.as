package spark.components.gridClasses
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IUITextField;
   import mx.events.PropertyChangeEvent;
   import spark.components.TextArea;
   import spark.core.IEditableText;
   
   public class DefaultGridItemEditor extends GridItemEditor
   {
       
      
      private var _1004197030textArea:TextArea;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function DefaultGridItemEditor()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._DefaultGridItemEditor_TextArea1_i()];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      override public function get value() : Object
      {
         return this.textArea.text;
      }
      
      override public function set value(param1:Object) : void
      {
         this.textArea.text = param1 != null ? param1.toString() : "";
      }
      
      override public function prepare() : void
      {
         var _loc8_:Number = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         super.prepare();
         var _loc1_:Rectangle = column.grid.getCellBounds(rowIndex,columnIndex);
         var _loc2_:IEditableText = this.textArea.textDisplay;
         var _loc3_:IGridItemRenderer = dataGrid.grid.getItemRendererAt(rowIndex,columnIndex);
         if(_loc3_ is IUITextField)
         {
            _loc2_.multiline = IUITextField(_loc3_).multiline;
            _loc2_.lineBreak = !!IUITextField(_loc3_).wordWrap ? "toFit" : "explicit";
         }
         else if("multiline" in _loc3_)
         {
            _loc2_.multiline = _loc3_["multiline"];
         }
         else
         {
            _loc2_.multiline = false;
         }
         if(_loc2_.multiline == false && _loc2_.lineBreak == "explicit" && this.isTextAlignStart())
         {
            this.textArea.width = NaN;
            this.textArea.widthInChars = NaN;
            _loc8_ = 6;
            _loc9_ = dataGrid.grid.getVisibleRect();
            _loc10_ = dataGrid.grid.localToGlobal(_loc1_.topLeft);
            this.textArea.maxWidth = Math.min(_loc9_.right - _loc10_.x - 1,_loc8_ * 0) - 2;
         }
         else
         {
            this.textArea.width = _loc1_.width + 1;
         }
         this.textArea.minWidth = _loc1_.width + 1;
         this.textArea.height = _loc1_.height + 1;
         var _loc4_:int = this.textArea.getStyle("paddingTop");
         var _loc5_:int = this.textArea.getStyle("paddingLeft");
         var _loc6_:int = this.textArea.getStyle("paddingBottom");
         var _loc7_:int = this.textArea.getStyle("paddingRight");
         this.textArea.setStyle("paddingTop",_loc4_ + 3);
         this.textArea.setStyle("paddingLeft",_loc5_ + 3);
         this.textArea.setStyle("paddingBottom",_loc6_ + 3);
         this.textArea.setStyle("paddingRight",_loc7_ + 4);
      }
      
      override public function setFocus() : void
      {
         this.textArea.setFocus();
         if(this.textArea.textDisplay.multiline)
         {
            this.textArea.selectAll();
         }
      }
      
      private function isTextAlignStart() : Boolean
      {
         var _loc1_:String = this.textArea.getStyle("textAlign");
         if(_loc1_ == "start")
         {
            return true;
         }
         if(_loc1_ == "end")
         {
            return false;
         }
         var _loc2_:String = this.textArea.getStyle("direction");
         if(_loc2_ == "ltr" && _loc1_ == "left" || _loc2_ == "rtl" && _loc1_ == "right")
         {
            return true;
         }
         return false;
      }
      
      private function _DefaultGridItemEditor_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("verticalScrollPolicy","off");
         _loc1_.id = "textArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textArea = _loc1_;
         BindingManager.executeBindings(this,"textArea",this.textArea);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get textArea() : TextArea
      {
         return this._1004197030textArea;
      }
      
      public function set textArea(param1:TextArea) : void
      {
         var _loc2_:Object = this._1004197030textArea;
         if(_loc2_ !== param1)
         {
            this._1004197030textArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textArea",_loc2_,param1));
            }
         }
      }
   }
}
