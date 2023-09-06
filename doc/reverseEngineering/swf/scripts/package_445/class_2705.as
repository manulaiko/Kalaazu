package package_445
{
   import flash.geom.Vector3D;
   import package_304.class_2114;
   
   public class class_2705 extends Vector3D
   {
      
      private static const const_681:Vector.<Number> = new Vector.<Number>(3,true);
       
      
      private var _size:Number = 1;
      
      public function class_2705(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 1)
      {
         super(param1,param2,param3);
         this._size = param4;
      }
      
      public static function method_5906(param1:class_2114) : class_2705
      {
         param1.bounds.method_5132(param1.geometry);
         var _loc2_:Vector3D = param1.bounds.min;
         var _loc3_:Vector3D = param1.bounds.max;
         var _loc4_:class_2705 = new class_2705(_loc2_.x + (_loc3_.x - _loc2_.x) * 0.5,_loc2_.y + (_loc3_.y - _loc2_.y) * 0.5,_loc2_.z + (_loc3_.z - _loc2_.z) * 0.5,Vector3D.distance(_loc3_,_loc2_));
         const_681[0] = _loc4_.x;
         const_681[1] = _loc4_.y;
         const_681[2] = _loc4_.z;
         param1.transform.transformVectors(const_681,const_681);
         _loc4_.x = const_681[0];
         _loc4_.y = const_681[1];
         _loc4_.z = const_681[2];
         return _loc4_;
      }
      
      public function get size() : Number
      {
         return this._size;
      }
   }
}
