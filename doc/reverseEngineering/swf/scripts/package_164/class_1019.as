package package_164
{
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.collections.ArrayCollection;
   import mx.core.DragSource;
   import mx.events.DragEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.DragManager;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.battlestationswindow.class_1023;
   import package_150.class_988;
   import package_155.class_999;
   import package_163.class_1520;
   import package_9.ResourceManager;
   import spark.components.Image;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.SkinnableContainer;
   
   public class class_1019 extends SkinnableContainer
   {
       
      
      private var var_3832:List;
      
      private var var_359:Label;
      
      private var var_2585:class_999;
      
      protected var var_3991:Boolean;
      
      protected var var_3259:ArrayCollection;
      
      public function class_1019()
      {
         super();
      }
      
      protected function creationCompleteHandler() : void
      {
         this.titleLabel.text = class_88.getItem("label_bswin_mod_inventory");
      }
      
      protected function method_3896(param1:MouseEvent) : void
      {
         var _loc2_:int = int(this.moduleItemList.selectedIndex);
         if(this.var_2585 != null)
         {
            this.var_2585.selected = false;
         }
         this.var_2585 = class_999(Object(this.moduleItemList.dataGroup.getElementAt(_loc2_)).moduleItemComponent);
         this.var_2585.selected = true;
      }
      
      protected function method_1650(param1:DragEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc2_:int = int(this.moduleItemList.selectedIndex);
         var _loc3_:class_999 = class_999(Object(this.moduleItemList.dataGroup.getElementAt(_loc2_)).moduleItemComponent);
         if(_loc3_)
         {
            if(this.var_2585 != null)
            {
               this.var_2585.selected = false;
            }
            this.var_2585 = _loc3_;
            this.var_2585.selected = true;
            _loc4_ = class_1520(class_999(Object(this.moduleItemList.dataGroup.getElementAt(_loc2_)).moduleItemComponent).moduleVO);
            (_loc5_ = new DragSource()).addData(_loc4_,"moduleData");
            _loc6_ = class_1023.const_1822[_loc4_.type];
            _loc7_ = ResourceManager.getMovieClip("battleStationsUI",_loc6_);
            (_loc8_ = new Image()).source = _loc7_;
            DragManager.doDrag(_loc3_,_loc5_,param1,_loc8_,1,1,1);
         }
      }
      
      public function method_3785(param1:ArrayCollection) : void
      {
         callLater(this.method_6202,[param1]);
      }
      
      private function method_6202(param1:ArrayCollection) : void
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc2_:ArrayCollection = new ArrayCollection(param1.toArray());
         if(_loc2_.length < 18)
         {
            _loc3_ = 18 - _loc2_.length;
         }
         else if(_loc2_.length > 18)
         {
            if((_loc5_ = _loc2_.length % 6) != 0)
            {
               _loc3_ = 6 - _loc5_;
            }
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            (_loc6_ = new class_1520()).type = class_1520.NONE;
            _loc6_.draggable = false;
            _loc2_.addItem(_loc6_);
            _loc4_++;
         }
         this.var_3259 = new ArrayCollection(_loc2_.source);
         if(this.var_3991)
         {
            this.moduleItemList.dataProvider = this.var_3259;
         }
         if(this.var_2585 != null)
         {
            this.var_2585.selected = false;
         }
      }
      
      protected function method_3932(param1:Event) : void
      {
         dispatchEvent(new class_988(class_988.SHOW_INVENTORY_FILTER_POPUP,true));
      }
      
      public function set method_3558(param1:Boolean) : void
      {
         this.var_3991 = param1;
         if(this.var_3259)
         {
            TweenLite.delayedCall(0.15,this.method_3895);
         }
      }
      
      private function method_3895() : void
      {
         callLater(this.method_812);
      }
      
      private function method_812() : void
      {
         this.moduleItemList.dataProvider = this.var_3259;
      }
      
      [Bindable(event="propertyChange")]
      public function get moduleItemList() : List
      {
         return this.var_3832;
      }
      
      public function set moduleItemList(param1:List) : void
      {
         var _loc2_:Object = this.var_3832;
         if(_loc2_ !== param1)
         {
            this.var_3832 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moduleItemList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleLabel() : Label
      {
         return this.var_359;
      }
      
      public function set titleLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_359;
         if(_loc2_ !== param1)
         {
            this.var_359 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleLabel",_loc2_,param1));
            }
         }
      }
   }
}
