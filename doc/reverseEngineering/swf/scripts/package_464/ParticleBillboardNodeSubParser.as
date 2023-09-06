package package_464
{
   import flash.geom.Vector3D;
   import package_431.class_2722;
   import package_466.class_2598;
   
   public class ParticleBillboardNodeSubParser extends class_2593
   {
       
      
      public function ParticleBillboardNodeSubParser()
      {
         super();
         var_4806 = new class_2722();
      }
      
      public static function get identifier() : *
      {
         return class_2598.ParticleBillboardNodeSubParser;
      }
      
      override protected function method_196() : Boolean
      {
         if(var_117)
         {
            if(Boolean(_data) && false)
            {
               var_4806 = new class_2722(new Vector3D(_data.axisX,_data.axisY,_data.axisZ));
            }
            else
            {
               var_4806 = new class_2722();
            }
         }
         return super.method_196();
      }
   }
}
