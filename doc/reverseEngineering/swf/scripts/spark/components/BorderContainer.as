package spark.components
{
   import mx.graphics.IFill;
   import mx.graphics.IStroke;
   
   public class BorderContainer extends SkinnableContainer
   {
       
      
      private var _backgroundFill:IFill;
      
      private var _borderStroke:IStroke;
      
      public function BorderContainer()
      {
         super();
      }
      
      public function get backgroundFill() : IFill
      {
         return this._backgroundFill;
      }
      
      public function set backgroundFill(param1:IFill) : void
      {
         if(param1 == this._backgroundFill)
         {
            return;
         }
         this._backgroundFill = param1;
         if(skin)
         {
            skin.invalidateDisplayList();
         }
      }
      
      public function get borderStroke() : IStroke
      {
         return this._borderStroke;
      }
      
      public function set borderStroke(param1:IStroke) : void
      {
         if(param1 == this._borderStroke)
         {
            return;
         }
         this._borderStroke = param1;
         if(skin)
         {
            skin.invalidateDisplayList();
         }
      }
   }
}
