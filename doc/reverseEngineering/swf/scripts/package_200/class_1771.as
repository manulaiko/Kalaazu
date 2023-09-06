package package_200
{
   import flash.geom.Vector3D;
   import package_10.class_1179;
   import package_10.class_19;
   import package_10.class_2233;
   import package_297.class_2157;
   import package_364.DirectionalLight;
   import package_364.PointLight;
   import package_364.class_2102;
   
   public class class_1771 extends class_1770
   {
       
      
      public const visible:class_19 = new class_19(true);
      
      public const color:class_2233 = new class_2233(16777215,0,16777215);
      
      public const diffuse:class_1179 = new class_1179(1,0,1);
      
      public const specular:class_1179 = new class_1179(1,0);
      
      public const ambientColor:class_2233 = new class_2233(16777215,0,16777215);
      
      public const ambient:class_1179 = new class_1179(0,0,1);
      
      public const radius:class_1179 = new class_1179(0,0);
      
      public const fallOff:class_1179 = new class_1179(100,0);
      
      public const directionTilt:class_1179 = new class_1179(45,0,180);
      
      public const directionPan:class_1179 = new class_1179(45);
      
      private var var_3886:Boolean;
      
      public function class_1771(param1:Boolean, param2:Boolean, param3:uint, param4:Number, param5:Number, param6:uint, param7:Number, param8:Number, param9:Number, param10:Number = 0, param11:Number = 0)
      {
         super();
         this.var_3886 = param1;
         this.visible.value = param2;
         this.color.value = param3;
         this.diffuse.value = param4;
         this.specular.value = param5;
         this.ambientColor.value = param6;
         this.ambient.value = param7;
         this.radius.value = param8;
         this.fallOff.value = param9;
         this.directionTilt.value = param10;
         this.directionPan.value = param11;
      }
      
      public function save(param1:Object) : void
      {
         param1.version = 1;
         param1.visible = this.visible.value;
         param1.color = this.color.value;
         param1.diffuse = this.diffuse.value;
         param1.specular = this.specular.value;
         param1.ambientColor = this.ambientColor.value;
         param1.ambient = this.ambient.value;
         param1.radius = this.radius.value;
         param1.fallOff = this.fallOff.value;
         param1.directionTilt = this.directionTilt.value;
         param1.directionPan = this.directionPan.value;
      }
      
      public function method_3921(param1:Object) : void
      {
         var _loc2_:int = int(param1.version);
         if(_loc2_ == 1)
         {
            this.visible.value = method_4892(param1.visible,true);
            this.color.value = method_983(param1.color,16777215);
            this.diffuse.value = method_3438(param1.diffuse,1);
            this.specular.value = method_3438(param1.specular,1);
            this.ambientColor.value = method_983(param1.ambientColor,16777215);
            this.ambient.value = method_3438(param1.ambient,0);
            this.radius.value = method_3438(param1.radius,0);
            this.fallOff.value = method_3438(param1.fallOff,0);
            this.directionTilt.value = method_3438(param1.directionTilt,this.directionTilt.value);
            this.directionPan.value = method_3438(param1.directionPan,this.directionPan.value);
         }
      }
      
      public function copyFrom(param1:class_1771) : void
      {
         this.visible.value = param1.visible.value;
         this.color.value = param1.color.value;
         this.diffuse.value = param1.diffuse.value;
         this.specular.value = param1.specular.value;
         this.ambientColor.value = param1.ambientColor.value;
         this.ambient.value = param1.ambient.value;
         this.radius.value = param1.radius.value;
         this.fallOff.value = param1.fallOff.value;
         this.directionTilt.value = param1.directionTilt.value;
         this.directionPan.value = param1.directionPan.value;
      }
      
      public function get method_1703() : Boolean
      {
         return this.var_3886;
      }
      
      public function clone() : class_1771
      {
         return new class_1771(this.var_3886,this.visible.value,this.color.value,this.diffuse.value,this.specular.value,this.ambientColor.value,this.ambient.value,this.radius.value,this.fallOff.value,this.directionTilt.value,this.directionPan.value);
      }
      
      public function apply(param1:class_2102) : void
      {
         var _loc2_:* = null;
         param1.visible = this.visible.value;
         param1.color = this.color.value;
         param1.diffuse = this.diffuse.value;
         param1.specular = this.specular.value;
         param1.ambientColor = this.ambientColor.value;
         param1.ambient = this.ambient.value;
         if(param1 is PointLight)
         {
            PointLight(param1).radius = this.radius.value;
            PointLight(param1).fallOff = this.fallOff.value;
         }
         else
         {
            _loc2_ = DirectionalLight(param1).direction;
            class_2157.method_2709(this.directionTilt.value,this.directionPan.value,-1,_loc2_);
            DirectionalLight(param1).direction = _loc2_;
         }
      }
   }
}
