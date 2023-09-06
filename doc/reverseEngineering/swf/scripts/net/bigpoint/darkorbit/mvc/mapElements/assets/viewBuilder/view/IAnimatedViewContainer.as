package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.view
{
   import net.bigpoint.darkorbit.mvc.display.class_1704;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.ViewCreateDTO;
   
   public interface IAnimatedViewContainer
   {
       
      
      function get dto() : ViewCreateDTO;
      
      function getViewById(param1:String) : class_1704;
      
      function get view() : class_1704;
      
      function startTween(param1:String) : Boolean;
      
      function resumeTween(param1:String) : Boolean;
      
      function pauseTween(param1:String) : Boolean;
      
      function stopTween(param1:String) : Boolean;
      
      function resetTween(param1:String) : Boolean;
      
      function set reductionLevel(param1:int) : void;
      
      function set userQuality(param1:int) : void;
      
      function dispose() : void;
   }
}
