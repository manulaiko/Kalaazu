package package_289
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.map.model.traits.class_309;
   import package_102.LayeredSprite;
   import package_193.class_1692;
   import package_194.class_1697;
   import package_258.class_2079;
   import package_29.class_267;
   import package_29.class_84;
   import package_29.class_89;
   import package_358.class_2081;
   import package_358.class_2085;
   import package_360.class_2084;
   
   public class MapDisplayLayer2D extends LayeredSprite implements class_80
   {
      
      private static const _bd:BitmapData = new BitmapData(1,1,true,0);
      
      private static const const_1332:Matrix = new Matrix();
      
      {
         class_89.method_5405(class_306);
         class_89.method_5405(class_1697);
         class_89.method_5405(class_1692);
      }
      
      private const const_241:Dictionary = new Dictionary(true);
      
      private var _updatables:Vector.<class_80>;
      
      public function MapDisplayLayer2D()
      {
         this._updatables = new Vector.<class_80>();
         super();
         this.method_2831(class_306,class_2083);
         this.method_2831(class_309,class_2084);
         this.method_2831(class_2079,class_2086);
         this.method_2831(class_1697,class_2085);
         this.method_2831(class_1692,class_2081);
      }
      
      public function set map(param1:class_89) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in this.const_241)
         {
            InternalDisplayLayer(this.const_241[_loc2_]).list = !!param1 ? param1.method_328(_loc2_) : null;
         }
      }
      
      public function method_6501(param1:class_267) : DisplayObject
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
      
      public function method_822(param1:int, param2:int) : Boolean
      {
         const_1332.identity();
         const_1332.translate(-param1,-param2);
         const_1332.concat(transform.concatenatedMatrix);
         _bd.lock();
         _bd.setPixel32(0,0,0);
         _bd.draw(this,const_1332,null,null,new Rectangle(0,0,1,1));
         _bd.unlock();
         var _loc3_:uint = uint(_bd.getPixel32(0,0));
         return _loc3_ >>> 24 > 128;
      }
      
      public function updateObj(param1:Number) : void
      {
         var _loc2_:int = this._updatables.length - 1;
         while(_loc2_ >= 0)
         {
            this._updatables[_loc2_].updateObj(param1);
            _loc2_--;
         }
      }
      
      protected function method_2831(param1:Class, param2:Class) : void
      {
         var _loc3_:InternalDisplayLayer = new InternalDisplayLayer(this,param1,param2);
         this.const_241[param1] = _loc3_;
         this._updatables.push(_loc3_);
      }
   }
}

import flash.display.DisplayObject;
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;
import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_1699;
import net.bigpoint.darkorbit.map.common.class_80;
import package_102.LayeredSprite;
import package_29.class_267;
import package_29.class_84;

class InternalDisplayLayer implements class_80
{
    
   
   private const _viewByData:Dictionary = new Dictionary(true);
   
   private var _container:LayeredSprite;
   
   private var _traitClass:Class;
   
   private var _viewClass:Class;
   
   private var _list:class_84;
   
   private var _updatables:Vector.<class_80>;
   
   function InternalDisplayLayer(param1:LayeredSprite, param2:Class, param3:Class)
   {
      this._updatables = new Vector.<class_80>();
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
   
   public function getView(param1:class_267) : DisplayObject
   {
      return this._viewByData[param1] as DisplayObject;
   }
   
   private function addTrait(param1:class_267) : void
   {
      var _loc2_:* = null;
      var _loc3_:int = 0;
      if(this._viewByData[param1] != null)
      {
         throw Error("Unbelivable");
      }
      if(getQualifiedClassName(param1) == getQualifiedClassName(this._traitClass))
      {
         _loc2_ = new this._viewClass(param1);
         _loc3_ = 0;
         if(_loc2_ is class_1699)
         {
            _loc3_ = int(class_1699(_loc2_).layer);
         }
         if(_loc2_ is class_80)
         {
            this._updatables.push(_loc2_);
         }
         this._container.method_5974(_loc2_,_loc3_);
         this._viewByData[param1] = _loc2_;
      }
   }
   
   private function removeTrait(param1:class_267) : void
   {
      var _loc3_:int = 0;
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
         _loc3_ = int(this._updatables.indexOf(_loc2_));
         if(_loc3_ != -1)
         {
            this._updatables.splice(_loc3_,1);
         }
         this._viewByData[param1] = null;
         delete this._viewByData[param1];
      }
   }
   
   public function updateObj(param1:Number) : void
   {
      var _loc2_:int = this._updatables.length - 1;
      while(_loc2_ >= 0)
      {
         this._updatables[_loc2_].updateObj(param1);
         _loc2_--;
      }
   }
}
