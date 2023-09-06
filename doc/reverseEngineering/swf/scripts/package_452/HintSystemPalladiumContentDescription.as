package package_452
{
   import package_392.class_2266;
   import package_448.class_2514;
   
   public class HintSystemPalladiumContentDescription extends class_2266
   {
      
      private static const const_40:String = "HintSystemPalladiumContentDescription";
       
      
      public function HintSystemPalladiumContentDescription(param1:String)
      {
         super(param1);
      }
      
      override public function method_3751(param1:String = "default") : String
      {
         return const_40;
      }
      
      override public function get content() : class_2514
      {
         if(_content == null)
         {
            _title = "targeted_hintwindow_title_palladium";
            _message = "targeted_hintwindow_message_palladium";
            _content = method_3960();
         }
         return _content;
      }
      
      override public function get method_108() : int
      {
         return 1000;
      }
   }
}
