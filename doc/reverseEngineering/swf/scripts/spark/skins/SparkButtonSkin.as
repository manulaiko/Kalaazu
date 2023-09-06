package spark.skins
{
   import flash.events.Event;
   import mx.core.IVisualElement;
   import mx.events.PropertyChangeEvent;
   import mx.styles.IStyleClient;
   import spark.components.Group;
   import spark.components.IconPlacement;
   import spark.components.supportClasses.ButtonBase;
   import spark.components.supportClasses.LabelAndIconLayout;
   import spark.core.IDisplayText;
   import spark.primitives.BitmapImage;
   
   public class SparkButtonSkin extends SparkSkin
   {
       
      
      private var iconChanged:Boolean = true;
      
      private var iconPlacementChanged:Boolean = false;
      
      private var groupPaddingChanged:Boolean = true;
      
      private var iconGroup:Group;
      
      private var _icon:Object;
      
      private var prevTextAlign:String;
      
      private var _autoIconManagement:Boolean = true;
      
      private var _gap:Number = 6;
      
      private var _hostComponent:ButtonBase;
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var _1184053038labelDisplay:IDisplayText;
      
      private var _iconGroupPaddingLeft:Number = 10;
      
      private var _iconGroupPaddingRight:Number = 10;
      
      private var _iconGroupPaddingTop:Number = 2;
      
      private var _iconGroupPaddingBottom:Number = 2;
      
      public function SparkButtonSkin()
      {
         super();
      }
      
      public function get autoIconManagement() : Boolean
      {
         return this._autoIconManagement;
      }
      
      public function set autoIconManagement(param1:Boolean) : void
      {
         this._autoIconManagement = param1;
         invalidateProperties();
      }
      
      public function get gap() : Number
      {
         return this._gap;
      }
      
      public function set gap(param1:Number) : void
      {
         this._gap = param1;
         this.groupPaddingChanged = true;
         invalidateProperties();
      }
      
      public function set hostComponent(param1:ButtonBase) : void
      {
         if(this._hostComponent)
         {
            this._hostComponent.removeEventListener("contentChange",this.contentChangeHandler);
         }
         this._hostComponent = param1;
         if(param1)
         {
            this._hostComponent.addEventListener("contentChange",this.contentChangeHandler);
         }
      }
      
      public function get hostComponent() : ButtonBase
      {
         return this._hostComponent;
      }
      
      public function get iconGroupPaddingLeft() : Number
      {
         return this._iconGroupPaddingLeft;
      }
      
      public function set iconGroupPaddingLeft(param1:Number) : void
      {
         this._iconGroupPaddingLeft = param1;
         this.groupPaddingChanged = true;
         invalidateProperties();
      }
      
      public function get iconGroupPaddingRight() : Number
      {
         return this._iconGroupPaddingRight;
      }
      
      public function set iconGroupPaddingRight(param1:Number) : void
      {
         this._iconGroupPaddingRight = param1;
         this.groupPaddingChanged = true;
         invalidateProperties();
      }
      
      public function get iconGroupPaddingTop() : Number
      {
         return this._iconGroupPaddingTop;
      }
      
      public function set iconGroupPaddingTop(param1:Number) : void
      {
         this._iconGroupPaddingTop = param1;
         this.groupPaddingChanged = true;
         invalidateProperties();
      }
      
      public function get iconGroupPaddingBottom() : Number
      {
         return this._iconGroupPaddingBottom;
      }
      
      public function set iconGroupPaddingBottom(param1:Number) : void
      {
         this._iconGroupPaddingBottom = param1;
         this.groupPaddingChanged = true;
         invalidateProperties();
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         super.commitProperties();
         if(!this.autoIconManagement)
         {
            return;
         }
         if(this.iconChanged)
         {
            _loc1_ = getStyle("icon");
            if(this._icon == _loc1_)
            {
               this.iconChanged = false;
            }
            else
            {
               this._icon = _loc1_;
            }
         }
         if(!(this.iconChanged || this.iconPlacementChanged || this.groupPaddingChanged))
         {
            return;
         }
         if(this._icon)
         {
            if(this.iconChanged)
            {
               this.constructIconParts(true);
            }
            _loc2_ = this.iconGroup.layout as LabelAndIconLayout;
            if(this.groupPaddingChanged || this.iconChanged)
            {
               _loc2_.gap = this._gap;
               _loc2_.paddingLeft = this._iconGroupPaddingLeft;
               _loc2_.paddingRight = this._iconGroupPaddingRight;
               _loc2_.paddingTop = this._iconGroupPaddingTop;
               _loc2_.paddingBottom = this._iconGroupPaddingBottom;
            }
            if(this.iconPlacementChanged || this.iconChanged)
            {
               _loc2_.iconPlacement = getStyle("iconPlacement");
               this.alignLabelForPlacement();
            }
         }
         else
         {
            this.constructIconParts(false);
         }
         this.iconChanged = false;
         this.iconPlacementChanged = false;
         this.groupPaddingChanged = false;
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc2_:Boolean = !param1 || param1 == "styleName";
         if(_loc2_ || param1 == "iconPlacement")
         {
            this.iconPlacementChanged = true;
            invalidateProperties();
         }
         if(_loc2_ || param1 == "icon")
         {
            this.iconChanged = true;
            invalidateProperties();
         }
         super.styleChanged(param1);
      }
      
      private function constructIconParts(param1:Boolean) : void
      {
         if(!this.autoIconManagement)
         {
            return;
         }
         if(param1)
         {
            if(!this.iconDisplay)
            {
               this.iconDisplay = new BitmapImage();
            }
            if(!this.iconGroup)
            {
               this.iconGroup = new Group();
               this.iconGroup.left = this.iconGroup.right = 0;
               this.iconGroup.top = this.iconGroup.bottom = 0;
               this.iconGroup.layout = new LabelAndIconLayout();
            }
            this.iconGroup.addElement(this.iconDisplay);
            this.iconGroup.clipAndEnableScrolling = true;
            addElement(this.iconGroup);
            if(Boolean(this.labelDisplay) && IVisualElement(this.labelDisplay).parent != this.iconGroup)
            {
               this.iconGroup.addElement(IVisualElement(this.labelDisplay));
               if(this.labelDisplay is IStyleClient)
               {
                  this.prevTextAlign = IStyleClient(this.labelDisplay).getStyle("textAlign");
               }
            }
         }
         else
         {
            if(Boolean(this.iconDisplay) && Boolean(this.iconDisplay.parent))
            {
               this.iconGroup.removeElement(this.iconDisplay);
            }
            if(Boolean(this.iconGroup) && Boolean(this.iconGroup.parent))
            {
               removeElement(this.iconGroup);
               addElement(IVisualElement(this.labelDisplay));
               if(this.labelDisplay is IStyleClient)
               {
                  IStyleClient(this.labelDisplay).setStyle("textAlign",this.prevTextAlign);
               }
            }
         }
      }
      
      private function alignLabelForPlacement() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this.labelDisplay is IStyleClient)
         {
            _loc1_ = getStyle("iconPlacement");
            _loc2_ = _loc1_ == IconPlacement.LEFT || _loc1_ == IconPlacement.RIGHT ? "start" : "center";
            IStyleClient(this.labelDisplay).setStyle("textAlign",_loc2_);
         }
      }
      
      protected function contentChangeHandler(param1:Event) : void
      {
         if(this.labelDisplay)
         {
            IVisualElement(this.labelDisplay).includeInLayout = this.labelDisplay.text != null && Boolean(this.labelDisplay.text.length);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconDisplay() : BitmapImage
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : IDisplayText
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:IDisplayText) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
   }
}
