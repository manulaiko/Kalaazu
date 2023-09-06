package net.bigpoint.darkorbit.mvc.common.model.vo
{
   import com.bigpoint.utils.class_73;
   
   public class ViewportResizeValuesVO
   {
       
      
      private var _beforResize:class_73;
      
      private var _afterResize:class_73;
      
      public function ViewportResizeValuesVO(param1:class_73)
      {
         super();
         this._beforResize = this._afterResize = param1;
      }
      
      public function get beforeResize() : class_73
      {
         return this._beforResize;
      }
      
      public function set beforeResize(param1:class_73) : void
      {
         this._beforResize = param1;
      }
      
      public function get afterResize() : class_73
      {
         return this._afterResize;
      }
      
      public function set afterResize(param1:class_73) : void
      {
         this._afterResize = param1;
      }
   }
}
