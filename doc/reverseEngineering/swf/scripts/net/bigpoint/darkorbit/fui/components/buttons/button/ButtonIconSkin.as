package net.bigpoint.darkorbit.fui.components.buttons.button
{
   import flash.display.DisplayObject;
   import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;
   import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;
   import net.bigpoint.darkorbit.fui.components.core.skins.layers.ISkinLayer;
   
   public class ButtonIconSkin extends ButtonSkin implements IButtonSkin
   {
       
      
      public function ButtonIconSkin()
      {
         super();
      }
      
      override public function init() : void
      {
         super.init();
         if(false)
         {
            addChild(_layers[SkinLayerNames.ICON_NORMAL]);
            showState(SkinLayerNames.ICON_NORMAL);
         }
         if(false)
         {
            addChild(_layers[SkinLayerNames.ICON_CLICKED]);
            hideState(SkinLayerNames.ICON_CLICKED);
         }
         if(false)
         {
            addChild(_layers[SkinLayerNames.ICON_OVER]);
            hideState(SkinLayerNames.ICON_OVER);
         }
         if(false)
         {
            addChild(_layers[SkinLayerNames.ICON_DISABLED]);
            hideState(SkinLayerNames.ICON_DISABLED);
         }
      }
      
      override protected function setCurrentSkinState(param1:String) : void
      {
         super.setCurrentSkinState(param1);
         switch(param1)
         {
            case SkinLayerNames.NORMAL:
               showState(SkinLayerNames.ICON_NORMAL);
               hideState(SkinLayerNames.ICON_OVER);
               hideState(SkinLayerNames.ICON_CLICKED);
               hideState(SkinLayerNames.ICON_DISABLED);
               break;
            case SkinLayerNames.OVER:
               hideState(SkinLayerNames.ICON_NORMAL);
               showState(SkinLayerNames.ICON_OVER);
               hideState(SkinLayerNames.ICON_CLICKED);
               hideState(SkinLayerNames.ICON_DISABLED);
               break;
            case SkinLayerNames.CLICKED:
               hideState(SkinLayerNames.ICON_NORMAL);
               hideState(SkinLayerNames.ICON_OVER);
               showState(SkinLayerNames.ICON_CLICKED);
               hideState(SkinLayerNames.ICON_DISABLED);
               break;
            case SkinLayerNames.DISABLED:
               hideState(SkinLayerNames.ICON_NORMAL);
               hideState(SkinLayerNames.ICON_OVER);
               hideState(SkinLayerNames.ICON_CLICKED);
               showState(SkinLayerNames.ICON_DISABLED);
         }
      }
      
      override public function clone() : ISkin
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc1_:ButtonIconSkin = new ButtonIconSkin();
         var _loc2_:ISkinLayer = this.getSkinLayer(SkinLayerNames.NORMAL) as ISkinLayer;
         if(_loc2_)
         {
            _loc10_ = _loc2_.clone();
            _loc1_.setSkinLayer(SkinLayerNames.NORMAL,_loc10_);
         }
         var _loc3_:ISkinLayer = this.getSkinLayer(SkinLayerNames.OVER) as ISkinLayer;
         if(_loc3_)
         {
            _loc11_ = _loc3_.clone();
            _loc1_.setSkinLayer(SkinLayerNames.OVER,_loc11_);
         }
         var _loc4_:ISkinLayer;
         if(_loc4_ = this.getSkinLayer(SkinLayerNames.CLICKED) as ISkinLayer)
         {
            _loc12_ = _loc4_.clone();
            _loc1_.setSkinLayer(SkinLayerNames.CLICKED,_loc12_);
         }
         var _loc5_:ISkinLayer;
         if(_loc5_ = this.getSkinLayer(SkinLayerNames.DISABLED) as ISkinLayer)
         {
            _loc13_ = _loc5_.clone();
            _loc1_.setSkinLayer(SkinLayerNames.DISABLED,_loc13_);
         }
         var _loc6_:ISkinLayer;
         if(_loc6_ = this.getSkinLayer(SkinLayerNames.ICON_NORMAL) as ISkinLayer)
         {
            _loc14_ = _loc6_.clone();
            _loc1_.setSkinLayer(SkinLayerNames.ICON_NORMAL,_loc14_);
         }
         var _loc7_:ISkinLayer;
         if(_loc7_ = this.getSkinLayer(SkinLayerNames.ICON_OVER) as ISkinLayer)
         {
            _loc15_ = _loc7_.clone();
            _loc1_.setSkinLayer(SkinLayerNames.ICON_OVER,_loc15_);
         }
         var _loc8_:ISkinLayer;
         if(_loc8_ = this.getSkinLayer(SkinLayerNames.ICON_CLICKED) as ISkinLayer)
         {
            _loc16_ = _loc8_.clone();
            _loc1_.setSkinLayer(SkinLayerNames.ICON_CLICKED,_loc16_);
         }
         var _loc9_:ISkinLayer;
         if(_loc9_ = this.getSkinLayer(SkinLayerNames.ICON_DISABLED) as ISkinLayer)
         {
            _loc17_ = _loc9_.clone();
            _loc1_.setSkinLayer(SkinLayerNames.ICON_DISABLED,_loc17_);
         }
         return _loc1_;
      }
   }
}
