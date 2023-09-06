package package_424
{
   import net.bigpoint.darkorbit.map.common.class_80;
   
   public class class_2565 implements class_80
   {
       
      
      private var _target:Object;
      
      private var _props:Object;
      
      public function class_2565(param1:Object, param2:Object)
      {
         this._props = {};
         super();
         this._target = param1;
         this._props = param2;
      }
      
      public function updateObj(param1:Number) : void
      {
         var _loc2_:* = null;
         if(this._target)
         {
            for(_loc2_ in this._props)
            {
               this._target[_loc2_] += Number(this._props[_loc2_]) * param1;
            }
         }
      }
   }
}
