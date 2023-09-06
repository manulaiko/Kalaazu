package package_5
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import package_20.class_71;
   import spark.components.gridClasses.GridItemRenderer;
   
   public class class_27 extends GridItemRenderer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _JackpotWindowItemListSkinInnerClass4_JackpotGridHeadRenderer1:class_71;
      
      private var _88844982outerDocument:class_4;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_27()
      {
         var bindings:Array;
         var watchers:Array;
         var var_1:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this.method_700();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_skin_JackpotWindowItemListSkinInnerClass4WatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_27[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this.method_1456()];
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_27._watcherSetupUtil = param1;
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
      
      private function method_1456() : class_71
      {
         var _loc1_:class_71 = new class_71();
         _loc1_.id = "_JackpotWindowItemListSkinInnerClass4_JackpotGridHeadRenderer1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._JackpotWindowItemListSkinInnerClass4_JackpotGridHeadRenderer1 = _loc1_;
         BindingManager.executeBindings(this,"_JackpotWindowItemListSkinInnerClass4_JackpotGridHeadRenderer1",this._JackpotWindowItemListSkinInnerClass4_JackpotGridHeadRenderer1);
         return _loc1_;
      }
      
      private function method_700() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():String
         {
            var _loc1_:* = column.headerText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_JackpotWindowItemListSkinInnerClass4_JackpotGridHeadRenderer1.headerText");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : class_4
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:class_4) : void
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
