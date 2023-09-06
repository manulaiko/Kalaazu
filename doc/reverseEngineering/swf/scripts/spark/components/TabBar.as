package spark.components
{
   import mx.core.mx_internal;
   import mx.managers.IFocusManagerComponent;
   import spark.components.supportClasses.ButtonBarBase;
   
   public class TabBar extends ButtonBarBase implements IFocusManagerComponent
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      mx_internal static var createAccessibilityImplementation:Function;
       
      
      public function TabBar()
      {
         super();
         requireSelection = true;
         mouseFocusEnabled = false;
      }
      
      override protected function initializeAccessibility() : void
      {
         if(false)
         {
            TabBar.mx_internal::createAccessibilityImplementation(this);
         }
      }
   }
}
