package starling.utils
{
   public function formatString(param1:String, ... rest) : String
   {
      var _loc3_:int = 0;
      while(_loc3_ < rest.length)
      {
         param1 = param1.replace(new RegExp("\\{" + _loc3_ + "\\}","g"),rest[_loc3_]);
         _loc3_++;
      }
      return param1;
   }
}
