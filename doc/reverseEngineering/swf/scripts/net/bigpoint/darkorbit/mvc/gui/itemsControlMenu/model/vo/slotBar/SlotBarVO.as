package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.slotBar
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.mvc.gui.abstract.model.vo.AbstractMenuBarVO;
   import net.bigpoint.darkorbit.net.class_74;
   
   public class SlotBarVO extends AbstractMenuBarVO
   {
       
      
      private var _slotBars:Vector.<SlotVO>;
      
      private var _stickOffset:class_73;
      
      private var _isVisible:Boolean = true;
      
      public function SlotBarVO(param1:String, param2:String, param3:Vector.<class_73>, param4:Vector.<SlotVO>, param5:Boolean = true)
      {
         super(param1,param2,param3[0]);
         this._isVisible = param5;
         this._slotBars = param4;
         this._stickOffset = param3.length > 1 ? param3[1] : new class_73();
      }
      
      override public function get positionCords() : String
      {
         return super.positionCords + class_74.const_3147 + this._stickOffset.x + class_74.const_1012 + this._stickOffset.y;
      }
      
      public function get slotBars() : Vector.<SlotVO>
      {
         return this._slotBars;
      }
      
      public function get stickOffset() : class_73
      {
         return this._stickOffset;
      }
      
      public function set stickOffset(param1:class_73) : void
      {
         this._stickOffset = param1;
      }
      
      public function get isVisible() : Boolean
      {
         return this._isVisible;
      }
      
      public function set isVisible(param1:Boolean) : void
      {
         this._isVisible = param1;
      }
   }
}
