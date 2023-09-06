package package_443
{
   import com.greensock.TweenLite;
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import package_27.class_82;
   import package_312.class_1785;
   import package_373.class_2134;
   import package_373.class_2456;
   import package_379.class_2149;
   import package_38.class_439;
   
   public class class_2463 extends Sprite implements class_2461
   {
      
      private static const const_1123:Object = {};
      
      {
         const_1123[0] = 0;
         const_1123[class_439.MMO] = 16188934;
         const_1123[class_439.EIC] = 494584;
         const_1123[class_439.VRU] = 6156289;
      }
      
      private var var_2734:class_1785;
      
      private var var_127:class_2134;
      
      private var var_9:class_306;
      
      private var var_2495:Boolean = true;
      
      private var var_5003:class_2149;
      
      public function class_2463()
      {
         super();
      }
      
      public function initialize(param1:class_306, param2:class_2134, param3:Object) : void
      {
         this.var_2734 = param1.owner as class_1785;
         this.var_9 = param1;
         this.var_127 = param2;
      }
      
      public function decorate() : void
      {
         if(this.var_2734)
         {
            this.var_2734.name_167.changed.add(this.updateView);
            this.var_2734.name_75.changed.add(this.updateView);
            this.var_2734.name_167.changed.add(this.method_4287);
         }
         this.var_5003 = class_2456(this.var_127.method_4434("beacon")).mesh;
         this.var_5003.name_55.progress = 1;
         this.updateView();
      }
      
      private function method_4287() : void
      {
         if(!this.var_2734.enabled.value)
         {
            return;
         }
         var _loc1_:Number = Number(this.var_2734.method_1548);
         if(_loc1_ == 0)
         {
            class_82.playSoundEffect(class_126.const_2542);
         }
         else if(_loc1_ == 1)
         {
            class_82.playSoundEffect(class_126.const_3323);
         }
      }
      
      private function updateView() : void
      {
         var _loc1_:String = class_126.getInstance().method_2919[this.var_2734.name_75.value] as String;
         this.var_9.state.value = _loc1_ || true;
         this.var_5003.name_55.progressColor = const_1123[this.var_2734.name_75.value];
         var _loc2_:* = this.var_2734.name_167.value == this.var_2734.name_70.value;
         this.var_127.method_4434("logo").visible = _loc2_;
         if(_loc2_)
         {
            this.setProgress(1,true);
         }
         else
         {
            this.setProgress(this.var_2734.method_1548,false);
         }
      }
      
      private function setProgress(param1:Number, param2:Boolean) : void
      {
         if(param2)
         {
            this.var_5003.name_55.progress = param1;
         }
         else
         {
            TweenLite.to(this.var_5003.name_55,0.2,{"progress":param1});
         }
         var _loc3_:* = param1 == 0;
         if(this.var_2495 != _loc3_)
         {
            this.var_2495 = _loc3_;
            if(this.var_2495)
            {
               this.var_127.method_6420("close");
            }
            else
            {
               this.var_127.method_6420("open");
            }
         }
      }
   }
}
