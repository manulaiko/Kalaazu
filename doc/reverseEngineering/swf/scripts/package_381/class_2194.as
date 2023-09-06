package package_381
{
   import flash.media.Sound;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_75.class_371;
   import package_9.ResourceManager;
   
   public class class_2194 extends class_2160
   {
      
      private static const const_364:String = "soundfx";
      
      private static const const_48:String = "abstract_ui_achievement_unlocked.zip";
       
      
      private var _effect:class_371;
      
      public function class_2194(param1:class_1211, param2:class_371)
      {
         this._effect = param2;
         super(param2,const_48,param2.source.position,param2.source);
      }
      
      override protected function method_1460() : void
      {
         var _loc1_:* = null;
         super.method_1460();
         if(false)
         {
            _loc1_ = ResourceManager.getSound(this._effect.pattern.resKey,const_364);
            if(_loc1_ != null)
            {
               _loc1_.play();
            }
         }
      }
   }
}
