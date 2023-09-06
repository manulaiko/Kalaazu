package net.bigpoint.darkorbit.mvc.gui.highlights.view
{
   import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;
   import package_107.ClassUtils;
   
   public class CombinedHighLighter implements IHighLighter
   {
       
      
      private var _list:Vector.<IHighLighter>;
      
      private var _highliteVo:HighlightItemVO;
      
      private var _expectedClass:Class;
      
      public function CombinedHighLighter(param1:Vector.<IHighLighter>)
      {
         super();
         this._list = param1;
         this.calculateExpectedType();
      }
      
      private function calculateExpectedType() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = this._list.length;
         if(_loc1_)
         {
            this._expectedClass = this._list[0].expectedClass;
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this._list[_loc3_];
            if(_loc2_.expectedClass != _loc2_.expectedClass)
            {
               if(!ClassUtils.method_5726(this._expectedClass,_loc2_.expectedClass))
               {
                  if(!ClassUtils.method_5726(_loc2_.expectedClass,this._expectedClass))
                  {
                     throw new Error("the two classes do not fit: " + [this._expectedClass,_loc2_.expectedClass]);
                  }
                  this._expectedClass = _loc2_.expectedClass;
               }
            }
            _loc3_++;
         }
      }
      
      public function decorateUiElement(param1:Object, param2:HighlightItemVO) : void
      {
         this._highliteVo = param2;
         var _loc3_:int = this._list.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this._list[_loc4_].decorateUiElement(param1,param2);
            _loc4_++;
         }
      }
      
      public function remove() : void
      {
         var _loc1_:int = this._list.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this._list[_loc2_].remove();
            _loc2_++;
         }
      }
      
      public function get vo() : HighlightItemVO
      {
         return this._highliteVo;
      }
      
      public function get expectedClass() : Class
      {
         return this._expectedClass;
      }
   }
}
