package package_153
{
   import flash.utils.getDefinitionByName;
   import flashx.textLayout.formats.TextAlign;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import net.bigpoint.darkorbit.class_18;
   import spark.components.Group;
   import spark.primitives.Rect;
   
   public class class_1516 extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _TDMAccordionContent_SolidColor1:SolidColor;
      
      public var _TDMAccordionContent_Text1:Text;
      
      public var _TDMAccordionContent_Text2:Text;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var var_1660:uint;
      
      private var var_3756:int;
      
      private var var_3491:String;
      
      private var var_3458:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_1516()
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
         bindings = this.method_3665();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_accordion_TDMAccordionContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_1516[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.mxmlContent = [this.method_5839(),this.method_59(),this.method_4039()];
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_1516._watcherSetupUtil = param1;
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
      
      public function set bgcolor(param1:uint) : void
      {
         this._bgcolor = param1;
      }
      
      public function set padding(param1:int) : void
      {
         this._padding = param1;
      }
      
      public function set method_1780(param1:String) : void
      {
         this._leftText = param1;
      }
      
      public function set method_5902(param1:String) : void
      {
         this._rightText = param1;
      }
      
      private function method_5839() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this.method_4794();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function method_4794() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._TDMAccordionContent_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_TDMAccordionContent_SolidColor1",this._TDMAccordionContent_SolidColor1);
         return _loc1_;
      }
      
      private function method_59() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.left = 0;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",11);
         _loc1_.id = "_TDMAccordionContent_Text1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TDMAccordionContent_Text1 = _loc1_;
         BindingManager.executeBindings(this,"_TDMAccordionContent_Text1",this._TDMAccordionContent_Text1);
         return _loc1_;
      }
      
      private function method_4039() : Text
      {
         var _loc1_:Text = new Text();
         _loc1_.right = 0;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",11);
         _loc1_.id = "_TDMAccordionContent_Text2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TDMAccordionContent_Text2 = _loc1_;
         BindingManager.executeBindings(this,"_TDMAccordionContent_Text2",this._TDMAccordionContent_Text2);
         return _loc1_;
      }
      
      private function method_3665() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():uint
         {
            return _bgcolor;
         },null,"_TDMAccordionContent_SolidColor1.color");
         var_5[1] = new Binding(this,function():String
         {
            var _loc1_:* = TextAlign.LEFT;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _TDMAccordionContent_Text1.setStyle("textAlign",param1);
         },"_TDMAccordionContent_Text1.textAlign");
         var_5[2] = new Binding(this,function():String
         {
            var _loc1_:* = _leftText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TDMAccordionContent_Text1.htmlText");
         var_5[3] = new Binding(this,function():Boolean
         {
            return false;
         },null,"_TDMAccordionContent_Text1.selectable");
         var_5[4] = new Binding(this,function():Number
         {
            return _padding;
         },function(param1:Number):void
         {
            _TDMAccordionContent_Text1.setStyle("paddingLeft",param1);
         },"_TDMAccordionContent_Text1.paddingLeft");
         var_5[5] = new Binding(this,function():String
         {
            var _loc1_:* = class_18.const_183;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _TDMAccordionContent_Text1.setStyle("fontFamily",param1);
         },"_TDMAccordionContent_Text1.fontFamily");
         var_5[6] = new Binding(this,function():String
         {
            var _loc1_:* = TextAlign.RIGHT;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _TDMAccordionContent_Text2.setStyle("textAlign",param1);
         },"_TDMAccordionContent_Text2.textAlign");
         var_5[7] = new Binding(this,function():String
         {
            var _loc1_:* = _rightText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TDMAccordionContent_Text2.htmlText");
         var_5[8] = new Binding(this,function():Boolean
         {
            return false;
         },null,"_TDMAccordionContent_Text2.selectable");
         var_5[9] = new Binding(this,function():Number
         {
            return _padding;
         },function(param1:Number):void
         {
            _TDMAccordionContent_Text2.setStyle("paddingRight",param1);
         },"_TDMAccordionContent_Text2.paddingRight");
         var_5[10] = new Binding(this,function():String
         {
            var _loc1_:* = class_18.const_183;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _TDMAccordionContent_Text2.setStyle("fontFamily",param1);
         },"_TDMAccordionContent_Text2.fontFamily");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      private function get _bgcolor() : uint
      {
         return this.var_1660;
      }
      
      private function set _bgcolor(param1:uint) : void
      {
         var _loc2_:Object = this.var_1660;
         if(_loc2_ !== param1)
         {
            this.var_1660 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bgcolor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _padding() : int
      {
         return this.var_3756;
      }
      
      private function set _padding(param1:int) : void
      {
         var _loc2_:Object = this.var_3756;
         if(_loc2_ !== param1)
         {
            this.var_3756 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_padding",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _leftText() : String
      {
         return this.var_3491;
      }
      
      private function set _leftText(param1:String) : void
      {
         var _loc2_:Object = this.var_3491;
         if(_loc2_ !== param1)
         {
            this.var_3491 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_leftText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _rightText() : String
      {
         return this.var_3458;
      }
      
      private function set _rightText(param1:String) : void
      {
         var _loc2_:Object = this.var_3458;
         if(_loc2_ !== param1)
         {
            this.var_3458 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_rightText",_loc2_,param1));
            }
         }
      }
   }
}
