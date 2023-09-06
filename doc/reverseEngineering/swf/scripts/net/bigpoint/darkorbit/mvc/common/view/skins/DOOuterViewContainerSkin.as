package net.bigpoint.darkorbit.mvc.common.view.skins
{
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
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.State;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOViewContainerBase;
   import spark.components.Group;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class DOOuterViewContainerSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _DOOuterViewContainerSkin_SolidColor1:SolidColor;
      
      public var _DOOuterViewContainerSkin_SolidColorStroke1:SolidColorStroke;
      
      private var _1383304148border:Rect;
      
      private var _809612678contentGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _932924696borderColour:uint = 3423815;
      
      private var _720898194borderAlpha:uint = 1;
      
      private var _1496175044borderWeight:uint = 1;
      
      private var _1246160026backgroundColour:uint = 2239282;
      
      private var _1285191888backgroundAlpha:uint = 1;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DOViewContainerBase;
      
      public function DOOuterViewContainerSkin()
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
         bindings = this._DOOuterViewContainerSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_common_view_skins_DOOuterViewContainerSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DOOuterViewContainerSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._DOOuterViewContainerSkin_Group1_c(),this._DOOuterViewContainerSkin_Group2_i()];
         this.currentState = "normal";
         this.addEventListener("creationComplete",this.___DOOuterViewContainerSkin_SparkSkin1_creationComplete);
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
         DOOuterViewContainerSkin._watcherSetupUtil = param1;
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
         if(getStyle("borderColour"))
         {
            this.borderColour = getStyle("borderColour");
         }
         var _loc1_:int = getStyle("borderAlpha") as int;
         this.borderAlpha = _loc1_;
         if(getStyle("borderWeight"))
         {
            this.borderWeight = getStyle("borderWeight") as int;
         }
         if(getStyle("backgroundColour"))
         {
            this.backgroundColour = getStyle("backgroundColour") as uint;
         }
         var _loc2_:int = getStyle("backgroundAlpha") as int;
         this.backgroundAlpha = _loc2_;
      }
      
      private function _DOOuterViewContainerSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._DOOuterViewContainerSkin_Rect1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DOOuterViewContainerSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._DOOuterViewContainerSkin_SolidColorStroke1_i();
         _loc1_.fill = this._DOOuterViewContainerSkin_SolidColor1_i();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _DOOuterViewContainerSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._DOOuterViewContainerSkin_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_DOOuterViewContainerSkin_SolidColorStroke1",this._DOOuterViewContainerSkin_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _DOOuterViewContainerSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._DOOuterViewContainerSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_DOOuterViewContainerSkin_SolidColor1",this._DOOuterViewContainerSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _DOOuterViewContainerSkin_Group2_i() : Group
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
      
      public function ___DOOuterViewContainerSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _DOOuterViewContainerSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return borderColour;
         },null,"_DOOuterViewContainerSkin_SolidColorStroke1.color");
         result[1] = new Binding(this,function():Number
         {
            return borderWeight;
         },null,"_DOOuterViewContainerSkin_SolidColorStroke1.weight");
         result[2] = new Binding(this,function():Number
         {
            return borderAlpha;
         },null,"_DOOuterViewContainerSkin_SolidColorStroke1.alpha");
         result[3] = new Binding(this,function():uint
         {
            return backgroundColour;
         },null,"_DOOuterViewContainerSkin_SolidColor1.color");
         result[4] = new Binding(this,function():Number
         {
            return backgroundAlpha;
         },null,"_DOOuterViewContainerSkin_SolidColor1.alpha");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get border() : Rect
      {
         return this._1383304148border;
      }
      
      public function set border(param1:Rect) : void
      {
         var _loc2_:Object = this._1383304148border;
         if(_loc2_ !== param1)
         {
            this._1383304148border = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
            }
         }
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
      private function get borderColour() : uint
      {
         return this._932924696borderColour;
      }
      
      private function set borderColour(param1:uint) : void
      {
         var _loc2_:Object = this._932924696borderColour;
         if(_loc2_ !== param1)
         {
            this._932924696borderColour = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderColour",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get borderAlpha() : uint
      {
         return this._720898194borderAlpha;
      }
      
      private function set borderAlpha(param1:uint) : void
      {
         var _loc2_:Object = this._720898194borderAlpha;
         if(_loc2_ !== param1)
         {
            this._720898194borderAlpha = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderAlpha",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get borderWeight() : uint
      {
         return this._1496175044borderWeight;
      }
      
      private function set borderWeight(param1:uint) : void
      {
         var _loc2_:Object = this._1496175044borderWeight;
         if(_loc2_ !== param1)
         {
            this._1496175044borderWeight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderWeight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get backgroundColour() : uint
      {
         return this._1246160026backgroundColour;
      }
      
      private function set backgroundColour(param1:uint) : void
      {
         var _loc2_:Object = this._1246160026backgroundColour;
         if(_loc2_ !== param1)
         {
            this._1246160026backgroundColour = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundColour",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get backgroundAlpha() : uint
      {
         return this._1285191888backgroundAlpha;
      }
      
      private function set backgroundAlpha(param1:uint) : void
      {
         var _loc2_:Object = this._1285191888backgroundAlpha;
         if(_loc2_ !== param1)
         {
            this._1285191888backgroundAlpha = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundAlpha",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : DOViewContainerBase
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DOViewContainerBase) : void
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
