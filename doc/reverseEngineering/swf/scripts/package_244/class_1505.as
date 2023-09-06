package package_244
{
   import flash.events.Event;
   import mx.binding.BindingManager;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import package_337.class_1898;
   import package_338.class_1900;
   import package_65.class_1103;
   import spark.components.Group;
   import spark.components.Scroller;
   
   public class class_1505 extends class_1504
   {
       
      
      private var var_3367:class_1899;
      
      private var var_4207:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function class_1505()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_5157);
         this.addEventListener("creationComplete",this.method_5939);
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
      
      override protected function creationCompleteHandler(param1:FlexEvent) : void
      {
         super.creationCompleteHandler(param1);
         this.objectiveList.addEventListener(class_1103.const_2446,this.method_3627);
      }
      
      private function method_3627(param1:Event) : void
      {
      }
      
      private function method_5157() : Array
      {
         return [this.method_1031()];
      }
      
      private function method_1031() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.styleName = "skinnedScroller";
         _loc1_.viewport = this.method_5036();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_5036() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this.method_1478()];
         _loc1_.id = "objectiveListScrollerGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.objectiveListScrollerGroup = _loc1_;
         BindingManager.executeBindings(this,"objectiveListScrollerGroup",this.objectiveListScrollerGroup);
         return _loc1_;
      }
      
      private function method_1478() : class_1899
      {
         var _loc1_:class_1899 = new class_1899();
         _loc1_.itemRenderer = this.method_4105();
         _loc1_.setStyle("skinClass",class_1900);
         _loc1_.id = "objectiveList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.objectiveList = _loc1_;
         BindingManager.executeBindings(this,"objectiveList",this.objectiveList);
         return _loc1_;
      }
      
      private function method_4105() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = class_1898;
         return _loc1_;
      }
      
      public function method_5939(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get objectiveList() : class_1899
      {
         return this.var_3367;
      }
      
      public function set objectiveList(param1:class_1899) : void
      {
         var _loc2_:Object = this.var_3367;
         if(_loc2_ !== param1)
         {
            this.var_3367 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"objectiveList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get objectiveListScrollerGroup() : Group
      {
         return this.var_4207;
      }
      
      public function set objectiveListScrollerGroup(param1:Group) : void
      {
         var _loc2_:Object = this.var_4207;
         if(_loc2_ !== param1)
         {
            this.var_4207 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"objectiveListScrollerGroup",_loc2_,param1));
            }
         }
      }
   }
}
