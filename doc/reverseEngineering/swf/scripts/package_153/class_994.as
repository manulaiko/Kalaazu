package package_153
{
   import flash.utils.getDefinitionByName;
   import flashx.textLayout.formats.TextAlign;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import package_151.class_1515;
   import package_92.class_996;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.filters.GlowFilter;
   import spark.layouts.BasicLayout;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Graphic;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   public class class_994 extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _TDMResultWindowAccordionContentListRenderer_GlowFilter1:GlowFilter;
      
      public var _TDMResultWindowAccordionContentListRenderer_GlowFilter2:GlowFilter;
      
      public var _TDMResultWindowAccordionContentListRenderer_GlowFilter3:GlowFilter;
      
      private var var_951:GradientEntry;
      
      private var var_514:GradientEntry;
      
      private var var_794:Graphic;
      
      private var var_2661:Group;
      
      public var _TDMResultWindowAccordionContentListRenderer_Group2:Group;
      
      private var var_678:Path;
      
      private var var_4293:Rect;
      
      private var var_2077:SetProperty;
      
      private var var_1534:SetProperty;
      
      private var var_4326:SetProperty;
      
      private var var_1354:SetProperty;
      
      private var var_3640:SetProperty;
      
      private var var_3653:SetProperty;
      
      private var var_4060:SetProperty;
      
      private var var_2557:SetProperty;
      
      private var var_1091:SetStyle;
      
      private var var_3758:SetStyle;
      
      private var var_4359:SetStyle;
      
      private var var_4344:SetStyle;
      
      private var var_4975:SetStyle;
      
      private var var_1897:SetStyle;
      
      public var _TDMResultWindowAccordionContentListRenderer_SolidColor1:SolidColor;
      
      public var _TDMResultWindowAccordionContentListRenderer_SolidColor2:SolidColor;
      
      public var _TDMResultWindowAccordionContentListRenderer_SolidColor3:SolidColor;
      
      private var var_3443:Group;
      
      private var var_4262:class_1516;
      
      private var var_1721:class_1516;
      
      private var var_2150:class_1516;
      
      private var var_605:Label;
      
      private var var_3780:Label;
      
      private var var_1783:class_1516;
      
      private var var_2040:class_1516;
      
      private var var_2319:class_1516;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_994()
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
         bindings = this.method_5031();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_accordion_TDMResultWindowAccordionContentListRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_994[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = true;
         this.mouseEnabled = false;
         this.percentWidth = 100;
         this.mxmlContent = [this.method_3924()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_TDMResultWindowAccordionContentListRenderer_Path1",
               "name":"filters",
               "value":[this.method_4060()]
            }),new SetProperty().initializeFromObject({
               "target":"_TDMResultWindowAccordionContentListRenderer_Group1",
               "name":"layout",
               "value":this.method_1640()
            }),new SetProperty().initializeFromObject({
               "target":"_TDMResultWindowAccordionContentListRenderer_Path1",
               "name":"fill",
               "value":this.method_932()
            }),this._TDMResultWindowAccordionContentListRenderer_SetStyle1 = SetStyle(new SetStyle().initializeFromObject({
               "target":"topLable",
               "name":"color",
               "value":undefined
            })),this._TDMResultWindowAccordionContentListRenderer_SetStyle4 = SetStyle(new SetStyle().initializeFromObject({
               "target":"topLablePointsDelta",
               "name":"color",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"content",
               "name":"y",
               "value":0
            }),this._TDMResultWindowAccordionContentListRenderer_SetProperty6 = SetProperty(new SetProperty().initializeFromObject({
               "target":"content",
               "name":"visible",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"content",
               "name":"height",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"content",
               "name":"layout",
               "value":this.method_3557()
            })]
         }),new State({
            "name":"hovered",
            "basedOn":"normal",
            "overrides":[this._TDMResultWindowAccordionContentListRenderer_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_TDMResultWindowAccordionContentListRenderer_GradientEntry1",
               "name":"color",
               "value":undefined
            })),this._TDMResultWindowAccordionContentListRenderer_SetProperty3 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_TDMResultWindowAccordionContentListRenderer_GradientEntry2",
               "name":"color",
               "value":undefined
            }))]
         }),new State({
            "name":"isHero",
            "basedOn":"normal",
            "overrides":[this._TDMResultWindowAccordionContentListRenderer_SetStyle2 = SetStyle(new SetStyle().initializeFromObject({
               "target":"topLable",
               "name":"color",
               "value":undefined
            })),this._TDMResultWindowAccordionContentListRenderer_SetStyle5 = SetStyle(new SetStyle().initializeFromObject({
               "target":"topLablePointsDelta",
               "name":"color",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"content",
               "name":"y",
               "value":0
            }),this._TDMResultWindowAccordionContentListRenderer_SetProperty7 = SetProperty(new SetProperty().initializeFromObject({
               "target":"content",
               "name":"visible",
               "value":undefined
            }))]
         }),new State({
            "name":"selected",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_TDMResultWindowAccordionContentListRenderer_Path1",
               "name":"filters",
               "value":[this.method_6326()]
            }),new SetProperty().initializeFromObject({
               "target":"_TDMResultWindowAccordionContentListRenderer_Group1",
               "name":"layout",
               "value":this.method_5674()
            }),this._TDMResultWindowAccordionContentListRenderer_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_TDMResultWindowAccordionContentListRenderer_GradientEntry1",
               "name":"color",
               "value":undefined
            })),this._TDMResultWindowAccordionContentListRenderer_SetProperty4 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_TDMResultWindowAccordionContentListRenderer_GradientEntry2",
               "name":"color",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"_TDMResultWindowAccordionContentListRenderer_Graphic1",
               "name":"left",
               "value":8
            }),new SetProperty().initializeFromObject({
               "target":"_TDMResultWindowAccordionContentListRenderer_Graphic1",
               "name":"top",
               "value":5
            }),this._TDMResultWindowAccordionContentListRenderer_SetProperty5 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_TDMResultWindowAccordionContentListRenderer_Path1",
               "name":"data",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"_TDMResultWindowAccordionContentListRenderer_Path1",
               "name":"fill",
               "value":this.method_2130()
            }),this._TDMResultWindowAccordionContentListRenderer_SetStyle3 = SetStyle(new SetStyle().initializeFromObject({
               "target":"topLable",
               "name":"color",
               "value":undefined
            })),this._TDMResultWindowAccordionContentListRenderer_SetStyle6 = SetStyle(new SetStyle().initializeFromObject({
               "target":"topLablePointsDelta",
               "name":"color",
               "value":undefined
            })),this._TDMResultWindowAccordionContentListRenderer_SetProperty8 = SetProperty(new SetProperty().initializeFromObject({
               "target":"content",
               "name":"visible",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"content",
               "name":"layout",
               "value":this.method_4268()
            })]
         }),new State({
            "name":"hoveredAndSelected",
            "basedOn":"selected",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_TDMResultWindowAccordionContentListRenderer_Rect1",
               "name":"filters",
               "value":[this.method_3577()]
            })]
         })];
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetStyle1",this._TDMResultWindowAccordionContentListRenderer_SetStyle1);
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetStyle4",this._TDMResultWindowAccordionContentListRenderer_SetStyle4);
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty6",this._TDMResultWindowAccordionContentListRenderer_SetProperty6);
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty1",this._TDMResultWindowAccordionContentListRenderer_SetProperty1);
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty3",this._TDMResultWindowAccordionContentListRenderer_SetProperty3);
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetStyle2",this._TDMResultWindowAccordionContentListRenderer_SetStyle2);
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetStyle5",this._TDMResultWindowAccordionContentListRenderer_SetStyle5);
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty7",this._TDMResultWindowAccordionContentListRenderer_SetProperty7);
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty2",this._TDMResultWindowAccordionContentListRenderer_SetProperty2);
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty4",this._TDMResultWindowAccordionContentListRenderer_SetProperty4);
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty5",this._TDMResultWindowAccordionContentListRenderer_SetProperty5);
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetStyle3",this._TDMResultWindowAccordionContentListRenderer_SetStyle3);
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetStyle6",this._TDMResultWindowAccordionContentListRenderer_SetStyle6);
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty8",this._TDMResultWindowAccordionContentListRenderer_SetProperty8);
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_994._watcherSetupUtil = param1;
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
      
      public function set method_6230(param1:Object) : void
      {
         super.data = param1;
         var _loc2_:class_1515 = data as class_1515;
         if(_loc2_)
         {
            this.topLable.text = _loc2_.method_6469.left;
            this.topLablePointsDelta.text = _loc2_.method_6469.right;
            this.pointDelta.method_1780 = _loc2_.method_6444.left;
            this.winnigStreak.method_1780 = _loc2_.method_3845.left;
            this.peakDMG.method_1780 = _loc2_.method_5491.left;
            this.totalDMGtaken.method_1780 = _loc2_.method_1339.left;
            this.totalDMGgiven.method_1780 = _loc2_.method_5365.left;
            this.killDeath.method_1780 = _loc2_.method_3632.left;
            this.pointDelta.method_5902 = _loc2_.method_6444.right;
            this.winnigStreak.method_5902 = _loc2_.method_3845.right;
            this.peakDMG.method_5902 = _loc2_.method_5491.right;
            this.totalDMGtaken.method_5902 = _loc2_.method_1339.right;
            this.totalDMGgiven.method_5902 = _loc2_.method_5365.right;
            this.killDeath.method_5902 = _loc2_.method_3632.right;
         }
      }
      
      override protected function getCurrentRendererState() : String
      {
         var _loc1_:class_1515 = data as class_1515;
         var _loc2_:String = super.getCurrentRendererState();
         if(_loc1_)
         {
            if(Boolean(_loc1_.isHero) && currentState == "normal")
            {
               return "isHero";
            }
         }
         if(Boolean(hovered) && Boolean(selected))
         {
            return "hoveredAndSelected";
         }
         return _loc2_;
      }
      
      private function method_3924() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.layout = this.method_6120();
         _loc1_.mxmlContent = [this.method_3094(),this.method_3396()];
         _loc1_.id = "_TDMResultWindowAccordionContentListRenderer_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TDMResultWindowAccordionContentListRenderer_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_Group1",this._TDMResultWindowAccordionContentListRenderer_Group1);
         return _loc1_;
      }
      
      private function method_6120() : BasicLayout
      {
         return new BasicLayout();
      }
      
      private function method_3094() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this.method_1452(),this.method_4216(),this.method_1498()];
         _loc1_.id = "_TDMResultWindowAccordionContentListRenderer_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TDMResultWindowAccordionContentListRenderer_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_Group2",this._TDMResultWindowAccordionContentListRenderer_Group2);
         return _loc1_;
      }
      
      private function method_1452() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.fill = this.method_1739();
         _loc1_.initialized(this,"_TDMResultWindowAccordionContentListRenderer_Rect1");
         this._TDMResultWindowAccordionContentListRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_Rect1",this._TDMResultWindowAccordionContentListRenderer_Rect1);
         return _loc1_;
      }
      
      private function method_1739() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this.method_1540(),this.method_5693()];
         return _loc1_;
      }
      
      private function method_1540() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         this._TDMResultWindowAccordionContentListRenderer_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_GradientEntry1",this._TDMResultWindowAccordionContentListRenderer_GradientEntry1);
         return _loc1_;
      }
      
      private function method_5693() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         this._TDMResultWindowAccordionContentListRenderer_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_GradientEntry2",this._TDMResultWindowAccordionContentListRenderer_GradientEntry2);
         return _loc1_;
      }
      
      private function method_4216() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.height = 1;
         _loc1_.percentWidth = 100;
         _loc1_.fill = this.method_3959();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function method_3959() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._TDMResultWindowAccordionContentListRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SolidColor1",this._TDMResultWindowAccordionContentListRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function method_1498() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this.method_3947(),this.method_6329(),this.method_4754()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_3947() : Graphic
      {
         var _loc1_:Graphic = new Graphic();
         _loc1_.left = 10;
         _loc1_.top = 3;
         _loc1_.mxmlContent = [this.method_304()];
         _loc1_.id = "_TDMResultWindowAccordionContentListRenderer_Graphic1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TDMResultWindowAccordionContentListRenderer_Graphic1 = _loc1_;
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_Graphic1",this._TDMResultWindowAccordionContentListRenderer_Graphic1);
         return _loc1_;
      }
      
      private function method_304() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.initialized(this,"_TDMResultWindowAccordionContentListRenderer_Path1");
         this._TDMResultWindowAccordionContentListRenderer_Path1 = _loc1_;
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_Path1",this._TDMResultWindowAccordionContentListRenderer_Path1);
         return _loc1_;
      }
      
      private function method_6329() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 25;
         _loc1_.setStyle("paddingBottom",3);
         _loc1_.setStyle("paddingTop",3);
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("backgroundAlpha",0);
         _loc1_.id = "topLable";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.topLable = _loc1_;
         BindingManager.executeBindings(this,"topLable",this.topLable);
         return _loc1_;
      }
      
      private function method_4754() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.right = 25;
         _loc1_.setStyle("paddingBottom",3);
         _loc1_.setStyle("paddingTop",3);
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("backgroundAlpha",0);
         _loc1_.id = "topLablePointsDelta";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.topLablePointsDelta = _loc1_;
         BindingManager.executeBindings(this,"topLablePointsDelta",this.topLablePointsDelta);
         return _loc1_;
      }
      
      private function method_3396() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.percentWidth = 100;
         _loc1_.layout = this.method_5643();
         _loc1_.mxmlContent = [this.method_2537(),this.method_2018(),this.method_6081(),this.method_978(),this.method_2579(),this.method_2191()];
         _loc1_.id = "content";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.content = _loc1_;
         BindingManager.executeBindings(this,"content",this.content);
         return _loc1_;
      }
      
      private function method_5643() : BasicLayout
      {
         return new BasicLayout();
      }
      
      private function method_2537() : class_1516
      {
         var _loc1_:class_1516 = new class_1516();
         _loc1_.id = "killDeath";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.killDeath = _loc1_;
         BindingManager.executeBindings(this,"killDeath",this.killDeath);
         return _loc1_;
      }
      
      private function method_2018() : class_1516
      {
         var _loc1_:class_1516 = new class_1516();
         _loc1_.id = "pointDelta";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pointDelta = _loc1_;
         BindingManager.executeBindings(this,"pointDelta",this.pointDelta);
         return _loc1_;
      }
      
      private function method_6081() : class_1516
      {
         var _loc1_:class_1516 = new class_1516();
         _loc1_.id = "winnigStreak";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.winnigStreak = _loc1_;
         BindingManager.executeBindings(this,"winnigStreak",this.winnigStreak);
         return _loc1_;
      }
      
      private function method_978() : class_1516
      {
         var _loc1_:class_1516 = new class_1516();
         _loc1_.id = "peakDMG";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.peakDMG = _loc1_;
         BindingManager.executeBindings(this,"peakDMG",this.peakDMG);
         return _loc1_;
      }
      
      private function method_2579() : class_1516
      {
         var _loc1_:class_1516 = new class_1516();
         _loc1_.id = "totalDMGtaken";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.totalDMGtaken = _loc1_;
         BindingManager.executeBindings(this,"totalDMGtaken",this.totalDMGtaken);
         return _loc1_;
      }
      
      private function method_2191() : class_1516
      {
         var _loc1_:class_1516 = new class_1516();
         _loc1_.id = "totalDMGgiven";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.totalDMGgiven = _loc1_;
         BindingManager.executeBindings(this,"totalDMGgiven",this.totalDMGgiven);
         return _loc1_;
      }
      
      private function method_4060() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.strength = 1;
         _loc1_.blurX = 6;
         _loc1_.blurY = 6;
         this._TDMResultWindowAccordionContentListRenderer_GlowFilter3 = _loc1_;
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_GlowFilter3",this._TDMResultWindowAccordionContentListRenderer_GlowFilter3);
         return _loc1_;
      }
      
      private function method_1640() : BasicLayout
      {
         return new BasicLayout();
      }
      
      private function method_932() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._TDMResultWindowAccordionContentListRenderer_SolidColor2 = _loc1_;
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SolidColor2",this._TDMResultWindowAccordionContentListRenderer_SolidColor2);
         return _loc1_;
      }
      
      private function method_3557() : BasicLayout
      {
         return new BasicLayout();
      }
      
      private function method_6326() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.strength = 1;
         _loc1_.blurX = 6;
         _loc1_.blurY = 6;
         this._TDMResultWindowAccordionContentListRenderer_GlowFilter2 = _loc1_;
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_GlowFilter2",this._TDMResultWindowAccordionContentListRenderer_GlowFilter2);
         return _loc1_;
      }
      
      private function method_5674() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function method_2130() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._TDMResultWindowAccordionContentListRenderer_SolidColor3 = _loc1_;
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_SolidColor3",this._TDMResultWindowAccordionContentListRenderer_SolidColor3);
         return _loc1_;
      }
      
      private function method_4268() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function method_3577() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.inner = true;
         _loc1_.blurX = 7;
         _loc1_.blurY = 7;
         _loc1_.alpha = 0.5;
         this._TDMResultWindowAccordionContentListRenderer_GlowFilter1 = _loc1_;
         BindingManager.executeBindings(this,"_TDMResultWindowAccordionContentListRenderer_GlowFilter1",this._TDMResultWindowAccordionContentListRenderer_GlowFilter1);
         return _loc1_;
      }
      
      private function method_5031() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():Boolean
         {
            return false;
         },null,"_TDMResultWindowAccordionContentListRenderer_Group1.mouseEnabled");
         var_5[1] = new Binding(this,function():Boolean
         {
            return true;
         },null,"_TDMResultWindowAccordionContentListRenderer_Group2.buttonMode");
         var_5[2] = new Binding(this,function():Boolean
         {
            return true;
         },null,"_TDMResultWindowAccordionContentListRenderer_Group2.mouseChildren");
         var_5[3] = new Binding(this,function():uint
         {
            return class_996.const_1644;
         },null,"_TDMResultWindowAccordionContentListRenderer_GradientEntry1.color");
         var_5[4] = new Binding(this,function():*
         {
            return class_996.const_1071;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetProperty1.value");
         var_5[5] = new Binding(this,function():*
         {
            return class_996.const_1644;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetProperty2.value");
         var_5[6] = new Binding(this,function():uint
         {
            return class_996.const_178;
         },null,"_TDMResultWindowAccordionContentListRenderer_GradientEntry2.color");
         var_5[7] = new Binding(this,function():*
         {
            return class_996.const_2864;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetProperty3.value");
         var_5[8] = new Binding(this,function():*
         {
            return class_996.const_178;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetProperty4.value");
         var_5[9] = new Binding(this,function():uint
         {
            return class_996.const_2455;
         },null,"_TDMResultWindowAccordionContentListRenderer_GlowFilter1.color");
         var_5[10] = new Binding(this,function():uint
         {
            return class_996.const_1534;
         },null,"_TDMResultWindowAccordionContentListRenderer_SolidColor1.color");
         var_5[11] = new Binding(this,function():String
         {
            var _loc1_:* = class_996.const_896;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TDMResultWindowAccordionContentListRenderer_Path1.data");
         var_5[12] = new Binding(this,function():*
         {
            return class_996.const_1135;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetProperty5.value");
         var_5[13] = new Binding(this,function():uint
         {
            return class_996.const_2715;
         },null,"_TDMResultWindowAccordionContentListRenderer_SolidColor2.color");
         var_5[14] = new Binding(this,function():uint
         {
            return class_996.const_2137;
         },null,"_TDMResultWindowAccordionContentListRenderer_SolidColor3.color");
         var_5[15] = new Binding(this,function():uint
         {
            return class_996.const_2563;
         },null,"_TDMResultWindowAccordionContentListRenderer_GlowFilter2.color");
         var_5[16] = new Binding(this,function():uint
         {
            return class_996.const_2462;
         },null,"_TDMResultWindowAccordionContentListRenderer_GlowFilter3.color");
         var_5[17] = new Binding(this,function():Object
         {
            return class_996.const_1263;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetStyle1.value");
         var_5[18] = new Binding(this,function():Object
         {
            return class_996.const_2137;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetStyle2.value");
         var_5[19] = new Binding(this,function():Object
         {
            return class_996.const_2137;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetStyle3.value");
         var_5[20] = new Binding(this,function():Boolean
         {
            return false;
         },null,"topLable.mouseEnabled");
         var_5[21] = new Binding(this,function():String
         {
            var _loc1_:* = class_18.const_183;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            topLable.setStyle("fontFamily",param1);
         },"topLable.fontFamily");
         var_5[22] = new Binding(this,function():Object
         {
            return class_996.const_1263;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetStyle4.value");
         var_5[23] = new Binding(this,function():Object
         {
            return class_996.const_2137;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetStyle5.value");
         var_5[24] = new Binding(this,function():Object
         {
            return class_996.const_2137;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetStyle6.value");
         var_5[25] = new Binding(this,function():String
         {
            var _loc1_:* = class_88.getItem("result_window_points_delta");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"topLablePointsDelta.toolTip");
         var_5[26] = new Binding(this,function():String
         {
            var _loc1_:* = TextAlign.RIGHT;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            topLablePointsDelta.setStyle("textAlign",param1);
         },"topLablePointsDelta.textAlign");
         var_5[27] = new Binding(this,function():Boolean
         {
            return true;
         },null,"topLablePointsDelta.mouseEnabled");
         var_5[28] = new Binding(this,function():String
         {
            var _loc1_:* = class_18.const_183;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            topLablePointsDelta.setStyle("fontFamily",param1);
         },"topLablePointsDelta.fontFamily");
         var_5[29] = new Binding(this,function():*
         {
            return false;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetProperty6.value");
         var_5[30] = new Binding(this,function():*
         {
            return false;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetProperty7.value");
         var_5[31] = new Binding(this,function():*
         {
            return true;
         },null,"_TDMResultWindowAccordionContentListRenderer_SetProperty8.value");
         var_5[32] = new Binding(this,function():Boolean
         {
            return false;
         },null,"content.mouseEnabled");
         var_5[33] = new Binding(this,function():Boolean
         {
            return false;
         },null,"content.mouseChildren");
         var_5[34] = new Binding(this,function():int
         {
            return class_996.const_764;
         },null,"killDeath.padding");
         var_5[35] = new Binding(this,function():uint
         {
            return class_996.const_1551;
         },null,"killDeath.bgcolor");
         var_5[36] = new Binding(this,function():int
         {
            return class_996.const_764;
         },null,"pointDelta.padding");
         var_5[37] = new Binding(this,function():uint
         {
            return class_996.const_2774;
         },null,"pointDelta.bgcolor");
         var_5[38] = new Binding(this,function():int
         {
            return class_996.const_764;
         },null,"winnigStreak.padding");
         var_5[39] = new Binding(this,function():uint
         {
            return class_996.const_1551;
         },null,"winnigStreak.bgcolor");
         var_5[40] = new Binding(this,function():int
         {
            return class_996.const_764;
         },null,"peakDMG.padding");
         var_5[41] = new Binding(this,function():uint
         {
            return class_996.const_2774;
         },null,"peakDMG.bgcolor");
         var_5[42] = new Binding(this,function():int
         {
            return class_996.const_764;
         },null,"totalDMGtaken.padding");
         var_5[43] = new Binding(this,function():uint
         {
            return class_996.const_1551;
         },null,"totalDMGtaken.bgcolor");
         var_5[44] = new Binding(this,function():int
         {
            return class_996.const_764;
         },null,"totalDMGgiven.padding");
         var_5[45] = new Binding(this,function():uint
         {
            return class_996.const_2774;
         },null,"totalDMGgiven.bgcolor");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_GradientEntry1() : GradientEntry
      {
         return this.var_951;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_GradientEntry1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this.var_951;
         if(_loc2_ !== param1)
         {
            this.var_951 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_GradientEntry1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_GradientEntry2() : GradientEntry
      {
         return this.var_514;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_GradientEntry2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this.var_514;
         if(_loc2_ !== param1)
         {
            this.var_514 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_GradientEntry2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_Graphic1() : Graphic
      {
         return this.var_794;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_Graphic1(param1:Graphic) : void
      {
         var _loc2_:Object = this.var_794;
         if(_loc2_ !== param1)
         {
            this.var_794 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_Graphic1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_Group1() : Group
      {
         return this.var_2661;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_Group1(param1:Group) : void
      {
         var _loc2_:Object = this.var_2661;
         if(_loc2_ !== param1)
         {
            this.var_2661 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_Group1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_Path1() : Path
      {
         return this.var_678;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_Path1(param1:Path) : void
      {
         var _loc2_:Object = this.var_678;
         if(_loc2_ !== param1)
         {
            this.var_678 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_Path1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_Rect1() : Rect
      {
         return this.var_4293;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_Rect1(param1:Rect) : void
      {
         var _loc2_:Object = this.var_4293;
         if(_loc2_ !== param1)
         {
            this.var_4293 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_Rect1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetProperty1() : SetProperty
      {
         return this.var_2077;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_2077;
         if(_loc2_ !== param1)
         {
            this.var_2077 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetProperty2() : SetProperty
      {
         return this.var_1534;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_1534;
         if(_loc2_ !== param1)
         {
            this.var_1534 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetProperty3() : SetProperty
      {
         return this.var_4326;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetProperty3(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_4326;
         if(_loc2_ !== param1)
         {
            this.var_4326 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetProperty4() : SetProperty
      {
         return this.var_1354;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetProperty4(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_1354;
         if(_loc2_ !== param1)
         {
            this.var_1354 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetProperty5() : SetProperty
      {
         return this.var_3640;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetProperty5(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_3640;
         if(_loc2_ !== param1)
         {
            this.var_3640 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetProperty6() : SetProperty
      {
         return this.var_3653;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetProperty6(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_3653;
         if(_loc2_ !== param1)
         {
            this.var_3653 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetProperty7() : SetProperty
      {
         return this.var_4060;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetProperty7(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_4060;
         if(_loc2_ !== param1)
         {
            this.var_4060 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty7",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetProperty8() : SetProperty
      {
         return this.var_2557;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetProperty8(param1:SetProperty) : void
      {
         var _loc2_:Object = this.var_2557;
         if(_loc2_ !== param1)
         {
            this.var_2557 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetProperty8",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetStyle1() : SetStyle
      {
         return this.var_1091;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetStyle1(param1:SetStyle) : void
      {
         var _loc2_:Object = this.var_1091;
         if(_loc2_ !== param1)
         {
            this.var_1091 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetStyle1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetStyle2() : SetStyle
      {
         return this.var_3758;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetStyle2(param1:SetStyle) : void
      {
         var _loc2_:Object = this.var_3758;
         if(_loc2_ !== param1)
         {
            this.var_3758 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetStyle2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetStyle3() : SetStyle
      {
         return this.var_4359;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetStyle3(param1:SetStyle) : void
      {
         var _loc2_:Object = this.var_4359;
         if(_loc2_ !== param1)
         {
            this.var_4359 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetStyle3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetStyle4() : SetStyle
      {
         return this.var_4344;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetStyle4(param1:SetStyle) : void
      {
         var _loc2_:Object = this.var_4344;
         if(_loc2_ !== param1)
         {
            this.var_4344 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetStyle4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetStyle5() : SetStyle
      {
         return this.var_4975;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetStyle5(param1:SetStyle) : void
      {
         var _loc2_:Object = this.var_4975;
         if(_loc2_ !== param1)
         {
            this.var_4975 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetStyle5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TDMResultWindowAccordionContentListRenderer_SetStyle6() : SetStyle
      {
         return this.var_1897;
      }
      
      public function set _TDMResultWindowAccordionContentListRenderer_SetStyle6(param1:SetStyle) : void
      {
         var _loc2_:Object = this.var_1897;
         if(_loc2_ !== param1)
         {
            this.var_1897 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TDMResultWindowAccordionContentListRenderer_SetStyle6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get content() : Group
      {
         return this.var_3443;
      }
      
      public function set content(param1:Group) : void
      {
         var _loc2_:Object = this.var_3443;
         if(_loc2_ !== param1)
         {
            this.var_3443 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"content",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get killDeath() : class_1516
      {
         return this.var_4262;
      }
      
      public function set killDeath(param1:class_1516) : void
      {
         var _loc2_:Object = this.var_4262;
         if(_loc2_ !== param1)
         {
            this.var_4262 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"killDeath",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get peakDMG() : class_1516
      {
         return this.var_1721;
      }
      
      public function set peakDMG(param1:class_1516) : void
      {
         var _loc2_:Object = this.var_1721;
         if(_loc2_ !== param1)
         {
            this.var_1721 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"peakDMG",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pointDelta() : class_1516
      {
         return this.var_2150;
      }
      
      public function set pointDelta(param1:class_1516) : void
      {
         var _loc2_:Object = this.var_2150;
         if(_loc2_ !== param1)
         {
            this.var_2150 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pointDelta",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get topLable() : Label
      {
         return this.var_605;
      }
      
      public function set topLable(param1:Label) : void
      {
         var _loc2_:Object = this.var_605;
         if(_loc2_ !== param1)
         {
            this.var_605 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topLable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get topLablePointsDelta() : Label
      {
         return this.var_3780;
      }
      
      public function set topLablePointsDelta(param1:Label) : void
      {
         var _loc2_:Object = this.var_3780;
         if(_loc2_ !== param1)
         {
            this.var_3780 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topLablePointsDelta",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get totalDMGgiven() : class_1516
      {
         return this.var_1783;
      }
      
      public function set totalDMGgiven(param1:class_1516) : void
      {
         var _loc2_:Object = this.var_1783;
         if(_loc2_ !== param1)
         {
            this.var_1783 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"totalDMGgiven",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get totalDMGtaken() : class_1516
      {
         return this.var_2040;
      }
      
      public function set totalDMGtaken(param1:class_1516) : void
      {
         var _loc2_:Object = this.var_2040;
         if(_loc2_ !== param1)
         {
            this.var_2040 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"totalDMGtaken",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get winnigStreak() : class_1516
      {
         return this.var_2319;
      }
      
      public function set winnigStreak(param1:class_1516) : void
      {
         var _loc2_:Object = this.var_2319;
         if(_loc2_ !== param1)
         {
            this.var_2319 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"winnigStreak",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      override public function set data(param1:Object) : void
      {
         var _loc2_:Object = this.data;
         if(_loc2_ !== param1)
         {
            this.method_6230 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"data",_loc2_,param1));
            }
         }
      }
   }
}
