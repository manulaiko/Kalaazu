package package_249
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import package_155.class_999;
   import package_163.class_1520;
   import spark.components.supportClasses.ItemRenderer;
   
   public class class_1538 extends ItemRenderer
   {
       
      
      private var var_1619:class_999;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _data:class_1520;
      
      private var var_18:Boolean = true;
      
      public function class_1538()
      {
         super();
         mx_internal::_document = this;
         this.width = 32;
         this.height = 32;
         this.mxmlContent = [this.method_415()];
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 != this._data)
         {
            this.var_18 = true;
            this._data = param1 as class_1520;
            invalidateProperties();
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.var_18)
         {
            this.var_18 = false;
            this.moduleItemComponent.moduleVO = this._data;
            this.moduleItemComponent.moduleType = this._data.type;
         }
      }
      
      private function method_415() : class_999
      {
         var _loc1_:class_999 = new class_999();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "moduleItemComponent";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.moduleItemComponent = _loc1_;
         BindingManager.executeBindings(this,"moduleItemComponent",this.moduleItemComponent);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get moduleItemComponent() : class_999
      {
         return this.var_1619;
      }
      
      public function set moduleItemComponent(param1:class_999) : void
      {
         var _loc2_:Object = this.var_1619;
         if(_loc2_ !== param1)
         {
            this.var_1619 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moduleItemComponent",_loc2_,param1));
            }
         }
      }
   }
}
