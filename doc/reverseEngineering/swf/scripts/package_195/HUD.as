package package_195
{
   import net.bigpoint.darkorbit.map.class_87;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.traits.class_1180;
   import net.bigpoint.darkorbit.map.model.traits.class_1182;
   import net.bigpoint.darkorbit.map.model.traits.class_308;
   import net.bigpoint.darkorbit.map.model.traits.class_319;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_102.LayeredSprite;
   import package_113.class_310;
   import package_279.class_1700;
   import package_279.class_1702;
   import package_280.class_1701;
   import package_281.class_1703;
   import package_29.class_84;
   import package_29.class_89;
   
   public class HUD extends LayeredSprite
   {
      
      {
         class_89.method_5405(class_310);
         class_89.method_5405(class_1180);
         class_89.method_5405(class_308);
      }
      
      private const const_241:Vector.<InternalDisplayLayer> = new Vector.<InternalDisplayLayer>();
      
      private var _mapView:class_87;
      
      private var _map:class_90;
      
      public function HUD(param1:class_87)
      {
         super();
         this._mapView = param1;
         this.method_2831(class_1180,class_1701);
         this.method_2831(class_310,class_1700);
         this.method_2831(class_308,class_1702);
         this.method_2831(class_1182,class_1698);
      }
      
      public function set map(param1:class_90) : void
      {
         var _loc2_:* = null;
         this._map = param1;
         for each(_loc2_ in this.const_241)
         {
            _loc2_.list = !!this._map ? this._map.method_328(_loc2_.traitClass) : null;
         }
         if(this._map)
         {
            Settings.showHUD.changed.add(this.method_5387);
            this.method_5387();
         }
         else
         {
            Settings.showHUD.changed.remove(this.method_5387);
         }
      }
      
      public function method_2831(param1:Class, param2:Class) : void
      {
         var _loc3_:InternalDisplayLayer = new InternalDisplayLayer(this._mapView,this,param1,param2);
         this.const_241.push(_loc3_);
         _loc3_.list = !!this._map ? this._map.method_328(_loc3_.traitClass) : null;
      }
      
      protected function method_2828(param1:Class, param2:Class) : void
      {
         var _loc3_:* = null;
         for each(_loc3_ in this.const_241)
         {
            if(_loc3_.traitClass == param1 && _loc3_.viewClass == param2)
            {
               this.const_241.splice(this.const_241.indexOf(_loc3_),1);
               _loc3_.list = null;
            }
         }
      }
      
      private function method_6359() : void
      {
         this.method_2828(class_319,class_1703);
         this.method_2828(class_1180,class_1703);
         if(Settings.show_debug_objects.value)
         {
            this.method_2831(class_319,class_1703);
            this.method_2831(class_1180,class_1703);
         }
      }
      
      private function method_5387() : void
      {
         visible = Settings.showHUD.value;
      }
   }
}

import flash.display.DisplayObject;
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;
import net.bigpoint.darkorbit.map.class_87;
import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_1699;
import package_102.LayeredSprite;
import package_29.class_267;
import package_29.class_84;

class InternalDisplayLayer
{
    
   
   private const _viewByData:Dictionary = new Dictionary(true);
   
   private var _container:LayeredSprite;
   
   private var _traitClass:Class;
   
   private var _viewClass:Class;
   
   private var _list:class_84;
   
   private var _mapView:class_87;
   
   function InternalDisplayLayer(param1:class_87, param2:LayeredSprite, param3:Class, param4:Class)
   {
      super();
      this._mapView = param1;
      this._container = param2;
      this._traitClass = param3;
      this._viewClass = param4;
   }
   
   public function set list(param1:class_84) : void
   {
      var _loc2_:* = undefined;
      var _loc3_:* = null;
      var _loc4_:int = 0;
      var _loc5_:int = 0;
      if(this._list)
      {
         this._list.name_110.remove(this.addTrait);
         this._list.name_33.remove(this.removeTrait);
         for(_loc2_ in this._viewByData)
         {
            this.removeTrait(_loc2_);
         }
      }
      this._list = param1;
      if(this._list)
      {
         this._list.name_110.add(this.addTrait);
         this._list.name_33.add(this.removeTrait);
         _loc3_ = this._list.traits;
         _loc4_ = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            this.addTrait(_loc3_[_loc5_]);
            _loc5_++;
         }
      }
   }
   
   public function getView(param1:class_267) : DisplayObject
   {
      return this._viewByData[param1] as DisplayObject;
   }
   
   private function addTrait(param1:class_267) : void
   {
      var _loc2_:* = null;
      var _loc3_:int = 0;
      if(getQualifiedClassName(param1) == getQualifiedClassName(this._traitClass))
      {
         _loc2_ = new this._viewClass(this._mapView,param1);
         _loc3_ = 0;
         if(_loc2_ is class_1699)
         {
            _loc3_ = int(class_1699(_loc2_).layer);
         }
         this._container.method_5974(_loc2_,_loc3_);
         this._viewByData[param1] = _loc2_;
      }
   }
   
   private function removeTrait(param1:class_267) : void
   {
      var _loc2_:DisplayObject = this._viewByData[param1] as DisplayObject;
      if(_loc2_ != null)
      {
         if(_loc2_ is IDisposable)
         {
            IDisposable(_loc2_).disposeView();
         }
         else
         {
            this._container.method_3406(_loc2_);
         }
         this._viewByData[param1] = null;
         delete this._viewByData[param1];
      }
   }
   
   public function get traitClass() : Class
   {
      return this._traitClass;
   }
   
   public function get viewClass() : Class
   {
      return this._viewClass;
   }
}
