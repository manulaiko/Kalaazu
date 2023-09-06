package package_430
{
   import away3d.animators.class_2403;
   import away3d.arcane;
   import flash.geom.Vector3D;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_386.class_2238;
   import package_386.class_2575;
   import package_431.class_2737;
   
   public class class_2755 extends class_2401
   {
       
      
      private var var_2685:Vector3D;
      
      private var var_71:Vector3D;
      
      private var var_1248:Vector.<Vector3D>;
      
      private var var_865:int;
      
      private var var_924:Vector.<Number>;
      
      public function class_2755(param1:class_2403, param2:class_2737)
      {
         super(param1,param2);
         this.var_2685 = param2.arcane::var_2685;
         this.var_71 = param2.arcane::var_71;
         this.var_1248 = param2.arcane::var_2368;
         this.var_865 = param2.arcane::var_865;
         this.method_2316();
      }
      
      public function get startScale() : Vector3D
      {
         return this.var_2685;
      }
      
      public function set startScale(param1:Vector3D) : void
      {
         this.var_2685 = param1;
         this.method_2316();
      }
      
      public function get endScale() : Vector3D
      {
         return this.var_71;
      }
      
      public function set endScale(param1:Vector3D) : void
      {
         this.var_71 = param1;
         this.method_2316();
      }
      
      public function get method_2422() : int
      {
         return this.var_865;
      }
      
      public function get segmentPoints() : Vector.<Vector3D>
      {
         return this.var_1248;
      }
      
      public function set segmentPoints(param1:Vector.<Vector3D>) : void
      {
         this.var_1248 = param1;
         this.method_2316();
      }
      
      override public function setRenderState(param1:class_1208, param2:class_2133, param3:class_2575, param4:class_2238, param5:class_1767) : void
      {
         param4.method_2855(param4.method_2879(var_3560,class_2737.arcane::const_2910),this.var_924);
      }
      
      private function method_2316() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Vector.<Number> = new Vector.<Number>();
         this.var_924 = new Vector.<Number>();
         _loc2_ = 0;
         while(_loc2_ < this.var_865)
         {
            if(_loc2_ == 0)
            {
               _loc1_.push(this.var_1248[_loc2_].w);
            }
            else
            {
               _loc1_.push(Number(this.var_1248[_loc2_].w) - Number(this.var_1248[_loc2_ - 1].w));
            }
            _loc2_++;
         }
         if(this.var_865 == 0)
         {
            _loc1_.push(1);
         }
         else
         {
            _loc1_.push(1 - Number(this.var_1248[_loc2_ - 1].w));
         }
         this.var_924.push(this.var_2685.x,this.var_2685.y,this.var_2685.z,0);
         _loc2_ = 0;
         while(_loc2_ < this.var_865)
         {
            if(_loc2_ == 0)
            {
               this.var_924.push((Number(this.var_1248[_loc2_].x) - Number(this.var_2685.x)) / _loc1_[_loc2_],(Number(this.var_1248[_loc2_].y) - Number(this.var_2685.y)) / _loc1_[_loc2_],(Number(this.var_1248[_loc2_].z) - Number(this.var_2685.z)) / _loc1_[_loc2_],_loc1_[_loc2_]);
            }
            else
            {
               this.var_924.push((Number(this.var_1248[_loc2_].x) - Number(this.var_1248[_loc2_ - 1].x)) / _loc1_[_loc2_],(Number(this.var_1248[_loc2_].y) - Number(this.var_1248[_loc2_ - 1].y)) / _loc1_[_loc2_],(Number(this.var_1248[_loc2_].z) - Number(this.var_1248[_loc2_ - 1].z)) / _loc1_[_loc2_],_loc1_[_loc2_]);
            }
            _loc2_++;
         }
         if(this.var_865 == 0)
         {
            this.var_924.push(Number(this.var_71.x) - Number(this.var_2685.x),Number(this.var_71.y) - Number(this.var_2685.y),Number(this.var_71.z) - Number(this.var_2685.z),1);
         }
         else
         {
            this.var_924.push((Number(this.var_71.x) - Number(this.var_1248[_loc2_ - 1].x)) / _loc1_[_loc2_],(Number(this.var_71.y) - Number(this.var_1248[_loc2_ - 1].y)) / _loc1_[_loc2_],(Number(this.var_71.z) - Number(this.var_1248[_loc2_ - 1].z)) / _loc1_[_loc2_],_loc1_[_loc2_]);
         }
      }
   }
}
