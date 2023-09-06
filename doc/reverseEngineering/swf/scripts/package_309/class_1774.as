package package_309
{
   import away3d.animators.class_2234;
   import away3d.arcane;
   import flash.display.BlendMode;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DBlendFactor;
   import flash.display3D.Context3DCompareMode;
   import flash.display3D.Context3DTriangleFace;
   import flash.display3D.Program3D;
   import flash.display3D.textures.TextureBase;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Matrix3D;
   import flash.geom.Rectangle;
   import package_198.AGALProgram3DCache;
   import package_198.class_1208;
   import package_291.class_1745;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_307.class_1772;
   import package_363.class_2100;
   import package_374.AbstractMethodError;
   import package_386.class_2238;
   
   public class class_1774 extends EventDispatcher
   {
      
      private static var var_3763:Vector.<int> = Vector.<int>([0,0,0,0,0,0,0,0]);
      
      private static var var_4904:Vector.<int> = Vector.<int>([0,0,0,0,0,0,0,0]);
       
      
      protected var var_642:class_1772;
      
      protected var var_1183:class_2234;
      
      arcane var var_768:Vector.<Program3D>;
      
      arcane var var_4423:Vector.<int>;
      
      private var var_665:Vector.<Context3D>;
      
      protected var var_1671:uint;
      
      protected var var_1971:uint;
      
      protected var var_237:uint;
      
      protected var var_47:uint;
      
      protected var var_3673:uint;
      
      protected var _smooth:Boolean = true;
      
      protected var _repeat:Boolean = false;
      
      protected var var_2370:Boolean = true;
      
      protected var var_4718:String = "lessEqual";
      
      protected var var_73:String = "one";
      
      protected var var_2227:String = "zero";
      
      protected var var_3123:Boolean;
      
      private var var_1658:Boolean;
      
      protected var var_1149:class_2100;
      
      protected var var_16:Vector.<String>;
      
      protected var var_2915:Vector.<String>;
      
      protected var var_3471:String = "ft0";
      
      protected var var_3455:String = "back";
      
      private var var_3093:Boolean;
      
      private var var_2448:TextureBase;
      
      private var var_1835:int;
      
      private var var_5020:Boolean;
      
      private var var_2036:Rectangle;
      
      protected var var_3218:Boolean;
      
      protected var var_2395:Boolean;
      
      protected var var_1081:Boolean;
      
      protected var var_1613:String;
      
      protected var var_1302:String;
      
      protected var var_4586:Boolean = true;
      
      public var var_2120:class_2238;
      
      public function class_1774(param1:Boolean = false)
      {
         this.arcane::var_768 = new Vector.<Program3D>(8);
         this.arcane::var_4423 = Vector.<int>([-1,-1,-1,-1,-1,-1,-1,-1]);
         this.var_665 = new Vector.<Context3D>(8);
         this.var_16 = Vector.<String>(["va0"]);
         this.var_2915 = Vector.<String>(["vt0"]);
         super();
         this.var_3093 = param1;
         this.var_1671 = 1;
         this.var_237 = 5;
      }
      
      public function get material() : class_1772
      {
         return this.var_642;
      }
      
      public function set material(param1:class_1772) : void
      {
         this.var_642 = param1;
      }
      
      public function get method_2615() : Boolean
      {
         return this.var_4586;
      }
      
      public function set method_2615(param1:Boolean) : void
      {
         this.var_4586 = param1;
      }
      
      public function get mipmap() : Boolean
      {
         return this.var_2370;
      }
      
      public function set mipmap(param1:Boolean) : void
      {
         if(this.var_2370 == param1)
         {
            return;
         }
         this.var_2370 = param1;
         this.arcane::method_220();
      }
      
      public function get smooth() : Boolean
      {
         return this._smooth;
      }
      
      public function set smooth(param1:Boolean) : void
      {
         if(this._smooth == param1)
         {
            return;
         }
         this._smooth = param1;
         this.arcane::method_220();
      }
      
      public function get repeat() : Boolean
      {
         return this._repeat;
      }
      
      public function set repeat(param1:Boolean) : void
      {
         if(this._repeat == param1)
         {
            return;
         }
         this._repeat = param1;
         this.arcane::method_220();
      }
      
      public function get bothSides() : Boolean
      {
         return this.var_1658;
      }
      
      public function set bothSides(param1:Boolean) : void
      {
         this.var_1658 = param1;
      }
      
      public function get depthCompareMode() : String
      {
         return this.var_4718;
      }
      
      public function set depthCompareMode(param1:String) : void
      {
         this.var_4718 = param1;
      }
      
      public function get animationSet() : class_2234
      {
         return this.var_1183;
      }
      
      public function set animationSet(param1:class_2234) : void
      {
         if(this.var_1183 == param1)
         {
            return;
         }
         this.var_1183 = param1;
         this.arcane::method_220();
      }
      
      public function get method_2502() : Boolean
      {
         return this.var_3093;
      }
      
      public function dispose() : void
      {
         if(this.var_1149)
         {
            this.var_1149.removeEventListener(Event.CHANGE,this.method_120);
         }
         var _loc1_:Number = 0;
         while(_loc1_ < 8)
         {
            if(this.arcane::var_768[_loc1_])
            {
               if(AGALProgram3DCache.method_4844(_loc1_))
               {
                  AGALProgram3DCache.method_4844(_loc1_).method_2578(this.arcane::var_4423[_loc1_]);
               }
               this.arcane::var_768[_loc1_] = null;
            }
            _loc1_++;
         }
      }
      
      public function get method_1035() : uint
      {
         return this.var_1671;
      }
      
      public function get method_1025() : uint
      {
         return this.var_237;
      }
      
      public function get method_5243() : uint
      {
         return this.var_3673;
      }
      
      public function get method_6441() : uint
      {
         return this.var_47;
      }
      
      public function get name_132() : Boolean
      {
         return this.var_2395;
      }
      
      public function get name_26() : Boolean
      {
         return this.var_1081;
      }
      
      arcane function method_545(param1:class_2133, param2:class_1208, param3:class_1767) : void
      {
         param1.animator.setRenderState(param2,param1,this.var_237,this.var_1671,param3);
      }
      
      arcane function render(param1:class_2133, param2:class_1208, param3:class_1767, param4:Matrix3D) : void
      {
         throw new AbstractMethodError();
      }
      
      arcane function getVertexCode() : String
      {
         throw new AbstractMethodError();
      }
      
      arcane function getFragmentCode(param1:String) : String
      {
         throw new AbstractMethodError();
      }
      
      public function method_4125(param1:String) : void
      {
         switch(param1)
         {
            case BlendMode.NORMAL:
               this.var_73 = Context3DBlendFactor.ONE;
               this.var_2227 = Context3DBlendFactor.ZERO;
               this.var_3123 = false;
               break;
            case BlendMode.LAYER:
               this.var_73 = Context3DBlendFactor.SOURCE_ALPHA;
               this.var_2227 = Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA;
               this.var_3123 = true;
               break;
            case BlendMode.MULTIPLY:
               this.var_73 = Context3DBlendFactor.ZERO;
               this.var_2227 = Context3DBlendFactor.SOURCE_COLOR;
               this.var_3123 = true;
               break;
            case BlendMode.ADD:
               this.var_73 = Context3DBlendFactor.SOURCE_ALPHA;
               this.var_2227 = Context3DBlendFactor.ONE;
               this.var_3123 = true;
               break;
            case BlendMode.ALPHA:
               this.var_73 = Context3DBlendFactor.ZERO;
               this.var_2227 = Context3DBlendFactor.SOURCE_ALPHA;
               this.var_3123 = true;
               break;
            case BlendMode.SCREEN:
               this.var_73 = Context3DBlendFactor.ONE;
               this.var_2227 = Context3DBlendFactor.ONE_MINUS_SOURCE_COLOR;
               this.var_3123 = true;
               break;
            default:
               throw new ArgumentError("Unsupported blend mode!");
         }
      }
      
      arcane function activate(param1:class_1208, param2:class_1767) : void
      {
         var _loc6_:* = 0;
         var _loc3_:int = int(param1.arcane::var_1572);
         var _loc4_:Context3D;
         (_loc4_ = param1.arcane::var_4582).setDepthTest(Boolean(this.var_4586) && !this.var_3123,this.var_4718);
         if(this.var_3123)
         {
            _loc4_.setBlendFactors(this.var_73,this.var_2227);
         }
         if(this.var_665[_loc3_] != _loc4_ || !this.arcane::var_768[_loc3_])
         {
            this.var_665[_loc3_] = _loc4_;
            this.arcane::method_3625(param1);
            dispatchEvent(new Event(Event.CHANGE));
         }
         var _loc5_:int = 0;
         _loc6_ = uint(this.var_1671);
         while(_loc6_ < _loc5_)
         {
            _loc4_.setVertexBufferAt(_loc6_,null);
            _loc6_++;
         }
         _loc5_ = 0;
         _loc6_ = uint(this.var_1971);
         while(_loc6_ < _loc5_)
         {
            _loc4_.setTextureAt(_loc6_,null);
            _loc6_++;
         }
         if(Boolean(this.var_1183) && !this.var_1183.method_3822)
         {
            this.var_1183.activate(param1,this);
         }
         _loc4_.setProgram(this.arcane::var_768[_loc3_]);
         _loc4_.setCulling(!!this.var_1658 ? "null" : this.var_3455);
         if(this.var_3093)
         {
            this.var_2448 = param1.renderTarget;
            this.var_1835 = param1.method_351;
            this.var_5020 = param1.method_658;
            this.var_2036 = param1.method_2358;
         }
      }
      
      arcane function deactivate(param1:class_1208) : void
      {
         var _loc2_:uint = uint(param1.arcane::var_1572);
         var_3763[_loc2_] = this.var_1671;
         var_4904[_loc2_] = this.var_1971;
         if(Boolean(this.var_1183) && !this.var_1183.method_3822)
         {
            this.var_1183.deactivate(param1,this);
         }
         if(this.var_3093)
         {
            param1.setRenderTarget(this.var_2448,this.var_5020,this.var_1835);
            param1.method_2358 = this.var_2036;
         }
         if(this.var_3123)
         {
            param1.arcane::var_4582.setBlendFactors(Context3DBlendFactor.ONE,Context3DBlendFactor.ZERO);
         }
         param1.arcane::var_4582.setDepthTest(true,Context3DCompareMode.LESS_EQUAL);
      }
      
      arcane function method_220(param1:Boolean = true) : void
      {
         var _loc2_:Number = 0;
         while(_loc2_ < 8)
         {
            this.arcane::var_768[_loc2_] = null;
            _loc2_++;
         }
         if(Boolean(this.var_642) && param1)
         {
            this.var_642.arcane::method_6504(this);
         }
      }
      
      arcane function method_3625(param1:class_1208) : void
      {
         var _loc7_:* = 0;
         var _loc8_:Number = 0;
         var _loc2_:String = "";
         var _loc3_:* = "";
         var _loc4_:String = "";
         var _loc5_:String = this.arcane::getVertexCode();
         if(Boolean(this.var_1183) && !this.var_1183.method_3822)
         {
            _loc2_ = this.var_1183.method_2174(this,this.var_16,this.var_2915,param1.profile);
            if(this.var_2395)
            {
               _loc4_ = this.var_1183.method_2535(this,this.var_3471,param1.profile);
            }
            if(this.var_1081)
            {
               _loc3_ = this.var_1183.method_45(this,this.var_1302,this.var_1613);
            }
            this.var_1183.method_5085(this);
         }
         else
         {
            _loc7_ = uint(this.var_16.length);
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc2_ += "mov " + this.var_2915[_loc8_] + ", " + this.var_16[_loc8_] + "\n";
               _loc8_++;
            }
            if(this.var_1081)
            {
               _loc3_ = "mov " + this.var_1613 + "," + this.var_1302 + "\n";
            }
         }
         _loc5_ = _loc2_ + _loc3_ + _loc5_;
         var _loc6_:String = this.arcane::getFragmentCode(_loc4_);
         if(true)
         {
         }
         AGALProgram3DCache.getInstance(param1).method_4626(this,_loc5_,_loc6_);
      }
      
      arcane function get lightPicker() : class_2100
      {
         return this.var_1149;
      }
      
      arcane function set lightPicker(param1:class_2100) : void
      {
         if(this.var_1149)
         {
            this.var_1149.removeEventListener(Event.CHANGE,this.method_120);
         }
         this.var_1149 = param1;
         if(this.var_1149)
         {
            this.var_1149.addEventListener(Event.CHANGE,this.method_120);
         }
         this.method_395();
      }
      
      private function method_120(param1:Event) : void
      {
         this.method_395();
      }
      
      protected function method_395() : void
      {
      }
      
      public function get alphaPremultiplied() : Boolean
      {
         return this.var_3218;
      }
      
      public function set alphaPremultiplied(param1:Boolean) : void
      {
         this.var_3218 = param1;
         this.arcane::method_220(false);
      }
   }
}
