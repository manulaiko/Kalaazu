package package_386
{
   import away3d.animators.class_2403;
   import flash.geom.Vector3D;
   import package_304.class_2114;
   
   public class class_2408
   {
      
      private static const const_1579:Vector3D = new Vector3D();
      
      private static const const_438:Vector3D = new Vector3D(1,1,1);
       
      
      private var _position:Vector3D;
      
      private var _rotation:Vector3D;
      
      private var _scale:Vector3D;
      
      private var var_2546:Number;
      
      private var var_3531:Number;
      
      public function class_2408(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Number, param5:Number)
      {
         super();
         this._position = !!param1 ? param1 : const_1579;
         this._rotation = !!param2 ? param2 : const_1579;
         this._scale = !!param3 ? param3 : const_438;
         this.var_3531 = param4;
         this.var_2546 = param5;
      }
      
      public function get timeOffset() : Number
      {
         return this.var_3531;
      }
      
      public function apply(param1:class_2114) : void
      {
         param1.position = this._position.clone();
         param1.eulers = this._rotation.clone();
         param1.scaleX = this._scale.x;
         param1.scaleY = this._scale.y;
         param1.scaleZ = this._scale.z;
         class_2403(param1.animator).playbackSpeed = this.var_2546;
      }
   }
}
