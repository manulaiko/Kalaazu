package net.bigpoint.darkorbit.mvc.arena.view
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   
   public class ArenaWindowMenuInnerClass0 extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _533586193_ArenaWindowMenuInnerClass0_SolidColor1:SolidColor;
      
      private var _1215755049nameLabel:Label;
      
      private var _88844982outerDocument:ArenaWindowMenu;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ArenaWindowMenuInnerClass0()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ArenaWindowMenuInnerClass0_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_arena_view_ArenaWindowMenuInnerClass0WatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ArenaWindowMenuInnerClass0[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ArenaWindowMenuInnerClass0_Rect1_c(),this._ArenaWindowMenuInnerClass0_Label1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ArenaWindowMenuInnerClass0_SolidColor1",
               "name":"alpha",
               "value":0.2
            })]
         }),new State({
            "name":"selected",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ArenaWindowMenuInnerClass0_SolidColor1",
               "name":"alpha",
               "value":0.6
            })]
         })];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ArenaWindowMenuInnerClass0._watcherSetupUtil = param1;
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
      
      private function _ArenaWindowMenuInnerClass0_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ArenaWindowMenuInnerClass0_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ArenaWindowMenuInnerClass0_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 10066329;
         _loc1_.alpha = 0;
         this._ArenaWindowMenuInnerClass0_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_ArenaWindowMenuInnerClass0_SolidColor1",this._ArenaWindowMenuInnerClass0_SolidColor1);
         return _loc1_;
      }
      
      private function _ArenaWindowMenuInnerClass0_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.top = 5;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.id = "nameLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nameLabel = _loc1_;
         BindingManager.executeBindings(this,"nameLabel",this.nameLabel);
         return _loc1_;
      }
      
      private function _ArenaWindowMenuInnerClass0_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = data.name;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"nameLabel.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ArenaWindowMenuInnerClass0_SolidColor1() : SolidColor
      {
         return this._533586193_ArenaWindowMenuInnerClass0_SolidColor1;
      }
      
      public function set _ArenaWindowMenuInnerClass0_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._533586193_ArenaWindowMenuInnerClass0_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._533586193_ArenaWindowMenuInnerClass0_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ArenaWindowMenuInnerClass0_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nameLabel() : Label
      {
         return this._1215755049nameLabel;
      }
      
      public function set nameLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1215755049nameLabel;
         if(_loc2_ !== param1)
         {
            this._1215755049nameLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : ArenaWindowMenu
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:ArenaWindowMenu) : void
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
