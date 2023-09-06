package net.bigpoint.darkorbit.mvc.common.view.skins
{
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.primitives.Rect;
   
   public class DOListSkinInnerClass0 extends Group
   {
       
      
      private var _88844982outerDocument:DOListSkin;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function DOListSkinInnerClass0()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 3;
         this.minHeight = 3;
         this.maxWidth = 3;
         this.maxHeight = 3;
         this.mxmlContent = [this._DOListSkinInnerClass0_Rect1_c()];
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
      
      private function _DOListSkinInnerClass0_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._DOListSkinInnerClass0_SolidColor1_c();
         _loc1_.stroke = this._DOListSkinInnerClass0_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DOListSkinInnerClass0_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 12303291;
         return _loc1_;
      }
      
      private function _DOListSkinInnerClass0_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 8816262;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : DOListSkin
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:DOListSkin) : void
      {
         var _loc2_:Object = this._88844982outerDocument;
         if(_loc2_ !== param1)
         {
            this._88844982outerDocument = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerDocument",_loc2_,param1));
            }
         }
      }
   }
}
