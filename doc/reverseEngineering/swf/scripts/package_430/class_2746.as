package package_430
{
   import away3d.animators.class_2403;
   import away3d.arcane;
   import flash.geom.Matrix3D;
   import flash.geom.Orientation3D;
   import flash.geom.Vector3D;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_371.class_2125;
   import package_371.class_2127;
   import package_386.class_2238;
   import package_386.class_2575;
   import package_431.class_2722;
   
   public class class_2746 extends class_2401
   {
       
      
      private var _matrix:Matrix3D;
      
      private var var_2103:Vector3D;
      
      public function class_2746(param1:class_2403, param2:class_2722)
      {
         this._matrix = new Matrix3D();
         super(param1,param2);
         this.method_5298 = param2.arcane::var_2103;
      }
      
      override public function setRenderState(param1:class_1208, param2:class_2133, param3:class_2575, param4:class_2238, param5:class_1767) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(this.var_2103)
         {
            _loc7_ = param2.sceneTransform.position;
            (_loc9_ = (_loc8_ = param5.sceneTransform.position.subtract(_loc7_)).crossProduct(this.var_2103)).normalize();
            (_loc8_ = this.var_2103.crossProduct(_loc9_)).normalize();
            this._matrix.copyFrom(param2.sceneTransform);
            _loc6_ = class_2125.decompose(this._matrix,Orientation3D.AXIS_ANGLE);
            this._matrix.copyColumnFrom(0,_loc9_);
            this._matrix.copyColumnFrom(1,this.var_2103);
            this._matrix.copyColumnFrom(2,_loc8_);
            this._matrix.copyColumnFrom(3,_loc7_);
            this._matrix.appendRotation(-_loc6_[1].w * 0,_loc6_[1]);
         }
         else
         {
            this._matrix.copyFrom(param2.sceneTransform);
            this._matrix.append(param5.method_2908);
            _loc6_ = class_2125.decompose(this._matrix,Orientation3D.AXIS_ANGLE);
            this._matrix.identity();
            this._matrix.appendRotation(-_loc6_[1].w * 0,_loc6_[1]);
         }
         param4.method_1255(param4.method_2879(var_3560,class_2722.arcane::const_947),this._matrix);
      }
      
      public function get method_5298() : Vector3D
      {
         return this.var_2103;
      }
      
      public function set method_5298(param1:Vector3D) : void
      {
         this.var_2103 = !!param1 ? param1.clone() : null;
         if(this.var_2103)
         {
            this.var_2103.normalize();
         }
      }
   }
}
