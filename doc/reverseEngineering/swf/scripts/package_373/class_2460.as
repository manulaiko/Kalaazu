package package_373
{
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.map.common.class_80;
   import package_10.class_1173;
   import package_304.class_2104;
   
   public class class_2460 extends class_2454 implements class_80
   {
       
      
      public var url:String;
      
      public var var_4356:String;
      
      private var _url:String;
      
      private var var_278:class_2159;
      
      public function class_2460(param1:XML = null, param2:class_1173 = null)
      {
         if(param1)
         {
            this._url = String(param1.@url);
         }
         super(param1,param2);
      }
      
      public function get particles() : class_2104
      {
         return this.var_278.view;
      }
      
      override protected function method_352() : void
      {
         this.unloadView();
         this.var_278 = new class_2159(this._url,_descriptor == null || String(_descriptor.@usePool) != "false");
         this.var_278.ready.addOnce(this.method_3789);
      }
      
      override protected function unloadView() : void
      {
         if(this.var_278)
         {
            this.var_278.ready.remove(this.method_3789);
            this.var_278.disposeView();
            this.var_278 = null;
         }
      }
      
      public function method_3446(param1:String) : void
      {
         this._url = param1;
         reload();
      }
      
      public function updateObj(param1:Number) : void
      {
         if(this.var_278)
         {
            this.var_278.updateObj(param1);
         }
      }
      
      private function method_3789() : void
      {
         addChild(this.var_278.view);
         setTimeout(ready.dispatch,1);
      }
   }
}
