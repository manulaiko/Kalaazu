package net.bigpoint.darkorbit.mvc.gui.abstract.model.vo
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.net.class_74;
   
   public class AbstractMenuBarVO
   {
       
      
      private var _id:String;
      
      private var _layoutId:String;
      
      private var _position:class_73;
      
      public function AbstractMenuBarVO(param1:String, param2:String, param3:class_73)
      {
         super();
         this._id = param1;
         this._layoutId = param2;
         this._position = param3;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get layoutId() : String
      {
         return this._layoutId;
      }
      
      public function set layoutId(param1:String) : void
      {
         this._layoutId = param1;
      }
      
      public function get positionCords() : String
      {
         return this._position.x + class_74.const_1012 + this._position.y;
      }
      
      public function get layoutType() : String
      {
         var _loc1_:* = null;
         for(_loc1_ in GuiConstants.LAYOUTS_MAP)
         {
            if(GuiConstants.LAYOUTS_MAP[_loc1_] == this._layoutId)
            {
               return String(_loc1_);
            }
         }
         return null;
      }
      
      public function get position() : class_73
      {
         return this._position;
      }
   }
}
