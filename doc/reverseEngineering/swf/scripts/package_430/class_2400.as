package package_430
{
   import away3d.animators.class_2120;
   import flash.geom.Vector3D;
   import package_431.class_2405;
   
   public class class_2400 implements class_2399
   {
       
      
      protected var var_3560:class_2405;
      
      protected var var_2808:Vector3D;
      
      protected var var_4672:Boolean = true;
      
      protected var _time:int;
      
      protected var _animator:class_2120;
      
      public function class_2400(param1:class_2120, param2:class_2405)
      {
         this.var_2808 = new Vector3D();
         super();
         this._animator = param1;
         this.var_3560 = param2;
      }
      
      public function get method_5121() : Vector3D
      {
         if(this.var_4672)
         {
            this.method_1087();
         }
         return this.var_2808;
      }
      
      public function set time(param1:int) : void
      {
         if(this._time == param1)
         {
            return;
         }
         this._time = param1;
         this.var_4672 = true;
      }
      
      protected function method_1087() : void
      {
      }
   }
}
