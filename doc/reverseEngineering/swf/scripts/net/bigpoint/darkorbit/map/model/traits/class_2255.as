package net.bigpoint.darkorbit.map.model.traits
{
   import package_29.class_267;
   import package_75.class_1856;
   import package_9.class_50;
   
   public class class_2255 extends class_267
   {
       
      
      private var _enabled:Boolean;
      
      private var _effect:class_1856;
      
      public function class_2255(param1:Boolean = false, param2:uint = 0, param3:uint = 0, param4:Boolean = false, param5:Number = 4)
      {
         super();
         this._enabled = param1;
         this._effect = new class_1856(null);
         this._effect.method_5815 = param2;
         this._effect.method_5087 = param3;
         this._effect.method_5290 = param4;
         this._effect.cycleTime = param5;
      }
      
      override public function method_6037() : void
      {
         this._effect.position = owner.position;
         class_50.getInstance().map.effects.method_5084(this._effect);
      }
      
      override public function method_2753() : void
      {
         this.disable();
      }
      
      public function enable(param1:uint = 0, param2:uint = 0, param3:Boolean = false, param4:Number = 4) : void
      {
         this._effect.method_5815 = param1;
         this._effect.method_5087 = param2;
         this._effect.method_5290 = param3;
         this._effect.cycleTime = param4;
         if(Boolean(owner) && this._enabled == false)
         {
            class_50.getInstance().map.effects.method_5084(this._effect);
         }
         this._enabled = true;
      }
      
      public function disable() : void
      {
         class_50.getInstance().map.effects.method_1847(this._effect);
         this._enabled = false;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
   }
}
