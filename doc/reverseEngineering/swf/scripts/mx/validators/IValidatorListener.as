package mx.validators
{
   import mx.events.ValidationResultEvent;
   
   public interface IValidatorListener
   {
       
      
      function get errorString() : String;
      
      function set errorString(param1:String) : void;
      
      function get validationSubField() : String;
      
      function set validationSubField(param1:String) : void;
      
      function validationResultHandler(param1:ValidationResultEvent) : void;
   }
}
