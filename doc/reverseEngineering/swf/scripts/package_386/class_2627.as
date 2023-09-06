package package_386
{
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import package_371.class_2451;
   
   public class class_2627
   {
       
      
      public var name:String;
      
      public var orientation:class_2451;
      
      public var var_2277:Vector3D;
      
      public function class_2627()
      {
         this.orientation = new class_2451();
         this.var_2277 = new Vector3D();
         super();
      }
      
      public function toMatrix3D(param1:Matrix3D = null) : Matrix3D
      {
         param1 = param1 || new Matrix3D();
         this.orientation.toMatrix3D(param1);
         param1.appendTranslation(this.var_2277.x,this.var_2277.y,this.var_2277.z);
         return param1;
      }
      
      public function copyFrom(param1:class_2627) : void
      {
         var _loc2_:class_2451 = param1.orientation;
         var _loc3_:Vector3D = param1.var_2277;
         this.orientation.x = _loc2_.x;
         this.orientation.y = _loc2_.y;
         this.orientation.z = _loc2_.z;
         this.orientation.w = _loc2_.w;
         this.var_2277.x = _loc3_.x;
         this.var_2277.y = _loc3_.y;
         this.var_2277.z = _loc3_.z;
      }
   }
}
