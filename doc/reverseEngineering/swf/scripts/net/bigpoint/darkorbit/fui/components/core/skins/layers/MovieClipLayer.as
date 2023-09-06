package net.bigpoint.darkorbit.fui.components.core.skins.layers
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class MovieClipLayer extends Sprite implements ISkinLayer
   {
       
      
      private var _mc:MovieClip;
      
      public function MovieClipLayer(param1:MovieClip)
      {
         super();
         this._mc = param1;
         this.addChild(this._mc);
      }
      
      public function clone() : DisplayObject
      {
         var _loc1_:Class = Class(getDefinitionByName(getQualifiedClassName(this)));
         var _loc2_:MovieClip = MovieClip(new this._mc.constructor());
         if(!_loc2_)
         {
            _loc2_ = this._mc;
         }
         return new _loc1_(_loc2_) as MovieClipLayer;
      }
      
      public function dispose() : void
      {
         if(this._mc)
         {
            if(this.contains(this._mc))
            {
               this.removeChild(this._mc);
            }
            this._mc = null;
         }
      }
   }
}
