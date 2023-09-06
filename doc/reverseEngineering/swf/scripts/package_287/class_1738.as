package package_287
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import net.bigpoint.darkorbit.map.class_87;
   import package_10.class_305;
   import package_195.class_1203;
   import package_75.class_337;
   import package_9.ResourceManager;
   import package_99.class_266;
   
   public class class_1738 extends class_1203
   {
      
      private static const const_816:class_73 = new class_73();
      
      private static const const_2063:class_73 = new class_73();
       
      
      private var _effect:class_337;
      
      private var var_2983:MovieClip;
      
      public function class_1738(param1:class_87, param2:class_337)
      {
         this._effect = param2;
         super(param1,new class_305(param2.method_1567.x,param2.method_1567.y,0));
         this.var_2983 = ResourceManager.getMovieClip("ui","tutorial_arrow");
         this.var_2983.mouseChildren = false;
         this.var_2983.mouseEnabled = false;
         this.var_2983.alpha = 0;
         addChild(this.var_2983);
         TweenLite.to(this.var_2983,0.5,{"alpha":1});
      }
      
      override public function updateObj(param1:Number) : void
      {
         super.updateObj(param1);
         _mapView.method_4683(this._effect.name_67.x,this._effect.name_67.y,0,const_816);
         _mapView.method_4683(this._effect.method_1567.x,this._effect.method_1567.y,0,const_2063);
         this.var_2983.rotation = Math.atan2(0 - 0,0 - 0) * 0;
      }
   }
}
