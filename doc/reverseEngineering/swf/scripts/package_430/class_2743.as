package package_430
{
   import away3d.animators.class_2403;
   import away3d.arcane;
   import flash.geom.ColorTransform;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_386.class_2238;
   import package_386.class_2575;
   import package_386.class_2717;
   import package_431.class_2718;
   
   public class class_2743 extends class_2401
   {
       
      
      private var var_291:Boolean;
      
      private var var_456:Boolean;
      
      private var var_2288:ColorTransform;
      
      private var var_148:ColorTransform;
      
      private var var_1248:Vector.<class_2717>;
      
      private var var_865:int;
      
      private var var_4004:Vector.<Number>;
      
      private var var_2571:Vector.<Number>;
      
      private var var_810:Vector.<Number>;
      
      public function class_2743(param1:class_2403, param2:class_2718)
      {
         super(param1,param2);
         this.var_291 = param2.arcane::var_291;
         this.var_456 = param2.arcane::var_456;
         this.var_2288 = param2.arcane::var_2288;
         this.var_148 = param2.arcane::var_148;
         this.var_1248 = param2.arcane::var_1248;
         this.var_865 = param2.arcane::var_865;
         this.method_985();
      }
      
      public function get startColor() : ColorTransform
      {
         return this.var_2288;
      }
      
      public function set startColor(param1:ColorTransform) : void
      {
         this.var_2288 = param1;
         this.method_985();
      }
      
      public function get endColor() : ColorTransform
      {
         return this.var_148;
      }
      
      public function set endColor(param1:ColorTransform) : void
      {
         this.var_148 = param1;
         this.method_985();
      }
      
      public function get method_2422() : int
      {
         return this.var_865;
      }
      
      public function get segmentPoints() : Vector.<class_2717>
      {
         return this.var_1248;
      }
      
      public function set segmentPoints(param1:Vector.<class_2717>) : void
      {
         this.var_1248 = param1;
         this.method_985();
      }
      
      public function get usesMultiplier() : Boolean
      {
         return this.var_291;
      }
      
      public function get usesOffset() : Boolean
      {
         return this.var_456;
      }
      
      override public function setRenderState(param1:class_1208, param2:class_2133, param3:class_2575, param4:class_2238, param5:class_1767) : void
      {
         if(param4.name_132)
         {
            if(this.var_865 > 0)
            {
               param4.method_5167(param4.method_2879(var_3560,class_2718.arcane::const_2163),this.var_4004[0],this.var_4004[1],this.var_4004[2],this.var_4004[3]);
            }
            if(this.var_291)
            {
               param4.method_2855(param4.method_2879(var_3560,class_2718.arcane::const_1461),this.var_2571);
            }
            if(this.var_456)
            {
               param4.method_2855(param4.method_2879(var_3560,class_2718.arcane::const_1300),this.var_810);
            }
         }
      }
      
      private function method_985() : void
      {
         var _loc1_:int = 0;
         this.var_4004 = new Vector.<Number>();
         this.var_2571 = new Vector.<Number>();
         this.var_810 = new Vector.<Number>();
         _loc1_ = 0;
         while(_loc1_ < this.var_865)
         {
            if(_loc1_ == 0)
            {
               this.var_4004.push(this.var_1248[_loc1_].life);
            }
            else
            {
               this.var_4004.push(Number(this.var_1248[_loc1_].life) - Number(this.var_1248[_loc1_ - 1].life));
            }
            _loc1_++;
         }
         if(this.var_865 == 0)
         {
            this.var_4004.push(1);
         }
         else
         {
            this.var_4004.push(1 - Number(this.var_1248[_loc1_ - 1].life));
         }
         if(this.var_291)
         {
            this.var_2571.push(this.var_2288.redMultiplier,this.var_2288.greenMultiplier,this.var_2288.blueMultiplier,this.var_2288.alphaMultiplier);
            _loc1_ = 0;
            while(_loc1_ < this.var_865)
            {
               if(_loc1_ == 0)
               {
                  this.var_2571.push((Number(this.var_1248[_loc1_].color.redMultiplier) - Number(this.var_2288.redMultiplier)) / Number(this.var_4004[_loc1_]),(Number(this.var_1248[_loc1_].color.greenMultiplier) - Number(this.var_2288.greenMultiplier)) / Number(this.var_4004[_loc1_]),(Number(this.var_1248[_loc1_].color.blueMultiplier) - Number(this.var_2288.blueMultiplier)) / Number(this.var_4004[_loc1_]),(Number(this.var_1248[_loc1_].color.alphaMultiplier) - Number(this.var_2288.alphaMultiplier)) / Number(this.var_4004[_loc1_]));
               }
               else
               {
                  this.var_2571.push((Number(this.var_1248[_loc1_].color.redMultiplier) - Number(this.var_1248[_loc1_ - 1].color.redMultiplier)) / Number(this.var_4004[_loc1_]),(Number(this.var_1248[_loc1_].color.greenMultiplier) - Number(this.var_1248[_loc1_ - 1].color.greenMultiplier)) / Number(this.var_4004[_loc1_]),(Number(this.var_1248[_loc1_].color.blueMultiplier) - Number(this.var_1248[_loc1_ - 1].color.blueMultiplier)) / Number(this.var_4004[_loc1_]),(Number(this.var_1248[_loc1_].color.alphaMultiplier) - Number(this.var_1248[_loc1_ - 1].color.alphaMultiplier)) / Number(this.var_4004[_loc1_]));
               }
               _loc1_++;
            }
            if(this.var_865 == 0)
            {
               this.var_2571.push(Number(this.var_148.redMultiplier) - Number(this.var_2288.redMultiplier),Number(this.var_148.greenMultiplier) - Number(this.var_2288.greenMultiplier),Number(this.var_148.blueMultiplier) - Number(this.var_2288.blueMultiplier),Number(this.var_148.alphaMultiplier) - Number(this.var_2288.alphaMultiplier));
            }
            else
            {
               this.var_2571.push((Number(this.var_148.redMultiplier) - Number(this.var_1248[_loc1_ - 1].color.redMultiplier)) / Number(this.var_4004[_loc1_]),(Number(this.var_148.greenMultiplier) - Number(this.var_1248[_loc1_ - 1].color.greenMultiplier)) / Number(this.var_4004[_loc1_]),(Number(this.var_148.blueMultiplier) - Number(this.var_1248[_loc1_ - 1].color.blueMultiplier)) / Number(this.var_4004[_loc1_]),(Number(this.var_148.alphaMultiplier) - Number(this.var_1248[_loc1_ - 1].color.alphaMultiplier)) / Number(this.var_4004[_loc1_]));
            }
         }
         if(this.var_456)
         {
            this.var_810.push(Number(this.var_2288.redOffset) / 255,Number(this.var_2288.greenOffset) / 255,Number(this.var_2288.blueOffset) / 255,Number(this.var_2288.alphaOffset) / 255);
            _loc1_ = 0;
            while(_loc1_ < this.var_865)
            {
               if(_loc1_ == 0)
               {
                  this.var_810.push((Number(this.var_1248[_loc1_].color.redOffset) - Number(this.var_2288.redOffset)) / Number(this.var_4004[_loc1_]) / 255,(Number(this.var_1248[_loc1_].color.greenOffset) - Number(this.var_2288.greenOffset)) / Number(this.var_4004[_loc1_]) / 255,(Number(this.var_1248[_loc1_].color.blueOffset) - Number(this.var_2288.blueOffset)) / Number(this.var_4004[_loc1_]) / 255,(Number(this.var_1248[_loc1_].color.alphaOffset) - Number(this.var_2288.alphaOffset)) / Number(this.var_4004[_loc1_]) / 255);
               }
               else
               {
                  this.var_810.push((Number(this.var_1248[_loc1_].color.redOffset) - Number(this.var_1248[_loc1_ - 1].color.redOffset)) / Number(this.var_4004[_loc1_]) / 255,(Number(this.var_1248[_loc1_].color.greenOffset) - Number(this.var_1248[_loc1_ - 1].color.greenOffset)) / Number(this.var_4004[_loc1_]) / 255,(Number(this.var_1248[_loc1_].color.blueOffset) - Number(this.var_1248[_loc1_ - 1].color.blueOffset)) / Number(this.var_4004[_loc1_]) / 255,(Number(this.var_1248[_loc1_].color.alphaOffset) - Number(this.var_1248[_loc1_ - 1].color.alphaOffset)) / Number(this.var_4004[_loc1_]) / 255);
               }
               _loc1_++;
            }
            if(this.var_865 == 0)
            {
               this.var_810.push((Number(this.var_148.redOffset) - Number(this.var_2288.redOffset)) / 255,(Number(this.var_148.greenOffset) - Number(this.var_2288.greenOffset)) / 255,(Number(this.var_148.blueOffset) - Number(this.var_2288.blueOffset)) / 255,(Number(this.var_148.alphaOffset) - Number(this.var_2288.alphaOffset)) / 255);
            }
            else
            {
               this.var_810.push((Number(this.var_148.redOffset) - Number(this.var_1248[_loc1_ - 1].color.redOffset)) / Number(this.var_4004[_loc1_]) / 255,(Number(this.var_148.greenOffset) - Number(this.var_1248[_loc1_ - 1].color.greenOffset)) / Number(this.var_4004[_loc1_]) / 255,(Number(this.var_148.blueOffset) - Number(this.var_1248[_loc1_ - 1].color.blueOffset)) / Number(this.var_4004[_loc1_]) / 255,(Number(this.var_148.alphaOffset) - Number(this.var_1248[_loc1_ - 1].color.alphaOffset)) / Number(this.var_4004[_loc1_]) / 255);
            }
         }
         this.var_4004.length = 4;
      }
   }
}
