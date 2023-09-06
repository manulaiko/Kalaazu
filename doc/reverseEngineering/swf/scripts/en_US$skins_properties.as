package
{
   import mx.resources.ResourceBundle;
   
   public class en_US$skins_properties extends ResourceBundle
   {
       
      
      public function en_US$skins_properties()
      {
         super("en_US","skins");
      }
      
      override protected function getContent() : Object
      {
         return {"notLoaded":"Unable to load \'{0}\'."};
      }
   }
}
