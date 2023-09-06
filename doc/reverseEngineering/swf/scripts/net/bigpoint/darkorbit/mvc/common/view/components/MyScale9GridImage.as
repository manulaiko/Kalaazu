package net.bigpoint.darkorbit.mvc.common.view.components
{
   import net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImage;
   
   public class MyScale9GridImage extends Scale9GridImage
   {
       
      
      public function MyScale9GridImage()
      {
         super();
      }
      
      override public function set source(param1:*) : void
      {
         if(param1 != null)
         {
            super.source = param1;
         }
      }
   }
}
