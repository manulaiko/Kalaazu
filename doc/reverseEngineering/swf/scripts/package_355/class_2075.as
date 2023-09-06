package package_355
{
   import com.greensock.TweenLite;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_11.class_39;
   import package_27.class_82;
   import package_286.class_1734;
   import package_29.class_85;
   import package_36.class_406;
   import package_9.ResourceManager;
   
   public class class_2075 extends class_1734
   {
       
      
      private var _effect:class_406;
      
      private var _map:class_1206;
      
      public function class_2075(param1:class_1206, param2:class_406)
      {
         this._map = param1;
         this._effect = param2;
         super(param1,param2);
      }
      
      override protected function method_30() : void
      {
         var _loc1_:* = null;
         if(this.name_64 != null && this.name_51 != null)
         {
            this._map.fxLayer.addChild(this);
            x = this.name_64.position.x;
            y = this.name_64.position.y;
            TweenLite.to(this,1,{
               "dynamicProps":{
                  "x":this.method_791,
                  "y":this.method_853
               },
               "onComplete":disposeView
            });
            _loc1_ = class_39(ResourceManager.name_15.getFinisher(this._effect.method_1509));
            if(_loc1_)
            {
               addChild(_loc1_.getEmbeddedMovieClip("mc"));
            }
            class_82.playSoundEffect(class_126.const_1325,false,false,this.name_64.position.x,this.name_64.position.y,true);
         }
      }
      
      private function get name_51() : class_85
      {
         return this._effect.target;
      }
      
      private function get name_64() : class_85
      {
         return this._effect.attacker;
      }
      
      private function method_791() : Number
      {
         return this.name_51.position.x;
      }
      
      private function method_853() : Number
      {
         return this.name_51.position.y;
      }
   }
}
