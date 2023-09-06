package package_441
{
   import flash.display.BitmapData;
   import package_294.class_2113;
   import package_307.class_1776;
   import package_369.class_2117;
   
   public class class_2430
   {
      
      private static var var_785:BitmapData;
      
      private static var var_2798:class_1776;
      
      private static var var_2524:class_2117;
       
      
      public function class_2430()
      {
         super();
      }
      
      public static function method_782(param1:class_2113 = null) : class_1776
      {
         if(!var_2524)
         {
            method_4694();
         }
         if(!var_2798)
         {
            method_3471();
         }
         return var_2798;
      }
      
      public static function method_1959(param1:class_2113 = null) : class_2117
      {
         if(!var_2524)
         {
            method_4694();
         }
         return var_2524;
      }
      
      private static function method_4694() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var_785 = new BitmapData(8,8,false,0);
         _loc1_ = 0;
         while(_loc1_ < 8)
         {
            _loc2_ = 0;
            while(_loc2_ < 8)
            {
               if(_loc2_ & 1 ^ _loc1_ & 1)
               {
                  var_785.setPixel(_loc1_,_loc2_,16777215);
               }
               _loc2_++;
            }
            _loc1_++;
         }
         var_2524 = new class_2117(var_785);
         var_2524.name = "defaultTexture";
      }
      
      private static function method_3471() : void
      {
         var_2798 = new class_1776(var_2524);
         var_2798.mipmap = false;
         var_2798.smooth = false;
         var_2798.name = "defaultMaterial";
      }
   }
}
