package package_310
{
   import away3d.arcane;
   import flash.display3D.Context3DTextureFormat;
   import package_198.class_1208;
   import package_199.class_2253;
   import package_293.class_1749;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_309.class_1774;
   import package_369.class_2115;
   import package_385.class_2237;
   import package_385.class_2250;
   import package_385.class_2251;
   
   public class class_1779 extends class_1749
   {
       
      
      protected var var_1283:class_2250;
      
      protected var var_746:Vector.<class_1774>;
      
      public function class_1779()
      {
         super();
      }
      
      arcane function initVO(param1:class_2252) : void
      {
      }
      
      arcane function method_4956(param1:class_2252) : void
      {
      }
      
      arcane function get sharedRegisters() : class_2250
      {
         return this.var_1283;
      }
      
      arcane function set sharedRegisters(param1:class_2250) : void
      {
         this.var_1283 = param1;
      }
      
      public function get method_4325() : Vector.<class_1774>
      {
         return this.var_746;
      }
      
      public function dispose() : void
      {
      }
      
      arcane function method_4601() : class_2252
      {
         return new class_2252();
      }
      
      arcane function reset() : void
      {
         this.arcane::method_3031();
      }
      
      arcane function method_3031() : void
      {
      }
      
      arcane function getVertexCode(param1:class_2252, param2:class_2237) : String
      {
         return "";
      }
      
      arcane function activate(param1:class_2252, param2:class_1208) : void
      {
      }
      
      arcane function setRenderState(param1:class_2252, param2:class_2133, param3:class_1208, param4:class_1767) : void
      {
      }
      
      arcane function deactivate(param1:class_2252, param2:class_1208) : void
      {
      }
      
      protected function getTex2DSampleCode(param1:class_2252, param2:class_2251, param3:class_2251, param4:class_2115, param5:class_2251 = null, param6:String = null) : String
      {
         var _loc8_:* = null;
         var _loc7_:String = param6 || (!!param1.var_2679 ? "wrap" : "clamp");
         var _loc9_:String = this.getFormatStringForTexture(param4);
         var _loc10_:Boolean = Boolean(param1.var_2526) && Boolean(param4.method_5818);
         if(param1.var_4636)
         {
            _loc8_ = _loc10_ ? "linear,miplinear" : "linear";
         }
         else
         {
            _loc8_ = _loc10_ ? "nearest,mipnearest" : "nearest";
         }
         param5 = param5 || this.var_1283.var_443;
         return "tex " + param2 + ", " + param5 + ", " + param3 + " <2d," + _loc8_ + "," + _loc9_ + _loc7_ + ">\n";
      }
      
      protected function method_3486(param1:class_2252, param2:class_2251, param3:class_2251, param4:class_2115, param5:class_2251) : String
      {
         var _loc6_:* = null;
         var _loc7_:String = this.getFormatStringForTexture(param4);
         var _loc8_:Boolean = Boolean(param1.var_2526) && Boolean(param4.method_5818);
         if(param1.var_4636)
         {
            _loc6_ = _loc8_ ? "linear,miplinear" : "linear";
         }
         else
         {
            _loc6_ = _loc8_ ? "nearest,mipnearest" : "nearest";
         }
         return "tex " + param2 + ", " + param5 + ", " + param3 + " <cube," + _loc7_ + _loc6_ + ">\n";
      }
      
      private function getFormatStringForTexture(param1:class_2115) : String
      {
         switch(param1.format)
         {
            case Context3DTextureFormat.COMPRESSED:
               return "dxt1,";
            case "compressedAlpha":
               return "dxt5,";
            default:
               return "";
         }
      }
      
      protected function method_220() : void
      {
         dispatchEvent(new class_2253(class_2253.const_3136));
      }
      
      public function copyFrom(param1:class_1779) : void
      {
      }
   }
}
