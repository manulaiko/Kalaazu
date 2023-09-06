package package_63
{
   import net.bigpoint.darkorbit.settings.Settings;
   
   public class class_224
   {
      
      private static const const_2385:Boolean = true;
       
      
      public function class_224()
      {
         super();
      }
      
      public static function get method_5407() : String
      {
         var _loc1_:* = null;
         if(const_2385)
         {
            _loc1_ = "http://undefined/gamechat/as3/chat.swf";
         }
         else
         {
            _loc1_ = "./graphics/ui/chat.swf";
         }
         return _loc1_;
      }
      
      public static function get method_263() : String
      {
         var _loc1_:* = null;
         if(const_2385)
         {
            _loc1_ = "http://undefined/gamechat/as3";
         }
         else
         {
            _loc1_ = "./graphics/ui/chat/";
         }
         return _loc1_;
      }
   }
}
