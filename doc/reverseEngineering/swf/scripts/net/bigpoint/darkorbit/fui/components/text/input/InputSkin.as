package net.bigpoint.darkorbit.fui.components.text.input
{
   import flash.display.DisplayObject;
   import flash.text.TextFieldType;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;
   import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;
   import net.bigpoint.darkorbit.fui.components.text.label.LabelSkin;
   
   public class InputSkin extends LabelSkin
   {
      
      private static var _skinLayerDefintions:Dictionary = new Dictionary();
      
      {
         _skinLayerDefintions[SkinLayerNames.NORMAL] = {};
         _skinLayerDefintions[SkinLayerNames.DISABLED] = {};
      }
      
      public function InputSkin()
      {
         super();
      }
      
      override public function getSkinLayerDefintions() : Dictionary
      {
         return _skinLayerDefintions;
      }
      
      override public function init() : void
      {
         _mouseEnabled = true;
         _mouseChildrenEnabled = true;
         super.init();
      }
      
      override protected function assignTextStyle() : void
      {
         _msgLabel.selectable = true;
         _msgLabel.type = TextFieldType.INPUT;
         super.assignTextStyle();
      }
      
      override public function setSkinLayer(param1:String, param2:DisplayObject) : void
      {
         super.setSkinLayer(param1,param2);
      }
      
      override public function clone() : ISkin
      {
         var _loc1_:InputSkin = new InputSkin();
         _clone_(_loc1_,_skinLayerDefintions);
         return _loc1_;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
