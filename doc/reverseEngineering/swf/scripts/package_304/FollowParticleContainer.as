package package_304
{
   import away3d.animators.class_2403;
   import away3d.arcane;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import package_295.class_1752;
   import package_383.class_2396;
   import package_430.class_2581;
   import package_431.class_2407;
   
   public class FollowParticleContainer extends class_1752
   {
       
      
      private var var_3122:Matrix3D;
      
      private var var_2886:TargetObject3D;
      
      private var var_529:Vector.<class_2114>;
      
      private var var_3517:Vector.<class_2114>;
      
      private var var_4265:Vector3D;
      
      public function FollowParticleContainer()
      {
         this.var_3122 = new Matrix3D();
         this.var_529 = new Vector.<class_2114>();
         this.var_3517 = new Vector.<class_2114>();
         this.var_4265 = new Vector3D();
         super();
         this.var_2886 = new TargetObject3D(this);
         addChild(this.var_2886);
      }
      
      public function method_102(param1:class_2114) : void
      {
         var _loc2_:class_2403 = param1.animator as class_2403;
         if(!_loc2_)
         {
            throw new Error("not a particle mesh");
         }
         var _loc3_:class_2581 = _loc2_.method_1258("ParticleFollowLocalDynamic") as class_2581;
         if(!_loc3_)
         {
            throw new Error("not a follow particle");
         }
         _loc3_.method_774 = this.var_2886;
         addChild(param1);
         if((_loc2_.animationSet.method_1957("ParticleFollowLocalDynamic") as class_2407).arcane::var_2896)
         {
            this.var_529.push(param1);
         }
         else
         {
            this.var_3517.push(param1);
         }
      }
      
      public function method_2526(param1:class_2114) : void
      {
         var _loc2_:class_2403 = param1.animator as class_2403;
         if(!_loc2_)
         {
            throw new Error("not a particle mesh");
         }
         var _loc3_:class_2581 = _loc2_.method_1258("ParticleFollowLocalDynamic") as class_2581;
         if(!_loc3_)
         {
            throw new Error("not a follow particle");
         }
         _loc3_.method_774 = null;
         removeChild(param1);
         var _loc4_:int;
         if((_loc4_ = int(this.var_529.indexOf(param1))) != -1)
         {
            this.var_529.splice(_loc4_,1);
         }
         else
         {
            this.var_3517.splice(this.var_3517.indexOf(param1),1);
         }
      }
      
      public function get method_3132() : Matrix3D
      {
         return super.sceneTransform;
      }
      
      override public function get sceneTransform() : Matrix3D
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(var_4750)
         {
            _loc1_ = super.sceneTransform.decompose();
            _loc2_ = this.var_3122.rawData;
            _loc2_[0] = _loc1_[2].x;
            _loc2_[5] = _loc1_[2].y;
            _loc2_[10] = _loc1_[2].z;
            this.var_3122.copyRawDataFrom(_loc2_);
         }
         if(this.var_2886.sceneTransformDirty)
         {
            this.updateBounds(this.var_2886.position);
         }
         return this.var_3122;
      }
      
      private function updateBounds(param1:Vector3D) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in this.var_529)
         {
            this.var_4265.copyFrom(param1);
            this.var_4265.x /= _loc2_.scaleX;
            this.var_4265.y /= _loc2_.scaleY;
            this.var_4265.z /= _loc2_.scaleZ;
            _loc3_ = _loc2_.bounds as class_2396;
            _loc3_.method_5432(this.var_4265,_loc3_.radius);
         }
         for each(_loc2_ in this.var_3517)
         {
            _loc2_.position = this.var_2886.specificPos;
         }
      }
   }
}

import flash.geom.Matrix3D;
import flash.geom.Vector3D;
import package_295.class_1752;
import package_304.FollowParticleContainer;

class TargetObject3D extends class_1752
{
    
   
   private var _container:FollowParticleContainer;
   
   private var _helpTransform:Matrix3D;
   
   public var specificPos:Vector3D;
   
   private var specificEulers:Vector3D;
   
   function TargetObject3D(param1:FollowParticleContainer)
   {
      this._helpTransform = new Matrix3D();
      this.specificPos = new Vector3D();
      this.specificEulers = new Vector3D();
      super();
      this._container = param1;
   }
   
   public function get sceneTransformDirty() : Boolean
   {
      return var_4750;
   }
   
   private function validateTransform() : void
   {
      var _loc1_:* = null;
      var _loc2_:* = null;
      if(var_4750)
      {
         this._helpTransform.copyFrom(this._container.method_3132);
         _loc1_ = this._helpTransform.decompose();
         this.specificPos = _loc1_[0];
         this.specificPos.x /= _loc1_[2].x;
         this.specificPos.y /= _loc1_[2].y;
         this.specificPos.z /= _loc1_[2].z;
         this.specificEulers.x = 0;
         this.specificEulers.y = 0;
         this.specificEulers.z = 0;
         _loc2_ = this._container;
         while(_loc2_)
         {
            this.specificEulers.x += _loc2_.rotationX;
            this.specificEulers.y += _loc2_.rotationY;
            this.specificEulers.z += _loc2_.rotationZ;
            _loc2_ = _loc2_.parent;
         }
         var_4750 = false;
      }
   }
   
   override public function get x() : Number
   {
      if(var_4750)
      {
         this.validateTransform();
      }
      return this.specificPos.x;
   }
   
   override public function get y() : Number
   {
      if(var_4750)
      {
         this.validateTransform();
      }
      return this.specificPos.y;
   }
   
   override public function get z() : Number
   {
      if(var_4750)
      {
         this.validateTransform();
      }
      return this.specificPos.z;
   }
   
   override public function get position() : Vector3D
   {
      if(var_4750)
      {
         this.validateTransform();
      }
      return this.specificPos;
   }
   
   override public function get rotationX() : Number
   {
      if(var_4750)
      {
         this.validateTransform();
      }
      return this.specificEulers.x;
   }
   
   override public function get rotationY() : Number
   {
      if(var_4750)
      {
         this.validateTransform();
      }
      return this.specificEulers.y;
   }
   
   override public function get rotationZ() : Number
   {
      if(var_4750)
      {
         this.validateTransform();
      }
      return this.specificEulers.z;
   }
}
