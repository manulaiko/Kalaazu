package package_284
{
   import package_283.class_1725;
   
   public class class_1728 extends class_1712 implements class_1725
   {
       
      
      private var _distance:Number = 4;
      
      private var _angle:Number = 45;
      
      public function class_1728(param1:Number = 4, param2:Number = 45, param3:uint = 0, param4:Number = 1, param5:Number = 4, param6:Number = 4, param7:Number = 1)
      {
         this._angle = param2;
         this._distance = param1;
         super(param3,param4,param5,param6,param7);
         this.method_2413();
      }
      
      private function method_2413() : void
      {
         offsetX = Math.cos(this._angle) * Number(this._distance);
         offsetY = Math.sin(this._angle) * Number(this._distance);
      }
      
      public function get distance() : Number
      {
         return this._distance;
      }
      
      public function set distance(param1:Number) : void
      {
         this._distance = param1;
         this.method_2413();
      }
      
      public function get angle() : Number
      {
         return this._angle;
      }
      
      public function set angle(param1:Number) : void
      {
         this._angle = param1;
         this.method_2413();
      }
   }
}
