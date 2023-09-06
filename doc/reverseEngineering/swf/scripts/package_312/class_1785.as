package package_312
{
   import com.bigpoint.utils.class_129;
   import com.bigpoint.utils.class_73;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import net.bigpoint.darkorbit.map.model.traits.class_1180;
   import net.bigpoint.darkorbit.map.model.traits.class_2255;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import package_10.class_19;
   import package_10.class_20;
   import package_10.class_2254;
   import package_100.class_313;
   import package_29.class_85;
   import package_38.class_439;
   import package_38.class_868;
   
   public class class_1785 extends class_85
   {
      
      private static const const_161:Array = [];
      
      {
         const_161[class_439.MMO] = "lock_mmo";
         const_161[class_439.EIC] = "lock_eic";
         const_161[class_439.VRU] = "lock_vru";
      }
      
      public const name_70:class_20 = new class_20(100);
      
      public const name_75:class_20 = new class_20();
      
      public const name_167:class_20 = new class_20();
      
      public const name_153:class_2254 = new class_2254(Vector.<Object>(new Vector.<class_439>()));
      
      public const const_822:class_19 = new class_19();
      
      public const const_2579:class_19 = new class_19();
      
      public const enabled:class_19 = new class_19();
      
      private var var_1146:Number = 0;
      
      private var var_630:class_313;
      
      private var var_816:class_1180;
      
      private var _timer:Timer;
      
      private var _tpf:int;
      
      private var var_1360:Boolean = false;
      
      public function class_1785(param1:class_868)
      {
         this._timer = new Timer(1000);
         super(param1.name_115,new class_73(param1.var_4787,param1.var_2295));
         UberAssetsLib.instance.fillTraits(this,"sectorControlBeacon",UberAssetsLib.LIB_DEFAULT,this.method_1071);
         addTrait(new class_2255(true));
         this.var_630 = new class_313("");
         this.var_816 = method_1954(class_1180) as class_1180;
         this.var_816.const_250.value = class_1180.const_2201;
         this.var_816.enabled.value = true;
         addTrait(this.var_630);
         this.name_153.changed.add(this.method_1148);
         this.name_167.changed.add(this.method_4398);
         this._timer.addEventListener(TimerEvent.TIMER,this.updateTimer);
         this._tpf = getTimer();
         this.updateTimer();
         this.method_4398();
      }
      
      override public function method_166() : void
      {
         this._timer.stop();
         super.method_166();
      }
      
      public function get method_4671() : Boolean
      {
         return this.name_167.value == this.name_70.value || this.name_167.value == 0;
      }
      
      public function get method_1548() : Number
      {
         return Number(this.name_167.value) / Number(this.name_70.value);
      }
      
      public function method_3415() : Boolean
      {
         switch(this.name_153.length)
         {
            case 0:
               return false;
            case 1:
               if((this.name_153.getElementAt(0) as class_439).faction == this.name_75.value && Boolean(this.const_2579.value))
               {
                  return false;
               }
               break;
         }
         return true;
      }
      
      private function method_4398() : void
      {
         if(this.name_70.value == this.name_167.value)
         {
            this.const_2579.value = true;
         }
         else if(this.name_167.value == 0)
         {
            this.const_2579.value = false;
         }
      }
      
      private function method_1148() : void
      {
         var _loc1_:Vector.<class_439> = Vector.<class_439>(this.name_153.value);
         _loc1_.sort(this.method_5191);
         var _loc2_:uint = _loc1_.length;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            while(_loc3_ + 1 < _loc1_.length && _loc1_[_loc3_].faction == _loc1_[_loc3_ + 1].faction)
            {
               _loc1_.splice(_loc3_,1);
            }
            _loc3_++;
         }
      }
      
      private function method_5191(param1:class_439, param2:class_439) : int
      {
         return Number(param1.faction) - Number(param2.faction);
      }
      
      private function updateTimer(param1:TimerEvent = null) : void
      {
         this.var_1146 = Math.max(0,this.var_1146 - (getTimer() - Number(this._tpf)));
         this._tpf = getTimer();
         this.update();
      }
      
      private function update() : void
      {
         this.var_816.text.value = class_129.method_1101(Number(this.var_1146) * 0.001);
         this.var_1360 = this.var_1146 > 0;
         if(this.var_1360)
         {
            this._tpf = getTimer();
            this._timer.start();
            this.var_630.resKey = true || false;
            addTrait(this.var_816);
         }
         else
         {
            this._timer.stop();
            this.var_630.resKey = "";
            removeTrait(this.var_816);
         }
      }
      
      private function method_1071() : void
      {
      }
      
      public function set name_4(param1:Number) : void
      {
         this.var_1146 = param1;
         this.update();
      }
   }
}
