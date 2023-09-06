package package_430
{
   import away3d.animators.class_2403;
   import away3d.arcane;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_386.class_2238;
   import package_386.class_2575;
   import package_386.class_2578;
   import package_431.class_2739;
   
   public class class_2756 extends class_2401
   {
       
      
      private var var_2672:class_2739;
      
      private var var_4442:Vector3D;
      
      private var var_2574:Vector3D;
      
      public function class_2756(param1:class_2403, param2:class_2739)
      {
         super(param1,param2);
         this.var_2672 = param2;
         this.var_2574 = this.var_2672.arcane::var_2574;
         this.method_4541();
      }
      
      public function get method_3370() : Vector3D
      {
         return this.var_2574;
      }
      
      public function set method_3370(param1:Vector3D) : void
      {
         this.var_2574 = param1;
         this.method_4541();
      }
      
      public function method_6381() : Vector.<Vector3D>
      {
         return var_2419;
      }
      
      public function method_590(param1:Vector.<Vector3D>) : void
      {
         var_2419 = param1;
         var_1953 = new Dictionary(true);
      }
      
      override public function setRenderState(param1:class_1208, param2:class_2133, param3:class_2575, param4:class_2238, param5:class_1767) : void
      {
         param2 = param2;
         param5 = param5;
         if(this.var_2672.mode == class_2578.name_117 && true)
         {
            method_1348(param3);
         }
         var _loc6_:int = int(param4.method_2879(var_3560,class_2739.arcane::const_1898));
         if(this.var_2672.mode == class_2578.name_100)
         {
            param4.method_5167(_loc6_,this.var_4442.x,this.var_4442.y,this.var_4442.z,this.var_4442.w);
         }
         else
         {
            param3.method_748(_loc6_,this.var_2672.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_4);
         }
      }
      
      private function method_4541() : void
      {
         var _loc1_:* = null;
         if(this.var_2672.mode == class_2578.name_100)
         {
            if(this.var_2574.w <= 0)
            {
               throw new Error("the cycle duration must greater than zero");
            }
            _loc1_ = this.var_2574.clone();
            if(_loc1_.length <= 0)
            {
               _loc1_.z = 1;
            }
            else
            {
               _loc1_.normalize();
            }
            this.var_4442 = new Vector3D(_loc1_.x,_loc1_.y,_loc1_.z,0 / _loc1_.w);
         }
      }
   }
}
