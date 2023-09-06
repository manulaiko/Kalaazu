package package_49
{
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.styles.*;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOScalableDivider;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOViewContainerBase;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOCheckBoxSkin;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOOuterViewContainerSkin;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOScalableDividerSkin;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_145.class_983;
   import package_147.class_984;
   import package_148.class_985;
   import package_149.class_986;
   import spark.components.BorderContainer;
   import spark.components.CheckBox;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.TabBar;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import spark.events.IndexChangeEvent;
   import spark.layouts.HorizontalAlign;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   public class class_139 extends class_138 implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var var_4541:CheckBox;
      
      private var var_3193:BorderContainer;
      
      private var _1719531403bigTopLevelHoldingGroupObjectThingy:Group;
      
      private var name_77:CheckBox;
      
      private var var_451:DOScalableDivider;
      
      private var var_2441:CheckBox;
      
      private var _315970861groupDepth1:VGroup;
      
      private var var_470:HGroup;
      
      private var var_1191:VGroup;
      
      private var var_2884:CheckBox;
      
      private var var_4375:CheckBox;
      
      private var var_4270:BorderContainer;
      
      private var var_288:VGroup;
      
      private var var_3451:CheckBox;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function class_139()
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
         bindings = this.method_4283();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_questWindow_view_components_QuestGiverWindowViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return class_139[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.styleName = "questWindow";
         this.title = "Mission Giver";
         this.width = 700;
         this.height = 550;
         this.minHeight = 550;
         this.minWidth = 700;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4708);
         this.addEventListener("creationComplete",this.method_5194);
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         class_139._watcherSetupUtil = param1;
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
      
      override protected function handleResizeMouseMove(param1:MouseEvent) : void
      {
         super.handleResizeMouseMove(param1);
      }
      
      public function method_4482() : Vector.<Label>
      {
         var _loc1_:Vector.<Label> = new Vector.<Label>();
         _loc1_.push(questWindowQuestSection.questsLeft);
         _loc1_.push(questWindowChallengesSection.questsLeft);
         return _loc1_;
      }
      
      private function method_2647() : void
      {
         Settings.questsAvailableFilter = this.available.selected;
         Settings.questsUnavailableFilter = this.unavailable.selected;
         Settings.questsCompletedFilter = this.completed.selected;
         Settings.questsLevelOrderDescending = this.levelorder.selected;
         Settings.challengesUnattemptedFilter = this.notYetDone.selected;
         Settings.challengesAttemptedFilter = this.done.selected;
         dispatchEvent(new class_985(class_985.FILTERS_CHANGED));
      }
      
      override public function handleCreationComplete() : void
      {
         super.handleCreationComplete();
         this.available.selected = Settings.questsAvailableFilter;
         this.unavailable.selected = Settings.questsUnavailableFilter;
         this.completed.selected = Settings.questsCompletedFilter;
         this.levelorder.selected = Settings.questsLevelOrderDescending;
         this.notYetDone.selected = Settings.challengesUnattemptedFilter;
         this.done.selected = Settings.challengesAttemptedFilter;
         this.method_2647();
      }
      
      private function method_4708() : Array
      {
         return [this.method_5012(),this.method_4050()];
      }
      
      private function method_5012() : DOScalableDivider
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
      
      private function method_4050() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.bottom = 30;
         _loc1_.left = 20;
         _loc1_.right = 20;
         _loc1_.mxmlContent = [this.method_4471()];
         _loc1_.id = "bigTopLevelHoldingGroupObjectThingy";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bigTopLevelHoldingGroupObjectThingy = _loc1_;
         BindingManager.executeBindings(this,"bigTopLevelHoldingGroupObjectThingy",this.bigTopLevelHoldingGroupObjectThingy);
         return _loc1_;
      }
      
      private function method_4471() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this.method_393(),this.method_4514()];
         _loc1_.id = "groupDepth1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.groupDepth1 = _loc1_;
         BindingManager.executeBindings(this,"groupDepth1",this.groupDepth1);
         return _loc1_;
      }
      
      private function method_393() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this.method_3594(),this.method_5224()];
         _loc1_.id = "topBarHGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.topBarHGroup = _loc1_;
         BindingManager.executeBindings(this,"topBarHGroup",this.topBarHGroup);
         return _loc1_;
      }
      
      private function method_3594() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingLeft = 0;
         _loc1_.mxmlContent = [this.method_3569()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_3569() : TabBar
      {
         var _loc1_:TabBar = new TabBar();
         _loc1_.setStyle("skinClass",class_987);
         _loc1_.addEventListener("change",this.method_5779);
         _loc1_.id = "mainTabBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         mainTabBar = _loc1_;
         BindingManager.executeBindings(this,"mainTabBar",mainTabBar);
         return _loc1_;
      }
      
      public function method_5779(param1:IndexChangeEvent) : void
      {
         method_738(param1);
      }
      
      private function method_5224() : DOScalableDivider
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
      
      private function method_4514() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this.method_1768(),this.method_787()];
         _loc1_.id = "groupDepth2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.groupDepth2 = _loc1_;
         BindingManager.executeBindings(this,"groupDepth2",this.groupDepth2);
         return _loc1_;
      }
      
      private function method_1768() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.width = 240;
         _loc1_.percentHeight = 100;
         _loc1_.gap = -1;
         _loc1_.mxmlContent = [this.method_2359(),this.method_5002(),this.method_6499()];
         _loc1_.id = "groupDepth3a";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.groupDepth3a = _loc1_;
         BindingManager.executeBindings(this,"groupDepth3a",this.groupDepth3a);
         return _loc1_;
      }
      
      private function method_2359() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.maxHeight = 200;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_3931);
         _loc1_.setStyle("backgroundAlpha",0);
         _loc1_.setStyle("borderAlpha",0);
         _loc1_.id = "questGiverPortrait";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.questGiverPortrait = _loc1_;
         BindingManager.executeBindings(this,"questGiverPortrait",this.questGiverPortrait);
         return _loc1_;
      }
      
      private function method_3931() : Array
      {
         return [this.method_365(),this.method_5706()];
      }
      
      private function method_365() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.left = -1;
         _loc1_.top = 12;
         _loc1_.height = 200;
         _loc1_.initialized(this,"questGiverImageContainer");
         questGiverImageContainer = _loc1_;
         BindingManager.executeBindings(this,"questGiverImageContainer",questGiverImageContainer);
         return _loc1_;
      }
      
      private function method_5706() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.right = 0;
         _loc1_.initialized(this,"questGiverPortraitNameText");
         questGiverPortraitNameText = _loc1_;
         BindingManager.executeBindings(this,"questGiverPortraitNameText",questGiverPortraitNameText);
         return _loc1_;
      }
      
      private function method_5002() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_708);
         _loc1_.setStyle("borderColor",5789784);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_708() : Array
      {
         return [this.method_6024(),this.method_3933(),this.method_5850()];
      }
      
      private function method_6024() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.height = 36;
         _loc1_.fill = this.method_2020();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function method_2020() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 1844009;
         return _loc1_;
      }
      
      private function method_3933() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.top = 4;
         _loc1_.bottom = 2;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this.method_4187(),this.method_3825(),this.method_1883(),this.method_3434()];
         _loc1_.id = "questStateFilters";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         questStateFilters = _loc1_;
         BindingManager.executeBindings(this,"questStateFilters",questStateFilters);
         return _loc1_;
      }
      
      private function method_4187() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.styleName = "doCheckBoxFilterAvailable";
         _loc1_.setStyle("skinClass",DOCheckBoxSkin);
         _loc1_.addEventListener("change",this.method_5883);
         _loc1_.id = "available";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.available = _loc1_;
         BindingManager.executeBindings(this,"available",this.available);
         return _loc1_;
      }
      
      public function method_5883(param1:Event) : void
      {
         this.method_2647();
      }
      
      private function method_3825() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.styleName = "doCheckBoxFilterUnavailable";
         _loc1_.setStyle("skinClass",DOCheckBoxSkin);
         _loc1_.addEventListener("change",this.method_5009);
         _loc1_.id = "unavailable";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.unavailable = _loc1_;
         BindingManager.executeBindings(this,"unavailable",this.unavailable);
         return _loc1_;
      }
      
      public function method_5009(param1:Event) : void
      {
         this.method_2647();
      }
      
      private function method_1883() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.styleName = "doCheckBoxFilterCompleted";
         _loc1_.setStyle("skinClass",DOCheckBoxSkin);
         _loc1_.addEventListener("change",this.method_5832);
         _loc1_.id = "completed";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.completed = _loc1_;
         BindingManager.executeBindings(this,"completed",this.completed);
         return _loc1_;
      }
      
      public function method_5832(param1:Event) : void
      {
         this.method_2647();
      }
      
      private function method_3434() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.styleName = "doCheckBoxLevelOrder";
         _loc1_.setStyle("skinClass",DOCheckBoxSkin);
         _loc1_.addEventListener("change",this.method_2061);
         _loc1_.id = "levelorder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.levelorder = _loc1_;
         BindingManager.executeBindings(this,"levelorder",this.levelorder);
         return _loc1_;
      }
      
      public function method_2061(param1:Event) : void
      {
         this.method_2647();
      }
      
      private function method_5850() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.visible = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.top = 4;
         _loc1_.bottom = 2;
         _loc1_.gap = 23;
         _loc1_.mxmlContent = [this.method_4906(),this.method_3473()];
         _loc1_.id = "challengeStateFilters";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         challengeStateFilters = _loc1_;
         BindingManager.executeBindings(this,"challengeStateFilters",challengeStateFilters);
         return _loc1_;
      }
      
      private function method_4906() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.styleName = "doCheckBoxFilterUnattempted";
         _loc1_.setStyle("skinClass",DOCheckBoxSkin);
         _loc1_.addEventListener("change",this.method_554);
         _loc1_.id = "notYetDone";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.notYetDone = _loc1_;
         BindingManager.executeBindings(this,"notYetDone",this.notYetDone);
         return _loc1_;
      }
      
      public function method_554(param1:Event) : void
      {
         this.method_2647();
      }
      
      private function method_3473() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.styleName = "doCheckBoxFilterAttempted";
         _loc1_.setStyle("skinClass",DOCheckBoxSkin);
         _loc1_.addEventListener("change",this.method_697);
         _loc1_.id = "done";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.done = _loc1_;
         BindingManager.executeBindings(this,"done",this.done);
         return _loc1_;
      }
      
      public function method_697(param1:Event) : void
      {
         this.method_2647();
      }
      
      private function method_6499() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this.method_6235(),this.method_2253()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_6235() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_1435);
         _loc1_.setStyle("borderColor",5789784);
         _loc1_.setStyle("backgroundAlpha",0);
         _loc1_.id = "availableQuestList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.availableQuestList = _loc1_;
         BindingManager.executeBindings(this,"availableQuestList",this.availableQuestList);
         return _loc1_;
      }
      
      private function method_1435() : Array
      {
         return [this.method_2313()];
      }
      
      private function method_2313() : List
      {
         var _loc1_:List = new List();
         _loc1_.itemRenderer = this.method_6439();
         _loc1_.styleName = "skinnedList";
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "questList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         questList = _loc1_;
         BindingManager.executeBindings(this,"questList",questList);
         return _loc1_;
      }
      
      private function method_6439() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = class_986;
         return _loc1_;
      }
      
      private function method_2253() : DOViewContainerBase
      {
         var _loc1_:DOViewContainerBase = new DOViewContainerBase();
         _loc1_.visible = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.styleName = "questWindowOuter";
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4982);
         _loc1_.setStyle("skinClass",DOOuterViewContainerSkin);
         _loc1_.id = "noQuestListMessageContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         noQuestListMessageContainer = _loc1_;
         BindingManager.executeBindings(this,"noQuestListMessageContainer",noQuestListMessageContainer);
         return _loc1_;
      }
      
      private function method_4982() : Array
      {
         return [this.method_3730()];
      }
      
      private function method_3730() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.text = "No quests avails!";
         _loc1_.setStyle("fontSize",20);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("paddingTop",10);
         _loc1_.setStyle("color",16763648);
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "noAvailableQuestListMessage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         noAvailableQuestListMessage = _loc1_;
         BindingManager.executeBindings(this,"noAvailableQuestListMessage",noAvailableQuestListMessage);
         return _loc1_;
      }
      
      private function method_787() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this.method_104(),this.method_4559(),this.method_1704()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_104() : class_983
      {
         var _loc1_:class_983 = new class_983();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = true;
         _loc1_.id = "questWindowQuestSection";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         questWindowQuestSection = _loc1_;
         BindingManager.executeBindings(this,"questWindowQuestSection",questWindowQuestSection);
         return _loc1_;
      }
      
      private function method_4559() : class_984
      {
         var _loc1_:class_984 = new class_984();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.id = "questWindowChallengesSection";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         questWindowChallengesSection = _loc1_;
         BindingManager.executeBindings(this,"questWindowChallengesSection",questWindowChallengesSection);
         return _loc1_;
      }
      
      private function method_1704() : DOViewContainerBase
      {
         var _loc1_:DOViewContainerBase = new DOViewContainerBase();
         _loc1_.visible = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.styleName = "questWindowOuter";
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_1683);
         _loc1_.setStyle("skinClass",DOOuterViewContainerSkin);
         _loc1_.id = "noQuestsMessageContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         noQuestsMessageContainer = _loc1_;
         BindingManager.executeBindings(this,"noQuestsMessageContainer",noQuestsMessageContainer);
         return _loc1_;
      }
      
      private function method_1683() : Array
      {
         return [this.method_5830()];
      }
      
      private function method_5830() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this.method_5948(),this.method_4545()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_5948() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.text = "";
         _loc1_.setStyle("fontSize",20);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("paddingTop",10);
         _loc1_.setStyle("color",16763648);
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "noAvailableQuestsMessage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         noAvailableQuestsMessage = _loc1_;
         BindingManager.executeBindings(this,"noAvailableQuestsMessage",noAvailableQuestsMessage);
         return _loc1_;
      }
      
      private function method_4545() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.text = "";
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("paddingTop",10);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "noAvailableQuestsMessageDescription";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         noAvailableQuestsMessageDescription = _loc1_;
         BindingManager.executeBindings(this,"noAvailableQuestsMessageDescription",noAvailableQuestsMessageDescription);
         return _loc1_;
      }
      
      public function method_5194(param1:FlexEvent) : void
      {
         this.handleCreationComplete();
      }
      
      private function method_4283() : Array
      {
         var var_5:Array = [];
         var_5[0] = new Binding(this,function():Number
         {
            return NaN;
         },null,"divider.y");
         var_5[1] = new Binding(this,null,null,"mainTabBar.dataProvider","tabList");
         var_5[2] = new Binding(this,function():Number
         {
            return 0 - 0;
         },null,"questGiverPortraitNameText.y");
         var_5[3] = new Binding(this,function():String
         {
            var _loc1_:* = HorizontalAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"questStateFilters.horizontalAlign");
         var_5[4] = new Binding(this,function():String
         {
            var _loc1_:* = class_88.getItem("ttip_questsAvailable_filter");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"available.toolTip");
         var_5[5] = new Binding(this,function():String
         {
            var _loc1_:* = class_88.getItem("ttip_questsUnavailable_filter");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"unavailable.toolTip");
         var_5[6] = new Binding(this,function():String
         {
            var _loc1_:* = class_88.getItem("ttip_questsCompleted_filter");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"completed.toolTip");
         var_5[7] = new Binding(this,function():String
         {
            var _loc1_:* = class_88.getItem("ttip_levelOrdering_toggle");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"levelorder.toolTip");
         var_5[8] = new Binding(this,function():String
         {
            var _loc1_:* = HorizontalAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"challengeStateFilters.horizontalAlign");
         var_5[9] = new Binding(this,function():String
         {
            var _loc1_:* = class_88.getItem("ttip_challengesNotYetDone_filter");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"notYetDone.toolTip");
         var_5[10] = new Binding(this,function():String
         {
            var _loc1_:* = class_88.getItem("ttip_challengesDone_filter");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"done.toolTip");
         return var_5;
      }
      
      [Bindable(event="propertyChange")]
      public function get available() : CheckBox
      {
         return this.var_4541;
      }
      
      public function set available(param1:CheckBox) : void
      {
         var _loc2_:Object = this.var_4541;
         if(_loc2_ !== param1)
         {
            this.var_4541 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"available",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get availableQuestList() : BorderContainer
      {
         return this.var_3193;
      }
      
      public function set availableQuestList(param1:BorderContainer) : void
      {
         var _loc2_:Object = this.var_3193;
         if(_loc2_ !== param1)
         {
            this.var_3193 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"availableQuestList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bigTopLevelHoldingGroupObjectThingy() : Group
      {
         return this._1719531403bigTopLevelHoldingGroupObjectThingy;
      }
      
      public function set bigTopLevelHoldingGroupObjectThingy(param1:Group) : void
      {
         var _loc2_:Object = this._1719531403bigTopLevelHoldingGroupObjectThingy;
         if(_loc2_ !== param1)
         {
            this._1719531403bigTopLevelHoldingGroupObjectThingy = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bigTopLevelHoldingGroupObjectThingy",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get completed() : CheckBox
      {
         return this.name_77;
      }
      
      public function set completed(param1:CheckBox) : void
      {
         var _loc2_:Object = this.name_77;
         if(_loc2_ !== param1)
         {
            this.name_77 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"completed",_loc2_,param1));
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
      public function get done() : CheckBox
      {
         return this.var_2441;
      }
      
      public function set done(param1:CheckBox) : void
      {
         var _loc2_:Object = this.var_2441;
         if(_loc2_ !== param1)
         {
            this.var_2441 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"done",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get groupDepth1() : VGroup
      {
         return this._315970861groupDepth1;
      }
      
      public function set groupDepth1(param1:VGroup) : void
      {
         var _loc2_:Object = this._315970861groupDepth1;
         if(_loc2_ !== param1)
         {
            this._315970861groupDepth1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"groupDepth1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get groupDepth2() : HGroup
      {
         return this.var_470;
      }
      
      public function set groupDepth2(param1:HGroup) : void
      {
         var _loc2_:Object = this.var_470;
         if(_loc2_ !== param1)
         {
            this.var_470 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"groupDepth2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get groupDepth3a() : VGroup
      {
         return this.var_1191;
      }
      
      public function set groupDepth3a(param1:VGroup) : void
      {
         var _loc2_:Object = this.var_1191;
         if(_loc2_ !== param1)
         {
            this.var_1191 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"groupDepth3a",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get levelorder() : CheckBox
      {
         return this.var_2884;
      }
      
      public function set levelorder(param1:CheckBox) : void
      {
         var _loc2_:Object = this.var_2884;
         if(_loc2_ !== param1)
         {
            this.var_2884 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"levelorder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get notYetDone() : CheckBox
      {
         return this.var_4375;
      }
      
      public function set notYetDone(param1:CheckBox) : void
      {
         var _loc2_:Object = this.var_4375;
         if(_loc2_ !== param1)
         {
            this.var_4375 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"notYetDone",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get questGiverPortrait() : BorderContainer
      {
         return this.var_4270;
      }
      
      public function set questGiverPortrait(param1:BorderContainer) : void
      {
         var _loc2_:Object = this.var_4270;
         if(_loc2_ !== param1)
         {
            this.var_4270 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questGiverPortrait",_loc2_,param1));
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
      public function get unavailable() : CheckBox
      {
         return this.var_3451;
      }
      
      public function set unavailable(param1:CheckBox) : void
      {
         var _loc2_:Object = this.var_3451;
         if(_loc2_ !== param1)
         {
            this.var_3451 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"unavailable",_loc2_,param1));
            }
         }
      }
   }
}
