package package_155
{
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.ToolTipEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.Image;
   import spark.components.Label;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   public class class_999 extends class_998 implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ModuleItem_Rect1:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_999()
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
         bindings = this.method_2580();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_battlestationswindow_view_components_ModuleItemWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_999[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 32;
         this.mxmlContent = [this.method_5761(),this.method_911(),this.method_3635(),this.method_5308(),this.method_3467(),this.method_3252(),this.method_2837(),this.method_3749(),this.method_6067(),this.method_6143()];
         this.addEventListener("creationComplete",this.method_4996);
         this.addEventListener("rollOver",this.method_4292);
         this.addEventListener("rollOut",this.method_6237);
         this.addEventListener("toolTipCreate",this.method_5926);
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_999._watcherSetupUtil = param1;
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
      
      private function method_5761() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.alpha = 0;
         _loc1_.fill = this.method_3306();
         _loc1_.initialized(this,"_ModuleItem_Rect1");
         this._ModuleItem_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_ModuleItem_Rect1",this._ModuleItem_Rect1);
         return _loc1_;
      }
      
      private function method_3306() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function method_911() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.visible = false;
         _loc1_.initialized(this,"backgroundImage");
         backgroundImage = _loc1_;
         BindingManager.executeBindings(this,"backgroundImage",backgroundImage);
         return _loc1_;
      }
      
      private function method_3635() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.id = "iconContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         iconContainer = _loc1_;
         BindingManager.executeBindings(this,"iconContainer",iconContainer);
         return _loc1_;
      }
      
      private function method_5308() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 30;
         _loc1_.height = 30;
         _loc1_.alpha = 0;
         _loc1_.visible = false;
         _loc1_.fill = this.method_4868();
         _loc1_.initialized(this,"backgroundFlash");
         backgroundFlash = _loc1_;
         BindingManager.executeBindings(this,"backgroundFlash",backgroundFlash);
         return _loc1_;
      }
      
      private function method_4868() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777088;
         return _loc1_;
      }
      
      private function method_3467() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.visible = false;
         _loc1_.initialized(this,"hoverIcon");
         hoverIcon = _loc1_;
         BindingManager.executeBindings(this,"hoverIcon",hoverIcon);
         return _loc1_;
      }
      
      private function method_3252() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.visible = false;
         _loc1_.initialized(this,"selectedIcon");
         selectedIcon = _loc1_;
         BindingManager.executeBindings(this,"selectedIcon",selectedIcon);
         return _loc1_;
      }
      
      private function method_2837() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.visible = false;
         _loc1_.percentWidth = 100;
         _loc1_.top = 19;
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.id = "installationProgressTimer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         installationProgressTimer = _loc1_;
         BindingManager.executeBindings(this,"installationProgressTimer",installationProgressTimer);
         return _loc1_;
      }
      
      private function method_3749() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.alpha = 0;
         _loc1_.id = "repairIcon";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         repairIcon = _loc1_;
         BindingManager.executeBindings(this,"repairIcon",repairIcon);
         return _loc1_;
      }
      
      private function method_6067() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.id = "repairAnimContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         repairAnimContainer = _loc1_;
         BindingManager.executeBindings(this,"repairAnimContainer",repairAnimContainer);
         return _loc1_;
      }
      
      private function method_6143() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.visible = false;
         _loc1_.alpha = 0;
         _loc1_.initialized(this,"destroyedIcon");
         destroyedIcon = _loc1_;
         BindingManager.executeBindings(this,"destroyedIcon",destroyedIcon);
         return _loc1_;
      }
      
      public function method_4996(param1:FlexEvent) : void
      {
         handleCreationComplete();
      }
      
      public function method_4292(param1:MouseEvent) : void
      {
         method_2654(param1);
      }
      
      public function method_6237(param1:MouseEvent) : void
      {
         method_2654(param1);
      }
      
      public function method_5926(param1:ToolTipEvent) : void
      {
         method_1216(param1);
      }
      
      private function method_2580() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():Number
         {
            return const_3282;
         },null,"_ModuleItem_Rect1.width");
         var_5[1] = new Binding(this,function():Number
         {
            return const_706;
         },null,"_ModuleItem_Rect1.height");
         return var_5;
      }
   }
}
