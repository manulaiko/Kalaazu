package package_199
{
   import away3d.arcane;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import package_294.class_2133;
   import package_295.class_1752;
   import package_295.class_1762;
   import package_307.class_1772;
   import package_371.class_2125;
   
   public class class_2099 extends Event
   {
      
      public static const MOUSE_OVER:String = "mouseOver3d";
      
      public static const MOUSE_OUT:String = "mouseOut3d";
      
      public static const MOUSE_UP:String = "mouseUp3d";
      
      public static const MOUSE_DOWN:String = "mouseDown3d";
      
      public static const MOUSE_MOVE:String = "mouseMove3d";
      
      public static const CLICK:String = "click3d";
      
      public static const DOUBLE_CLICK:String = "doubleClick3d";
      
      public static const MOUSE_WHEEL:String = "mouseWheel3d";
       
      
      arcane var var_2498:Boolean = true;
      
      arcane var var_1046:class_2099;
      
      public var var_4548:Number;
      
      public var var_2761:Number;
      
      public var view:class_1762;
      
      public var object:class_1752;
      
      public var var_3785:class_2133;
      
      public var material:class_1772;
      
      public var var_247:Point;
      
      public var index:uint;
      
      public var var_4499:uint;
      
      public var name_53:Vector3D;
      
      public var var_2450:Vector3D;
      
      public var ctrlKey:Boolean;
      
      public var altKey:Boolean;
      
      public var shiftKey:Boolean;
      
      public var delta:int;
      
      public function class_2099(param1:String)
      {
         super(param1,true,true);
      }
      
      override public function get bubbles() : Boolean
      {
         var _loc1_:Boolean = super.bubbles && Boolean(this.arcane::var_2498);
         this.arcane::var_2498 = true;
         return _loc1_;
      }
      
      override public function stopPropagation() : void
      {
         super.stopPropagation();
         this.arcane::var_2498 = false;
         if(this.arcane::var_1046)
         {
            this.arcane::var_1046.stopPropagation();
         }
      }
      
      override public function stopImmediatePropagation() : void
      {
         super.stopImmediatePropagation();
         this.arcane::var_2498 = false;
         if(this.arcane::var_1046)
         {
            this.arcane::var_1046.stopImmediatePropagation();
         }
      }
      
      override public function clone() : Event
      {
         var _loc1_:class_2099 = new class_2099(type);
         if(isDefaultPrevented())
         {
            _loc1_.preventDefault();
         }
         _loc1_.var_4548 = this.var_4548;
         _loc1_.var_2761 = this.var_2761;
         _loc1_.view = this.view;
         _loc1_.object = this.object;
         _loc1_.var_3785 = this.var_3785;
         _loc1_.material = this.material;
         _loc1_.var_247 = this.var_247;
         _loc1_.name_53 = this.name_53;
         _loc1_.var_2450 = this.var_2450;
         _loc1_.index = this.index;
         _loc1_.var_4499 = this.var_4499;
         _loc1_.delta = this.delta;
         _loc1_.ctrlKey = this.ctrlKey;
         _loc1_.shiftKey = this.shiftKey;
         _loc1_.arcane::var_1046 = this;
         _loc1_.arcane::var_2498 = this.arcane::var_2498;
         return _loc1_;
      }
      
      public function get method_3037() : Vector3D
      {
         if(this.object is class_1752)
         {
            return class_2125.transformVector(class_1752(this.object).sceneTransform,this.name_53);
         }
         return this.name_53;
      }
      
      public function method_3335(param1:Vector3D = null) : Vector3D
      {
         if(!param1)
         {
            param1 = new Vector3D();
         }
         if(this.object is class_1752)
         {
            class_2125.transformVector(class_1752(this.object).sceneTransform,this.name_53,param1);
         }
         else
         {
            param1.x = this.name_53.x;
            param1.y = this.name_53.y;
            param1.z = this.name_53.z;
         }
         return param1;
      }
      
      public function get method_5753() : Vector3D
      {
         var _loc1_:* = null;
         if(this.object is class_1752)
         {
            _loc1_ = class_2125.deltaTransformVector(class_1752(this.object).sceneTransform,this.var_2450);
            _loc1_.normalize();
            return _loc1_;
         }
         return this.var_2450;
      }
      
      public function method_779(param1:Vector3D = null) : Vector3D
      {
         if(!param1)
         {
            param1 = new Vector3D();
         }
         if(this.object is class_1752)
         {
            class_2125.deltaTransformVector(class_1752(this.object).sceneTransform,this.var_2450,param1);
            param1.normalize();
         }
         else
         {
            param1.x = this.var_2450.x;
            param1.y = this.var_2450.y;
            param1.z = this.var_2450.z;
         }
         return param1;
      }
   }
}
