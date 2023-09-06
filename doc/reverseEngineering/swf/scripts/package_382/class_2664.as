package package_382
{
   import flash.display.MovieClip;
   import flash.geom.Vector3D;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import package_19.class_1199;
   import package_22.class_1088;
   import package_294.class_2429;
   import package_295.class_1752;
   import package_297.class_2486;
   import package_297.class_2662;
   import package_304.class_2104;
   import package_304.class_2114;
   import package_436.PlaneGeometry;
   import package_446.Merge;
   import package_472.class_2656;
   import package_9.ResourceManager;
   
   public class class_2664 extends class_1752 implements class_2662, IDisposable
   {
      
      private static const const_2889:String = "doublePlane";
      
      private static const const_1033:String = "singlePlane";
      
      private static const const_646:String = "particle";
      
      private static var var_3716:class_2429;
      
      private static var var_2732:class_2429;
      
      private static const const_1975:Vector3D = new Vector3D();
       
      
      private var var_1110:Number = 0;
      
      private var var_278:class_2104;
      
      private var var_1333:class_2114;
      
      private var var_849:class_1088;
      
      private var _resKey:String;
      
      private var name_35:Vector3D;
      
      private var var_4684:class_1199;
      
      private var _active:Boolean = true;
      
      public function class_2664(param1:class_1088, param2:String)
      {
         super();
         this.var_849 = param1;
         this._resKey = param2;
         this.var_1110 = this.var_849.laserLength;
         if("doublePlane" == const_2889)
         {
            this.method_1904(this._resKey);
         }
         else if("doublePlane" == const_1033)
         {
            this.method_6391(this._resKey);
         }
         else if("doublePlane" == const_646)
         {
            this.method_2841(this._resKey);
         }
      }
      
      public static function method_1938(param1:class_1088, param2:String) : String
      {
         return "LaserBullet3D_" + param1.laserType + "_" + param2;
      }
      
      public function method_3639() : void
      {
         this._active = true;
         if(this.var_278)
         {
            if(this.name_35)
            {
               this.var_278.method_1154(this.name_35);
            }
            this.var_278.animator.time = 0;
            this.var_278.animator.start();
         }
         if(Boolean(this.var_1333) && Boolean(this.name_35))
         {
            this.var_1333.method_1154(const_1975,Vector3D.Z_AXIS);
         }
      }
      
      public function method_1274() : void
      {
         if(this.var_278)
         {
            this.var_278.animator.stop();
         }
         if(parent)
         {
            parent.removeChild(this);
         }
         this._active = false;
      }
      
      public function get method_1159() : Number
      {
         return this.var_1110;
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         if(this.var_278)
         {
            this.var_278.animator.stop();
            this.var_278.animator.dispose();
            this.var_278.dispose();
            this.var_278 = null;
         }
         if(this.var_4684)
         {
            this.var_4684.remove(this.method_310);
            this.var_4684 = null;
         }
         if(this.var_1333)
         {
            this.var_1333.method_718();
            this.var_1333 = null;
         }
         if(parent)
         {
            parent.removeChild(this);
         }
      }
      
      public function method_4027(param1:Vector3D) : void
      {
         const_1975.setTo(param1.x - Number(x),param1.y - Number(y),param1.z - Number(z));
         if(this.var_1333)
         {
            this.var_1333.method_1154(const_1975,Vector3D.Z_AXIS);
         }
         else if(this.var_278)
         {
            this.var_278.method_1154(const_1975);
         }
         else
         {
            this.name_35 = const_1975.clone();
         }
      }
      
      private function method_1904(param1:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_3716 == null || var_3716.subGeometries.length == 0)
         {
            _loc4_ = new class_2114(new PlaneGeometry(1,1,1,1,true,true));
            (_loc5_ = new class_2114(new PlaneGeometry(1,1,1,1,true,true))).rotationX = 90;
            (_loc6_ = new Merge(false,true,false)).apply(_loc4_,_loc5_);
            class_2656.method_1468(_loc4_,-0.5,0,0);
            _loc4_.x = _loc4_.y = _loc4_.z = 0;
            _loc4_.rotationY = 90;
            class_2656.method_5615(_loc4_);
            var_3716 = _loc4_.geometry;
         }
         if(!ResourceManager.isLoaded(param1))
         {
            ResourceManager.loadAndCall(param1,this.method_1904,arguments,100);
            return;
         }
         var _loc3_:MovieClip = ResourceManager.getMovieClip(param1,"mc");
         if(this.var_1110 == 0)
         {
            this.var_1110 = _loc3_.width;
         }
         this.var_1333 = class_2486.method_6114(param1,_loc3_,var_3716);
         this.var_1333.scaleX = _loc3_.height;
         this.var_1333.scaleY = _loc3_.height;
         this.var_1333.scaleZ = _loc3_.width;
         if(this.name_35)
         {
            this.var_1333.method_1154(this.name_35);
         }
         addChild(this.var_1333);
      }
      
      private function method_6391(param1:String) : void
      {
         var _loc4_:* = null;
         if(var_2732 == null || var_2732.subGeometries.length == 0)
         {
            (_loc4_ = new class_2114(new PlaneGeometry(1,1,1,1,true,true))).rotationY = 90;
            _loc4_.rotationX -= 90;
            class_2656.method_5615(_loc4_);
            var_2732 = _loc4_.geometry;
         }
         if(!ResourceManager.isLoaded(param1))
         {
            ResourceManager.loadAndCall(param1,this.method_6391,arguments,100);
            return;
         }
         var _loc3_:MovieClip = ResourceManager.getMovieClip(param1,"mc");
         if(this.var_1110 == 0)
         {
            this.var_1110 = _loc3_.width;
         }
         this.var_1333 = class_2486.method_6114(param1,_loc3_,var_2732);
         this.var_1333.scaleX = _loc3_.height * 2;
         this.var_1333.scaleY = _loc3_.height * 2;
         this.var_1333.scaleZ = _loc3_.width * 2;
         if(this.name_35)
         {
            this.var_1333.method_1154(this.name_35);
         }
         addChild(this.var_1333);
      }
      
      private function method_2841(param1:String) : void
      {
         this.var_4684 = class_1210.instance.method_659.method_1811(param1 + ".zip",class_1210.const_2984);
         this.var_4684.addOnce(this.method_310);
      }
      
      private function method_310(param1:class_2104) : void
      {
         this.var_278 = param1.clone() as class_2104;
         if(this._active)
         {
            this.var_278.animator.time = 0;
            this.var_278.animator.start();
            if(this.name_35)
            {
               this.var_278.method_1154(this.name_35);
            }
         }
         addChild(this.var_278);
      }
      
      public function get method_3485() : String
      {
         return method_1938(this.var_849,this._resKey);
      }
   }
}
