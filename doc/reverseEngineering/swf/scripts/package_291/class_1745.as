package package_291
{
   public class class_1745
   {
      
      public static var active:Boolean = false;
      
      public static var var_3536:Boolean = true;
       
      
      public function class_1745()
      {
         super();
      }
      
      public static function clear() : void
      {
      }
      
      public static function method_2213() : void
      {
      }
      
      public static function trace(param1:Object) : void
      {
         if(active)
         {
            dotrace(param1);
         }
      }
      
      public static function warning(param1:Object) : void
      {
         if(var_3536)
         {
            error(param1);
            return;
         }
      }
      
      public static function error(param1:Object) : void
      {
         throw new Error(param1);
      }
   }
}

function dotrace(param1:Object):void
{
   §§pop();
}