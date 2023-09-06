package net.bigpoint.darkorbit.map.common
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.map.model.class_90;
   import package_29.class_85;
   
   public class MiniMapViewportBounds extends class_85
   {
       
      
      private var var_176:MiniMapTrait;
      
      public function MiniMapViewportBounds()
      {
         super(class_90.method_5486,new class_73(0,0));
         this.var_176 = new MiniMapTrait();
         addTrait(this.var_176);
      }
      
      public function setViewport(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
      {
         this.var_176.setViewport(param1,param2,param3,param4,param5,param6,param7,param8);
      }
   }
}

import flash.display.BlendMode;
import flash.display.Shape;
import package_100.class_270;

class MiniMapTrait extends class_270
{
    
   
   private var _leftTopX:Number = 0;
   
   private var _leftTopY:Number = 0;
   
   private var _rightTopX:Number = 0;
   
   private var _rightTopY:Number = 0;
   
   private var _rightBottomX:Number = 0;
   
   private var _rightBottomY:Number = 0;
   
   private var _leftBottomX:Number = 0;
   
   private var _leftBottomY:Number = 0;
   
   function MiniMapTrait()
   {
      super(new Shape(),false,false,-1);
      Shape(_icon).blendMode = BlendMode.INVERT;
   }
   
   public function setViewport(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
   {
      this._leftTopX = param1;
      this._leftTopY = param2;
      this._rightTopX = param3;
      this._rightTopY = param4;
      this._rightBottomX = param5;
      this._rightBottomY = param6;
      this._leftBottomX = param7;
      this._leftBottomY = param8;
      this.update();
   }
   
   override protected function update() : void
   {
      var _loc1_:Shape = _icon as Shape;
      _loc1_.graphics.clear();
      _loc1_.graphics.lineStyle(0.7,13421772,0.5);
      _loc1_.graphics.moveTo(Number(this._leftTopX) * Number(_scale),Number(this._leftTopY) * Number(_scale));
      _loc1_.graphics.lineTo(Number(this._leftTopX) * Number(_scale) + (Number(this._rightTopX) - Number(this._leftTopX)) * 0.125 * Number(_scale),Number(this._leftTopY) * Number(_scale) - (Number(this._leftTopY) - Number(this._rightTopY)) * 0.125 * Number(_scale));
      _loc1_.graphics.moveTo(Number(this._leftTopX) * Number(_scale),Number(this._leftTopY) * Number(_scale));
      _loc1_.graphics.lineTo(Number(this._leftTopX) * Number(_scale) - (Number(this._leftTopX) - Number(this._leftBottomX)) * 0.125 * Number(_scale),Number(this._leftTopY) * Number(_scale) - (Number(this._leftTopY) - Number(this._leftBottomY)) * 0.125 * Number(_scale));
      _loc1_.graphics.moveTo(Number(this._rightBottomX) * Number(_scale),Number(this._rightBottomY) * Number(_scale));
      _loc1_.graphics.lineTo(Number(this._rightBottomX) * Number(_scale) - (Number(this._rightBottomX) - Number(this._leftBottomX)) * 0.125 * Number(_scale),Number(this._rightBottomY) * Number(_scale) - (Number(this._rightBottomY) - Number(this._leftBottomY)) * 0.125 * Number(_scale));
      _loc1_.graphics.moveTo(Number(this._rightBottomX) * Number(_scale),Number(this._rightBottomY) * Number(_scale));
      _loc1_.graphics.lineTo(Number(this._rightBottomX) * Number(_scale) - (Number(this._rightBottomX) - Number(this._rightTopX)) * 0.125 * Number(_scale),Number(this._rightBottomY) * Number(_scale) + (Number(this._rightTopY) - Number(this._rightBottomY)) * 0.125 * Number(_scale));
      _loc1_.graphics.moveTo(Number(this._rightTopX) * Number(_scale),Number(this._rightTopY) * Number(_scale));
      _loc1_.graphics.lineTo(Number(this._rightTopX) * Number(_scale) - (Number(this._rightTopX) - Number(this._leftTopX)) * 0.125 * Number(_scale),Number(this._rightTopY) * Number(_scale) - (Number(this._rightTopY) - Number(this._leftTopY)) * 0.125 * Number(_scale));
      _loc1_.graphics.moveTo(Number(this._rightTopX) * Number(_scale),Number(this._rightTopY) * Number(_scale));
      _loc1_.graphics.lineTo(Number(this._rightTopX) * Number(_scale) - (Number(this._rightTopX) - Number(this._rightBottomX)) * 0.125 * Number(_scale),Number(this._rightTopY) * Number(_scale) - (Number(this._rightTopY) - Number(this._rightBottomY)) * 0.125 * Number(_scale));
      _loc1_.graphics.moveTo(Number(this._leftBottomX) * Number(_scale),Number(this._leftBottomY) * Number(_scale));
      _loc1_.graphics.lineTo(Number(this._leftBottomX) * Number(_scale) - (Number(this._leftBottomX) - Number(this._rightBottomX)) * 0.125 * Number(_scale),Number(this._leftBottomY) * Number(_scale) - (Number(this._leftBottomY) - Number(this._rightBottomY)) * 0.125 * Number(_scale));
      _loc1_.graphics.moveTo(Number(this._leftBottomX) * Number(_scale),Number(this._leftBottomY) * Number(_scale));
      _loc1_.graphics.lineTo(Number(this._leftBottomX) * Number(_scale) - (Number(this._leftBottomX) - Number(this._leftTopX)) * 0.125 * Number(_scale),Number(this._leftBottomY) * Number(_scale) - (Number(this._leftBottomY) - Number(this._leftTopY)) * 0.125 * Number(_scale));
   }
}
