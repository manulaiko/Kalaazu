package starling.utils
{
   public function execute(param1:Function, ... rest) : void
   {
      var _loc3_:int = 0;
      var _loc4_:int = 0;
      if(param1 != null)
      {
         _loc4_ = param1.length;
         _loc3_ = int(rest.length);
         while(_loc3_ < _loc4_)
         {
            rest[_loc3_] = null;
            _loc3_++;
         }
         param1.apply(null,rest.slice(0,_loc4_));
      }
   }
}
