package net.bigpoint.darkorbit.mvc.common.view.skins.scroller
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.HScrollBar;
   import spark.components.Scroller;
   import spark.components.VScrollBar;
   import spark.skins.SparkSkin;
   
   public class DOScrollerSkinWithoutBorder extends SparkSkin
   {
       
      
      private var _42694078horizontalScrollBar:HScrollBar;
      
      private var _1618627376verticalScrollBar:VScrollBar;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Scroller;
      
      public function DOScrollerSkinWithoutBorder()
      {
         super();
         mx_internal::_document = this;
         this.left = 0;
         this.right = 0;
         this.mxmlContent = [this._DOScrollerSkinWithoutBorder_VScrollBar1_i(),this._DOScrollerSkinWithoutBorder_HScrollBar1_i()];
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
      
      override public function beginHighlightBitmapCapture() : Boolean
      {
         var _loc1_:Boolean = super.beginHighlightBitmapCapture();
         graphics.beginFill(0,0);
         graphics.drawRect(0,0,width,height);
         graphics.endFill();
         return _loc1_;
      }
      
      override public function endHighlightBitmapCapture() : Boolean
      {
         var _loc1_:Boolean = super.endHighlightBitmapCapture();
         graphics.clear();
         return _loc1_;
      }
      
      private function _DOScrollerSkinWithoutBorder_VScrollBar1_i() : VScrollBar
      {
         var _loc1_:VScrollBar = new VScrollBar();
         _loc1_.visible = false;
         _loc1_.styleName = "skinnedVScrollBar";
         _loc1_.id = "verticalScrollBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.verticalScrollBar = _loc1_;
         BindingManager.executeBindings(this,"verticalScrollBar",this.verticalScrollBar);
         return _loc1_;
      }
      
      private function _DOScrollerSkinWithoutBorder_HScrollBar1_i() : HScrollBar
      {
         var _loc1_:HScrollBar = new HScrollBar();
         _loc1_.visible = false;
         _loc1_.styleName = "skinnedHScrollBar";
         _loc1_.id = "horizontalScrollBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.horizontalScrollBar = _loc1_;
         BindingManager.executeBindings(this,"horizontalScrollBar",this.horizontalScrollBar);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get horizontalScrollBar() : HScrollBar
      {
         return this._42694078horizontalScrollBar;
      }
      
      public function set horizontalScrollBar(param1:HScrollBar) : void
      {
         var _loc2_:Object = this._42694078horizontalScrollBar;
         if(_loc2_ !== param1)
         {
            this._42694078horizontalScrollBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"horizontalScrollBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get verticalScrollBar() : VScrollBar
      {
         return this._1618627376verticalScrollBar;
      }
      
      public function set verticalScrollBar(param1:VScrollBar) : void
      {
         var _loc2_:Object = this._1618627376verticalScrollBar;
         if(_loc2_ !== param1)
         {
            this._1618627376verticalScrollBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"verticalScrollBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : Scroller
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Scroller) : void
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
