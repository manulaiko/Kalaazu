package package_354
{
   import com.bigpoint.utils.class_73;
   import flash.filters.BlurFilter;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_136.class_393;
   import package_14.class_52;
   import package_286.class_2019;
   import package_29.class_85;
   import package_413.class_2335;
   import package_415.Move;
   import package_415.class_2342;
   import package_417.class_2339;
   import package_418.class_2341;
   import package_419.Position;
   import package_419.class_2343;
   import package_421.class_2347;
   import package_422.class_2349;
   import package_422.class_2350;
   import package_422.class_2351;
   import package_9.class_50;
   
   public class class_2023 extends class_2019 implements class_52
   {
       
      
      private var var_1493:Boolean;
      
      private const const_1910:Number = 550;
      
      private const const_777:Number = 40;
      
      private const const_1227:Number = 57.29577951308232;
      
      private var var_5017:class_2339;
      
      private var var_811:class_2347;
      
      private var var_747:class_2343;
      
      private var var_2242:Move;
      
      private var _angle:Number;
      
      private var var_4321:Number;
      
      private var _distance:Number;
      
      private var var_2850:Number;
      
      private var _oldHeight:Number;
      
      private var var_3662:Number;
      
      private var var_2696:class_2341;
      
      private var var_460:class_85;
      
      private var var_2688:class_85;
      
      private var var_1278:class_73;
      
      private var var_1622:class_73;
      
      private var var_2933:class_2351;
      
      private var _color:int;
      
      private var var_2102:Number;
      
      public function class_2023(param1:class_1206, param2:class_393)
      {
         this.var_2242 = new Move();
         this.var_2933 = new class_2351(new Point(0,0),200);
         this._color = param2.color;
         super(param1,param2);
      }
      
      private function get method_1809() : class_393
      {
         return effect as class_393;
      }
      
      override protected function method_30() : void
      {
         super.method_30();
         this.var_5017 = new class_2339();
         this.var_5017.method_6355(new class_2335(this._color,this._color));
         var _loc1_:class_2349 = new class_2349(new Point(0,0));
         var _loc2_:Position = new Position(_loc1_);
         this.var_5017.method_6355(_loc2_);
         this.method_2399(this.method_1809.source.position,this.method_1809.target.position,this.method_1809.source as class_85,this.method_1809.target as class_85);
      }
      
      private function method_2050(param1:Point, param2:Number) : void
      {
         this.var_2933.center = param1;
         this.var_2933.outerRadius = param2 + 200;
      }
      
      private function method_2399(param1:class_73, param2:class_73, param3:class_85 = null, param4:class_85 = null) : void
      {
         this.var_2102 = 1280;
         this.var_1278 = param1;
         this.var_1622 = param2;
         this.var_460 = param3;
         this.var_2688 = param4;
         if(param1 == null || param2 == null)
         {
            return;
         }
         this.var_2850 = Math.sqrt(Math.pow(Number(param2.y) - Number(param1.y),2) + Math.pow(Number(param2.x) - Number(param1.x),2));
         this.var_2850 = this.var_2850 > this.var_2102 ? 20 : Number(this.var_2850);
         this._oldHeight = Number(this.var_2850) * 40 / 550 << 1;
         var _loc5_:BlurFilter = new BlurFilter(4,4,1);
         var _loc6_:ColorMatrixFilter = new ColorMatrixFilter([1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.99,0]);
         if(this.var_2850 == 0 || this._oldHeight == 0)
         {
            this.var_2850 = 249;
            this._oldHeight = 36;
         }
         this.var_811 = new class_2347(new Rectangle(0,Number(this._oldHeight) * -0.5,this.var_2850,this._oldHeight));
         this.var_811.name = "renderer";
         this.var_811.addFilter(_loc5_);
         this.var_811.addFilter(_loc6_);
         this.var_2696 = new class_2341(0.2,10);
         this.updateTimer(0);
         var _loc7_:Point = new Point(550,40);
         var _loc8_:Point = new Point(550,-40);
         var _loc9_:class_2350 = new class_2350(_loc7_,_loc8_);
         this.var_747 = new class_2343(_loc9_);
         if(this.var_5017 == null)
         {
            this.var_5017 = new class_2339();
         }
         this.var_5017.method_6355(this.var_747);
         var _loc10_:class_2342 = new class_2342(this.var_2933,true);
         this.var_5017.method_399(_loc10_);
         this.var_5017.counter = this.var_2696;
         this.var_5017.method_399(this.var_2242);
         this.var_811.method_35(this.var_5017);
         if(getChildByName("renderer") == null)
         {
            addChild(this.var_811);
         }
         if(method_5878 != null)
         {
            method_5878.addChild(this);
         }
         this.var_5017.start();
         class_50.method_5621(this);
      }
      
      private function method_5765() : void
      {
         class_50.removeObserver(this);
         this.var_2696.stop();
         this.var_5017.method_1335();
         this.var_5017.method_587(this.var_747);
         this.var_5017.method_3616(this.var_2242);
      }
      
      public function updateTimer(param1:Number) : void
      {
         if(!this.var_1493)
         {
            if(this.var_2688 != null && Boolean(class_50.getInstance().map.method_1203().method_2455(this.var_2688.id)))
            {
               this.var_1622.x = this.var_2688.position.x;
               this.var_1622.y = this.var_2688.position.y;
            }
            if(this.var_460 != null && Boolean(class_50.getInstance().map.method_1203().method_2455(this.var_460.id)))
            {
               this.var_1278.x = this.var_460.position.x;
               this.var_1278.y = this.var_460.position.y;
            }
            this._angle = Math.atan2(Number(this.var_1622.y) - Number(this.var_1278.y),Number(this.var_1622.x) - Number(this.var_1278.x)) * 57.29577951308232;
            this._distance = Math.sqrt(Math.pow(Number(this.var_1622.y) - Number(this.var_1278.y),2) + Math.pow(Number(this.var_1622.x) - Number(this.var_1278.x),2));
            this._distance = this._distance > this.var_2102 ? 20 : Number(this._distance);
            this.var_4321 = Number(this._distance) * 40 / 550 << 1;
            this.var_4321 = this.var_4321 > 30 ? 30 : Number(this.var_4321);
            this.var_811.scaleX = Number(this._distance) / Number(this.var_2850);
            this.var_811.scaleY = Number(this.var_4321) / Number(this._oldHeight);
            this.var_3662 = Number(this._distance) >> 2;
            this.var_2696.quantity = this.var_3662;
            this.var_811.rotation = this._angle;
            this.method_2050(new Point(0,Number(this.var_4321) * -0.5),this._distance);
         }
         else
         {
            this.method_5765();
         }
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         this.var_1493 = true;
         super.disposeView(param1);
      }
   }
}
