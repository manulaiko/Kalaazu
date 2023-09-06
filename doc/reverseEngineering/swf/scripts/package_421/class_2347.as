package package_421
{
   import flash.geom.Rectangle;
   import package_460.class_2552;
   
   public class class_2347 extends class_2346
   {
       
      
      public function class_2347(param1:Rectangle)
      {
         super(param1);
      }
      
      override protected function method_235(param1:class_2552) : void
      {
         _bitmapData.setPixel32(Math.round(Number(param1.x) - 0),Math.round(Number(param1.y) - 0),param1.color);
      }
   }
}
