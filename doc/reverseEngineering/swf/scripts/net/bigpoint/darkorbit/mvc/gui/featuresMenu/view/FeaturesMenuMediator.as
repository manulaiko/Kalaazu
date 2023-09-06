package net.bigpoint.darkorbit.mvc.gui.featuresMenu.view
{
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.mvc.common.utils.TextUtils;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.abstract.view.AbstractMenuMediator;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.FeaturesMenuProxy;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureBarVO;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureItemVO;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.components.FeatureBtn;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.components.FeaturesMenu;
   import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_103.class_2009;
   import package_11.class_39;
   import package_141.class_2008;
   import package_242.DragEvent;
   import package_26.class_94;
   import package_46.class_131;
   
   public class FeaturesMenuMediator extends AbstractMenuMediator
   {
      
      public static const NAME:String = "FeaturesMenuMediator";
       
      
      private var _featuresBtnsMap:Dictionary;
      
      public function FeaturesMenuMediator(param1:FeaturesMenu, param2:class_39)
      {
         super(NAME,param1);
         _swfFinisher = param2;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [FeaturesMenuNotifications.DATA_READY,FeaturesMenuNotifications.UPDATE_BTNS_SELECTIONS,FeaturesMenuNotifications.TOGGLE_BTN_SELECTION,GuiNotifications.MANAGE_MENUS_CONFIG_MODE,FeaturesMenuNotifications.HIGHLIGHT_ITEM,FeaturesMenuNotifications.STOP_HIGHLIGHT_ITEM];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         switch(param1.getName())
         {
            case FeaturesMenuNotifications.DATA_READY:
               this.initBarsMap();
               this._featuresBtnsMap = new Dictionary();
               this.initFeatureBar(this.view.gameFeatureBar,FeaturesMenuConstants.GAME_FEATURE_BAR);
               this.initFeatureBar(this.view.genericFeatureBar,FeaturesMenuConstants.GENERIC_FEATURE_BAR);
               sendNotification(FeaturesMenuNotifications.UPDATE_POSITION,GuiConstants.SET_MENUS_INIT_POSITION);
               this.updateBtnsSelections();
               break;
            case FeaturesMenuNotifications.UPDATE_BTNS_SELECTIONS:
               this.updateBtnsSelections();
               break;
            case FeaturesMenuNotifications.TOGGLE_BTN_SELECTION:
               _loc2_ = param1.getType();
               _loc3_ = Boolean(param1.getBody());
               this.toggleBtnSelection(_loc2_,_loc3_);
               break;
            case FeaturesMenuNotifications.HIGHLIGHT_ITEM:
               _loc4_ = param1.getBody() as HighlightItemVO;
               this.highliteButton(_loc4_);
               break;
            case FeaturesMenuNotifications.STOP_HIGHLIGHT_ITEM:
               _loc5_ = param1.getBody() as HighlightItemVO;
               this.stopHighliteButton(_loc5_);
               break;
            case GuiNotifications.MANAGE_MENUS_CONFIG_MODE:
               _loc6_ = Boolean(param1.getBody());
               manageConfigMode(_loc6_);
         }
      }
      
      private function stopHighliteButton(param1:HighlightItemVO) : void
      {
         var _loc2_:FeatureBtn = this.getGameFeatureBtnById(param1.itemId);
         _loc2_.stopHighlight();
      }
      
      private function highliteButton(param1:HighlightItemVO) : void
      {
         var _loc2_:FeatureBtn = this.getGameFeatureBtnById(param1.itemId);
         _loc2_.highlight(param1.highlightDuration);
      }
      
      override protected function initBarsMap() : void
      {
         _menuBars = new <class_2008>[this.view.gameFeatureBar,this.view.genericFeatureBar];
         _menuBarsMap = new Dictionary();
         _menuBarsMap[this.view.gameFeatureBar] = this.menuProxy.getMenuBarVOById(FeaturesMenuConstants.GAME_FEATURE_BAR);
         _menuBarsMap[this.view.genericFeatureBar] = this.menuProxy.getMenuBarVOById(FeaturesMenuConstants.GENERIC_FEATURE_BAR);
      }
      
      private function initFeatureBar(param1:class_2008, param2:String) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc3_:FeatureBarVO = this.menuProxy.getMenuBarById(param2) as FeatureBarVO;
         var _loc4_:* = [];
         var _loc5_:int = _loc3_.featureItems.length;
         var _loc6_:int = 0;
         while(_loc6_ != _loc5_)
         {
            if((_loc7_ = _loc3_.featureItems[_loc6_]).visible)
            {
               _loc8_ = new FeatureBtn(_swfFinisher,TextUtils.getTooltipText(_loc7_.tooltipKeyList),this.getIconBitmapData(_loc7_.id + GuiConstants.NORMAL_SUFFIX),this.getIconBitmapData(_loc7_.id + GuiConstants.HOVER_SUFFIX),this.getIconBitmapData(_loc7_.id + GuiConstants.SELECT_SUFFIX));
               this._featuresBtnsMap[_loc8_] = _loc7_;
               _loc4_.push(_loc8_);
            }
            _loc6_++;
         }
         param1.showItems(_loc4_,_loc5_,SlotAndItemBarElement.DEFAULT_SIZE,false);
      }
      
      override protected function addListeners() : void
      {
         super.addListeners();
         this.view.addEventListener(FeatureBtn.FEATURE_BTN_CLICKED,this.featureBtnClickHandler);
         this.view.addEventListener(FeatureBtn.FEATURE_BTN_ROLLED_OVER,this.featureBtnRollHandler);
         this.view.addEventListener(FeatureBtn.FEATURE_BTN_ROLLED_OUT,this.featureBtnRollHandler);
         this.view.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
         this.view.addEventListener(Event.ADDED,this.mouseDownHandler);
         this.view.addEventListener(class_2009.const_543,this.layoutChangeComplete);
      }
      
      private function featureBtnRollHandler(param1:Event) : void
      {
         var _loc2_:FeatureItemVO = this._featuresBtnsMap[param1.target] as FeatureItemVO;
         if(_loc2_.id == GuiConstants.HELP_WINDOW)
         {
            if(param1.type == FeatureBtn.FEATURE_BTN_ROLLED_OVER)
            {
               class_94.getInstance().method_6461();
            }
            else if(param1.type == FeatureBtn.FEATURE_BTN_ROLLED_OUT)
            {
               class_94.getInstance().method_5847();
            }
         }
      }
      
      override protected function barDragOverHandler(param1:DragEvent) : void
      {
         super.barDragOverHandler(param1);
         sendNotification(FeaturesMenuNotifications.CHECK_BOUNDS_AND_SAVE_POS);
      }
      
      private function layoutChangeComplete(param1:Event) : void
      {
         sendNotification(FeaturesMenuNotifications.CHECK_BOUNDS_AND_SAVE_POS);
      }
      
      private function updateBtnsSelections() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         for(_loc1_ in this._featuresBtnsMap)
         {
            _loc2_ = _loc1_ as FeatureBtn;
            _loc3_ = this._featuresBtnsMap[_loc2_] as FeatureItemVO;
            _loc4_ = guiManager.method_468(_loc3_.id);
            if(Boolean(_loc3_.featureWindowVO) && Boolean(_loc4_))
            {
               if(false)
               {
                  _loc2_.selected = false;
               }
               else
               {
                  _loc2_.selected = _loc3_.visible && _loc3_.featureWindowVO.maximized;
               }
            }
         }
      }
      
      private function toggleBtnSelection(param1:String, param2:Boolean) : void
      {
         var _loc3_:FeatureBtn = this.getGameFeatureBtnById(param1);
         var _loc4_:FeatureItemVO;
         if((_loc4_ = this._featuresBtnsMap[_loc3_] as FeatureItemVO).featureWindowVO)
         {
            _loc4_.featureWindowVO.maximized = param2;
         }
         if(_loc3_)
         {
            _loc3_.selected = param2;
         }
      }
      
      private function featureBtnClickHandler(param1:Event) : void
      {
         var _loc2_:FeatureBtn = param1.target as FeatureBtn;
         var _loc3_:FeatureItemVO = this._featuresBtnsMap[_loc2_] as FeatureItemVO;
         sendNotification(FeaturesMenuNotifications.ACTION_TRIGERRED,_loc2_,_loc3_.id);
      }
      
      public function getGameFeatureBtnById(param1:String) : FeatureBtn
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for(_loc2_ in this._featuresBtnsMap)
         {
            _loc3_ = this._featuresBtnsMap[_loc2_] as FeatureItemVO;
            if(_loc3_.id == param1)
            {
               return _loc2_ as FeatureBtn;
            }
         }
         return null;
      }
      
      private function mouseDownHandler(param1:Event) : void
      {
         param1.stopPropagation();
      }
      
      private function getIconBitmapData(param1:String) : BitmapData
      {
         return assetsProxy.getBitmapDataFromAtlas(param1,FeaturesMenuConstants.ICONS_BITMAP_ATLAS);
      }
      
      protected function get menuProxy() : FeaturesMenuProxy
      {
         return facade.retrieveProxy(FeaturesMenuProxy.NAME) as FeaturesMenuProxy;
      }
      
      public function get view() : FeaturesMenu
      {
         return viewComponent as FeaturesMenu;
      }
   }
}
