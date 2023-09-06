package org.osmf.elements
{
   import org.osmf.elements.loaderClasses.LoaderLoadTrait;
   import org.osmf.elements.loaderClasses.LoaderUtils;
   import org.osmf.media.LoadableElementBase;
   import org.osmf.media.MediaResourceBase;
   import org.osmf.media.URLResource;
   import org.osmf.traits.LoadTrait;
   import org.osmf.traits.LoaderBase;
   import org.osmf.traits.MediaTraitType;
   
   public class SWFElement extends LoadableElementBase
   {
       
      
      public function SWFElement(param1:URLResource = null, param2:SWFLoader = null)
      {
         if(param2 == null)
         {
            param2 = new SWFLoader();
         }
         super(param1,param2);
      }
      
      override protected function createLoadTrait(param1:MediaResourceBase, param2:LoaderBase) : LoadTrait
      {
         return new LoaderLoadTrait(param2,param1);
      }
      
      override protected function processReadyState() : void
      {
         var _loc1_:LoaderLoadTrait = getTrait(MediaTraitType.LOAD) as LoaderLoadTrait;
         addTrait(MediaTraitType.DISPLAY_OBJECT,LoaderUtils.createDisplayObjectTrait(_loc1_.loader,this));
      }
      
      override protected function processUnloadingState() : void
      {
         removeTrait(MediaTraitType.DISPLAY_OBJECT);
      }
   }
}
