package mx.skins.spark
{
   import flash.display.Graphics;
   import mx.skins.ProgrammaticSkin;
   
   public class ProgressMaskSkin extends ProgrammaticSkin
   {
       
      
      public function ProgressMaskSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         _loc3_.beginFill(16776960);
         _loc3_.drawRect(2,1,param1 - 4,param2 - 2);
         _loc3_.endFill();
      }
   }
}
