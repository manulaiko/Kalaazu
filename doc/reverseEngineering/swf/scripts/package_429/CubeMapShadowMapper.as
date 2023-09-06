package package_429
{
   import away3d.arcane;
   import flash.display3D.textures.TextureBase;
   import flash.geom.Vector3D;
   import package_295.class_2128;
   import package_299.class_1758;
   import package_300.class_2152;
   import package_305.class_1767;
   import package_364.PointLight;
   import package_369.class_2115;
   import package_369.class_2574;
   
   public class CubeMapShadowMapper extends class_2393
   {
       
      
      private var var_1178:Vector.<class_1767>;
      
      private var var_3577:Vector.<class_1758>;
      
      private var var_597:Vector.<Boolean>;
      
      public function CubeMapShadowMapper()
      {
         super();
         var_3256 = 512;
         this.var_597 = new Vector.<Boolean>(6,true);
         this.method_2758();
      }
      
      private function method_2758() : void
      {
         this.var_1178 = new Vector.<class_1767>();
         this.var_3577 = new Vector.<class_1758>();
         this.method_159(0,90,0);
         this.method_159(0,-90,0);
         this.method_159(-90,0,0);
         this.method_159(90,0,0);
         this.method_159(0,0,0);
         this.method_159(0,180,0);
      }
      
      private function method_159(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc4_:class_1767;
         (_loc4_ = new class_1767()).rotationX = param1;
         _loc4_.rotationY = param2;
         _loc4_.rotationZ = param3;
         _loc4_.lens.method_5049 = 0.01;
         class_1758(_loc4_.lens).fieldOfView = 90;
         this.var_3577.push(class_1758(_loc4_.lens));
         _loc4_.lens.arcane::aspectRatio = 1;
         this.var_1178.push(_loc4_);
      }
      
      override protected function method_571() : class_2115
      {
         return new class_2574(var_3256);
      }
      
      override protected function method_873(param1:class_1767) : void
      {
         var _loc2_:Number = Number(PointLight(_light).arcane::_fallOff);
         var _loc3_:Vector3D = _light.method_3037;
         var _loc4_:Number = 0;
         while(_loc4_ < 6)
         {
            this.var_3577[_loc4_].method_1840 = _loc2_;
            this.var_1178[_loc4_].position = _loc3_;
            this.var_597[_loc4_] = true;
            _loc4_++;
         }
      }
      
      override protected function method_2669(param1:TextureBase, param2:class_2128, param3:class_2152) : void
      {
         var _loc4_:Number = 0;
         while(_loc4_ < 6)
         {
            if(this.var_597[_loc4_])
            {
               var_3449.camera = this.var_1178[_loc4_];
               var_3449.clear();
               param2.method_2653(var_3449);
               param3.arcane::render(var_3449,param1,null,_loc4_);
               var_3449.method_1140();
            }
            _loc4_++;
         }
      }
   }
}
