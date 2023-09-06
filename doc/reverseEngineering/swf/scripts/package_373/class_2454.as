package package_373
{
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import package_10.class_1173;
   import package_10.class_19;
   import package_19.class_70;
   import package_200.Settings3D;
   import package_295.class_1752;
   
   public class class_2454 extends class_1752 implements IDisposable
   {
       
      
      public const ready:class_70 = new class_70();
      
      protected var _descriptor:XML;
      
      private var _state:class_1173;
      
      private var var_1311:class_19;
      
      private var var_2785:Vector.<String>;
      
      public function class_2454(param1:XML, param2:class_1173 = null, param3:class_19 = null)
      {
         super();
         this._descriptor = param1;
         if(this._descriptor)
         {
            if(this._descriptor.attribute("includeIn").length() > 0)
            {
               this._state = param2;
               this._state.changed.add(this.reload);
               this.var_2785 = Vector.<String>(String(this._descriptor.@includeIn).split(","));
            }
            this.var_1311 = Settings3D.method_6337(this._descriptor.attribute("quality_settings")) || param3;
            if(this.var_1311)
            {
               this.var_1311.changed.add(this.reload);
            }
            this.reload(true);
         }
         else
         {
            setTimeout(this.ready.dispatch,1);
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         this.unloadView();
         if(this.var_1311)
         {
            this.var_1311.changed.remove(this.reload);
            this.var_1311 = null;
         }
         if(this._state)
         {
            this._state.changed.remove(this.reload);
         }
      }
      
      protected function method_352() : void
      {
      }
      
      protected function unloadView() : void
      {
      }
      
      protected function reload(param1:Boolean = false) : void
      {
         if((this.var_2785 == null || this.var_2785.indexOf(this._state.value) != -1) && (this.var_1311 == null || Boolean(this.var_1311.value)))
         {
            visible = true;
            this.method_352();
         }
         else
         {
            this.unloadView();
            visible = false;
            if(param1)
            {
               setTimeout(this.ready.dispatch,1);
            }
         }
      }
   }
}
