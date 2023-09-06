package net.bigpoint.darkorbit.map.view3D.display3D
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import package_193.class_1692;
   import package_194.class_1697;
   import package_29.class_267;
   import package_29.class_84;
   import package_29.class_89;
   import package_295.class_1752;
   import package_302.class_2137;
   import package_302.class_2138;
   
   public class MapDisplayLayer3D
   {
      
      {
         class_89.method_5405(class_1697);
         class_89.method_5405(class_1692);
      }
      
      private const const_241:Dictionary = new Dictionary(true);
      
      private var _container:class_1752;
      
      public function MapDisplayLayer3D(param1:class_1752)
      {
         super();
         this._container = param1;
         this.method_2831(class_306,class_2135);
         this.method_2831(class_1697,class_2137);
         this.method_2831(class_1692,class_2138);
      }
      
      public function set map(param1:class_89) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in this.const_241)
         {
            InternalDisplayLayer(this.const_241[_loc2_]).list = !!param1 ? param1.method_328(_loc2_) : null;
         }
      }
      
      public function method_6501(param1:class_267) : class_1752
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = undefined;
         for(_loc4_ in this.const_241)
         {
            _loc2_ = this.const_241[_loc4_] as InternalDisplayLayer;
            _loc3_ = _loc2_.getView(param1);
            if(_loc3_)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      protected function method_2831(param1:Class, param2:Class) : void
      {
         var _loc3_:InternalDisplayLayer = new InternalDisplayLayer(this._container,param1,param2);
         this.const_241[param1] = _loc3_;
      }
   }
}

import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;
import net.bigpoint.darkorbit.map.common.IDisposable;
import package_29.class_267;
import package_29.class_84;
import package_295.class_1752;

class InternalDisplayLayer
{
    
   
   private const _viewByData:Dictionary = new Dictionary(true);
   
   private var _container:class_1752;
   
   private var _traitClass:Class;
   
   private var _viewClass:Class;
   
   private var _list:class_84;
   
   function InternalDisplayLayer(param1:class_1752, param2:Class, param3:Class)
   {
      super();
      this._container = param1;
      this._traitClass = param2;
      this._viewClass = param3;
   }
   
   public function set list(param1:class_84) : void
   {
      var _loc2_:* = undefined;
      var _loc3_:* = null;
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
         for each(_loc3_ in this._list.traits)
         {
            this.addTrait(_loc3_);
         }
      }
   }
   
   public function getView(param1:class_267) : class_1752
   {
      return this._viewByData[param1] as class_1752;
   }
   
   private function addTrait(param1:class_267) : void
   {
      var _loc2_:* = null;
      if(getQualifiedClassName(param1) == getQualifiedClassName(this._traitClass))
      {
         _loc2_ = new this._viewClass(param1);
         this._container.addChild(_loc2_);
         this._viewByData[param1] = _loc2_;
      }
   }
   
   private function removeTrait(param1:class_267) : void
   {
      var _loc2_:class_1752 = this._viewByData[param1] as class_1752;
      if(_loc2_ != null)
      {
         if(_loc2_ is IDisposable)
         {
            (_loc2_ as IDisposable).disposeView();
         }
         else if(_loc2_.parent)
         {
            _loc2_.parent.removeChild(_loc2_);
         }
         this._viewByData[param1] = null;
         delete this._viewByData[param1];
      }
   }
}
