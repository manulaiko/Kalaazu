package package_279
{
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.model.traits.class_287;
   import net.bigpoint.darkorbit.map.model.traits.class_308;
   import package_112.class_307;
   import package_29.class_85;
   import package_9.class_50;
   
   public class class_2014 extends Sprite implements IDisposable
   {
      
      private static const const_2618:int = 2894892;
      
      private static const const_141:int = 7105644;
      
      private static const const_191:int = 0;
       
      
      private var var_2706:Shape;
      
      private var var_1504:Shape;
      
      private var var_4715:Shape;
      
      private var var_1267:class_2320;
      
      private var var_176:class_308;
      
      private var var_4546:class_287;
      
      private var _config:class_2328;
      
      public function class_2014(param1:class_308)
      {
         this.var_2706 = new Shape();
         this.var_1504 = new Shape();
         this.var_4715 = new Shape();
         this.var_1267 = new class_2320();
         this._config = new class_2328();
         super();
         this.var_176 = param1;
         this.var_4546 = this.var_176.owner.method_1954(class_287) as class_287;
         if(param1.var_1888)
         {
            this._config.width = param1.var_1888;
         }
         addChild(this.var_1267);
         this.var_1267.gap = 2;
         this.var_1267.method_4524 = false;
         this.var_1267.addElement(this.var_1504);
         this.var_1267.addElement(this.var_4715);
         this.var_1267.addElement(this.var_2706);
         this.update();
         if(this.var_4546)
         {
            class_50.getInstance().map.method_4929.targetChanged.add(this.method_6526);
         }
         this.var_176.changed.add(this.update);
         this.method_6526(class_50.getInstance().map.method_4929.target);
      }
      
      private function method_6526(param1:class_85) : void
      {
         var _loc2_:class_86 = this.var_176.owner as class_86;
         if(_loc2_)
         {
            this.visible = param1 == this.var_4546.owner || Boolean(_loc2_.method_6225()) || _loc2_ is class_307 && Boolean((_loc2_ as class_307).isHeroPet());
         }
         else if(this.var_4546 != null)
         {
            this.visible = param1 == this.var_4546.owner;
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         this.var_176.changed.remove(this.update);
         if(this.var_4546)
         {
            class_50.getInstance().map.method_4929.targetChanged.remove(this.method_6526);
         }
      }
      
      private function update() : void
      {
         var _loc1_:* = null;
         if(visible)
         {
            _loc1_ = new Vector.<DisplayObject>();
            if(this.var_176.hp.value > 0)
            {
               _loc1_.push(this.var_1504);
               this.method_1249(this.var_1504,this._config.method_2541,Number(this.var_176.hp.value) / Number(this.var_176.const_3026.value));
            }
            if(this.var_176.const_2381.value > 0)
            {
               _loc1_.push(this.var_4715);
               this.method_1249(this.var_4715,this._config.method_3762,Number(this.var_176.const_2381.value) / Number(this.var_176.const_805.value));
            }
            if(this.var_176.shield.value > 0)
            {
               _loc1_.push(this.var_2706);
               this.method_1249(this.var_2706,this._config.method_180,Number(this.var_176.shield.value) / Number(this.var_176.maxShield.value));
            }
            this.var_1267.method_3502(_loc1_);
         }
      }
      
      private function method_1249(param1:Shape, param2:uint, param3:Number) : void
      {
         param1.graphics.clear();
         param1.graphics.lineStyle(const_191,const_2618,1,true);
         param1.graphics.beginFill(const_141);
         param1.graphics.drawRect(-Number(const_191),-Number(const_191),this._config.width + 2 * Number(const_191),this._config.height + 2 * Number(const_191));
         param1.graphics.endFill();
         if(!isNaN(param3))
         {
            param1.graphics.beginFill(param2);
            param1.graphics.drawRect(0,0,Math.max(0,Math.min(1,param3)) * Number(this._config.width),this._config.height);
            param1.graphics.endFill();
         }
      }
      
      public function get config() : class_2328
      {
         return this._config;
      }
      
      public function set config(param1:class_2328) : void
      {
         if(this._config)
         {
            this._config.changed.remove(this.update);
         }
         this._config = param1;
         if(this._config)
         {
            this._config.changed.add(this.update);
         }
         this.update();
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(param1 != visible)
         {
            super.visible = param1;
            if(param1)
            {
               this.update();
            }
         }
      }
   }
}
