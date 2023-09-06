package net.bigpoint.darkorbit.fui.components.buttons.button
{
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;
   import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;
   
   public class FadableButtonSkin extends ButtonSkin implements IButtonSkin
   {
      
      private static var _skinLayerDefintions:Dictionary = new Dictionary();
      
      {
         _skinLayerDefintions[SkinLayerNames.MASK] = {};
         _skinLayerDefintions[SkinLayerNames.NORMAL] = {};
         _skinLayerDefintions[SkinLayerNames.OVER] = {};
         _skinLayerDefintions[SkinLayerNames.CLICKED] = {};
         _skinLayerDefintions[SkinLayerNames.DISABLED] = {};
      }
      
      public function FadableButtonSkin()
      {
         super();
      }
      
      override public function getSkinLayerDefintions() : Dictionary
      {
         return _skinLayerDefintions;
      }
      
      override protected function setCurrentSkinState(param1:String) : void
      {
         switch(param1)
         {
            case SkinLayerNames.NORMAL:
               showState(SkinLayerNames.NORMAL);
               this.alphaFadeStateOut(SkinLayerNames.OVER);
               hideState(SkinLayerNames.CLICKED);
               hideState(SkinLayerNames.DISABLED);
               break;
            case SkinLayerNames.OVER:
               showState(SkinLayerNames.NORMAL);
               this.alphaFadeStateIn(SkinLayerNames.OVER);
               hideState(SkinLayerNames.CLICKED);
               hideState(SkinLayerNames.DISABLED);
               break;
            case SkinLayerNames.CLICKED:
               hideState(SkinLayerNames.NORMAL);
               this.alphaFadeStateOut(SkinLayerNames.OVER);
               showState(SkinLayerNames.CLICKED);
               hideState(SkinLayerNames.DISABLED);
               break;
            case SkinLayerNames.DISABLED:
               hideState(SkinLayerNames.NORMAL);
               this.alphaFadeStateOut(SkinLayerNames.OVER);
               hideState(SkinLayerNames.CLICKED);
               showState(SkinLayerNames.DISABLED);
         }
      }
      
      protected function alphaFadeStateIn(param1:String) : void
      {
         var _loc2_:DisplayObject = getSkinLayer(param1);
         if(_loc2_)
         {
            TweenLite.to(_loc2_,0.3,{"autoAlpha":1});
         }
      }
      
      protected function alphaFadeStateOut(param1:String) : void
      {
         var _loc2_:DisplayObject = getSkinLayer(param1);
         if(_loc2_)
         {
            TweenLite.to(_loc2_,0.3,{"autoAlpha":0});
         }
      }
      
      override public function clone() : ISkin
      {
         var _loc1_:FadableButtonSkin = new FadableButtonSkin();
         _clone_(_loc1_,_skinLayerDefintions);
         return _loc1_;
      }
   }
}
