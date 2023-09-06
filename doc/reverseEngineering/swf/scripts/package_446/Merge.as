package package_446
{
   import package_294.*;
   import package_295.*;
   import package_304.*;
   import package_307.*;
   import package_371.class_2125;
   import package_434.*;
   
   public class Merge
   {
       
      
      private var var_4447:Boolean;
      
      private var var_1589:Boolean;
      
      private var var_1945:Boolean;
      
      private var var_1388:Vector.<GeometryVO>;
      
      private var var_1186:Vector.<class_2114>;
      
      public function Merge(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false)
      {
         super();
         this.var_1589 = param1;
         this.var_1945 = param2;
         this.var_4447 = param3;
      }
      
      public function set method_2885(param1:Boolean) : void
      {
         this.var_1945 = param1;
      }
      
      public function get method_2885() : Boolean
      {
         return this.var_1945;
      }
      
      public function set method_2462(param1:Boolean) : void
      {
         this.var_1589 = param1;
      }
      
      public function get method_2462() : Boolean
      {
         return this.var_1589;
      }
      
      public function set method_4442(param1:Boolean) : void
      {
         this.var_4447 = param1;
      }
      
      public function get method_4442() : Boolean
      {
         return this.var_4447;
      }
      
      public function method_4327(param1:class_2114, param2:class_1752) : void
      {
         this.reset();
         this.method_319(param1,param2);
         this.collect(param1,false);
         this.merge(param1,this.var_1945);
      }
      
      public function method_6293(param1:class_2114, param2:Vector.<class_2114>) : void
      {
         this.reset();
         if(!param2.length)
         {
            return;
         }
         var _loc3_:Number = 0;
         while(_loc3_ < param2.length)
         {
            if(param2[_loc3_] != param1)
            {
               this.collect(param2[_loc3_],this.var_1945);
            }
            _loc3_++;
         }
         this.collect(param1,false);
         this.merge(param1,this.var_1945);
      }
      
      public function apply(param1:class_2114, param2:class_2114) : void
      {
         this.reset();
         this.collect(param2,this.var_1945);
         this.collect(param1,false);
         this.merge(param1,this.var_1945);
      }
      
      private function reset() : void
      {
         this.var_1186 = new Vector.<class_2114>();
         this.var_1388 = new Vector.<GeometryVO>();
      }
      
      private function merge(param1:class_2114, param2:Boolean) : void
      {
         var _loc3_:Number = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = false;
         var _loc8_:Number = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         _loc5_ = param1.geometry;
         _loc6_ = param1.geometry = new class_2429();
         _loc4_ = uint(param1.method_3381.length);
         _loc7_ = this.var_1388.length > 1;
         _loc3_ = 0;
         while(_loc3_ < this.var_1388.length)
         {
            _loc9_ = this.var_1388[_loc3_];
            _loc10_ = class_2450.method_5600(_loc9_.vertices,_loc9_.indices,_loc9_.uvs,_loc9_.normals,null,null,null);
            _loc8_ = 0;
            while(_loc8_ < _loc10_.length)
            {
               _loc6_.method_1586(_loc10_[_loc8_]);
               if(Boolean(this.var_1589) && _loc7_)
               {
                  param1.method_3381[_loc4_].material = _loc9_.material;
               }
               _loc4_++;
               _loc8_++;
            }
            _loc3_++;
         }
         if(Boolean(this.var_1589) && !_loc7_ && Boolean(this.var_1388.length))
         {
            param1.material = this.var_1388[0].material;
         }
         if(param2)
         {
            for each(_loc11_ in this.var_1186)
            {
               _loc11_.geometry.dispose();
               _loc11_.dispose();
            }
            _loc5_.dispose();
         }
         this.var_1186 = null;
      }
      
      private function collect(param1:class_2114, param2:Boolean) : void
      {
         var _loc3_:Number = 0;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:Number = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = 0;
         var _loc18_:* = 0;
         var _loc19_:* = 0;
         var _loc20_:* = 0;
         var _loc21_:* = 0;
         var _loc22_:* = 0;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc25_:* = null;
         if(param1.geometry)
         {
            _loc4_ = param1.geometry.subGeometries;
            _loc3_ = 0;
            while(_loc3_ < _loc4_.length)
            {
               _loc23_ = (_loc13_ = _loc4_[_loc3_]).name_104;
               _loc17_ = uint(_loc13_.method_4110);
               _loc20_ = uint(_loc13_.method_720);
               _loc24_ = _loc13_.method_4313;
               _loc18_ = uint(_loc13_.method_4163);
               _loc21_ = uint(_loc13_.method_4530);
               _loc25_ = _loc13_.method_868;
               _loc19_ = uint(_loc13_.method_2639);
               _loc22_ = uint(_loc13_.method_2585);
               _loc14_ = this.method_5390(param1.method_3381[_loc3_].material || param1.material);
               _loc15_ = !!this.var_4447 ? _loc14_.vertices : new Vector.<Number>();
               _loc16_ = !!this.var_4447 ? _loc14_.normals : new Vector.<Number>();
               _loc9_ = _loc15_.length;
               _loc10_ = _loc16_.length;
               _loc11_ = _loc14_.uvs.length;
               _loc7_ = uint(_loc13_.numVertices);
               _loc6_ = 0;
               while(_loc6_ < _loc7_)
               {
                  _loc5_ = _loc20_ + _loc6_ * _loc17_;
                  var _loc26_:*;
                  _loc15_[_loc26_ = _loc9_++] = _loc23_[_loc5_];
                  var _loc27_:*;
                  _loc15_[_loc27_ = _loc9_++] = _loc23_[_loc5_ + 1];
                  var _loc28_:*;
                  _loc15_[_loc28_ = _loc9_++] = _loc23_[_loc5_ + 2];
                  _loc5_ = _loc21_ + _loc6_ * _loc18_;
                  var _loc29_:*;
                  _loc16_[_loc29_ = _loc10_++] = _loc24_[_loc5_];
                  var _loc30_:*;
                  _loc16_[_loc30_ = _loc10_++] = _loc24_[_loc5_ + 1];
                  var _loc31_:*;
                  _loc16_[_loc31_ = _loc10_++] = _loc24_[_loc5_ + 2];
                  _loc5_ = _loc22_ + _loc6_ * _loc19_;
                  var _loc32_:*;
                  _loc14_.uvs[_loc32_ = _loc11_++] = _loc25_[_loc5_];
                  var _loc33_:*;
                  _loc14_.uvs[_loc33_ = _loc11_++] = _loc25_[_loc5_ + 1];
                  _loc6_++;
               }
               _loc12_ = !this.var_4447 ? _loc14_.vertices.length / 3 : 0;
               _loc8_ = _loc14_.indices.length;
               _loc7_ = uint(_loc13_.name_42);
               _loc6_ = 0;
               while(_loc6_ < _loc7_)
               {
                  _loc5_ = _loc6_ * 3;
                  _loc14_.indices[_loc26_ = _loc8_++] = _loc13_.indexData[_loc5_] + _loc12_;
                  _loc14_.indices[_loc27_ = _loc8_++] = _loc13_.indexData[_loc5_ + 1] + _loc12_;
                  _loc14_.indices[_loc28_ = _loc8_++] = _loc13_.indexData[_loc5_ + 2] + _loc12_;
                  _loc6_++;
               }
               if(!this.var_4447)
               {
                  param1.sceneTransform.transformVectors(_loc15_,_loc15_);
                  class_2125.method_2373(param1.sceneTransform,_loc16_,_loc16_);
                  _loc9_ = _loc14_.vertices.length;
                  _loc10_ = _loc14_.normals.length;
                  _loc7_ = _loc15_.length;
                  _loc6_ = 0;
                  while(_loc6_ < _loc7_)
                  {
                     _loc14_.vertices[_loc26_ = _loc9_++] = _loc15_[_loc6_];
                     _loc14_.normals[_loc27_ = _loc10_++] = _loc16_[_loc6_];
                     _loc6_++;
                  }
               }
               _loc3_++;
            }
            if(param2)
            {
               this.var_1186.push(param1);
            }
         }
      }
      
      private function method_5390(param1:class_1772) : GeometryVO
      {
         var _loc2_:* = null;
         var _loc3_:Number = 0;
         var _loc4_:* = 0;
         if(this.var_1589)
         {
            _loc4_ = uint(this.var_1388.length);
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               if(this.var_1388[_loc3_].material == param1)
               {
                  _loc2_ = this.var_1388[_loc3_];
                  break;
               }
               _loc3_++;
            }
         }
         else if(this.var_1388.length)
         {
            _loc2_ = this.var_1388[0];
         }
         if(!_loc2_)
         {
            _loc2_ = new GeometryVO();
            _loc2_.vertices = new Vector.<Number>();
            _loc2_.normals = new Vector.<Number>();
            _loc2_.uvs = new Vector.<Number>();
            _loc2_.indices = new Vector.<uint>();
            _loc2_.material = param1;
            this.var_1388.push(_loc2_);
         }
         return _loc2_;
      }
      
      private function method_319(param1:class_2114, param2:class_1752) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = 0;
         if(param2 is class_2114 && param2 != param1)
         {
            this.collect(class_2114(param2),this.var_1945);
         }
         _loc4_ = 0;
         while(_loc4_ < param2.numChildren)
         {
            _loc3_ = param2.getChildAt(_loc4_);
            this.method_319(param1,_loc3_);
            _loc4_++;
         }
      }
   }
}

import package_307.class_1772;

class GeometryVO
{
    
   
   public var uvs:Vector.<Number>;
   
   public var vertices:Vector.<Number>;
   
   public var normals:Vector.<Number>;
   
   public var indices:Vector.<uint>;
   
   public var material:class_1772;
   
   function GeometryVO()
   {
      super();
   }
}
