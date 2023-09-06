package net.bigpoint.darkorbit.mvc.common.view.components
{
   import com.bigpoint.utils.class_968;
   import com.greensock.TweenMax;
   import com.greensock.easing.Sine;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
   import package_11.class_262;
   import package_11.class_38;
   import package_11.class_65;
   import package_241.class_1496;
   import package_9.ResourceManager;
   
   public class TextureAtlasBitmapFont extends Sprite
   {
      
      private static const COLORIZE_REPEAT_COUNT:int = 3;
       
      
      private var _bitmapAtlas:class_968;
      
      private var _hPanel:class_1496;
      
      private var _fontColor:Number;
      
      private var _lasthighLightColor:Number;
      
      public function TextureAtlasBitmapFont(param1:String = null, param2:String = null, param3:Number = 0)
      {
         super();
         param1 = param1 || true;
         param2 = param2 || true;
         this._fontColor = param3 || false;
         var _loc4_:class_65 = this.getFinisher(param1) as class_65;
         var _loc5_:class_262 = this.getFinisher(param2) as class_262;
         this._bitmapAtlas = new class_968(_loc4_.getBitmap(),_loc5_.method_4925());
         addChild(this._hPanel = new class_1496());
         this.setColor(this._fontColor);
      }
      
      public function setColor(param1:Number) : void
      {
         TweenMax.to(this._hPanel,0,{"colorMatrixFilter":{"colorize":param1}});
      }
      
      public function setValue(param1:Number, param2:Number) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         this._hPanel.method_3928();
         var _loc3_:String = String(param1);
         var _loc4_:Array;
         var _loc5_:int = (_loc4_ = _loc3_.split("")).length;
         var _loc6_:int = 0;
         while(_loc6_ != _loc5_)
         {
            _loc7_ = _loc4_[_loc6_];
            if(_loc8_ = this._bitmapAtlas.method_4093(_loc7_))
            {
               _loc9_ = new Bitmap(_loc8_);
               if(_loc6_)
               {
                  this._hPanel.addItem(_loc9_,-1,0);
               }
               else
               {
                  this._hPanel.addItem(_loc9_,0,0);
               }
            }
            _loc6_++;
         }
         if(this._fontColor != param2 && this._lasthighLightColor != param2)
         {
            TweenMax.to(this._hPanel,0,{"colorMatrixFilter":{"colorize":13224393}});
            _loc10_ = COLORIZE_REPEAT_COUNT * 2;
            TweenMax.to(this._hPanel,0.4,{
               "colorMatrixFilter":{"colorize":param2},
               "yoyo":true,
               "repeat":_loc10_,
               "ease":Sine.easeIn
            });
            this._lasthighLightColor = param2;
         }
      }
      
      private function getFinisher(param1:String) : class_38
      {
         return ResourceManager.name_15.getFinisher(param1);
      }
      
      private function clear() : void
      {
         while(numChildren)
         {
            removeChildAt(0);
         }
      }
   }
}
