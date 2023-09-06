package org.osmf.layout
{
   class LayoutTargetRenderers
   {
       
      
      public var containerRenderer:LayoutRendererBase;
      
      public var parentRenderer:LayoutRendererBase;
      
      function LayoutTargetRenderers(param1:ILayoutTarget)
      {
         super();
         param1.addEventListener(LayoutTargetEvent.ADD_TO_LAYOUT_RENDERER,this.onAddedToLayoutRenderer);
         param1.addEventListener(LayoutTargetEvent.REMOVE_FROM_LAYOUT_RENDERER,this.onRemovedFromLayoutRenderer);
         param1.addEventListener(LayoutTargetEvent.SET_AS_LAYOUT_RENDERER_CONTAINER,this.onSetAsLayoutRendererContainer);
         param1.addEventListener(LayoutTargetEvent.UNSET_AS_LAYOUT_RENDERER_CONTAINER,this.onUnsetAsLayoutRendererContainer);
      }
      
      private function onSetAsLayoutRendererContainer(param1:LayoutTargetEvent) : void
      {
         if(this.containerRenderer != param1.layoutRenderer)
         {
            this.containerRenderer = param1.layoutRenderer;
            this.containerRenderer.setParent(this.parentRenderer);
         }
      }
      
      private function onUnsetAsLayoutRendererContainer(param1:LayoutTargetEvent) : void
      {
         if(this.containerRenderer != null && this.containerRenderer == param1.layoutRenderer)
         {
            this.containerRenderer.setParent(null);
            this.containerRenderer = null;
         }
      }
      
      private function onAddedToLayoutRenderer(param1:LayoutTargetEvent) : void
      {
         if(this.parentRenderer != param1.layoutRenderer)
         {
            this.parentRenderer = param1.layoutRenderer;
            if(this.containerRenderer)
            {
               this.containerRenderer.setParent(this.parentRenderer);
            }
         }
      }
      
      private function onRemovedFromLayoutRenderer(param1:LayoutTargetEvent) : void
      {
         if(this.parentRenderer == param1.layoutRenderer)
         {
            this.parentRenderer = null;
            if(this.containerRenderer)
            {
               this.containerRenderer.setParent(null);
            }
         }
      }
   }
}
