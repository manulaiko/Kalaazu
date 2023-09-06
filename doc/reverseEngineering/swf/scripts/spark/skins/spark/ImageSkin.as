package spark.skins.spark
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Image;
   import spark.components.supportClasses.Range;
   import spark.components.supportClasses.Skin;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   public class ImageSkin extends Skin implements IStateClient2
   {
       
      
      private var _1332194002background:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1783571425brokenImageIcon:BitmapImage;
      
      private var _2024940825imageDisplay:BitmapImage;
      
      private var _1076871582progressIndicator:Range;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml_Assets_swf___brokenImage_818059060:Class;
      
      private var _213507019hostComponent:Image;
      
      public function ImageSkin()
      {
         this._embed_mxml_Assets_swf___brokenImage_818059060 = ImageSkin__embed_mxml_Assets_swf___brokenImage_818059060;
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._ImageSkin_Rect1_i(),this._ImageSkin_BitmapImage1_i()];
         this.currentState = "uninitialized";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ImageSkin_BitmapImage2_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ImageSkin_Range1_i);
         states = [new State({
            "name":"uninitialized",
            "overrides":[]
         }),new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
            })]
         }),new State({
            "name":"ready",
            "overrides":[]
         }),new State({
            "name":"invalid",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         })];
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
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         if(isNaN(getStyle("backgroundColor")))
         {
            this.background.visible = false;
            this.background.includeInLayout = false;
         }
         else
         {
            this.background.visible = true;
            this.background.includeInLayout = true;
            this.bgFill.color = getStyle("backgroundColor");
            this.bgFill.alpha = getStyle("backgroundAlpha");
         }
         super.updateDisplayList(param1,param2);
      }
      
      private function _ImageSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ImageSkin_SolidColor1_i();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _ImageSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _ImageSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"imageDisplay");
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _ImageSkin_Range1_i() : Range
      {
         var _loc1_:Range = new Range();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.layoutDirection = "ltr";
         _loc1_.setStyle("skinClass",ImageLoadingSkin);
         _loc1_.id = "progressIndicator";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.progressIndicator = _loc1_;
         BindingManager.executeBindings(this,"progressIndicator",this.progressIndicator);
         return _loc1_;
      }
      
      private function _ImageSkin_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml_Assets_swf___brokenImage_818059060;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"brokenImageIcon");
         this.brokenImageIcon = _loc1_;
         BindingManager.executeBindings(this,"brokenImageIcon",this.brokenImageIcon);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : Rect
      {
         return this._1332194002background;
      }
      
      public function set background(param1:Rect) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgFill() : SolidColor
      {
         return this._1391998104bgFill;
      }
      
      public function set bgFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1391998104bgFill;
         if(_loc2_ !== param1)
         {
            this._1391998104bgFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get brokenImageIcon() : BitmapImage
      {
         return this._1783571425brokenImageIcon;
      }
      
      public function set brokenImageIcon(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1783571425brokenImageIcon;
         if(_loc2_ !== param1)
         {
            this._1783571425brokenImageIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"brokenImageIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : BitmapImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2024940825imageDisplay;
         if(_loc2_ !== param1)
         {
            this._2024940825imageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get progressIndicator() : Range
      {
         return this._1076871582progressIndicator;
      }
      
      public function set progressIndicator(param1:Range) : void
      {
         var _loc2_:Object = this._1076871582progressIndicator;
         if(_loc2_ !== param1)
         {
            this._1076871582progressIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"progressIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : Image
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Image) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
