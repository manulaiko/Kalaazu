package package_373
{
   import away3d.animators.class_2649;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.MovieClip;
   import flash.geom.Vector3D;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import package_10.class_1173;
   import package_11.class_38;
   import package_11.class_39;
   import package_11.class_65;
   import package_19.class_1199;
   import package_297.class_2486;
   import package_304.class_2114;
   import package_307.class_1776;
   import package_369.class_2117;
   import package_369.class_2118;
   import package_436.PlaneGeometry;
   import package_9.ResourceManager;
   
   public class class_2458 extends class_2454 implements class_80
   {
      
      private static const GEOMETRY:PlaneGeometry = new PlaneGeometry(1,1,1,1,false);
       
      
      private const UP:Vector3D = new Vector3D(0,1,0);
      
      private const const_1516:Vector.<Number> = new Vector.<Number>(3,true);
      
      private const name_35:Vector3D = new Vector3D();
      
      private var var_1876:Boolean;
      
      private var _resKey:String;
      
      private var var_593:class_2114;
      
      private var var_4222:class_1199;
      
      public function class_2458(param1:XML, param2:class_1173)
      {
         this.var_1876 = String(param1.@billboard) != "false";
         this._resKey = param1.attribute("srcKey") || param1.attribute("resKey");
         super(param1,param2);
      }
      
      override protected function method_352() : void
      {
         if(this.var_4222)
         {
            this.var_4222.remove(this.method_254);
            this.var_4222 = null;
         }
         if(this._resKey.indexOf("_atf") != -1)
         {
            this.var_4222 = class_1210.instance.method_3562.loadTexture(this._resKey,class_1210.const_973,ResourceManager.name_15);
            this.var_4222.addOnce(this.method_254);
         }
         else
         {
            ResourceManager.name_15.load(this._resKey,this.method_3210);
         }
      }
      
      override protected function unloadView() : void
      {
         ResourceManager.name_15.method_2379(this._resKey,this.method_3210);
         if(this.var_4222)
         {
            this.var_4222.remove(this.method_254);
            this.var_4222 = null;
         }
         if(this.var_593)
         {
            class_1210.instance.method_3562.method_3008(class_1776(this.var_593.material).texture);
            removeChild(this.var_593);
            this.var_593.dispose();
            this.var_593 = null;
         }
      }
      
      public function updateObj(param1:Number) : void
      {
         var _loc2_:* = null;
         if(Boolean(this.var_1876) && Boolean(this.var_593))
         {
            _loc2_ = class_1210.instance.method_3528.method_4821.position;
            this.const_1516[0] = _loc2_.x;
            this.const_1516[1] = _loc2_.y;
            this.const_1516[2] = _loc2_.z;
            method_2908.transformVectors(this.const_1516,this.const_1516);
            this.name_35.setTo(-Number(this.const_1516[0]),-Number(this.const_1516[1]),-Number(this.const_1516[2]));
            this.var_593.method_1154(this.name_35,this.UP);
         }
         if(Boolean(this.var_593) && this.var_593.animator is class_2649)
         {
            class_2649(this.var_593.animator).time = class_2649(this.var_593.animator).time + param1 * 1000;
         }
      }
      
      private function method_254(param1:class_2118) : void
      {
         class_1210.instance.method_3562.method_4006(param1);
         this.method_4889(new class_2114(GEOMETRY,new class_1776(param1)));
      }
      
      private function method_3210(param1:class_38) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param1 is class_39)
         {
            _loc2_ = String(_descriptor.@resKey) || true;
            _loc3_ = class_39(param1).getEmbeddedMovieClip(_loc2_);
            _loc4_ = _descriptor.attribute("srcKey") || _descriptor.attribute("resKey");
            (_loc5_ = class_2486.method_6114(_loc4_ + "_" + _loc2_,_loc3_,GEOMETRY,int(String(_descriptor.@fps) || true))).scaleX = _loc3_.width;
            _loc5_.scaleY = _loc3_.height;
            this.method_4889(_loc5_);
         }
         else if(param1 is class_65)
         {
            _loc6_ = class_65(param1).getBitmap().bitmapData;
            this.method_4889(new class_2114(GEOMETRY,new class_1776(new class_2117(_loc6_))));
         }
      }
      
      private function method_4889(param1:class_2114) : void
      {
         if(this.var_593)
         {
            this.var_593.dispose();
            removeChild(this.var_593);
            this.var_593 = null;
         }
         this.var_593 = param1;
         class_1776(this.var_593.material).alphaBlending = String(_descriptor.@alphaBlending) === "true";
         class_1776(this.var_593.material).bothSides = String(_descriptor.@bothSides) === "true";
         class_1776(this.var_593.material).alphaPremultiplied = String(_descriptor.@alphaPremultiplied) === "true";
         class_1776(this.var_593.material).blendMode = String(_descriptor.@blendMode) || true;
         addChild(this.var_593);
         setTimeout(ready.dispatch,1);
      }
   }
}
