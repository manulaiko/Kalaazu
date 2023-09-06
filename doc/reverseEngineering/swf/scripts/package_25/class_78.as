package package_25
{
   import com.bigpoint.utils.class_122;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_100.class_270;
   import package_101.class_271;
   import package_102.LayeredSprite;
   import package_11.class_39;
   import package_19.class_68;
   import package_19.class_70;
   import package_29.class_267;
   import package_29.class_84;
   import package_30.class_268;
   import package_76.class_215;
   import package_9.ResourceManager;
   
   public class class_78 extends Sprite
   {
      
      private static const const_27:Number = 3;
      
      private static const const_2079:Number = 11;
       
      
      private var var_1282:class_86;
      
      public const const_2351:class_68 = new class_70();
      
      public const clicked:class_68 = new class_70();
      
      private var _map:class_90;
      
      private var var_1869:class_84;
      
      private var var_414:Number;
      
      private var var_427:Number = 8;
      
      private var var_4125:MovieClip;
      
      private var var_142:LayeredSprite;
      
      private var var_3844:Sprite;
      
      private var var_2554:TextField;
      
      private var var_1918:TextField;
      
      private var var_1770:TextField;
      
      private var var_3334:int = 0;
      
      private var var_3540:int = 0;
      
      private var var_3457:Array;
      
      private const yOffset:int = 27;
      
      private const const_230:int = 9;
      
      private var finisher:class_39;
      
      private var mapID:int;
      
      private var var_1161:String;
      
      private var var_5031:int;
      
      private var var_3281:int;
      
      private var var_1978:Shape;
      
      private var overlay:MovieClip;
      
      private var var_3410:Number;
      
      private var var_1113:Array;
      
      private var var_1881:class_268;
      
      private var _background:class_269;
      
      public function class_78()
      {
         this.var_3844 = new Sprite();
         this.var_2554 = new TextField();
         this.var_1918 = new TextField();
         this.var_1770 = new TextField();
         this.var_3457 = new Array();
         this.var_1113 = [16777215,16772505,16767296,16763955,16751360,16737792];
         this._background = new class_269();
         super();
         this.finisher = class_39(ResourceManager.name_15.getFinisher("minimap"));
         this.overlay = this.finisher.getEmbeddedMovieClip("minimapOverlay");
         this.overlay.mouseEnabled = false;
         this.overlay.y = 27;
         this.method_6284();
         this.method_76(this.var_2554);
         this.method_76(this.var_1918);
         this.var_1918.text = "999/999";
         this.var_3281 = int(this.var_1918.width) + 2;
         this.var_1918.text = "";
         this.method_76(this.var_1770);
         addChild(this.overlay);
         Settings.displayMiniMapBackgroundImage.changed.add(this.updateSize);
         Settings.enemyCount.changed.add(this.method_5958);
         this.method_5958();
      }
      
      public function set map(param1:class_90) : void
      {
         this.method_1876();
         if(this.var_1869)
         {
            this.var_1869.name_110.remove(this.method_3203);
            this.var_1869.name_33.remove(this.method_6426);
            this._map.method_1203().const_719.remove(this.method_4074);
         }
         this._map = param1;
         if(this._map)
         {
            this.var_1869 = this._map.method_328(class_270);
            this.var_1869.name_110.add(this.method_3203);
            this.var_1869.name_33.add(this.method_6426);
            this._map.method_1203().const_719.add(this.method_4074);
         }
         this.scaleFactor = this.scaleFactor;
         this.method_4074();
      }
      
      private function method_4074(param1:class_86 = null) : void
      {
         if(this.var_1282)
         {
            this.var_1282.position.changed.remove(this.method_5427);
         }
         this.var_1282 = !!this.map ? this.map.hero : null;
         if(this.var_1282)
         {
            this.var_1282.position.changed.add(this.method_5427);
            this.method_5427();
         }
      }
      
      public function get map() : class_90
      {
         return this._map;
      }
      
      public function set scaleFactor(param1:Number) : void
      {
         this.var_427 = Math.min(Math.max(param1,const_27),const_2079);
         if(this._map)
         {
            this.var_414 = Number(this.var_427) * Number(this._map.scaleFactor);
         }
         this.var_3410 = 1 / (Number(this.var_414) * 10);
         this.updateSize();
      }
      
      public function get scaleFactor() : Number
      {
         return this.var_427;
      }
      
      public function zoomIn() : void
      {
         this.scaleFactor = this.var_427 - 1;
      }
      
      public function zoomOut() : void
      {
         this.scaleFactor = this.var_427 + 1;
      }
      
      public function get hero() : class_86
      {
         return this.var_1282;
      }
      
      public function method_598(param1:int) : void
      {
         if(this.var_1881 != null)
         {
            this.var_1881.cleanup();
         }
         this.var_1881 = new class_268(this.var_3334,this.var_3540);
         this.var_1881.duration = param1;
         this.var_1881.alpha = 0.2;
         this.var_1881.start();
         this.var_1881.mouseChildren = false;
         this.var_1881.mouseEnabled = false;
         this.var_1881.y = 27;
         addChild(this.var_1881);
      }
      
      public function method_5958() : void
      {
         var _loc1_:int = Math.max(0,Math.min(Settings.enemyCount.value,5));
         var _loc2_:int = 6;
         var _loc3_:Number = this.var_3540 / (_loc2_ - 1);
         var _loc4_:uint = uint(this.var_1113[_loc1_]);
         if(this.var_1978 == null)
         {
            this.var_1978 = new Shape();
         }
         else
         {
            this.var_1978.graphics.clear();
         }
         this.var_1978.graphics.beginFill(_loc4_);
         this.var_1978.graphics.drawRect(0,(5 - _loc1_) * _loc3_,3,_loc3_ * _loc1_);
         this.var_1978.graphics.lineStyle(1,10079487);
         this.var_1978.graphics.moveTo(8,0);
         this.var_1978.graphics.lineTo(8,this.var_3540);
         var _loc5_:Number = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_)
         {
            if(_loc6_ == _loc2_ - 1)
            {
               _loc5_--;
            }
            this.var_1978.graphics.moveTo(4,_loc5_);
            this.var_1978.graphics.lineTo(10,_loc5_);
            _loc5_ += _loc3_;
            _loc6_++;
         }
         _loc5_ = 0;
         _loc2_ = 21;
         _loc3_ = this.var_3540 / (_loc2_ - 1);
         _loc6_ = 0;
         while(_loc6_ < _loc2_)
         {
            if(_loc6_ == _loc2_ - 1)
            {
               _loc5_--;
            }
            this.var_1978.graphics.lineTo(9,_loc5_);
            _loc5_ += _loc3_;
            _loc6_++;
         }
         if(this.var_3540 == 0)
         {
            return;
         }
         addChild(this.var_1978);
         this.var_1978.x = -Number(this.var_1978.width);
         this.var_1978.y = 27;
      }
      
      private function method_76(param1:TextField) : void
      {
         param1.defaultTextFormat = class_18.const_180;
         param1.autoSize = TextFieldAutoSize.LEFT;
         param1.textColor = 16777215;
         param1.embedFonts = class_18.var_1349;
         param1.antiAliasType = AntiAliasType.ADVANCED;
         param1.selectable = false;
         param1.mouseEnabled = false;
         param1.y = 9;
         if(!contains(param1))
         {
            addChild(param1);
         }
      }
      
      private function method_5427() : void
      {
         this.method_3178();
      }
      
      private function method_3178() : void
      {
         var _loc1_:Number = NaN;
         if(this.hero != null)
         {
            this.method_5911();
            this.var_1918.x = this.var_5031 + this.var_2554.x;
            this.var_1918.text = int(Number(this.hero.position.x) / 100) + "/" + int(Number(this.hero.position.y) / 100);
            this.var_1770.text = "";
            if(this.hero.method_6406)
            {
               _loc1_ = Number(this.hero.position.subtract(this.hero.destination).length) / 100;
               this.var_1770.text = "> " + class_88.getItem("travelling_distance").replace(/%DIST%/,class_122.round(_loc1_,2));
            }
            else
            {
               this.var_1770.text = "";
            }
            if(this.var_4125 && this.var_4125.visible && Boolean(this.hero.destination))
            {
               this.var_4125.x = Number(this.hero.destination.x) * Number(this.var_3410);
               this.var_4125.y = Number(this.hero.destination.y) * Number(this.var_3410);
            }
         }
      }
      
      private function method_5911() : void
      {
         if(this.mapID != this.map.method_1480())
         {
            this.mapID = this.map.method_1480();
            this.var_1161 = this.map.getName();
            this.var_2554.text = this.var_1161;
            this.var_5031 = int(this.var_2554.width) + 2;
            this.var_1770.x = this.var_5031 + this.var_2554.x + this.var_3281;
         }
      }
      
      private function method_6284() : void
      {
         this.var_142 = new LayeredSprite();
         this.var_142.y = 27;
         addChild(this.var_142);
         this.var_3844.addEventListener(MouseEvent.MOUSE_DOWN,this.handleMouseDown);
         this.var_3844.buttonMode = true;
         this.var_3844.y = 27;
         addChild(this.var_3844);
      }
      
      private function handleMouseDown(param1:MouseEvent) : void
      {
         this.method_3354();
         this.method_6058();
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.method_6058);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.handleMouseUp);
      }
      
      private function method_3354(param1:Number = 1) : void
      {
         if(this.var_4125 == null)
         {
            this.var_4125 = this.finisher.getEmbeddedMovieClip("minimapPointer");
            this.var_142.getLayer(int.MAX_VALUE).addChild(this.var_4125);
            this.var_4125.mouseEnabled = this.var_4125.mouseChildren = false;
         }
         TweenLite.killTweensOf(this.var_4125);
         this.var_4125.gotoAndStop(1);
         this.var_4125.scaleX = this.var_4125.scaleY = param1;
         this.var_4125.visible = true;
         if(this.hero)
         {
            class_271(this.hero.method_1954(class_271)).destinationMarkerVisible = true;
         }
      }
      
      private function method_2904() : void
      {
         var _loc1_:Number = NaN;
         if(this.var_4125)
         {
            _loc1_ = Number(this.var_4125.totalFrames) / 0;
            TweenLite.to(this.var_4125,_loc1_,{
               "frame":this.var_4125.totalFrames,
               "onComplete":this.method_568
            });
         }
      }
      
      private function method_568() : void
      {
         this.var_4125.visible = false;
      }
      
      private function handleMouseUp(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.method_6058);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.handleMouseUp);
         this.method_2904();
      }
      
      private function method_6058(param1:MouseEvent = null) : void
      {
         var _loc2_:int = Number(this.var_3844.mouseX) * Number(this.var_414) * 10;
         var _loc3_:int = Number(this.var_3844.mouseY) * Number(this.var_414) * 10;
         this.clicked.dispatch(_loc2_,_loc3_);
      }
      
      private function updateSize() : void
      {
         var _loc2_:* = null;
         if(this.map == null)
         {
            return;
         }
         this.var_3334 = Math.round(Number(this.map.method_5076) / Number(this.var_414) * 0.1);
         this.var_3540 = Math.round(Number(this.map.method_1901) / Number(this.var_414) * 0.1);
         this.var_3844.graphics.clear();
         this.var_3844.graphics.lineStyle(1,0,0);
         this.var_3844.graphics.beginFill(0,0.2);
         this.var_3844.graphics.drawRect(0,0,this.var_3334,this.var_3540);
         this.var_3844.graphics.endFill();
         this.overlay.width = this.var_3334;
         this.overlay.height = this.var_3540;
         var _loc1_:Vector.<class_267> = this.var_1869.traits;
         this.var_142.removeAll();
         this._background.update(this._map,this.method_1173,this.method_3133);
         this.var_142.method_5974(this._background,int.MIN_VALUE);
         if(this.var_4125)
         {
            this.var_142.getLayer(int.MAX_VALUE).addChild(this.var_4125);
         }
         for each(_loc2_ in _loc1_)
         {
            this.var_142.method_5974(_loc2_.method_248(this.var_3410,this.var_3334,this.var_3540),_loc2_.layer);
         }
         this.var_142.scrollRect = new Rectangle(0,0,this.var_3334,this.var_3540);
         this.method_5958();
         this.const_2351.dispatch();
      }
      
      public function method_1876() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_3457)
         {
            if(_loc1_.mc)
            {
               TweenLite.killTweensOf(_loc1_.mc);
               class_215.removeDisplayObject(_loc1_.mc);
            }
         }
         this.var_3457 = [];
      }
      
      private function method_3203(param1:class_270) : void
      {
         this.var_142.method_5974(param1.method_248(this.var_3410,this.method_1173,this.method_3133),param1.layer);
      }
      
      private function method_6426(param1:class_270) : void
      {
         this.var_142.method_3406(param1.method_248(this.var_3410,this.method_1173,this.method_3133));
      }
      
      public function method_1759(param1:class_272) : void
      {
         if(Boolean(param1.id) && param1.id != "")
         {
            if(this.var_3457[param1.id])
            {
               this.method_845(param1.id);
            }
            this.var_3457[param1.id] = param1;
         }
         this.method_3909(param1);
      }
      
      private function method_3909(param1:class_272) : void
      {
         if(param1.mc == null)
         {
            param1.mc = ResourceManager.getMovieClip("minimap","minimapmarker" + param1.method_3944);
         }
         var _loc2_:int = 1;
         var _loc3_:int = int(param1.mc.framesLoaded);
         var _loc4_:Number = 1;
         if(param1.inverse)
         {
            _loc2_ = _loc3_;
            _loc3_ = 1;
            _loc4_ = 0;
            param1.mc.scaleX = Number(param1.scale) * 3.5 / Number(this.var_414);
            param1.mc.scaleY = Number(param1.scale) * 3.5 / Number(this.var_414);
         }
         param1.mc.gotoAndStop(_loc2_);
         param1.mc.x = Number(param1.x) * Number(this.var_3410);
         param1.mc.y = Number(param1.y) * Number(this.var_3410);
         param1.mc.mouseEnabled = false;
         param1.mc.mouseChildren = false;
         this.var_142.method_5974(param1.mc,int.MAX_VALUE);
         TweenLite.to(param1.mc,param1.method_438,{
            "ease":Linear.easeNone,
            "frame":_loc3_,
            "alpha":_loc4_,
            "onComplete":this.method_6057,
            "onCompleteParams":[param1]
         });
      }
      
      private function method_6057(param1:class_272) : void
      {
         class_215.removeDisplayObject(param1.mc);
         if(param1.count == -1)
         {
            this.method_3909(param1);
         }
         else if(param1.count > 1)
         {
            --param1.count;
            this.method_3909(param1);
         }
         else
         {
            this.method_845(param1.id);
         }
      }
      
      public function method_845(param1:String) : void
      {
         var _loc2_:class_272 = this.var_3457[param1];
         if(_loc2_ != null)
         {
            class_215.removeDisplayObject(_loc2_.mc);
            TweenLite.killTweensOf(_loc2_.mc);
            _loc2_.count = 0;
            delete this.var_3457[param1];
         }
      }
      
      public function get method_1173() : int
      {
         return this.var_3334;
      }
      
      public function get method_3133() : int
      {
         return this.var_3540;
      }
   }
}
