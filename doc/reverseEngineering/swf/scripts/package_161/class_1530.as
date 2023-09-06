package package_161
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import package_247.class_1903;
   import spark.components.gridClasses.GridItemRenderer;
   
   public class class_1530 extends GridItemRenderer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SectorControlLobbyWindowItemListSkinInnerClass4_SectorControlLobbyWindowItemListHeaderRenderer1:class_1903;
      
      private var _88844982outerDocument:class_1012;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_1530()
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
         bindings = this.method_4012();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_sectorControlWindow_view_skins_SectorControlLobbyWindowItemListSkinInnerClass4WatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_1530[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this.method_1347()];
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_1530._watcherSetupUtil = param1;
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
      
      private function method_1347() : class_1903
      {
         var _loc1_:class_1903 = new class_1903();
         _loc1_.id = "_SectorControlLobbyWindowItemListSkinInnerClass4_SectorControlLobbyWindowItemListHeaderRenderer1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SectorControlLobbyWindowItemListSkinInnerClass4_SectorControlLobbyWindowItemListHeaderRenderer1 = _loc1_;
         BindingManager.executeBindings(this,"_SectorControlLobbyWindowItemListSkinInnerClass4_SectorControlLobbyWindowItemListHeaderRenderer1",this._SectorControlLobbyWindowItemListSkinInnerClass4_SectorControlLobbyWindowItemListHeaderRenderer1);
         return _loc1_;
      }
      
      private function method_4012() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():String
         {
            var _loc1_:* = column.headerText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SectorControlLobbyWindowItemListSkinInnerClass4_SectorControlLobbyWindowItemListHeaderRenderer1.headerText");
         var_5[1] = new Binding(this,function():int
         {
            return column.columnIndex;
         },null,"_SectorControlLobbyWindowItemListSkinInnerClass4_SectorControlLobbyWindowItemListHeaderRenderer1.columnIndex");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : class_1012
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:class_1012) : void
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
