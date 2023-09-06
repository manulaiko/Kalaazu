package package_479
{
   import away3d.arcane;
   import package_294.class_2429;
   import package_436.SphereGeometry;
   import package_466.class_2598;
   
   public class SphereShapeSubParser extends class_2692
   {
       
      
      private var name_69:SphereGeometry;
      
      public function SphereShapeSubParser()
      {
         super();
         this.name_69 = new SphereGeometry(10,8,8);
      }
      
      public static function get identifier() : *
      {
         return class_2598.SphereShapeSubParser;
      }
      
      override public function method_3173() : class_2429
      {
         return this.name_69;
      }
      
      override protected function method_196() : Boolean
      {
         if(var_117)
         {
            this.name_69.radius = _data.radius;
            this.name_69.segmentsW = _data.segmentsW;
            this.name_69.segmentsH = _data.segmentsH;
         }
         return super.method_196();
      }
   }
}
