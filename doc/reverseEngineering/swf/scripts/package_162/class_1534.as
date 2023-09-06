package package_162
{
   import com.greensock.TweenMax;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.controls.ProgressBar;
   import mx.core.IUIComponent;
   import mx.events.DragEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.DragManager;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import package_155.class_998;
   import package_155.class_999;
   import spark.components.BorderContainer;
   import spark.components.HGroup;
   import spark.components.SkinnableContainer;
   import spark.components.VGroup;
   import spark.primitives.Rect;
   
   public class class_1534 extends SkinnableContainer
   {
      
      public static const const_59:String = "single";
      
      public static const const_1980:String = "double";
       
      
      private var var_3912:int;
      
      private var var_4743:int;
      
      private var var_1170:BorderContainer;
      
      private var var_5047:BorderContainer;
      
      private var var_3043:HGroup;
      
      private var var_140:class_999;
      
      private var var_2384:Rect;
      
      private var var_4383:ProgressBar;
      
      private var var_2913:ProgressBar;
      
      private var var_3873:ProgressBar;
      
      private var var_1781:VGroup;
      
      protected var var_2239:int;
      
      private var var_2387:int;
      
      private var state:String;
      
      private var var_485:Number;
      
      private var name_11:int;
      
      private var totalTime:int;
      
      private var var_2938:Timer;
      
      private var var_1054:Function;
      
      private var var_4292:Function;
      
      private var var_4137:Function;
      
      private var var_2832:String = "single";
      
      public var var_1393:class_999;
      
      public function class_1534()
      {
         this.var_1393 = new class_999();
         super();
      }
      
      public function method_5254(param1:Boolean) : void
      {
         this.progressBar.visible = param1;
      }
      
      public function method_4055(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.healthBar.setProgress(param1,param2);
         this.sheildBar.setProgress(param3,param4);
      }
      
      public function method_5033(param1:String) : void
      {
         this.state = param1;
         switch(param1)
         {
            case class_998.INSTALLING_STATE:
               this.installedModuleBars.visible = false;
               break;
            case class_998.INSTALLED_STATE:
               this.installedModuleBars.visible = true;
         }
      }
      
      private function method_135() : void
      {
         this.method_5254(false);
         this.moduleItem.alpha = 0.1;
         TweenMax.to(this.moduleItem,0.8,{
            "alpha":1,
            "onComplete":this.method_208
         });
         this.var_2938.stop();
         this.var_2938.removeEventListener(TimerEvent.TIMER,this.method_2827);
      }
      
      private function method_208() : void
      {
         this.backgroundFlash.alpha = 0;
      }
      
      private function method_2827(param1:TimerEvent) : void
      {
         this.name_11 -= this.var_485;
         if(this.name_11 <= 0)
         {
            this.method_135();
         }
         this.progressBar.setProgress(this.name_11,this.totalTime);
      }
      
      public function get holsterMode() : String
      {
         return this.var_2832;
      }
      
      public function set holsterMode(param1:String) : void
      {
         this.var_2832 = param1;
         this.updateLayout();
      }
      
      private function updateLayout() : void
      {
         switch(this.var_2832)
         {
            case const_59:
               this.width = 38;
               if(this.modules.containsElement(this.var_1393))
               {
                  this.modules.removeElement(this.var_1393);
                  break;
               }
               break;
            case const_1980:
               this.width = 69;
               this.moduleItem.addEventListener(MouseEvent.CLICK,this._clickCallback);
               this.moduleItem.addEventListener(DragEvent.DRAG_DROP,this._droppingCallback);
               this.moduleItem.addEventListener(DragEvent.DRAG_ENTER,this.method_1806);
               this.moduleItem.addEventListener(DragEvent.DRAG_EXIT,this.method_3492);
               this.moduleItem.addEventListener(MouseEvent.ROLL_OVER,this._rollCallback);
               this.moduleItem.addEventListener(MouseEvent.ROLL_OUT,this._rollCallback);
               callLater(this.moduleItem.initIcon);
               callLater(this.var_1393.initIcon);
               this.var_1393.addEventListener(MouseEvent.CLICK,this._clickCallback);
               this.var_1393.addEventListener(DragEvent.DRAG_DROP,this._droppingCallback);
               this.var_1393.addEventListener(DragEvent.DRAG_ENTER,this.method_1806);
               this.var_1393.addEventListener(DragEvent.DRAG_EXIT,this.method_3492);
               this.var_1393.addEventListener(MouseEvent.ROLL_OVER,this._rollCallback);
               this.var_1393.addEventListener(MouseEvent.ROLL_OUT,this._rollCallback);
               callLater(this.modules.addElement,[this.var_1393]);
               this.modules.toolTip = class_88.getItem("tooltip_accepts_only_hub_modules");
         }
      }
      
      private function method_1806(param1:DragEvent) : void
      {
         var _loc2_:class_999 = param1.currentTarget as class_999;
         if(_loc2_)
         {
            _loc2_.hovered = true;
         }
         DragManager.acceptDragDrop(param1.currentTarget as IUIComponent);
      }
      
      private function method_3492(param1:DragEvent) : void
      {
         var _loc2_:class_999 = param1.currentTarget as class_999;
         if(_loc2_)
         {
            _loc2_.hovered = false;
         }
      }
      
      public function method_4858(param1:int, param2:int) : void
      {
         this.var_3912 = param1;
         this.var_4743 = param2;
      }
      
      protected function handleCreationComplete() : void
      {
         this.var_1393.slotId = this._slotId2;
         this.var_1393.moduleType = this.var_3912;
         this.var_1393.itemId = this.var_4743;
         this.updateLayout();
      }
      
      public function get method_5422() : int
      {
         return this._slotId2;
      }
      
      public function set method_5422(param1:int) : void
      {
         this._slotId2 = param1;
      }
      
      public function get slotId() : int
      {
         return this._slotId;
      }
      
      public function set slotId(param1:int) : void
      {
         this._slotId = param1;
      }
      
      public function get droppingCallback() : Function
      {
         return this._droppingCallback;
      }
      
      public function set droppingCallback(param1:Function) : void
      {
         this._droppingCallback = param1;
      }
      
      public function get clickCallback() : Function
      {
         return this._clickCallback;
      }
      
      public function set clickCallback(param1:Function) : void
      {
         this._clickCallback = param1;
      }
      
      public function set rollCallback(param1:Function) : void
      {
         this._rollCallback = param1;
      }
      
      public function method_4991() : void
      {
      }
      
      [Bindable(event="propertyChange")]
      public function get singleHolsterBackground() : BorderContainer
      {
         return this.var_1170;
      }
      
      public function set singleHolsterBackground(param1:BorderContainer) : void
      {
         var _loc2_:Object = this.var_1170;
         if(_loc2_ !== param1)
         {
            this.var_1170 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"singleHolsterBackground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get doubleHolsterBackground() : BorderContainer
      {
         return this.var_5047;
      }
      
      public function set doubleHolsterBackground(param1:BorderContainer) : void
      {
         var _loc2_:Object = this.var_5047;
         if(_loc2_ !== param1)
         {
            this.var_5047 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"doubleHolsterBackground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get modules() : HGroup
      {
         return this.var_3043;
      }
      
      public function set modules(param1:HGroup) : void
      {
         var _loc2_:Object = this.var_3043;
         if(_loc2_ !== param1)
         {
            this.var_3043 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"modules",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get moduleItem() : class_999
      {
         return this.var_140;
      }
      
      public function set moduleItem(param1:class_999) : void
      {
         var _loc2_:Object = this.var_140;
         if(_loc2_ !== param1)
         {
            this.var_140 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moduleItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundFlash() : Rect
      {
         return this.var_2384;
      }
      
      public function set backgroundFlash(param1:Rect) : void
      {
         var _loc2_:Object = this.var_2384;
         if(_loc2_ !== param1)
         {
            this.var_2384 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundFlash",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get progressBar() : ProgressBar
      {
         return this.var_4383;
      }
      
      public function set progressBar(param1:ProgressBar) : void
      {
         var _loc2_:Object = this.var_4383;
         if(_loc2_ !== param1)
         {
            this.var_4383 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"progressBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get healthBar() : ProgressBar
      {
         return this.var_2913;
      }
      
      public function set healthBar(param1:ProgressBar) : void
      {
         var _loc2_:Object = this.var_2913;
         if(_loc2_ !== param1)
         {
            this.var_2913 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"healthBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sheildBar() : ProgressBar
      {
         return this.var_3873;
      }
      
      public function set sheildBar(param1:ProgressBar) : void
      {
         var _loc2_:Object = this.var_3873;
         if(_loc2_ !== param1)
         {
            this.var_3873 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sheildBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get installedModuleBars() : VGroup
      {
         return this.var_1781;
      }
      
      public function set installedModuleBars(param1:VGroup) : void
      {
         var _loc2_:Object = this.var_1781;
         if(_loc2_ !== param1)
         {
            this.var_1781 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"installedModuleBars",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _slotId() : int
      {
         return this.var_2239;
      }
      
      protected function set _slotId(param1:int) : void
      {
         var _loc2_:Object = this.var_2239;
         if(_loc2_ !== param1)
         {
            this.var_2239 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_slotId",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _slotId2() : int
      {
         return this.var_2387;
      }
      
      private function set _slotId2(param1:int) : void
      {
         var _loc2_:Object = this.var_2387;
         if(_loc2_ !== param1)
         {
            this.var_2387 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_slotId2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _droppingCallback() : Function
      {
         return this.var_1054;
      }
      
      private function set _droppingCallback(param1:Function) : void
      {
         var _loc2_:Object = this.var_1054;
         if(_loc2_ !== param1)
         {
            this.var_1054 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_droppingCallback",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _clickCallback() : Function
      {
         return this.var_4292;
      }
      
      private function set _clickCallback(param1:Function) : void
      {
         var _loc2_:Object = this.var_4292;
         if(_loc2_ !== param1)
         {
            this.var_4292 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_clickCallback",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _rollCallback() : Function
      {
         return this.var_4137;
      }
      
      private function set _rollCallback(param1:Function) : void
      {
         var _loc2_:Object = this.var_4137;
         if(_loc2_ !== param1)
         {
            this.var_4137 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_rollCallback",_loc2_,param1));
            }
         }
      }
   }
}
