package package_66
{
   import flash.display.Bitmap;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import package_11.class_39;
   import package_30.class_91;
   import package_9.ResourceManager;
   
   public class class_1045 extends class_91
   {
      
      public static const const_256:int = 0;
      
      public static const const_3146:int = 1;
       
      
      private var var_913:String;
      
      private var _type:int;
      
      protected var var_2414:class_1560;
      
      protected var var_783:class_1560;
      
      protected var _background:Bitmap;
      
      protected var finisher:class_39;
      
      protected var resKey:String;
      
      protected var var_2016:class_175;
      
      protected var gap:int = 4;
      
      public function class_1045(param1:class_175, param2:int, param3:String, param4:String)
      {
         super(class_91.const_304);
         this.var_2016 = param1;
         this._type = param2;
         this.var_913 = param3;
         this.resKey = param4;
         this.finisher = class_39(ResourceManager.name_15.getFinisher("refinement"));
      }
      
      protected function method_3371() : void
      {
         this.var_2414 = new class_1560(this);
         this.var_2414.y = Number(this.background.y) - Number(this.var_2414.height) - Number(this.gap);
         this.var_2414.setText(class_88.getItem(this.var_913));
         this.addChild(this.var_2414);
         this.var_783 = new class_1560(this);
         this.var_783.y = this.background.height + this.gap;
         this.addChild(this.var_783);
      }
      
      public function get method_6320() : class_175
      {
         return this.var_2016;
      }
      
      public function get method_3876() : class_1560
      {
         return this.var_2414;
      }
      
      public function get method_451() : class_1560
      {
         return this.var_783;
      }
      
      public function get background() : Bitmap
      {
         return this._background;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get languageKey() : String
      {
         return this.var_913;
      }
   }
}
