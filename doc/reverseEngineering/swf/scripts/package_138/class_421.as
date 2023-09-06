package package_138
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import package_11.class_39;
   import package_22.class_414;
   import package_26.class_333;
   import package_9.ResourceManager;
   
   public class class_421 extends Sprite
   {
       
      
      public var id:int;
      
      private var languageKey:String;
      
      private var resKey:String;
      
      public var tooltip:class_333;
      
      public var pattern:class_414;
      
      public function class_421(param1:class_414)
      {
         super();
         this.buttonMode = true;
         this.useHandCursor = true;
         this.id = param1.id;
         this.languageKey = param1.languageKey;
         this.resKey = param1.resKey;
         this.pattern = param1;
         this.setIcon(this.resKey);
      }
      
      private function setIcon(param1:String) : void
      {
         var _loc2_:Bitmap = class_39(ResourceManager.name_15.getFinisher("ui")).getEmbeddedBitmap(param1);
         addChild(_loc2_);
      }
      
      public function setPosition(param1:int, param2:int) : void
      {
         this.x = param1;
         this.y = param2;
      }
   }
}
