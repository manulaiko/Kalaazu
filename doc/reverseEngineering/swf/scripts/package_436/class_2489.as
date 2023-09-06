package package_436
{
   import away3d.arcane;
   import flash.geom.Vector3D;
   import package_304.SegmentSet;
   import package_374.AbstractMethodError;
   import package_383.class_2226;
   import package_463.class_2588;
   
   public class class_2489 extends SegmentSet
   {
       
      
      private var var_2543:Boolean = true;
      
      private var _color:uint;
      
      private var var_125:Number;
      
      public function class_2489(param1:uint = 16777215, param2:Number = 1)
      {
         super();
         if(param2 <= 0)
         {
            param2 = 1;
         }
         this._color = param1;
         this.var_125 = param2;
         mouseChildren = false;
         mouseEnabled = false;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(param1:uint) : void
      {
         var _loc2_:* = null;
         this._color = param1;
         for each(_loc2_ in _segments)
         {
            _loc2_.segment.startColor = _loc2_.segment.endColor = param1;
         }
      }
      
      public function get thickness() : Number
      {
         return this.var_125;
      }
      
      public function set thickness(param1:Number) : void
      {
         var _loc2_:* = null;
         this.var_125 = param1;
         for each(_loc2_ in _segments)
         {
            _loc2_.segment.thickness = _loc2_.segment.thickness = param1;
         }
      }
      
      override public function method_682() : void
      {
         super.method_682();
      }
      
      override public function get bounds() : class_2226
      {
         if(this.var_2543)
         {
            this.method_3934();
         }
         return super.bounds;
      }
      
      protected function method_389() : void
      {
         throw new AbstractMethodError();
      }
      
      protected function method_2121() : void
      {
         this.var_2543 = true;
         method_1513();
      }
      
      private function method_3934() : void
      {
         this.method_389();
         this.var_2543 = false;
      }
      
      protected function method_3280(param1:uint, param2:Vector3D, param3:Vector3D) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if((_loc4_ = method_2011(param1)) != null)
         {
            _loc5_ = _loc4_.start;
            _loc6_ = _loc4_.end;
            _loc5_.x = param2.x;
            _loc5_.y = param2.y;
            _loc5_.z = param2.z;
            _loc6_.x = param3.x;
            _loc6_.y = param3.y;
            _loc6_.z = param3.z;
            _loc4_.method_6253(_loc5_,_loc6_,null,this._color,this._color,this.var_125);
         }
         else
         {
            method_2411(new LineSegment(param2.clone(),param3.clone(),this._color,this._color,this.var_125));
         }
      }
      
      override protected function method_434() : void
      {
         arcane::var_3982 = false;
      }
   }
}
