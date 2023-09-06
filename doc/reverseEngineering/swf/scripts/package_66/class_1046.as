package package_66
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import package_26.class_333;
   import package_26.class_94;
   
   public class class_1046 extends class_1045
   {
      
      private static const const_2126:String = "targetSlot";
      
      private static const const_11:String = "targetIcon";
      
      private static const const_247:Number = 2;
      
      private static const const_918:uint = 16770048;
      
      private static const const_2602:Number = 0.5;
       
      
      private const const_1013:String = "highlight";
      
      private var var_3417:Bitmap;
      
      private var var_1364:String;
      
      private var var_798:String;
      
      private var var_3083:class_1049;
      
      private var var_4625:Sprite;
      
      public function class_1046(param1:class_175, param2:int, param3:String, param4:String, param5:String, param6:String)
      {
         super(param1,param2,param3,param4);
         this.var_1364 = param5;
         this.var_798 = param6;
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 4;
         _background = finisher.getEmbeddedBitmap(const_2126);
         this.addChild(_background);
         var _loc2_:Bitmap = finisher.getEmbeddedBitmap(resKey);
         _loc2_.x = 0 - _loc2_.width / 2;
         _loc2_.y = 0 - _loc2_.height / 2;
         this.addChild(_loc2_);
         this.var_3417 = finisher.getEmbeddedBitmap(const_11);
         this.var_3417.x = _loc1_;
         this.var_3417.y = 0 - Number(this.var_3417.height) - _loc1_;
         this.addChild(this.var_3417);
         this.var_4625 = new Sprite();
         this.var_4625.buttonMode = true;
         this.var_4625.x = this.var_3417.x;
         this.var_4625.y = this.var_3417.y;
         var _loc3_:Graphics = this.var_4625.graphics;
         _loc3_.beginFill(16777215,0);
         _loc3_.drawRect(0,0,this.var_3417.width,this.var_3417.height);
         _loc3_.endFill();
         addChild(this.var_4625);
         method_3371();
         this.method_5928(0);
      }
      
      public function method_1554() : void
      {
         if(this.var_3083 != null && Boolean(this.contains(this.var_3083)))
         {
            this.removeChild(this.var_3083);
         }
         this.var_3083 = null;
      }
      
      public function method_5287(param1:class_1049) : void
      {
         this.var_3083 = param1;
         this.var_3083.x = this.targetIcon.x + 1;
         this.var_3083.y = this.targetIcon.y + 1;
         this.addChild(this.var_3083);
         this.updateTooltip(!!param1 ? param1.tooltipKey : null);
      }
      
      private function updateTooltip(param1:String) : void
      {
         var _loc2_:String = class_88.getItem(param1);
         var _loc3_:class_333 = class_94.getInstance().method_6181(this.var_4625);
         if(_loc3_ == null)
         {
            class_94.getInstance().method_1211(this.var_4625,_loc2_);
         }
         else
         {
            _loc3_.method_1455(_loc2_);
         }
      }
      
      public function get targetIcon() : Bitmap
      {
         return this.var_3417;
      }
      
      public function get identifier() : String
      {
         return this.var_1364;
      }
      
      public function method_5928(param1:int) : void
      {
         method_451.setText(class_88.getItem(this.var_798).replace("%COUNT%",param1.toString()));
      }
      
      public function get method_3483() : class_1049
      {
         return this.var_3083;
      }
      
      public function highlight() : void
      {
         var _loc1_:Shape = new Shape();
         _loc1_.name = "highlight";
         _loc1_.graphics.lineStyle(const_247,const_918,const_2602);
         _loc1_.graphics.drawRect(this.var_3417.x,this.var_3417.y,this.var_3417.width,this.var_3417.height);
         addChild(_loc1_);
      }
      
      public function removeHighlight() : void
      {
         var _loc1_:DisplayObject = getChildByName("highlight");
         if(_loc1_ != null)
         {
            removeChild(_loc1_);
         }
      }
   }
}
