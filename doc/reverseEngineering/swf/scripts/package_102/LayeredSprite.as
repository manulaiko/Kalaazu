package package_102
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   
   public class LayeredSprite extends Sprite
   {
       
      
      private var _layers:Vector.<Layer>;
      
      private var var_720:Object;
      
      public function LayeredSprite()
      {
         this._layers = new Vector.<Layer>();
         this.var_720 = {};
         super();
      }
      
      public function method_5974(param1:DisplayObject, param2:int) : void
      {
         this.getLayer(param2).addChild(param1);
      }
      
      public function removeAll() : void
      {
         while(this._layers.length)
         {
            removeChild(this._layers.pop());
         }
         this.var_720 = {};
      }
      
      public function getLayer(param1:int) : DisplayObjectContainer
      {
         var _loc2_:* = null;
         if(this.var_720[param1] == null)
         {
            _loc2_ = new Layer(param1);
            this.var_720[param1] = _loc2_;
            this._layers.push(_loc2_);
            this.method_5811();
         }
         return this.var_720[param1] as Layer;
      }
      
      private function method_5811() : void
      {
         var _loc1_:* = null;
         this._layers.sort(Layer.compare);
         for each(_loc1_ in this._layers)
         {
            addChild(_loc1_);
         }
      }
      
      public function method_3406(param1:DisplayObject) : void
      {
         if(contains(param1))
         {
            param1.parent.removeChild(param1);
         }
      }
   }
}

import flash.display.Sprite;

class Layer extends Sprite
{
    
   
   private var _index:int;
   
   function Layer(param1:int = 0)
   {
      super();
      this._index = param1;
   }
   
   public static function compare(param1:Layer, param2:Layer) : int
   {
      if(param1.index > param2.index)
      {
         return 1;
      }
      if(param1.index < param2.index)
      {
         return -1;
      }
      return 0;
   }
   
   public function get index() : int
   {
      return this._index;
   }
}
