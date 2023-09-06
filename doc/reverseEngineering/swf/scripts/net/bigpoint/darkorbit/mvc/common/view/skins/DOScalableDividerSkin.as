package net.bigpoint.darkorbit.mvc.common.view.skins
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
   import net.bigpoint.darkorbit.mvc.common.view.components.DOScalableDivider;
   import package_9.ResourceManager;
   import spark.components.Group;
   import spark.skins.SparkSkin;
   
   public class DOScalableDividerSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _809612678contentGroup:Group;
      
      private var _1404868679scale9Graphic:Scale9GridImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1079364307scalableGraphic:BitmapData;
      
      private var scale9Rect:Rectangle;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DOScalableDivider;
      
      public function DOScalableDividerSkin()
      {
         var watchers:Array;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._DOScalableDividerSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_common_view_skins_DOScalableDividerSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DOScalableDividerSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._DOScalableDividerSkin_Group1_c(),this._DOScalableDividerSkin_Group2_i()];
         this.currentState = "normal";
         this.addEventListener("creationComplete",this.___DOScalableDividerSkin_SparkSkin1_creationComplete);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[]
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
         DOScalableDividerSkin._watcherSetupUtil = param1;
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
      
      private function init() : void
      {
         var _loc1_:String = getStyle("libID");
         var _loc2_:String = getStyle("linkageID");
         this.scalableGraphic = ResourceManager.getBitmapData(_loc1_,_loc2_);
         var _loc3_:Array = (getStyle("scale9rect") as String).split(",");
         this.scale9Rect = new Rectangle(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3]);
         this.scale9Graphic.scale9Grid = this.scale9Rect;
      }
      
      private function _DOScalableDividerSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._DOScalableDividerSkin_Scale9GridImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DOScalableDividerSkin_Scale9GridImage1_i() : Scale9GridImage
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
      
      private function _DOScalableDividerSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      public function ___DOScalableDividerSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _DOScalableDividerSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return scalableGraphic;
         },null,"scale9Graphic.source");
         return result;
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
      private function get scalableGraphic() : BitmapData
      {
         return this._1079364307scalableGraphic;
      }
      
      private function set scalableGraphic(param1:BitmapData) : void
      {
         var _loc2_:Object = this._1079364307scalableGraphic;
         if(_loc2_ !== param1)
         {
            this._1079364307scalableGraphic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scalableGraphic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : DOScalableDivider
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DOScalableDivider) : void
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
