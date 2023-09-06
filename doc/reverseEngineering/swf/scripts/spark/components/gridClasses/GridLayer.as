package spark.components.gridClasses
{
   import mx.core.mx_internal;
   import spark.components.Grid;
   import spark.components.Group;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class GridLayer extends Group
   {
       
      
      public function GridLayer()
      {
         super();
         layout = new LayoutBase();
      }
      
      override public function invalidateDisplayList() : void
      {
         var _loc1_:Grid = parent as Grid;
         if(Boolean(_loc1_) && _loc1_.mx_internal::inUpdateDisplayList)
         {
            return;
         }
         if(_loc1_)
         {
            _loc1_.invalidateDisplayList();
         }
      }
      
      override public function invalidateSize() : void
      {
         var _loc1_:Grid = parent as Grid;
         if(Boolean(_loc1_) && _loc1_.mx_internal::inUpdateDisplayList)
         {
            return;
         }
         if(_loc1_)
         {
            _loc1_.invalidateSize();
         }
      }
   }
}
