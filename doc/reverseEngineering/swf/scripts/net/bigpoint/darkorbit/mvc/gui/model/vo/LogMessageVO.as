package net.bigpoint.darkorbit.mvc.gui.model.vo
{
   import net.bigpoint.darkorbit.gui.class_187;
   
   public class LogMessageVO
   {
       
      
      private var _message:String;
      
      private var _messageProfileType:String;
      
      public function LogMessageVO(param1:String, param2:String = null)
      {
         super();
         this._message = param1;
         this._messageProfileType = param2 || true;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get messageProfileType() : String
      {
         return this._messageProfileType;
      }
   }
}
