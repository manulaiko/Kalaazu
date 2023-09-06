package net.bigpoint.darkorbit.mvc.gui.model
{
   import net.bigpoint.darkorbit.gui.class_176;
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.abstract.model.DOAbstractProxy;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;
   import net.bigpoint.darkorbit.mvc.gui.windows.WindowCreationMap;
   import net.bigpoint.darkorbit.mvc.gui.windows.WindowCreationVO;
   import package_33.class_93;
   import package_46.class_131;
   
   public class GuiProxy extends DOAbstractProxy
   {
      
      public static const NAME:String = "GuiProxy";
       
      
      private var _guiManager:class_58;
      
      private var _featureWindows:Vector.<FeatureWindowVO>;
      
      private var _hideAllWindows:Boolean;
      
      private var _visibleWindows:Vector.<FeatureWindowVO>;
      
      private const _windowCreationMap:WindowCreationMap = new WindowCreationMap();
      
      public function GuiProxy()
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         this._featureWindows = new Vector.<FeatureWindowVO>();
         this._visibleWindows = new Vector.<FeatureWindowVO>();
         sendNotification(GuiNotifications.PARSE_WINDOWS_XML_DATA);
      }
      
      public function getWindowById(param1:String) : class_131
      {
         return this._guiManager.method_468(param1);
      }
      
      public function set guiManager(param1:class_58) : void
      {
         this._guiManager = param1;
      }
      
      public function getFeatureWindowById(param1:String) : FeatureWindowVO
      {
         var _loc2_:int = this._featureWindows.length;
         var _loc3_:int = 0;
         while(_loc3_ != _loc2_)
         {
            if(this._featureWindows[_loc3_].id == param1)
            {
               return this._featureWindows[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getVisibleFeatureWindowById(param1:String) : FeatureWindowVO
      {
         var _loc2_:int = this._visibleWindows.length;
         var _loc3_:int = 0;
         while(_loc3_ != _loc2_)
         {
            if(this._visibleWindows[_loc3_].id == param1)
            {
               return this._visibleWindows[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getWindowCreationVO(param1:String) : WindowCreationVO
      {
         return this._windowCreationMap.getVO(param1) as WindowCreationVO;
      }
      
      public function addVisibleWindow(param1:FeatureWindowVO) : void
      {
         var _loc2_:* = FeaturesMenuConstants.SPECIAL_WINDOWS.indexOf(param1.id) == -1;
         if(guiProxy.visibleWindows.indexOf(param1) == -1 && _loc2_)
         {
            guiProxy.visibleWindows.push(param1);
         }
      }
      
      public function removeVisibleWindow(param1:FeatureWindowVO) : void
      {
         var _loc2_:int = guiProxy.visibleWindows.indexOf(param1);
         if(_loc2_ != -1)
         {
            guiProxy.visibleWindows.splice(_loc2_,1);
         }
      }
      
      public function get featureWindows() : Vector.<FeatureWindowVO>
      {
         return this._featureWindows;
      }
      
      public function set featureWindows(param1:Vector.<FeatureWindowVO>) : void
      {
         this._featureWindows = param1;
      }
      
      public function get hideAllWindows() : Boolean
      {
         return this._hideAllWindows;
      }
      
      public function set hideAllWindows(param1:Boolean) : void
      {
         this._hideAllWindows = param1;
      }
      
      public function get visibleWindows() : Vector.<FeatureWindowVO>
      {
         return this._visibleWindows;
      }
      
      public function set visibleWindows(param1:Vector.<FeatureWindowVO>) : void
      {
         this._visibleWindows = param1;
      }
      
      public function getBarStatesAsString() : String
      {
         return this._guiManager.getBarStatesAsString();
      }
      
      public function setBarStatesFromString(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         while(param1.indexOf("|") != -1)
         {
            _loc2_ = param1.substring(0,param1.indexOf("|"));
            param1 = param1.substring(param1.indexOf("|") + 1);
            _loc3_ = _loc2_.split(",");
            if(_loc3_.length >= 2)
            {
               if((_loc4_ = this._guiManager.method_1262(_loc3_[0])) != null)
               {
                  _loc4_.var_3041 = _loc3_[1];
               }
               else
               {
                  _loc5_ = new class_176(_loc3_[0],_loc3_[1]);
                  this._guiManager.method_3714(_loc5_);
               }
               this._guiManager.updateInfoField(GuiConstants.SHIP_WINDOW,class_93.var_3654,_loc3_[0]);
               this._guiManager.updateInfoField(GuiConstants.SHIP_WINDOW,class_93.var_1265,_loc3_[0]);
            }
         }
      }
   }
}
