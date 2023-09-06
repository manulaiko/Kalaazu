package package_75
{
   import com.bigpoint.utils.class_73;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import net.bigpoint.darkorbit.map.model.class_90;
   import package_22.FullResourcePattern;
   import package_258.class_2079;
   import package_29.class_85;
   import package_35.class_338;
   import package_35.class_348;
   
   public class class_1871 extends class_348
   {
      
      private static const const_2294:FullResourcePattern = new FullResourcePattern(-1,"cameraDrone","mc");
      
      private static const const_3265:int = 200;
       
      
      private const ID:int = class_90.method_5486;
      
      private var var_4347:class_2079;
      
      private var var_1740:int = -1;
      
      private var _map:class_90;
      
      public function class_1871(param1:class_85, param2:class_90)
      {
         this._map = param2;
         super(class_338.const_1573,param1,const_2311);
      }
      
      override public function activate() : Boolean
      {
         this.var_4347 = new class_2079(const_2294,true,false);
         var _loc1_:class_85 = new class_85(this.ID,new class_73(source.x,source.y));
         _loc1_.addTrait(this.var_4347);
         source.position.changed.add(this.method_3495);
         this._map.method_4903(_loc1_);
         this.updateTimer();
         return super.activate();
      }
      
      override public function deactivate() : void
      {
         super.deactivate();
         clearInterval(this.var_1740);
         source.position.changed.remove(this.updateTimer);
         this._map.method_918(this.ID);
      }
      
      public function updateTimer() : void
      {
         var _loc1_:class_73 = this.method_6126();
         if(_loc1_)
         {
            this.var_4347.position.x = _loc1_.x;
            this.var_4347.position.y = _loc1_.y;
         }
         else
         {
            clearInterval(this.var_1740);
            this.var_1740 = -1;
         }
         this.var_4347.rotation.radians = Math.atan2(Number(this.var_4347.position.y) - 0,Number(this.var_4347.position.x) - 0);
      }
      
      private function method_3495() : void
      {
         if(this.var_1740 == -1)
         {
            this.var_1740 = setInterval(this.updateTimer,1);
         }
      }
      
      private function method_6126() : class_73
      {
         var _loc1_:class_73 = source.position.subtract(this.var_4347.position);
         if(_loc1_.length < const_3265)
         {
            return null;
         }
         var _loc2_:Number = Number(_loc1_.length);
         _loc1_.normalize((_loc2_ - Number(const_3265) * 1.25) * 0.1);
         return _loc1_.add(this.var_4347.position);
      }
   }
}
