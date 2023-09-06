package package_74
{
   import com.greensock.TweenMax;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import package_11.class_39;
   import package_174.class_1060;
   import package_26.class_333;
   import package_26.class_94;
   import package_38.class_577;
   import package_9.ResourceManager;
   
   public class class_1062 extends Sprite
   {
       
      
      private var var_1689:class_1060;
      
      private var var_4095:Bitmap;
      
      public function class_1062(param1:class_1060)
      {
         super();
         this.var_1689 = param1;
         if(this.var_1689)
         {
            this.method_2558();
            this.initIcon();
            this.method_4970();
         }
         mouseChildren = false;
         buttonMode = true;
         mouseEnabled = true;
         addEventListener(MouseEvent.ROLL_OUT,this.rollHandler);
         addEventListener(MouseEvent.ROLL_OVER,this.rollHandler);
         this.highlighted = false;
      }
      
      private function method_2558() : void
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(16711680,0);
         _loc1_.graphics.drawCircle(0,0,15);
         _loc1_.graphics.endFill();
         addChild(_loc1_);
      }
      
      private function rollHandler(param1:MouseEvent) : void
      {
         if(param1.type == MouseEvent.ROLL_OUT)
         {
            this.method_4970();
         }
         this.highlighted = param1.type == MouseEvent.ROLL_OVER;
      }
      
      private function set highlighted(param1:Boolean) : void
      {
         TweenMax.to(this,0,{
            "scaleX":(param1 ? 1 : 0.75),
            "scaleY":(param1 ? 1 : 0.75),
            "colorMatrixFilter":{"saturation":(param1 ? 1 : 0.8)}
         });
      }
      
      private function initIcon() : void
      {
         var _loc1_:* = null;
         switch(this.var_1689.status)
         {
            case class_577.const_2637:
               _loc1_ = "mapIcon_battlestation_own";
               break;
            case class_577.const_210:
               _loc1_ = "mapIcon_battlestation_allied";
               break;
            case class_577.const_2944:
               _loc1_ = "mapIcon_battlestation_hostile";
               break;
            case class_577.const_2838:
               _loc1_ = "mapIcon_battlestation_asteroid";
         }
         if(_loc1_ != "")
         {
            this.var_4095 = new Bitmap(class_39(ResourceManager.name_15.getFinisher("spacemap")).getEmbeddedBitmapData(_loc1_));
            this.var_4095.smoothing = true;
            this.var_4095.x = -Number(this.var_4095.width) / 2;
            this.var_4095.y = -Number(this.var_4095.height) / 2;
            addChild(this.var_4095);
         }
      }
      
      private function method_4970() : void
      {
         class_94.getInstance().method_4247(this);
         var _loc1_:class_333 = class_94.getInstance().method_1211(this,this.name_9);
         if(_loc1_)
         {
            _loc1_.showImmediately = true;
         }
      }
      
      private function get name_9() : String
      {
         var _loc2_:* = null;
         var _loc1_:String = "";
         if(this.var_1689.clanName)
         {
            _loc1_ += class_88.getItem("ttip_cbs") + ": " + this.var_1689.name_8 + "\n";
            _loc1_ += class_88.getItem("ttip_owner") + ": " + this.var_1689.clanName + "\n";
            _loc2_ = this.var_1689.method_3318 == 0 ? class_88.getItem("ttip_all") : this.method_1056.method_2919[this.var_1689.method_3318];
            _loc1_ += class_88.getItem("ttip_company") + ": " + _loc2_ + "\n";
            _loc1_ += class_88.getItem("ttip_since") + ": " + this.var_1689.method_3701;
         }
         else
         {
            _loc1_ += class_88.getItem("ttip_asteroid") + ": " + this.var_1689.name_8 + "\n";
            _loc1_ += class_88.getItem("ttip_free_since") + ": " + this.var_1689.method_3701;
         }
         return _loc1_;
      }
      
      private function get method_1056() : class_126
      {
         return class_126.getInstance();
      }
      
      public function get method_2997() : Bitmap
      {
         return this.var_4095;
      }
   }
}
