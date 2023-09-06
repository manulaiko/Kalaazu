package net.bigpoint.darkorbit.mvc.gui.highlights.view
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;
   import package_27.class_82;
   
   public class FlashHighlightWithSound extends FlashHighlight
   {
       
      
      public function FlashHighlightWithSound()
      {
         super();
      }
      
      override public function decorateUiElement(param1:Object, param2:HighlightItemVO) : void
      {
         super.decorateUiElement(param1,param2);
         class_82.playSoundEffect(class_126.const_3202);
      }
   }
}
