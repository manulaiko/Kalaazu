package package_66
{
   import flash.display.Bitmap;
   import package_26.class_94;
   
   public class class_1047 extends class_1045
   {
       
      
      private var var_758:int = 0;
      
      private var var_1576:String;
      
      public function class_1047(param1:class_175, param2:int, param3:String, param4:String, param5:String = null)
      {
         super(param1,param2,param3,param4);
         this.var_1576 = param5;
         this.init();
      }
      
      public function method_2920() : void
      {
         method_451.setText(this.var_758.toString());
      }
      
      public function method_4016(param1:int) : void
      {
         this.var_758 = param1;
      }
      
      private function init() : void
      {
         _background = finisher.getEmbeddedBitmap("sourceSlot");
         this.addChild(_background);
         var _loc1_:Bitmap = finisher.getEmbeddedBitmap(resKey);
         _loc1_.x = 0 - _loc1_.width / 2;
         _loc1_.y = 0 - _loc1_.height / 2;
         this.addChild(_loc1_);
         method_3371();
         this.method_5928(0);
         if(this.var_1576 != null)
         {
            class_94.getInstance().method_1211(this,this.var_1576);
         }
      }
      
      public function method_5928(param1:int) : void
      {
         method_451.setText(param1.toString());
      }
   }
}
