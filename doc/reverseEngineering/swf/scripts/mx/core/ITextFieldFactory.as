package mx.core
{
   import flash.text.TextField;
   
   public interface ITextFieldFactory
   {
       
      
      function createTextField(param1:IFlexModuleFactory) : TextField;
      
      function createFTETextField(param1:IFlexModuleFactory) : Object;
   }
}
