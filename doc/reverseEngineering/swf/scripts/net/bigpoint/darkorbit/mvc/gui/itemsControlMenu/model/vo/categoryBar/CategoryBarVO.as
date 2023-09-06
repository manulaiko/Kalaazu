package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.categoryBar
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.mvc.gui.abstract.model.vo.AbstractMenuBarVO;
   import package_104.class_278;
   
   public class CategoryBarVO extends AbstractMenuBarVO
   {
       
      
      private var _categories:Vector.<CategoryVO>;
      
      public function CategoryBarVO(param1:String, param2:class_73, param3:Vector.<CategoryVO>)
      {
         super(param1,class_278.ID,param2);
         this._categories = param3;
      }
      
      public function get categories() : Vector.<CategoryVO>
      {
         return this._categories;
      }
   }
}
