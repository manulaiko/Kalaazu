package package_76
{
   public class class_2279
   {
      
      private static const const_1590:String = "%BASE_PATH%flashAPI/profileImage.php?userId=%USERID%&instanceId=%INSTANCE%";
      
      private static const const_895:RegExp = /%USERID%/;
      
      private static const const_294:RegExp = /%INSTANCE%/;
      
      private static const const_742:RegExp = /%BASE_PATH%/;
       
      
      public function class_2279()
      {
         super();
      }
      
      public static function method_1192(param1:int, param2:int, param3:String) : String
      {
         return const_1590.replace(const_742,param3).replace(const_895,param1).replace(const_294,param2);
      }
   }
}
