package package_380
{
   import com.greensock.TweenMax;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.model.traits.class_287;
   import net.bigpoint.darkorbit.map.model.traits.class_299;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_114.class_318;
   import package_22.class_1090;
   import package_22.class_198;
   import package_22.class_426;
   import package_27.class_82;
   import package_36.class_425;
   import package_75.class_349;
   import package_9.class_50;
   
   public class class_2158
   {
       
      
      private var _effect:class_425;
      
      public function class_2158(param1:class_1211, param2:class_425)
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         super();
         this._effect = param2;
         if(this._effect.attacker != null && this._effect.target != null)
         {
            _loc3_ = class_299(param2.attacker.method_1954(class_299)).rocketLauncher;
            _loc4_ = int(_loc3_.rocketClassId);
            if((_loc5_ = class_198.method_4446(_loc4_,this._effect.name_106)) == null)
            {
               _loc5_ = class_198.method_4446(0,1);
            }
            class_82.playSoundEffect(_loc5_.method_3142(),false,false,this._effect.attacker.position.x,this._effect.attacker.position.y);
            class_82.playSoundEffect(class_126.const_1493,false,false,this._effect.attacker.position.x,this._effect.attacker.position.y);
            _loc6_ = class_198.var_4122[0];
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < this._effect.method_2523)
            {
               _loc9_ = new class_2482(class_299(param2.attacker.method_1954(class_299)),this._effect.target.method_1954(class_287) as class_287,true,_loc5_,_loc6_,false,true,0.5 * _loc8_ / Number(param2.method_2523));
               param1.method_1616.addChild(_loc9_);
               _loc7_ = Math.max(_loc7_,_loc9_.duration);
               _loc8_++;
            }
            if(this._effect.method_1885)
            {
               TweenMax.delayedCall(_loc7_,this.method_5854);
            }
         }
      }
      
      public function method_5854() : void
      {
         if(false)
         {
            class_50.getInstance().map.effects.method_5084(new class_349(this._effect.target,0));
         }
      }
   }
}
