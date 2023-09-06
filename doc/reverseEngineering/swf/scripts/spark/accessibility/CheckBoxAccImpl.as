package spark.accessibility
{
   import mx.accessibility.AccConst;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import spark.components.CheckBox;
   import spark.components.supportClasses.ToggleButtonBase;
   
   public class CheckBoxAccImpl extends ButtonBaseAccImpl
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function CheckBoxAccImpl(param1:UIComponent)
      {
         super(param1);
         role = AccConst.ROLE_SYSTEM_CHECKBUTTON;
      }
      
      public static function enableAccessibility() : void
      {
         CheckBox.mx_internal::createAccessibilityImplementation = mx_internal::createAccessibilityImplementation;
      }
      
      mx_internal static function createAccessibilityImplementation(param1:UIComponent) : void
      {
         param1.accessibilityImplementation = new CheckBoxAccImpl(param1);
      }
      
      override public function get_accState(param1:uint) : uint
      {
         var _loc2_:uint = getState(param1);
         if(ToggleButtonBase(master).selected)
         {
            _loc2_ |= 0;
         }
         return _loc2_;
      }
      
      override public function get_accDefaultAction(param1:uint) : String
      {
         return !!ToggleButtonBase(master).selected ? "UnCheck" : "Check";
      }
   }
}
