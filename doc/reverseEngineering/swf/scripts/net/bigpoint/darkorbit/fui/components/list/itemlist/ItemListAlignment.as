package net.bigpoint.darkorbit.fui.components.list.itemlist
{
   import net.bigpoint.darkorbit.fui.components.core.layout.Alignment;
   import net.bigpoint.darkorbit.fui.components.core.layout.AlignmentAutoSizeMode;
   
   public class ItemListAlignment extends Alignment
   {
       
      
      public function ItemListAlignment(param1:ItemList)
      {
         super(param1);
      }
      
      protected function get list() : ItemList
      {
         return _host as ItemList;
      }
      
      override public function calculatePercentageWidth() : Number
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = 0;
         if(_autoSizeMode == AlignmentAutoSizeMode.PARENT)
         {
            _loc2_ = _marginLeft + _marginRight;
            _loc1_ = getHostComponentParentWidth() - _loc2_;
         }
         else if(_autoSizeMode == AlignmentAutoSizeMode.CHILDREN)
         {
            if(this.list.list)
            {
               return this.list.itemWidth * this.list.list.length + this.list.layout.gap * (length - 1);
            }
            return super.calculatePercentageWidth();
         }
         return _loc1_;
      }
      
      override public function calculatePercentageHeight() : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = 0;
         var _loc1_:Number = 0;
         if(_autoSizeMode == AlignmentAutoSizeMode.PARENT)
         {
            _loc2_ = _marginTop + _marginBottom;
            _loc1_ = getHostComponentParentHeight() - _loc2_;
         }
         else if(_autoSizeMode == AlignmentAutoSizeMode.CHILDREN)
         {
            if(this.list.list)
            {
               _loc3_ = this.list.list.length;
               return this.list.itemHeight * _loc3_ + this.list.layout.gap * (_loc3_ - 1);
            }
            return this.list.getBounds(this.list).height;
         }
         return _loc1_;
      }
   }
}
