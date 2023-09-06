package spark.components.supportClasses
{
   import flash.display.Sprite;
   import spark.core.ISharedDisplayObject;
   
   public class InvalidatingSprite extends Sprite implements ISharedDisplayObject
   {
       
      
      private var _redrawRequested:Boolean = false;
      
      public function InvalidatingSprite()
      {
         super();
         mouseChildren = false;
         mouseEnabled = false;
      }
      
      public function get redrawRequested() : Boolean
      {
         return this._redrawRequested;
      }
      
      public function set redrawRequested(param1:Boolean) : void
      {
         this._redrawRequested = param1;
      }
   }
}
