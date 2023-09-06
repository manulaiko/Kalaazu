package package_247
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IVisualElement;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.darkorbit.mvc.common.view.components.MultilineMxLabel;
   import spark.components.VGroup;
   import spark.components.gridClasses.GridItemRenderer;
   
   public class class_1521 extends GridItemRenderer
   {
       
      
      private var var_1322:VGroup;
      
      private var var_1122:MultilineMxLabel;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function class_1521()
      {
         super();
         mx_internal::_document = this;
         this.clipAndEnableScrolling = true;
         this.percentWidth = 100;
         this.mxmlContent = [this.method_907()];
         this.addEventListener("creationComplete",this.method_3550);
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
      
      protected function creationCompleteHandler(param1:FlexEvent) : void
      {
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
      }
      
      override public function set mxmlContent(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc2_:Boolean = true;
         var _loc3_:int = 0;
         while(_loc2_)
         {
            _loc4_ = null;
            try
            {
               _loc4_ = super.getElementAt(_loc3_);
            }
            catch(e:Error)
            {
            }
            if(_loc4_ != null)
            {
               param1.push(_loc4_);
               _loc3_ += 1;
            }
            else
            {
               _loc2_ = false;
            }
         }
         param1.reverse();
         super.mxmlContent = param1;
      }
      
      private function method_907() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.height = 24;
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = -1;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this.method_1825()];
         _loc1_.id = "columnLabelContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.columnLabelContainer = _loc1_;
         BindingManager.executeBindings(this,"columnLabelContainer",this.columnLabelContainer);
         return _loc1_;
      }
      
      private function method_1825() : MultilineMxLabel
      {
         var _loc1_:MultilineMxLabel = new MultilineMxLabel();
         _loc1_.percentWidth = 100;
         _loc1_.text = ".";
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontFamily","EurostileTNoneCFF");
         _loc1_.id = "rowLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rowLabel = _loc1_;
         BindingManager.executeBindings(this,"rowLabel",this.rowLabel);
         return _loc1_;
      }
      
      public function method_3550(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get columnLabelContainer() : VGroup
      {
         return this.var_1322;
      }
      
      public function set columnLabelContainer(param1:VGroup) : void
      {
         var _loc2_:Object = this.var_1322;
         if(_loc2_ !== param1)
         {
            this.var_1322 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnLabelContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rowLabel() : MultilineMxLabel
      {
         return this.var_1122;
      }
      
      public function set rowLabel(param1:MultilineMxLabel) : void
      {
         var _loc2_:Object = this.var_1122;
         if(_loc2_ !== param1)
         {
            this.var_1122 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rowLabel",_loc2_,param1));
            }
         }
      }
   }
}
