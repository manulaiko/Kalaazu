package mx.geom
{
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.PerspectiveProjection;
   import flash.geom.Rectangle;
   import flash.geom.Transform;
   import mx.core.ILayoutElement;
   import mx.core.IVisualElement;
   import mx.core.mx_internal;
   
   public class Transform extends flash.geom.Transform
   {
       
      
      mx_internal var applyColorTransformAlpha:Boolean = false;
      
      mx_internal var applyMatrix:Boolean = false;
      
      mx_internal var applyMatrix3D:Boolean = false;
      
      private var _target:IVisualElement;
      
      public function Transform(param1:DisplayObject = null)
      {
         if(param1 == null)
         {
            param1 = new Shape();
         }
         super(param1);
      }
      
      override public function set colorTransform(param1:ColorTransform) : void
      {
         if(Boolean(this.target) && "$transform" in this.target)
         {
            this.target["$transform"]["colorTransform"] = param1;
         }
         else if(Boolean(this.target) && "setColorTransform" in this.target)
         {
            this.target["setColorTransform"](param1);
         }
         else
         {
            super.colorTransform = param1;
         }
         this.mx_internal::applyColorTransformAlpha = true;
      }
      
      override public function get colorTransform() : ColorTransform
      {
         if(Boolean(this.target) && "$transform" in this.target)
         {
            return this.target["$transform"]["colorTransform"];
         }
         if(this.target && "displayObject" in this.target && this.target["displayObject"] != null)
         {
            return this.target["displayObject"]["transform"]["colorTransform"];
         }
         return super.colorTransform;
      }
      
      override public function get concatenatedColorTransform() : ColorTransform
      {
         if(Boolean(this.target) && "$transform" in this.target)
         {
            return this.target["$transform"]["concatenatedColorTransform"];
         }
         if(this.target && "displayObject" in this.target && this.target["displayObject"] != null)
         {
            return this.target["displayObject"]["transform"]["concatenatedColorTransform"];
         }
         return super.concatenatedColorTransform;
      }
      
      override public function get concatenatedMatrix() : Matrix
      {
         if(Boolean(this.target) && "$transform" in this.target)
         {
            return this.target["$transform"]["concatenatedMatrix"];
         }
         if(this.target && "displayObject" in this.target && this.target["displayObject"] != null)
         {
            return this.target["displayObject"]["transform"]["concatenatedMatrix"];
         }
         return super.concatenatedMatrix;
      }
      
      override public function set matrix(param1:Matrix) : void
      {
         if(this.target is ILayoutElement && param1 != null)
         {
            ILayoutElement(this.target).setLayoutMatrix(param1,true);
         }
         else
         {
            super.matrix = param1;
         }
         this.mx_internal::applyMatrix = param1 != null;
         this.mx_internal::applyMatrix3D = false;
      }
      
      override public function get matrix() : Matrix
      {
         if(this.target is ILayoutElement)
         {
            return ILayoutElement(this.target).getLayoutMatrix();
         }
         return super.matrix;
      }
      
      override public function set matrix3D(param1:Matrix3D) : *
      {
         if(this.target is ILayoutElement && param1 != null)
         {
            ILayoutElement(this.target).setLayoutMatrix3D(param1,true);
         }
         else
         {
            super.matrix3D = param1;
         }
         this.mx_internal::applyMatrix3D = param1 != null;
         this.mx_internal::applyMatrix = false;
      }
      
      override public function get matrix3D() : Matrix3D
      {
         if(this.target is ILayoutElement)
         {
            return ILayoutElement(this.target).getLayoutMatrix3D();
         }
         return super.matrix3D;
      }
      
      override public function set perspectiveProjection(param1:PerspectiveProjection) : void
      {
         var _loc2_:PerspectiveProjection = super.perspectiveProjection;
         super.perspectiveProjection = param1;
      }
      
      override public function get perspectiveProjection() : PerspectiveProjection
      {
         if(Boolean(this.target) && "$transform" in this.target)
         {
            return this.target["$transform"]["perspectiveProjection"];
         }
         if(this.target && "displayObject" in this.target && this.target["displayObject"] != null)
         {
            return this.target["displayObject"]["transform"]["perspectiveProjection"];
         }
         return super.perspectiveProjection;
      }
      
      override public function get pixelBounds() : Rectangle
      {
         if(Boolean(this.target) && "$transform" in this.target)
         {
            return this.target["$transform"]["pixelBounds"];
         }
         if(this.target && "displayObject" in this.target && this.target["displayObject"] != null)
         {
            return this.target["displayObject"]["transform"]["pixelBounds"];
         }
         return super.pixelBounds;
      }
      
      public function set target(param1:IVisualElement) : void
      {
         if(param1 !== this._target)
         {
            this._target = param1;
         }
      }
      
      public function get target() : IVisualElement
      {
         return this._target;
      }
      
      override public function getRelativeMatrix3D(param1:DisplayObject) : Matrix3D
      {
         if(Boolean(this.target) && "$transform" in this.target)
         {
            return this.target["$transform"]["getRelativeMatrix3D"](param1);
         }
         if(this.target && "displayObject" in this.target && this.target["displayObject"] != null)
         {
            return this.target["displayObject"]["transform"]["getRelativeMatrix3D"](param1);
         }
         return super.getRelativeMatrix3D(param1);
      }
   }
}
