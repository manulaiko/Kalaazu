package package_423
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import flash.display.MovieClip;
   import net.bigpoint.darkorbit.map.model.ship.class_1861;
   import package_360.class_2084;
   import package_360.class_2381;
   
   public class class_2355
   {
       
      
      private var var_127:class_2084;
      
      private var var_176:class_1861;
      
      private var var_931:int = 0;
      
      private var name_99:Number = 0.4;
      
      private var var_1646:class_2381;
      
      private var var_1653:int = -1;
      
      public function class_2355(param1:class_1861, param2:class_2084)
      {
         super();
         this.var_176 = param1;
         this.var_127 = param2;
         this.var_127.base.loaded.add(this.init);
      }
      
      private function init() : void
      {
         var _loc1_:* = null;
         if(this.var_127.base.clip)
         {
            if(!this.var_1646)
            {
               this.var_1646 = new class_2381();
            }
            _loc1_ = this.var_127.base.clip["light"] as MovieClip;
            if(_loc1_)
            {
               _loc1_.stop();
               this.var_1646.loop = false;
               this.var_1646.rotatable = true;
               this.var_1646.clip = _loc1_;
               this.var_1646.method_2447 = this.var_127.ship.rotation;
            }
         }
      }
      
      public function method_1450(param1:int) : void
      {
         if(this.var_127.base.clip)
         {
            this.var_1653 = param1;
            this.method_4635();
         }
         else
         {
            TweenLite.delayedCall(1,this.method_1450,[param1]);
         }
      }
      
      public function method_4635() : void
      {
         --this.var_1653;
         if(this.var_127.base.clip != null)
         {
            if(this.var_931 == 0)
            {
               TweenLite.to(this.var_1646.clip,this.name_99,{"colorTransform":{
                  "tint":this.var_176.method_167,
                  "tintAmount":this.var_176.tintAmount
               }});
               TweenLite.to(this.var_1646.clip,this.name_99,{"glowFilter":{
                  "color":this.var_176.method_167,
                  "blurX":this.var_176.method_3525,
                  "blurY":this.var_176.method_1940,
                  "strength":this.var_176.glowStrength,
                  "alpha":this.var_176.method_2372
               }});
               this.var_931 = 1;
            }
            else if(this.var_931 == 1)
            {
               TweenLite.to(this.var_1646.clip,this.name_99,{"colorTransform":{
                  "tint":this.var_176.method_6299,
                  "tintAmount":0
               }});
               TweenLite.to(this.var_1646.clip,this.name_99,{"glowFilter":{
                  "color":this.var_176.method_6299,
                  "blurX":0,
                  "blurY":0,
                  "strength":0,
                  "alpha":0
               }});
               this.var_931 = 0;
            }
         }
         if(this.var_1653 > -1)
         {
            TweenMax.delayedCall(this.var_176.method_3723,this.method_4635);
         }
      }
      
      public function get method_6491() : int
      {
         return this.var_1653;
      }
   }
}
