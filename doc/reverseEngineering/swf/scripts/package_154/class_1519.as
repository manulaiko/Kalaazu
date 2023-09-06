package package_154
{
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImage;
   import package_9.ResourceManager;
   import spark.components.DataRenderer;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.BitmapImage;
   
   public class class_1519 extends DataRenderer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var var_343:Scale9GridImage;
      
      private var _1184053038labelDisplay:Label;
      
      private var _88844982outerDocument:DOHSliderSkin;
      
      private var var_3234:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var var_2246:int;
      
      private var var_616:int;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_1519()
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
         bindings = this.method_6437();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_battlestationswindow_view_skins_DOHSliderSkinInnerClass0WatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_1519[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minHeight = 24;
         this.minWidth = 40;
         this.y = -34;
         this.mxmlContent = [this.method_3282(),this.method_4712(),this.method_4233()];
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_1519._watcherSetupUtil = param1;
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
      
      private function creationCompleteHandler() : void
      {
         this.dataTipBackground.source = ResourceManager.getBitmap("battleStationsUI","slider_handle_display");
         this.dataTipBackground.scale9Grid = new Rectangle(15,1,1,1);
         this.method_1393();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this.method_1393();
      }
      
      private function method_1393() : void
      {
         this._tipBgWidth = Math.max(42,this.labelDisplay.width + 13);
         this._sliderArrowPos = this.dataTipBackground.x + Number(this._tipBgWidth) / 2;
      }
      
      private function method_3282() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 12;
         _loc1_.mxmlContent = [this.method_6016()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_6016() : Scale9GridImage
      {
         var _loc1_:Scale9GridImage = new Scale9GridImage();
         _loc1_.id = "dataTipBackground";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataTipBackground = _loc1_;
         BindingManager.executeBindings(this,"dataTipBackground",this.dataTipBackground);
         return _loc1_;
      }
      
      private function method_4712() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.top = 28;
         _loc1_.initialized(this,"sliderArrow");
         this.sliderArrow = _loc1_;
         BindingManager.executeBindings(this,"sliderArrow",this.sliderArrow);
         return _loc1_;
      }
      
      private function method_4233() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 1;
         _loc1_.top = 21;
         _loc1_.bottom = 5;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.setStyle("color",15262400);
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.addEventListener("creationComplete",this.method_5363);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      public function method_5363(param1:FlexEvent) : void
      {
         this.creationCompleteHandler();
      }
      
      private function method_6437() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():Number
         {
            return _tipBgWidth;
         },null,"dataTipBackground.width");
         var_5[1] = new Binding(this,function():Number
         {
            return _sliderArrowPos;
         },null,"sliderArrow.x");
         var_5[2] = new Binding(this,function():Object
         {
            return ResourceManager.getBitmap("battleStationsUI","slider_arrow");
         },null,"sliderArrow.source");
         var_5[3] = new Binding(this,null,null,"labelDisplay.text","data");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get dataTipBackground() : Scale9GridImage
      {
         return this.var_343;
      }
      
      public function set dataTipBackground(param1:Scale9GridImage) : void
      {
         var _loc2_:Object = this.var_343;
         if(_loc2_ !== param1)
         {
            this.var_343 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataTipBackground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : Label
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : DOHSliderSkin
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:DOHSliderSkin) : void
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
      
      [Bindable(event="propertyChange")]
      public function get sliderArrow() : BitmapImage
      {
         return this.var_3234;
      }
      
      public function set sliderArrow(param1:BitmapImage) : void
      {
         var _loc2_:Object = this.var_3234;
         if(_loc2_ !== param1)
         {
            this.var_3234 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sliderArrow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _tipBgWidth() : int
      {
         return this.var_2246;
      }
      
      private function set _tipBgWidth(param1:int) : void
      {
         var _loc2_:Object = this.var_2246;
         if(_loc2_ !== param1)
         {
            this.var_2246 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_tipBgWidth",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _sliderArrowPos() : int
      {
         return this.var_616;
      }
      
      private function set _sliderArrowPos(param1:int) : void
      {
         var _loc2_:Object = this.var_616;
         if(_loc2_ !== param1)
         {
            this.var_616 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sliderArrowPos",_loc2_,param1));
            }
         }
      }
   }
}
