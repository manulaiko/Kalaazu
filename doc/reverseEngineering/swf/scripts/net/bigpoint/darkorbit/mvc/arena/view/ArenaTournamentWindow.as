package net.bigpoint.darkorbit.mvc.arena.view
{
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.collections.ArrayCollection;
   import mx.collections.ArrayList;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
   import net.bigpoint.darkorbit.mvc.questWindow.model.vo.class_1037;
   import spark.components.BorderContainer;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   
   public class ArenaTournamentWindow extends DOWindow
   {
       
      
      private var _1969448916contentSection:BorderContainer;
      
      private var _725945613mainMenuSection:HGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var mainGroupMenu:ArenaWindowMenu;
      
      private var battleTypeMenu:ArenaWindowMenu;
      
      private var battleOptionsMenu:ArenaWindowMenu;
      
      private var tournamentMenu:ArenaWindowMenu;
      
      private var mainGroupMenuList:ArrayCollection;
      
      private var battleTypeMenuList:ArrayCollection;
      
      private var battleOptionsMenuList:ArrayCollection;
      
      private var tournamentMenuList:ArrayCollection;
      
      private var createBattleGroupView:CreateBattleGroupView;
      
      private var joinGroupView:JoinGroupView;
      
      public function ArenaTournamentWindow()
      {
         this.mainGroupMenuList = new ArrayCollection([{"name":"Create"},{"name":"Join"},{"name":"Manage"}]);
         this.battleTypeMenuList = new ArrayCollection([{"name":"1 on 1"},{"name":"3 vs 3"},{"name":"5 vs 5"}]);
         this.battleOptionsMenuList = new ArrayCollection([{"name":"Applications & Invitations"},{"name":"My Members"},{"name":"My Memberships"}]);
         this.tournamentMenuList = new ArrayCollection([{"name":"Sign Up"},{"name":"In Progress"}]);
         super();
         mx_internal::_document = this;
         this.styleName = "questWindow";
         this.title = "Mission Window | First Draft";
         this.width = 700;
         this.height = 500;
         this.minHeight = 500;
         this.minWidth = 700;
         this.verticalCenter = 0;
         this.horizontalCenter = 0;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ArenaTournamentWindow_Array1_c);
         this.addEventListener("creationComplete",this.___ArenaTournamentWindow_DOWindow1_creationComplete);
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
         currentState = "BG_Create";
         this.mainGroupMenu = new ArenaWindowMenu();
         this.battleTypeMenu = new ArenaWindowMenu();
         this.mainGroupMenu.setMenuListData(this.mainGroupMenuList);
         this.mainGroupMenu.setMenuChangeHandler(this.handleMainGroupMenuChange);
         this.battleTypeMenu.setMenuListData(this.battleTypeMenuList);
         this.battleTypeMenu.setMenuChangeHandler(this.handlebattleTypeMenuChange);
         this.mainMenuSection.addElement(this.mainGroupMenu);
         this.mainMenuSection.addElement(this.battleTypeMenu);
      }
      
      protected function handleMainGroupMenuChange(param1:IndexChangeEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         switch(this.mainGroupMenu.selectedItem.name)
         {
            case "Create":
               if(this.battleOptionsMenu)
               {
                  this.mainMenuSection.removeElement(this.battleOptionsMenu);
                  this.battleOptionsMenu = null;
               }
               this.createBattleGroupView = new CreateBattleGroupView();
               this.contentSection.removeAllElements();
               this.contentSection.addElement(this.createBattleGroupView);
               break;
            case "Join":
               if(this.battleOptionsMenu)
               {
                  this.mainMenuSection.removeElement(this.battleOptionsMenu);
                  this.battleOptionsMenu = null;
               }
               _loc2_ = new ArrayList();
               _loc3_ = new class_1037();
               _loc3_.var_3501 = "The Cunts";
               _loc3_.rank = 999;
               _loc3_.var_3080 = "21.09.99";
               _loc3_.var_4174 = "21 / 323523";
               _loc3_.name_113 = 2;
               (_loc4_ = new class_1037()).var_3501 = "The Flying Fucks";
               _loc4_.rank = 35;
               _loc4_.var_3080 = "11.01.10";
               _loc4_.var_4174 = "1 / 1";
               _loc4_.name_113 = 2;
               _loc2_.addItem(_loc3_);
               _loc2_.addItem(_loc4_);
               this.joinGroupView = new JoinGroupView();
               this.joinGroupView.setTableData(_loc2_);
               this.contentSection.removeAllElements();
               this.contentSection.addElement(this.joinGroupView);
               break;
            case "Manage":
               this.battleOptionsMenu = new ArenaWindowMenu();
               this.battleOptionsMenu.setMenuListData(this.battleOptionsMenuList);
               this.battleOptionsMenu.setMenuChangeHandler(this.handleBattleOptionsMenuChange);
               this.mainMenuSection.addElement(this.battleOptionsMenu);
         }
      }
      
      private function handlebattleTypeMenuChange(param1:IndexChangeEvent) : void
      {
      }
      
      private function handleBattleOptionsMenuChange(param1:IndexChangeEvent) : void
      {
      }
      
      private function handleTournamentMenuChange(param1:IndexChangeEvent) : void
      {
      }
      
      private function _ArenaTournamentWindow_Array1_c() : Array
      {
         return [this._ArenaTournamentWindow_VGroup1_c()];
      }
      
      private function _ArenaTournamentWindow_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ArenaTournamentWindow_BorderContainer1_c(),this._ArenaTournamentWindow_BorderContainer2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ArenaTournamentWindow_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.height = 84;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._ArenaTournamentWindow_Array3_c);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ArenaTournamentWindow_Array3_c() : Array
      {
         return [this._ArenaTournamentWindow_HGroup1_i()];
      }
      
      private function _ArenaTournamentWindow_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.x = 0;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ArenaTournamentWindow_VGroup2_c()];
         _loc1_.id = "mainMenuSection";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainMenuSection = _loc1_;
         BindingManager.executeBindings(this,"mainMenuSection",this.mainMenuSection);
         return _loc1_;
      }
      
      private function _ArenaTournamentWindow_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ArenaTournamentWindow_Button1_c(),this._ArenaTournamentWindow_Button2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ArenaTournamentWindow_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "Battle Group";
         _loc1_.addEventListener("click",this.___ArenaTournamentWindow_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___ArenaTournamentWindow_Button1_click(param1:MouseEvent) : void
      {
         currentState = "BG_Create";
      }
      
      private function _ArenaTournamentWindow_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "Tournament";
         _loc1_.addEventListener("click",this.___ArenaTournamentWindow_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___ArenaTournamentWindow_Button2_click(param1:MouseEvent) : void
      {
         currentState = "T_SignUp";
      }
      
      private function _ArenaTournamentWindow_BorderContainer2_i() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "contentSection";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentSection = _loc1_;
         BindingManager.executeBindings(this,"contentSection",this.contentSection);
         return _loc1_;
      }
      
      public function ___ArenaTournamentWindow_DOWindow1_creationComplete(param1:FlexEvent) : void
      {
         this.handleCreationComplete();
      }
      
      [Bindable(event="propertyChange")]
      public function get contentSection() : BorderContainer
      {
         return this._1969448916contentSection;
      }
      
      public function set contentSection(param1:BorderContainer) : void
      {
         var _loc2_:Object = this._1969448916contentSection;
         if(_loc2_ !== param1)
         {
            this._1969448916contentSection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentSection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainMenuSection() : HGroup
      {
         return this._725945613mainMenuSection;
      }
      
      public function set mainMenuSection(param1:HGroup) : void
      {
         var _loc2_:Object = this._725945613mainMenuSection;
         if(_loc2_ !== param1)
         {
            this._725945613mainMenuSection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainMenuSection",_loc2_,param1));
            }
         }
      }
   }
}
