package org.osmf.elements
{
   import org.osmf.media.URLResource;
   
   public class F4MElement extends LoadFromDocumentElement
   {
       
      
      public function F4MElement(param1:URLResource = null, param2:F4MLoader = null)
      {
         if(param2 == null)
         {
            param2 = new F4MLoader();
         }
         super(param1,param2);
      }
   }
}
