package package_444
{
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.ship.class_1860;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_2135;
   
   public class class_2466 implements IDisposable
   {
       
      
      private var _owner:class_2135;
      
      public function class_2466(param1:class_1860, param2:class_2135)
      {
         super();
         this._owner = param2;
         if(Boolean(this._owner) && Boolean(this._owner.method_4434("pod")))
         {
            this._owner.method_4434("pod").visible = true;
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         if(Boolean(this._owner) && Boolean(this._owner.method_4434("pod")))
         {
            this._owner.method_4434("pod").visible = false;
         }
      }
   }
}
