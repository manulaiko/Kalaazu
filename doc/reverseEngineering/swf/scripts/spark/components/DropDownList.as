package spark.components
{
   import mx.core.IVisualElement;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import spark.components.supportClasses.DropDownListBase;
   import spark.components.supportClasses.TextBase;
   import spark.core.IDisplayText;
   import spark.utils.LabelUtil;
   
   public class DropDownList extends DropDownListBase
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      [SkinPart(required="false")]
      public var labelDisplay:IDisplayText;
      
      private var labelChanged:Boolean = false;
      
      private var labelDisplayExplicitWidth:Number;
      
      private var labelDisplayExplicitHeight:Number;
      
      private var sizeSetByTypicalItem:Boolean;
      
      private var _prompt:String = "";
      
      public function DropDownList()
      {
         super();
      }
      
      override public function get baselinePosition() : Number
      {
         return getBaselinePositionForPart(this.labelDisplay as IVisualElement);
      }
      
      public function get prompt() : String
      {
         return this._prompt;
      }
      
      public function set prompt(param1:String) : void
      {
         if(this._prompt == param1)
         {
            return;
         }
         this._prompt = param1;
         this.labelChanged = true;
         invalidateProperties();
      }
      
      override public function set typicalItem(param1:Object) : void
      {
         super.typicalItem = param1;
         invalidateSize();
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.labelChanged)
         {
            this.labelChanged = false;
            this.mx_internal::updateLabelDisplay();
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.labelDisplay)
         {
            this.labelChanged = true;
            invalidateProperties();
         }
      }
      
      override protected function measure() : void
      {
         var _loc1_:TextBase = this.labelDisplay as TextBase;
         if(Boolean(_loc1_) && typicalItem != null)
         {
            if(!this.sizeSetByTypicalItem)
            {
               this.labelDisplayExplicitWidth = _loc1_.explicitWidth;
               this.labelDisplayExplicitHeight = _loc1_.explicitHeight;
               this.sizeSetByTypicalItem = true;
            }
            _loc1_.explicitWidth = NaN;
            _loc1_.explicitHeight = NaN;
            this.mx_internal::updateLabelDisplay(typicalItem);
            UIComponentGlobals.mx_internal::layoutManager.validateClient(skin,true);
            _loc1_.width = _loc1_.measuredWidth;
            _loc1_.height = _loc1_.measuredHeight;
            this.mx_internal::updateLabelDisplay();
         }
         else if(_loc1_ && this.sizeSetByTypicalItem && typicalItem == null)
         {
            _loc1_.width = this.labelDisplayExplicitWidth;
            _loc1_.height = this.labelDisplayExplicitHeight;
            this.sizeSetByTypicalItem = false;
         }
         super.measure();
      }
      
      override mx_internal function updateLabelDisplay(param1:* = undefined) : void
      {
         if(this.labelDisplay)
         {
            if(param1 == undefined)
            {
               param1 = selectedItem;
            }
            if(param1 != null && param1 != undefined)
            {
               this.labelDisplay.text = LabelUtil.itemToLabel(param1,labelField,labelFunction);
            }
            else
            {
               this.labelDisplay.text = this.prompt;
            }
         }
      }
   }
}
