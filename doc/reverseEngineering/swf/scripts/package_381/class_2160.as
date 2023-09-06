package package_381
{
   import com.bigpoint.utils.class_73;
   import flash.geom.Vector3D;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import package_29.class_85;
   import package_35.Effect;
   import package_35.class_348;
   import package_373.class_2159;
   
   public class class_2160 extends class_2159 implements class_80, IDisposable
   {
       
      
      private var _target:class_85;
      
      private var var_727:class_73;
      
      private var var_4494:Vector3D;
      
      public function class_2160(param1:Effect, param2:String, param3:class_73, param4:class_85 = null, param5:Boolean = false, param6:Number = 0, param7:Boolean = true)
      {
         this.var_727 = param3;
         if(param4 == null && param1 is class_348)
         {
            param4 = class_348(param1).source;
         }
         this._target = param4;
         super(param2,param5,param6,param7);
      }
      
      override public function updateObj(param1:Number) : void
      {
         var _loc2_:* = null;
         if(this._target)
         {
            _loc2_ = this._target.method_1954(class_306) as class_306;
            if(_loc2_)
            {
               scale = _loc2_.method_4449;
            }
         }
         if(this.var_727)
         {
            if(this.var_4494)
            {
               view.moveTo(this.var_727.x + this.var_4494.x,this.var_727.z + this.var_4494.y,-Number(this.var_727.y) + this.var_4494.z);
            }
            else
            {
               view.moveTo(this.var_727.x,this.var_727.z,-Number(this.var_727.y));
            }
         }
         super.updateObj(param1);
      }
      
      override protected function method_1460() : void
      {
         class_1210.instance.method_3528.method_1164(this);
         class_1210.instance.method_3528.method_1616.addChild(view);
         super.method_1460();
      }
      
      override protected function method_2298() : void
      {
         class_1210.instance.method_3528.method_3592(this);
         super.method_2298();
      }
      
      public function get method_1632() : Vector3D
      {
         if(this.var_4494 == null)
         {
            this.var_4494 = new Vector3D(0,0,0);
         }
         return this.var_4494;
      }
   }
}
