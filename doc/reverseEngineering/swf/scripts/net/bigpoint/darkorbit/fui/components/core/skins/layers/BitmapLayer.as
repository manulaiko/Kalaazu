package net.bigpoint.darkorbit.fui.components.core.skins.layers
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   
   public class BitmapLayer extends Bitmap implements ISkinLayer
   {
       
      
      public function BitmapLayer(param1:BitmapData = null)
      {
         super(param1);
      }
      
      public function clone() : DisplayObject
      {
         return new BitmapLayer(bitmapData.clone());
      }
      
      public function dispose() : void
      {
         if(this.bitmapData)
         {
            this.bitmapData.dispose();
            this.bitmapData = null;
         }
      }
   }
}
