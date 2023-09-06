package package_492
{
   import flash.geom.Matrix;
   import package_386.class_2580;
   import package_465.class_2594;
   
   public class class_2745 extends class_2594
   {
       
      
      private var _numColumns:int;
      
      private var var_2462:int;
      
      private var var_2415:class_2594;
      
      public function class_2745(param1:String, param2:int, param3:int, param4:class_2594)
      {
         super(param1);
         this._numColumns = param2;
         this.var_2462 = param3;
         this.var_2415 = param4;
      }
      
      override public function method_1777(param1:class_2580) : void
      {
         param1[var_78] = this.generateOneValue(param1.index,param1.total);
      }
      
      override public function generateOneValue(param1:int = 0, param2:int = 1) : *
      {
         var _loc3_:Matrix = new Matrix();
         _loc3_.scale(1 / Number(this._numColumns),1 / Number(this.var_2462));
         var _loc4_:int;
         var _loc5_:int = (_loc4_ = this.var_2415.generateOneValue(param1,param2) % (Number(this._numColumns) * Number(this.var_2462))) / Number(this._numColumns);
         var _loc6_:int = _loc4_ % Number(this._numColumns);
         _loc3_.translate(_loc6_ / Number(this._numColumns),_loc5_ / Number(this.var_2462));
         return _loc3_;
      }
      
      override public function method_5590(param1:class_2580) : void
      {
         this.var_2415.method_5590(param1);
      }
      
      override public function method_3724(param1:class_2580) : void
      {
         this.var_2415.method_3724(param1);
      }
   }
}
