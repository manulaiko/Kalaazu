package package_386
{
   import flash.geom.ColorTransform;
   
   public class class_2717
   {
       
      
      private var _color:ColorTransform;
      
      private var var_4805:Number;
      
      public function class_2717(param1:Number, param2:ColorTransform)
      {
         super();
         if(param1 <= 0 || param1 >= 1)
         {
            throw new Error("life exceeds range (0,1)");
         }
         this.var_4805 = param1;
         this._color = param2;
      }
      
      public function get color() : ColorTransform
      {
         return this._color;
      }
      
      public function get life() : Number
      {
         return this.var_4805;
      }
   }
}
