package package_4
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.State;
   import net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImage;
   import package_9.ResourceManager;
   import spark.components.Group;
   import spark.skins.SparkSkin;
   
   public class class_3 extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _809612678contentGroup:Group;
      
      private var _1404868679scale9Graphic:Scale9GridImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _387564642bgBitmapData:BitmapData;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_3()
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
         bindings = this.method_5133();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_TDMSkinnableContainerOuterSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_3[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this.method_5724(),this.method_6515()];
         this.currentState = "normal";
         this.addEventListener("creationComplete",this.method_2026);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[]
         })];
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_3._watcherSetupUtil = param1;
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
      
      private function handleCreationComplete() : void
      {
         var _loc1_:String = getStyle("libID");
         var _loc2_:String = getStyle("skinID");
         var _loc3_:String = getStyle("scale9Grid");
         var _loc4_:Array = _loc3_.split(",");
         this.bgBitmapData = ResourceManager.getBitmapData(_loc1_,_loc2_);
         this.scale9Graphic.scale9Grid = new Rectangle(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3]);
      }
      
      private function method_5724() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this.method_3244()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_3244() : Scale9GridImage
      {
         var _loc1_:Scale9GridImage = new Scale9GridImage();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "scale9Graphic";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scale9Graphic = _loc1_;
         BindingManager.executeBindings(this,"scale9Graphic",this.scale9Graphic);
         return _loc1_;
      }
      
      private function method_6515() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 9;
         _loc1_.bottom = 9;
         _loc1_.left = 2;
         _loc1_.right = 2;
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      public function method_2026(param1:FlexEvent) : void
      {
         this.handleCreationComplete();
      }
      
      private function method_5133() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():*
         {
            return bgBitmapData;
         },null,"scale9Graphic.source");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get contentGroup() : Group
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._809612678contentGroup;
         if(_loc2_ !== param1)
         {
            this._809612678contentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scale9Graphic() : Scale9GridImage
      {
         return this._1404868679scale9Graphic;
      }
      
      public function set scale9Graphic(param1:Scale9GridImage) : void
      {
         var _loc2_:Object = this._1404868679scale9Graphic;
         if(_loc2_ !== param1)
         {
            this._1404868679scale9Graphic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scale9Graphic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get bgBitmapData() : BitmapData
      {
         return this._387564642bgBitmapData;
      }
      
      private function set bgBitmapData(param1:BitmapData) : void
      {
         var _loc2_:Object = this._387564642bgBitmapData;
         if(_loc2_ !== param1)
         {
            this._387564642bgBitmapData = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgBitmapData",_loc2_,param1));
            }
         }
      }
   }
}
