package mx.managers
{
   public interface IFocusManagerComplexComponent extends IFocusManagerComponent
   {
       
      
      function get hasFocusableContent() : Boolean;
      
      function assignFocus(param1:String) : void;
   }
}
