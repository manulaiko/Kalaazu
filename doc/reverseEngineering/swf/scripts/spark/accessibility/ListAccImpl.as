package spark.accessibility
{
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import spark.components.List;
   
   public class ListAccImpl extends ListBaseAccImpl
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function ListAccImpl(param1:UIComponent)
      {
         super(param1);
      }
      
      public static function enableAccessibility() : void
      {
         List.mx_internal::createAccessibilityImplementation = mx_internal::createAccessibilityImplementation;
      }
      
      mx_internal static function createAccessibilityImplementation(param1:UIComponent) : void
      {
         param1.accessibilityImplementation = new ListAccImpl(param1);
      }
   }
}
