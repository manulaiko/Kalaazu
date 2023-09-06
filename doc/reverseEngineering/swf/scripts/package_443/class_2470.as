package package_443
{
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import package_364.class_2102;
   import package_373.class_2134;
   import package_373.class_2456;
   
   public class class_2470 implements class_2461, IDisposable
   {
       
      
      private var var_127:class_2134;
      
      private var var_1059:Boolean = false;
      
      private var _ship:class_86;
      
      public function class_2470()
      {
         super();
      }
      
      public function initialize(param1:class_306, param2:class_2134, param3:Object) : void
      {
         this._ship = param1.owner as class_86;
         this.var_127 = param2;
         if(this._ship.method_6225())
         {
            this.var_127.addChild(class_1210.instance.name_10.hero);
         }
      }
      
      public function decorate() : void
      {
         class_1210.instance.method_3528.method_4821.const_3022.changed.add(this.method_3048);
         this.method_3048();
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         var _loc2_:* = null;
         class_1210.instance.method_3528.method_4821.const_3022.changed.remove(this.method_3048);
         if(this._ship.method_6225())
         {
            _loc2_ = class_1210.instance.name_10.hero;
            if(_loc2_.parent == this.var_127)
            {
               _loc2_.parent.removeChild(_loc2_);
            }
         }
      }
      
      private function method_3048() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = class_1210.instance.method_3528.method_4821.const_3022.value > 1.3;
         if(this.var_1059 != _loc1_)
         {
            this.var_1059 = _loc1_;
            for each(_loc2_ in this.var_127.method_3287)
            {
               _loc2_.mesh.method_3545.const_517.value = !!this.var_1059 ? 2 : 1;
            }
         }
      }
   }
}
