package
{
   import mx.resources.ResourceBundle;
   
   public class en_US$effects_properties extends ResourceBundle
   {
       
      
      public function en_US$effects_properties()
      {
         super("en_US","effects");
      }
      
      override protected function getContent() : Object
      {
         return {
            "incorrectSource":"Source property must be a Class or String.",
            "incorrectTrigger":"The Zoom effect can not be triggered by a moveEffect trigger."
         };
      }
   }
}
