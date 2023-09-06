package net.bigpoint.darkorbit.mvc.gui.highlights.view
{
   import com.greensock.TweenMax;
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;
   
   public class RedBlinkingHighLight implements IHighLighter
   {
       
      
      private var _highliteVo:HighlightItemVO;
      
      private var _noSwitchingAmmoWarn:Sprite;
      
      private var _active:Boolean;
      
      public function RedBlinkingHighLight()
      {
         super();
      }
      
      public function decorateUiElement(param1:Object, param2:HighlightItemVO) : void
      {
         this._highliteVo = param2;
         var _loc3_:SlotAndItemBarElement = param1 as SlotAndItemBarElement;
         if(_loc3_)
         {
            this._active = true;
            this._noSwitchingAmmoWarn = _loc3_.noSwitchingAmmoWarn;
            _loc3_.method_4965(this._noSwitchingAmmoWarn,6,3,6);
            this._noSwitchingAmmoWarn.alpha = 0;
            this._noSwitchingAmmoWarn.visible = true;
            this.doHighlite();
         }
      }
      
      private function doHighlite() : void
      {
         if(Boolean(this._noSwitchingAmmoWarn) && this._active)
         {
            TweenMax.to(this._noSwitchingAmmoWarn,this._highliteVo.highlightDuration,{
               "alpha":1,
               "yoyo":true,
               "repeat":1,
               "onComplete":this.doHighlite
            });
         }
      }
      
      public function remove() : void
      {
         this._active = false;
      }
      
      public function get vo() : HighlightItemVO
      {
         return this._highliteVo;
      }
      
      public function get expectedClass() : Class
      {
         return SlotAndItemBarElement;
      }
   }
}
