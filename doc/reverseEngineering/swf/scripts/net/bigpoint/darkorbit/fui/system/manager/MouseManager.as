package net.bigpoint.darkorbit.fui.system.manager
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.EventDispatcher;
   import net.bigpoint.darkorbit.fui.system.utils.FlashPlayerCapabilities;
   
   public class MouseManager extends EventDispatcher implements IMouseManager
   {
       
      
      private var _useNativeCursors:Boolean;
      
      private var _manager:IMouseManager;
      
      public function MouseManager(param1:DisplayObjectContainer = null)
      {
         super();
         if(param1 == null)
         {
            this._useNativeCursors = this.supportsNativeCursors();
            if(!this._useNativeCursors)
            {
               throw new Error("Couldn´t initialize MouseManager --> layer=" + param1 + "  nativeCursor supported=" + this.supportsNativeCursors());
            }
         }
         else
         {
            this._useNativeCursors = this.supportsNativeCursors();
         }
         if(this._useNativeCursors)
         {
            this._manager = new NativeMouseCursorManager();
         }
         else
         {
            this._manager = new SoftwareRenderedMouseCursorManager();
            (this._manager as SoftwareRenderedMouseCursorManager).mouseLayer = param1;
         }
      }
      
      private function supportsNativeCursors() : Boolean
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         if(_loc1_ == 10 && _loc2_ >= 2 || _loc1_ >= 11)
         {
            return true;
         }
         return false;
      }
      
      public function isCursorRegistered(param1:String) : Boolean
      {
         return this._manager.isCursorRegistered(param1);
      }
      
      public function registerMouseCursorViaReskey(param1:String, param2:String, param3:String, param4:Number = 0, param5:Number = 0) : void
      {
         this._manager.registerMouseCursorViaReskey(param1,param2,param3,param4,param5);
      }
      
      public function registerMouseCursor(param1:String, param2:DisplayObject, param3:Number = 0, param4:Number = 0) : void
      {
         this._manager.registerMouseCursor(param1,param2,param3,param4);
      }
      
      public function unregisterMouseCursor(param1:String) : void
      {
         this._manager.unregisterMouseCursor(param1);
      }
      
      public function showCustomCursor(param1:String) : void
      {
         this._manager.showCustomCursor(param1);
      }
      
      public function hideCustomCursor() : void
      {
         this._manager.hideCustomCursor();
      }
      
      public function get mouseLayer() : DisplayObjectContainer
      {
         if(!this._useNativeCursors)
         {
            return (this._manager as SoftwareRenderedMouseCursorManager).mouseLayer;
         }
         return null;
      }
      
      public function set mouseLayer(param1:DisplayObjectContainer) : void
      {
         if(!this._useNativeCursors)
         {
            (this._manager as SoftwareRenderedMouseCursorManager).mouseLayer = param1;
         }
      }
   }
}

import flash.display.DisplayObject;

class CursorData
{
    
   
   private var _id:String;
   
   private var _view:DisplayObject;
   
   private var _offsetX:Number = 0;
   
   private var _offsetY:Number = 0;
   
   private var _frameRate:Number = 0;
   
   function CursorData(param1:String, param2:DisplayObject, param3:Number = 0, param4:Number = 0, param5:Number = 0)
   {
      super();
      this._id = param1;
      this._view = param2;
      this._offsetX = param3;
      this._offsetY = param4;
      this._frameRate = param5;
   }
   
   public function get view() : DisplayObject
   {
      return this._view;
   }
   
   public function get offsetX() : Number
   {
      return this._offsetX;
   }
   
   public function get offsetY() : Number
   {
      return this._offsetY;
   }
   
   public function get frameRate() : Number
   {
      return this._frameRate;
   }
   
   public function get id() : String
   {
      return this._id;
   }
}

import flash.utils.Dictionary;

class AbstractCursorManager
{
    
   
   protected var _currentCursorData:CursorData;
   
   protected var _mouseCursors:Dictionary;
   
   function AbstractCursorManager()
   {
      this._mouseCursors = new Dictionary();
      super();
   }
   
   public function unregisterMouseCursor(param1:String) : void
   {
      if(this._mouseCursors[param1] != null)
      {
         if(this._mouseCursors[param1] == this._currentCursorData && this._currentCursorData == null)
         {
            this.hideCustomCursor();
         }
         this._mouseCursors[param1] = null;
         delete this._mouseCursors[param1];
      }
   }
   
   public function hideCustomCursor() : void
   {
   }
   
   public function isCursorRegistered(param1:String) : Boolean
   {
      return this._mouseCursors[param1] != null ? true : false;
   }
}

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.geom.Point;
import flash.ui.Mouse;
import flash.ui.MouseCursor;
import flash.ui.MouseCursorData;
import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.system.manager.IMouseManager;

class NativeMouseCursorManager extends AbstractCursorManager implements IMouseManager
{
    
   
   function NativeMouseCursorManager()
   {
      super();
   }
   
   public function registerMouseCursorViaReskey(param1:String, param2:String, param3:String, param4:Number = 0, param5:Number = 0) : void
   {
      var _loc6_:Bitmap;
      if(_loc6_ = UISystem.getInstance().uiloader.getBitmap(param2,param3) as Bitmap)
      {
         this.registerMouseCursor(param1,_loc6_,param4,param5);
      }
   }
   
   public function registerMouseCursor(param1:String, param2:DisplayObject, param3:Number = 0, param4:Number = 0) : void
   {
      if(true)
      {
         _mouseCursors[param1] = new CursorData(param1,param2,param3,param4);
      }
      else
      {
         UISystem.log("A mouse cursor with the ID= " + param1 + " has been already registered.",UISystem.LOG_LEVEL_WARN);
      }
   }
   
   public function showCustomCursor(param1:String) : void
   {
      var _loc3_:* = null;
      var _loc4_:* = null;
      var _loc5_:* = null;
      var _loc2_:CursorData = _mouseCursors[param1];
      if(_loc2_)
      {
         if(_currentCursorData == _loc2_)
         {
            return;
         }
         if(_loc2_.view)
         {
            _currentCursorData = _loc2_;
            _loc3_ = new MouseCursorData();
            _loc4_ = new Vector.<BitmapData>();
            if(_loc5_ = _loc2_.view as Bitmap)
            {
               _loc4_.push(_loc5_.bitmapData);
               _loc3_.data = _loc4_;
               _loc3_.hotSpot = new Point(_loc2_.offsetX,_loc2_.offsetY);
               Mouse.registerCursor(_loc2_.id,_loc3_);
               Mouse.cursor = _loc2_.id;
            }
         }
      }
   }
   
   override public function hideCustomCursor() : void
   {
      Mouse.cursor = MouseCursor.AUTO;
      _currentCursorData = null;
   }
}

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Stage;
import flash.events.Event;
import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.system.manager.IMouseManager;

class SoftwareRenderedMouseCursorManager extends AbstractCursorManager implements IMouseManager
{
    
   
   private var _mouseLayer:DisplayObjectContainer;
   
   function SoftwareRenderedMouseCursorManager()
   {
      super();
   }
   
   public function registerMouseCursorViaReskey(param1:String, param2:String, param3:String, param4:Number = 0, param5:Number = 0) : void
   {
   }
   
   public function registerMouseCursor(param1:String, param2:DisplayObject, param3:Number = 0, param4:Number = 0) : void
   {
   }
   
   override public function unregisterMouseCursor(param1:String) : void
   {
      super.unregisterMouseCursor(param1);
   }
   
   public function showCustomCursor(param1:String) : void
   {
   }
   
   override public function hideCustomCursor() : void
   {
   }
   
   private function updateCursorPosition() : void
   {
      var _loc1_:* = null;
      if(_currentCursorData)
      {
         _loc1_ = _currentCursorData.view;
         _loc1_.x = this._stage_.mouseX + _currentCursorData.offsetX;
         _loc1_.y = this._stage_.mouseY + _currentCursorData.offsetY;
      }
   }
   
   private function startEnterFrameHandling() : void
   {
      this._stage_.addEventListener(Event.ENTER_FRAME,this.handleEnterFrameEvent);
   }
   
   private function stopEnterFrameHandling() : void
   {
      this._stage_.removeEventListener(Event.ENTER_FRAME,this.handleEnterFrameEvent);
   }
   
   private function handleEnterFrameEvent(param1:Event) : void
   {
      this.updateCursorPosition();
   }
   
   private function get _stage_() : Stage
   {
      return this._mouseLayer.stage;
   }
   
   public function get mouseLayer() : DisplayObjectContainer
   {
      return this._mouseLayer;
   }
   
   public function set mouseLayer(param1:DisplayObjectContainer) : void
   {
      this._mouseLayer = param1;
   }
   
   protected function addCurrentMouseCursor() : void
   {
      var _loc1_:* = null;
      if(Boolean(this._mouseLayer) && Boolean(_currentCursorData))
      {
         _loc1_ = _currentCursorData.view;
         if(this._mouseLayer.contains(_loc1_))
         {
            this._mouseLayer.removeChild(_loc1_);
         }
         this._mouseLayer.addChild(_loc1_);
         this.updateCursorPosition();
      }
      else
      {
         UISystem.log("Tried to add mouse cursor. But no mouse layer was specified.",UISystem.LOG_LEVEL_WARN);
      }
   }
   
   protected function removeCurrentMouseCursor() : void
   {
      var _loc1_:* = null;
      if(this._mouseLayer)
      {
         if(_currentCursorData == null)
         {
            UISystem.log("No custom cursor activated. So, it´s not possible to remove mouse cursor instance.",UISystem.LOG_LEVEL_WARN);
            return;
         }
         _loc1_ = _currentCursorData.view;
         if(this._mouseLayer.contains(_loc1_))
         {
            this._mouseLayer.removeChild(_loc1_);
         }
         else
         {
            UISystem.log("Tried to remove current mouse cursor.",UISystem.LOG_LEVEL_WARN);
         }
         _currentCursorData = null;
      }
      else
      {
         UISystem.log("Tried to remove mouse cursor. But no mouse layer was specified.",UISystem.LOG_LEVEL_WARN);
      }
   }
}
