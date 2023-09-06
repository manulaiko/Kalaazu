package package_459
{
   import flash.geom.ColorTransform;
   import flash.utils.Dictionary;
   
   public class class_2551
   {
       
      
      public var color:uint = 4294967295;
      
      private var _colorTransform:ColorTransform = null;
      
      private var var_3444:uint;
      
      public var scale:Number = 1;
      
      public var var_5033:Number = 1;
      
      public var var_386:Number = 1;
      
      public var image = null;
      
      public var lifetime:Number = 0;
      
      public var var_4875:Number = 0;
      
      public var var_3170:Number = 1;
      
      public var var_3064:Boolean = false;
      
      private var var_1977:Dictionary = null;
      
      public function class_2551()
      {
         super();
      }
      
      public function get method_3085() : Dictionary
      {
         if(this.var_1977 == null)
         {
            this.var_1977 = new Dictionary(true);
         }
         return this.var_1977;
      }
      
      public function initialize() : void
      {
         this.color = 4294967295;
         this.scale = 1;
         this.var_5033 = 1;
         this.var_386 = 1;
         this.lifetime = 0;
         this.var_4875 = 0;
         this.var_3170 = 1;
         this.var_3064 = false;
         this.image = null;
         this.var_1977 = null;
         this._colorTransform = null;
      }
      
      public function get colorTransform() : ColorTransform
      {
         if(!this._colorTransform || this.var_3444 != this.color)
         {
            this._colorTransform = new ColorTransform((Number(this.color) >>> 16 & 255) / 255,(Number(this.color) >>> 8 & 255) / 255,(Number(this.color) & 255) / 255,(Number(this.color) >>> 24 & 255) / 255,0,0,0,0);
            this.var_3444 = this.color;
         }
         return this._colorTransform;
      }
      
      public function get alpha() : Number
      {
         return ((Number(this.color) & 4278190080) >>> 24) / 255;
      }
      
      protected function method_2154(param1:class_2551) : class_2551
      {
         var _loc2_:* = null;
         param1.color = this.color;
         param1.scale = this.scale;
         param1.var_5033 = this.var_5033;
         param1.var_386 = this.var_386;
         param1.lifetime = this.lifetime;
         param1.var_4875 = this.var_4875;
         param1.var_3170 = this.var_3170;
         param1.var_3064 = this.var_3064;
         param1.image = this.image;
         if(this.var_1977)
         {
            param1.var_1977 = new Dictionary(true);
            for(_loc2_ in this.var_1977)
            {
               param1.var_1977[_loc2_] = this.var_1977[_loc2_];
            }
         }
         return param1;
      }
      
      public function clone(param1:class_2559 = null) : class_2551
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = param1.method_1095();
         }
         else
         {
            _loc2_ = new class_2551();
         }
         return this.method_2154(_loc2_);
      }
      
      public function method_3781() : void
      {
         this.lifetime = 0;
         this.var_4875 = 0;
         this.var_3170 = 1;
         this.var_3064 = false;
      }
   }
}
