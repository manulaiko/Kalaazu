package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.categoryBar
{
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.ItemVO;
   
   public class CategoryVO
   {
       
      
      private var _id:String;
      
      private var _items:Vector.<ItemVO>;
      
      public function CategoryVO(param1:String, param2:Vector.<ItemVO>)
      {
         super();
         this._id = param1;
         this._items = param2;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get items() : Vector.<ItemVO>
      {
         return this._items;
      }
   }
}
