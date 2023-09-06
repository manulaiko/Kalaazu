package package_55
{
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOScalableDivider;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOScalableDividerSkin;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOViewContainerSkin;
   import package_11.class_39;
   import package_156.class_1002;
   import package_157.class_1003;
   import package_49.class_987;
   import package_9.ResourceManager;
   import spark.components.BorderContainer;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.Scroller;
   import spark.components.TabBar;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.primitives.BitmapImage;
   
   public class class_151 extends class_150 implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var var_4946:BorderContainer;
      
      private var var_2887:VGroup;
      
      private var var_2538:BitmapImage;
      
      private var var_451:DOScalableDivider;
      
      private var var_757:BorderContainer;
      
      private var var_1403:VGroup;
      
      private var var_1778:VGroup;
      
      private var var_2215:TabBar;
      
      private var var_3919:VGroup;
      
      private var var_288:VGroup;
      
      private var var_4808:HGroup;
      
      private var var_2594:Label;
      
      private var var_577:VGroup;
      
      private var var_1884:HGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var var_2087:class_1004;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_151()
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
         bindings = this.method_428();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_companyhierarchy_view_components_CompanyHierarchyWindowViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_151[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.styleName = "companyHierarchyWindow";
         this.width = 600;
         this.height = 500;
         this.minHeight = 500;
         this.minWidth = 600;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_1006);
         this.addEventListener("creationComplete",this.method_1986);
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_151._watcherSetupUtil = param1;
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
      
      public function set handler(param1:class_1004) : void
      {
         this.var_2087 = param1;
      }
      
      private function onComplete() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(ResourceManager.name_15.getFinisher("clanHierarchyWin") != null && Boolean((ResourceManager.name_15.getFinisher("clanHierarchyWin") as class_39).method_2545("contentBg")))
         {
            this.bgContainer.setStyle("backgroundImage",ResourceManager.getBitmap("clanHierarchyWin","contentBg"));
         }
         if(ResourceManager.name_15.getFinisher("clanHierarchyWin") != null && Boolean((ResourceManager.name_15.getFinisher("clanHierarchyWin") as class_39).method_2545("infoBtn")))
         {
            _loc1_ = ResourceManager.getMovieClip("clanHierarchyWin","infoBtn");
            _loc1_.stop();
            _loc1_.addEventListener(MouseEvent.MOUSE_OVER,this.method_3174);
            _loc1_.addEventListener(MouseEvent.MOUSE_OUT,this.method_2100);
            _loc2_ = new UIComponent();
            _loc2_.addChild(_loc1_);
            this.windowDescription.addElement(_loc2_);
            this.windowDescription.toolTip = class_88.getItem("company_hierarchy_desc_window");
         }
         itsYourClan.text = class_88.getItem("company_hierarchy_desc_your_clan");
         this.method_315();
      }
      
      private function method_3174(param1:Event) : void
      {
         (param1.target as MovieClip).gotoAndStop(2);
      }
      
      private function method_2100(param1:Event) : void
      {
         (param1.target as MovieClip).gotoAndStop(1);
      }
      
      public function method_315() : void
      {
         var _loc1_:* = null;
         if(class_126.instance.method_1709[this.mainTabBar.selectedIndex + 1] != undefined && ResourceManager.name_15.getFinisher("clanHierarchyWin") != null && Boolean((ResourceManager.name_15.getFinisher("clanHierarchyWin") as class_39).method_2545("logo_" + class_126.instance.method_1709[this.mainTabBar.selectedIndex + 1])))
         {
            _loc1_ = ResourceManager.getBitmap("clanHierarchyWin","logo_" + class_126.instance.method_1709[this.mainTabBar.selectedIndex + 1]);
            this.companyLogo.source = _loc1_;
            this.companyLogo.alpha = 1;
         }
         else
         {
            this.companyLogo.alpha = 0;
         }
      }
      
      private function method_1005(param1:IndexChangeEvent) : void
      {
         this.mainTabBar.selectedIndex = param1.newIndex;
         this.method_315();
         super.method_2437(param1.newIndex);
         if(this.var_2087 != null)
         {
            this.var_2087.method_1331(param1.newIndex);
         }
      }
      
      private function method_1006() : Array
      {
         return [this.method_1556(),this.method_5671()];
      }
      
      private function method_1556() : DOScalableDivider
      {
         var _loc1_:DOScalableDivider = new DOScalableDivider();
         _loc1_.percentWidth = 100;
         _loc1_.styleName = "questWindowTabBar";
         _loc1_.setStyle("skinClass",DOScalableDividerSkin);
         _loc1_.id = "divider";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.divider = _loc1_;
         BindingManager.executeBindings(this,"divider",this.divider);
         return _loc1_;
      }
      
      private function method_5671() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingLeft = 1;
         _loc1_.paddingRight = 1;
         _loc1_.paddingTop = -10;
         _loc1_.mxmlContent = [this.method_1290(),this.method_6492()];
         _loc1_.id = "mainVGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainVGroup = _loc1_;
         BindingManager.executeBindings(this,"mainVGroup",this.mainVGroup);
         return _loc1_;
      }
      
      private function method_1290() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this.method_6176(),this.method_1763()];
         _loc1_.id = "topBarHGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.topBarHGroup = _loc1_;
         BindingManager.executeBindings(this,"topBarHGroup",this.topBarHGroup);
         return _loc1_;
      }
      
      private function method_6176() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingLeft = 1;
         _loc1_.mxmlContent = [this.method_2352()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_2352() : TabBar
      {
         var _loc1_:TabBar = new TabBar();
         _loc1_.setStyle("skinClass",class_987);
         _loc1_.addEventListener("change",this.method_5779);
         _loc1_.id = "mainTabBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainTabBar = _loc1_;
         BindingManager.executeBindings(this,"mainTabBar",this.mainTabBar);
         return _loc1_;
      }
      
      public function method_5779(param1:IndexChangeEvent) : void
      {
         this.method_1005(param1);
      }
      
      private function method_1763() : DOScalableDivider
      {
         var _loc1_:DOScalableDivider = new DOScalableDivider();
         _loc1_.percentWidth = 100;
         _loc1_.styleName = "questWindowTabBar";
         _loc1_.alpha = 0;
         _loc1_.setStyle("skinClass",DOScalableDividerSkin);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_6492() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_589);
         _loc1_.setStyle("backgroundAlpha",1);
         _loc1_.setStyle("borderAlpha",0);
         _loc1_.setStyle("borderColor",16777215);
         _loc1_.setStyle("skinClass",DOViewContainerSkin);
         _loc1_.id = "hierarchyContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hierarchyContainer = _loc1_;
         BindingManager.executeBindings(this,"hierarchyContainer",this.hierarchyContainer);
         return _loc1_;
      }
      
      private function method_589() : Array
      {
         return [this.method_5071()];
      }
      
      private function method_5071() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.bottom = 20;
         _loc1_.styleName = "skinnedScroller";
         _loc1_.viewport = this.method_333();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_333() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this.method_2211()];
         _loc1_.id = "hierarchyOuterVGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hierarchyOuterVGroup = _loc1_;
         BindingManager.executeBindings(this,"hierarchyOuterVGroup",this.hierarchyOuterVGroup);
         return _loc1_;
      }
      
      private function method_2211() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.height = 483;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_826);
         _loc1_.id = "bgContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bgContainer = _loc1_;
         BindingManager.executeBindings(this,"bgContainer",this.bgContainer);
         return _loc1_;
      }
      
      private function method_826() : Array
      {
         return [this.method_2308()];
      }
      
      private function method_2308() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this.method_6455(),this.method_5792(),this.method_391(),this.method_4831()];
         _loc1_.id = "hierarchyInnerVGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hierarchyInnerVGroup = _loc1_;
         BindingManager.executeBindings(this,"hierarchyInnerVGroup",this.hierarchyInnerVGroup);
         return _loc1_;
      }
      
      private function method_6455() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.alpha = 0;
         _loc1_.text = " ";
         _loc1_.id = "topLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.topLabel = _loc1_;
         BindingManager.executeBindings(this,"topLabel",this.topLabel);
         return _loc1_;
      }
      
      private function method_5792() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this.method_1980(),this.method_5623(),this.method_3052()];
         _loc1_.id = "topHGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.topHGroup = _loc1_;
         BindingManager.executeBindings(this,"topHGroup",this.topHGroup);
         return _loc1_;
      }
      
      private function method_1980() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 25;
         _loc1_.paddingLeft = 46;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this.method_4455()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_4455() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"companyLogo");
         this.companyLogo = _loc1_;
         BindingManager.executeBindings(this,"companyLogo",this.companyLogo);
         return _loc1_;
      }
      
      private function method_5623() : class_1000
      {
         var _loc1_:class_1000 = new class_1000();
         _loc1_.percentWidth = 50;
         _loc1_.id = "leader";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         leader = _loc1_;
         BindingManager.executeBindings(this,"leader",leader);
         return _loc1_;
      }
      
      private function method_3052() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 25;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this.method_5644()];
         _loc1_.id = "windowDescriptionContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.windowDescriptionContainer = _loc1_;
         BindingManager.executeBindings(this,"windowDescriptionContainer",this.windowDescriptionContainer);
         return _loc1_;
      }
      
      private function method_5644() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 82;
         _loc1_.id = "windowDescription";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.windowDescription = _loc1_;
         BindingManager.executeBindings(this,"windowDescription",this.windowDescription);
         return _loc1_;
      }
      
      private function method_391() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingTop = -3;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this.method_4713()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_4713() : List
      {
         var _loc1_:List = new List();
         _loc1_.itemRenderer = this.method_1960();
         _loc1_.percentWidth = 100;
         _loc1_.enabled = true;
         _loc1_.setStyle("skinClass",class_1003);
         _loc1_.setStyle("contentBackgroundAlpha",0);
         _loc1_.setStyle("borderAlpha",0);
         _loc1_.id = "rankedClanItemList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         rankedClanItemList = _loc1_;
         BindingManager.executeBindings(this,"rankedClanItemList",rankedClanItemList);
         return _loc1_;
      }
      
      private function method_1960() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = class_1002;
         return _loc1_;
      }
      
      private function method_4831() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this.method_5598(),this.method_3972()];
         _loc1_.id = "bottomVGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bottomVGroup = _loc1_;
         BindingManager.executeBindings(this,"bottomVGroup",this.bottomVGroup);
         return _loc1_;
      }
      
      private function method_5598() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.text = "Your Clan Position";
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontSize",14);
         _loc1_.id = "itsYourClan";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         itsYourClan = _loc1_;
         BindingManager.executeBindings(this,"itsYourClan",itsYourClan);
         return _loc1_;
      }
      
      private function method_3972() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingTop = -6;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this.method_648()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_648() : class_1000
      {
         var _loc1_:class_1000 = new class_1000();
         _loc1_.percentWidth = 50;
         _loc1_.id = "bottomClan";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         bottomClan = _loc1_;
         BindingManager.executeBindings(this,"bottomClan",bottomClan);
         return _loc1_;
      }
      
      public function method_1986(param1:FlexEvent) : void
      {
         this.onComplete();
      }
      
      private function method_428() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():String
         {
            var _loc1_:* = class_88.getItem("title_company_hierarchy");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"this.title");
         var_5[1] = new Binding(this,function():Number
         {
            return NaN;
         },null,"divider.y");
         var_5[2] = new Binding(this,null,null,"mainTabBar.dataProvider","tabList");
         var_5[3] = new Binding(this,function():uint
         {
            return class_18.const_1874;
         },function(param1:uint):void
         {
            itsYourClan.setStyle("color",param1);
         },"itsYourClan.color");
         var_5[4] = new Binding(this,function():String
         {
            var _loc1_:* = class_18.const_183;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            itsYourClan.setStyle("fontFamily",param1);
         },"itsYourClan.fontFamily");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get bgContainer() : BorderContainer
      {
         return this.var_4946;
      }
      
      public function set bgContainer(param1:BorderContainer) : void
      {
         var _loc2_:Object = this.var_4946;
         if(_loc2_ !== param1)
         {
            this.var_4946 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bottomVGroup() : VGroup
      {
         return this.var_2887;
      }
      
      public function set bottomVGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this.var_2887;
         if(_loc2_ !== param1)
         {
            this.var_2887 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bottomVGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get companyLogo() : BitmapImage
      {
         return this.var_2538;
      }
      
      public function set companyLogo(param1:BitmapImage) : void
      {
         var _loc2_:Object = this.var_2538;
         if(_loc2_ !== param1)
         {
            this.var_2538 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"companyLogo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get divider() : DOScalableDivider
      {
         return this.var_451;
      }
      
      public function set divider(param1:DOScalableDivider) : void
      {
         var _loc2_:Object = this.var_451;
         if(_loc2_ !== param1)
         {
            this.var_451 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"divider",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hierarchyContainer() : BorderContainer
      {
         return this.var_757;
      }
      
      public function set hierarchyContainer(param1:BorderContainer) : void
      {
         var _loc2_:Object = this.var_757;
         if(_loc2_ !== param1)
         {
            this.var_757 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hierarchyContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hierarchyInnerVGroup() : VGroup
      {
         return this.var_1403;
      }
      
      public function set hierarchyInnerVGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this.var_1403;
         if(_loc2_ !== param1)
         {
            this.var_1403 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hierarchyInnerVGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hierarchyOuterVGroup() : VGroup
      {
         return this.var_1778;
      }
      
      public function set hierarchyOuterVGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this.var_1778;
         if(_loc2_ !== param1)
         {
            this.var_1778 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hierarchyOuterVGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainTabBar() : TabBar
      {
         return this.var_2215;
      }
      
      public function set mainTabBar(param1:TabBar) : void
      {
         var _loc2_:Object = this.var_2215;
         if(_loc2_ !== param1)
         {
            this.var_2215 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainTabBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainVGroup() : VGroup
      {
         return this.var_3919;
      }
      
      public function set mainVGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this.var_3919;
         if(_loc2_ !== param1)
         {
            this.var_3919 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainVGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get topBarHGroup() : VGroup
      {
         return this.var_288;
      }
      
      public function set topBarHGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this.var_288;
         if(_loc2_ !== param1)
         {
            this.var_288 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topBarHGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get topHGroup() : HGroup
      {
         return this.var_4808;
      }
      
      public function set topHGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this.var_4808;
         if(_loc2_ !== param1)
         {
            this.var_4808 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topHGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get topLabel() : Label
      {
         return this.var_2594;
      }
      
      public function set topLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_2594;
         if(_loc2_ !== param1)
         {
            this.var_2594 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get windowDescription() : VGroup
      {
         return this.var_577;
      }
      
      public function set windowDescription(param1:VGroup) : void
      {
         var _loc2_:Object = this.var_577;
         if(_loc2_ !== param1)
         {
            this.var_577 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"windowDescription",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get windowDescriptionContainer() : HGroup
      {
         return this.var_1884;
      }
      
      public function set windowDescriptionContainer(param1:HGroup) : void
      {
         var _loc2_:Object = this.var_1884;
         if(_loc2_ !== param1)
         {
            this.var_1884 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"windowDescriptionContainer",_loc2_,param1));
            }
         }
      }
   }
}
