package package_427
{
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.mvc.display.class_1708;
   import package_27.class_82;
   import package_289.class_2366;
   import package_359.class_2082;
   import package_359.class_2363;
   import package_45.class_366;
   import package_9.class_50;
   
   public class class_2369 implements class_80, IDisposable, class_2366
   {
       
      
      private var var_176:class_306;
      
      private var var_195:class_366;
      
      private var var_127:class_2082;
      
      private var _label:class_2567;
      
      private var var_2893:class_2566;
      
      private var var_5041:class_2363;
      
      private var var_3888:uint;
      
      public function class_2369()
      {
         super();
      }
      
      public function method_1804(param1:class_306, param2:class_2082, param3:Object) : void
      {
         var _loc4_:* = null;
         this.var_176 = param1;
         this.var_127 = param2;
         this.var_195 = param1.owner as class_366;
         this.var_5041 = this.var_127.method_4434("portalView") as class_2363;
         if(this.var_5041)
         {
            if(this.var_5041.view.getViewById("labelF") != null)
            {
               this._label = new class_2567(this.var_5041.view.getViewById("labelF") as class_1708);
               _loc4_ = String(param3.xml.@displayTextKey);
               this._label.text = !!_loc4_ ? class_88.getItem(_loc4_) : " -- ";
            }
            if(this.var_5041.view.getViewById("map_preview") != null)
            {
               this.var_2893 = new class_2566(this.var_5041.view,param1.owner.position);
            }
            if(class_50.getInstance().map.method_5762 > 10000)
            {
               this.var_5041.view.startTween("spawn_animation");
               if(this.var_195)
               {
                  class_82.playSoundEffect(class_126.const_2261,false,false,this.var_195.x,this.var_195.y);
               }
            }
            else
            {
               this.var_5041.view.startTween("spawn_no_animation");
            }
            if(this.var_195)
            {
               this.var_195.const_381.add(this.method_2041);
            }
            return;
         }
         throw new Error("no portalView");
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         this.var_195.const_381.remove(this.method_2041);
         clearTimeout(this.var_3888);
         if(this._label)
         {
            this._label.disposeView();
         }
      }
      
      private function method_2041(param1:Number = 0) : void
      {
         if(this.var_5041)
         {
            this.var_5041.view.startTween("jumpOn");
         }
         class_82.playSoundEffect(class_126.const_2212,false,false,this.var_195.x,this.var_195.y);
         if(param1 > 0)
         {
            this.var_3888 = setTimeout(this.method_3505,param1 * 1000);
         }
      }
      
      private function method_3505() : void
      {
         if(Boolean(this.var_5041) && Boolean(this.var_5041.view))
         {
            this.var_5041.view.startTween("jumpOff");
         }
      }
      
      public function updateObj(param1:Number) : void
      {
         if(this.var_2893)
         {
            this.var_2893.updateObj(param1);
         }
      }
   }
}
