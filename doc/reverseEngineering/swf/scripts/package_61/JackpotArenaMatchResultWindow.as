package package_61
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Text;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.BitmapScaleMode;
   import mx.graphics.SolidColor;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOViewContainerBase;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
   import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.ResultHeaderLabel;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOOuterViewContainerSkin;
   import package_168.class_1038;
   import package_169.class_1039;
   import spark.components.Group;
   import spark.components.Image;
   import spark.components.SkinnableContainer;
   import spark.components.VGroup;
   import spark.components.gridClasses.GridSelectionMode;
   import spark.layouts.HorizontalAlign;
   import spark.layouts.VerticalAlign;
   import spark.primitives.Rect;
   
   public class JackpotArenaMatchResultWindow extends DOWindow implements IBindingClient
   {
      
      private static const const_884:uint = 5;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _JackpotArenaMatchResultWindow_Group2:Group;
      
      public var _JackpotArenaMatchResultWindow_Text1:Text;
      
      public var _JackpotArenaMatchResultWindow_VGroup2:VGroup;
      
      private var var_223:SkinnableContainer;
      
      private var var_782:Image;
      
      private var var_614:class_1038;
      
      private var var_2374:ResultHeaderLabel;
      
      private var var_647:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var var_2045:Bitmap;
      
      private var var_4865:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function JackpotArenaMatchResultWindow()
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
         bindings = this.method_385();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_JackpotArenaMatchResultWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return JackpotArenaMatchResultWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 460;
         this.height = 470;
         this.styleName = "jackpotWindow";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_1941);
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         JackpotArenaMatchResultWindow._watcherSetupUtil = param1;
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
      
      public function setHeaderImage(param1:Bitmap) : void
      {
         this._headerImage = param1;
      }
      
      public function set headerText(param1:String) : void
      {
         this.victoryLabel.headerText = param1.toUpperCase();
      }
      
      public function set name_122(param1:String) : void
      {
         this._hint = param1;
      }
      
      public function set method_3279(param1:DisplayObject) : void
      {
         this.victoryLabel.texture = param1;
      }
      
      public function set gradient(param1:DisplayObject) : void
      {
         this.victoryLabel.gradient = param1;
      }
      
      public function set effectImg(param1:DisplayObject) : void
      {
         this.victoryLabel.effectImg = param1;
      }
      
      public function set backGround(param1:DisplayObject) : void
      {
         this.victoryLabel.backGround = param1;
      }
      
      private function method_1941() : Array
      {
         return [this.method_4264()];
      }
      
      private function method_4264() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = true;
         _loc1_.paddingBottom = 10;
         _loc1_.mxmlContent = [this.method_1785(),this.method_5766(),this.method_5707()];
         _loc1_.id = "windowContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.windowContainer = _loc1_;
         BindingManager.executeBindings(this,"windowContainer",this.windowContainer);
         return _loc1_;
      }
      
      private function method_1785() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 99.5;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.mask = this.method_2342();
         _loc1_.mxmlContent = [this.method_1834(),this.method_4251()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_2342() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this.method_1267()];
         _loc1_.id = "_JackpotArenaMatchResultWindow_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._JackpotArenaMatchResultWindow_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_JackpotArenaMatchResultWindow_Group2",this._JackpotArenaMatchResultWindow_Group2);
         return _loc1_;
      }
      
      private function method_1267() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this.method_3583();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function method_3583() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 65280;
         _loc1_.alpha = 1;
         return _loc1_;
      }
      
      private function method_1834() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 90;
         _loc1_.id = "headerPic";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.headerPic = _loc1_;
         BindingManager.executeBindings(this,"headerPic",this.headerPic);
         return _loc1_;
      }
      
      private function method_4251() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this.method_4220()];
         _loc1_.id = "_JackpotArenaMatchResultWindow_VGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._JackpotArenaMatchResultWindow_VGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_JackpotArenaMatchResultWindow_VGroup2",this._JackpotArenaMatchResultWindow_VGroup2);
         return _loc1_;
      }
      
      private function method_4220() : ResultHeaderLabel
      {
         var _loc1_:ResultHeaderLabel = new ResultHeaderLabel();
         _loc1_.id = "victoryLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.victoryLabel = _loc1_;
         BindingManager.executeBindings(this,"victoryLabel",this.victoryLabel);
         return _loc1_;
      }
      
      private function method_5766() : SkinnableContainer
      {
         var _loc1_:SkinnableContainer = new SkinnableContainer();
         _loc1_.bottom = 25;
         _loc1_.top = 25;
         _loc1_.left = 25;
         _loc1_.right = 25;
         _loc1_.height = 235;
         _loc1_.percentWidth = 90;
         _loc1_.styleName = "jackpot";
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_5846);
         _loc1_.id = "container";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.container = _loc1_;
         BindingManager.executeBindings(this,"container",this.container);
         return _loc1_;
      }
      
      private function method_5846() : Array
      {
         return [this.method_2078()];
      }
      
      private function method_2078() : class_1038
      {
         var _loc1_:class_1038 = new class_1038();
         _loc1_.percentWidth = 100;
         _loc1_.focusEnabled = false;
         _loc1_.editable = false;
         _loc1_.resizableColumns = false;
         _loc1_.sortableColumns = false;
         _loc1_.styleName = "jackpotGrid";
         _loc1_.setStyle("contentBackgroundColor",1317149);
         _loc1_.setStyle("rollOverColor",2106665);
         _loc1_.setStyle("selectionColor",2106665);
         _loc1_.id = "itemList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.itemList = _loc1_;
         BindingManager.executeBindings(this,"itemList",this.itemList);
         return _loc1_;
      }
      
      private function method_5707() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 90;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this.method_1397(),this.method_2776()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_1397() : DOViewContainerBase
      {
         var _loc1_:DOViewContainerBase = new DOViewContainerBase();
         _loc1_.styleName = "questWindowOuter";
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",DOOuterViewContainerSkin);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_2776() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("paddingTop",4);
         _loc1_.setStyle("paddingBottom",4);
         _loc1_.setStyle("paddingLeft",6);
         _loc1_.setStyle("paddingRight",6);
         _loc1_.id = "_JackpotArenaMatchResultWindow_Text1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._JackpotArenaMatchResultWindow_Text1 = _loc1_;
         BindingManager.executeBindings(this,"_JackpotArenaMatchResultWindow_Text1",this._JackpotArenaMatchResultWindow_Text1);
         return _loc1_;
      }
      
      private function method_385() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():String
         {
            var _loc1_:* = HorizontalAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"windowContainer.horizontalAlign");
         var_5[1] = new Binding(this,function():String
         {
            var _loc1_:* = VerticalAlign.TOP;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"windowContainer.verticalAlign");
         var_5[2] = new Binding(this,function():Number
         {
            return headerPic.width;
         },null,"_JackpotArenaMatchResultWindow_Group2.width");
         var_5[3] = new Binding(this,function():Number
         {
            return headerPic.height;
         },null,"_JackpotArenaMatchResultWindow_Group2.height");
         var_5[4] = new Binding(this,function():Object
         {
            return _headerImage;
         },null,"headerPic.source");
         var_5[5] = new Binding(this,function():String
         {
            var _loc1_:* = HorizontalAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"headerPic.horizontalAlign");
         var_5[6] = new Binding(this,function():String
         {
            var _loc1_:* = VerticalAlign.MIDDLE;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"headerPic.verticalAlign");
         var_5[7] = new Binding(this,function():String
         {
            var _loc1_:* = BitmapScaleMode.STRETCH;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"headerPic.scaleMode");
         var_5[8] = new Binding(this,function():String
         {
            var _loc1_:* = VerticalAlign.MIDDLE;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_JackpotArenaMatchResultWindow_VGroup2.verticalAlign");
         var_5[9] = new Binding(this,function():String
         {
            var _loc1_:* = HorizontalAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_JackpotArenaMatchResultWindow_VGroup2.horizontalAlign");
         var_5[10] = new Binding(this,function():String
         {
            var _loc1_:* = class_18.const_183;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"victoryLabel.font");
         var_5[11] = new Binding(this,function():int
         {
            return class_1039.const_819;
         },null,"victoryLabel.fontSize");
         var_5[12] = new Binding(this,function():int
         {
            return class_1039.const_327;
         },null,"victoryLabel.trackingLeft");
         var_5[13] = new Binding(this,function():Object
         {
            return const_884;
         },null,"itemList.left");
         var_5[14] = new Binding(this,function():Object
         {
            return const_884;
         },null,"itemList.right");
         var_5[15] = new Binding(this,function():Object
         {
            return const_884;
         },null,"itemList.top");
         var_5[16] = new Binding(this,function():String
         {
            var _loc1_:* = GridSelectionMode.NONE;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"itemList.selectionMode");
         var_5[17] = new Binding(this,function():String
         {
            var _loc1_:* = _hint;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_JackpotArenaMatchResultWindow_Text1.htmlText");
         var_5[18] = new Binding(this,function():String
         {
            var _loc1_:* = class_18.const_1851;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _JackpotArenaMatchResultWindow_Text1.setStyle("fontFamily",param1);
         },"_JackpotArenaMatchResultWindow_Text1.fontFamily");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get container() : SkinnableContainer
      {
         return this.var_223;
      }
      
      public function set container(param1:SkinnableContainer) : void
      {
         var _loc2_:Object = this.var_223;
         if(_loc2_ !== param1)
         {
            this.var_223 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"container",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerPic() : Image
      {
         return this.var_782;
      }
      
      public function set headerPic(param1:Image) : void
      {
         var _loc2_:Object = this.var_782;
         if(_loc2_ !== param1)
         {
            this.var_782 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerPic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemList() : class_1038
      {
         return this.var_614;
      }
      
      public function set itemList(param1:class_1038) : void
      {
         var _loc2_:Object = this.var_614;
         if(_loc2_ !== param1)
         {
            this.var_614 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get victoryLabel() : ResultHeaderLabel
      {
         return this.var_2374;
      }
      
      public function set victoryLabel(param1:ResultHeaderLabel) : void
      {
         var _loc2_:Object = this.var_2374;
         if(_loc2_ !== param1)
         {
            this.var_2374 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"victoryLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get windowContainer() : VGroup
      {
         return this.var_647;
      }
      
      public function set windowContainer(param1:VGroup) : void
      {
         var _loc2_:Object = this.var_647;
         if(_loc2_ !== param1)
         {
            this.var_647 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"windowContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _headerImage() : Bitmap
      {
         return this.var_2045;
      }
      
      private function set _headerImage(param1:Bitmap) : void
      {
         var _loc2_:Object = this.var_2045;
         if(_loc2_ !== param1)
         {
            this.var_2045 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_headerImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _hint() : String
      {
         return this.var_4865;
      }
      
      private function set _hint(param1:String) : void
      {
         var _loc2_:Object = this.var_4865;
         if(_loc2_ !== param1)
         {
            this.var_4865 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_hint",_loc2_,param1));
            }
         }
      }
   }
}
