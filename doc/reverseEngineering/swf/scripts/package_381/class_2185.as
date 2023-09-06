package package_381
{
   import flash.display.MovieClip;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_27.class_82;
   import package_29.class_85;
   import package_294.class_2429;
   import package_295.class_1752;
   import package_297.class_2486;
   import package_304.class_2114;
   import package_38.class_562;
   import package_436.PlaneGeometry;
   import package_75.class_1838;
   import package_9.ResourceManager;
   import package_9.class_83;
   
   public class class_2185 implements class_80
   {
      
      private static const name_23:Dictionary = new Dictionary();
      
      private static const const_3061:uint = 5;
      
      private static const name_69:class_2429 = new PlaneGeometry(1,1);
      
      private static const const_2742:Object = {};
      
      {
         const_2742[class_562.LASER] = "Laser";
         const_2742[class_562.ROCKET] = "Rocket";
         const_2742[class_562.const_345] = "Hellstorm";
         const_2742[class_562.const_57] = "Misc";
      }
      
      private var _mapView:class_1211;
      
      private var var_1282:class_85;
      
      private var var_4367:Vector3D;
      
      private var var_3720:class_1752;
      
      public function class_2185(param1:class_1211, param2:class_1838)
      {
         this.var_4367 = new Vector3D();
         this.var_3720 = new class_1752();
         super();
         this._mapView = param1;
         this._mapView.method_1616.addChild(this.var_3720);
         this._mapView.method_1164(this);
         if(param2.target)
         {
            this.var_1282 = param2.source;
            this.method_1(this.var_1282,param2.target,param2.name_36,param2.type);
            setTimeout(this.method_1,33,this.var_1282,param2.target,param2.name_36,param2.type);
            setTimeout(this.method_1,660,this.var_1282,param2.target,param2.name_36,param2.type);
         }
      }
      
      private function method_1(param1:class_85, param2:class_85, param3:int, param4:int) : void
      {
         if(name_23[param4] == undefined)
         {
            name_23[param4] = 0;
         }
         if(name_23[param4] >= const_3061)
         {
            return;
         }
         name_23[param4] = NaN;
         var _loc5_:String = "outOfRangeLimiterundefined";
         var _loc6_:MovieClip = ResourceManager.getMovieClip("ui",_loc5_);
         var _loc7_:class_2114 = class_2486.method_6114(_loc5_,_loc6_,name_69);
         this.var_4367.setTo(Number(param2.method_1474) - Number(param1.method_1474),Number(param2.method_1121) - Number(param1.method_1121),Number(param2.method_6123) - Number(param1.method_6123));
         this.var_4367.normalize();
         this.var_4367.scaleBy(param3);
         _loc7_.x = this.var_4367.x;
         _loc7_.y = this.var_4367.y;
         _loc7_.z = this.var_4367.z;
         _loc7_.scaleX = _loc6_.width;
         _loc7_.scaleZ = _loc6_.height;
         _loc7_.rotationY = 90 - Math.atan2(this.var_4367.z,this.var_4367.x) * 0;
         this.var_3720.addChild(_loc7_);
         class_82.playSoundEffect(class_126.const_139);
         setTimeout(this.method_3122,2000,_loc7_,param4);
      }
      
      public function updateObj(param1:Number) : void
      {
         this.var_3720.x = this.var_1282.method_1474;
         this.var_3720.y = this.var_1282.method_1121;
         this.var_3720.z = this.var_1282.method_6123;
      }
      
      private function method_3122(param1:class_2114, param2:uint) : void
      {
         if(Boolean(param1) && Boolean(param1.parent))
         {
            param1.parent.removeChild(param1);
         }
         name_23[param2] = -1;
         if(this.var_3720.numChildren == 0)
         {
            this._mapView.method_3592(this);
            if(this.var_3720.parent)
            {
               this.var_3720.parent.removeChild(this.var_3720);
            }
         }
      }
   }
}
