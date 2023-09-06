package package_69
{
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import package_10.class_19;
   import package_10.class_305;
   import package_19.class_68;
   import package_19.class_70;
   import package_29.class_267;
   import package_29.class_85;
   import package_29.class_89;
   import package_9.class_50;
   
   public class class_180 extends class_85
   {
       
      
      public const clicked:class_68 = new class_70(class_180);
      
      public const name_43:class_68 = new class_70();
      
      private var var_724:int = 3;
      
      private var _settings:class_19;
      
      private var var_188:Vector.<class_267>;
      
      private var var_1260:String;
      
      private var var_4508:Boolean = false;
      
      private var var_1709:Boolean = false;
      
      public function class_180(param1:String, param2:String, param3:int, param4:int, param5:Boolean, param6:class_19 = null)
      {
         super(class_90.method_3817(param2),new class_305(param3,param4));
         this.var_1260 = param2;
         this.var_1709 = param5;
         this._settings = param6;
         UberAssetsLib.instance.fillTraits(this,param1,UberAssetsLib.LIB_COLLECTABLES,null,this.method_3460);
         this.var_188 = traits.concat();
      }
      
      public function get hash() : String
      {
         return this.var_1260;
      }
      
      public function get method_364() : Boolean
      {
         return this.var_4508;
      }
      
      public function get method_4697() : Boolean
      {
         return this.var_1709;
      }
      
      override public function method_125(param1:class_89) : void
      {
         if(this._settings)
         {
            this._settings.changed.add(this.updateTraits);
         }
         this.updateTraits();
         super.method_125(param1);
      }
      
      override public function method_166() : void
      {
         if(this._settings)
         {
            this._settings.changed.remove(this.updateTraits);
         }
         super.method_166();
      }
      
      public function collect() : void
      {
         this.var_4508 = true;
         this.name_43.dispatch();
      }
      
      private function updateTraits() : void
      {
         var _loc1_:* = null;
         if(this._settings == null || Boolean(this._settings.value))
         {
            for each(_loc1_ in this.var_188)
            {
               addTrait(_loc1_);
            }
         }
         else
         {
            for each(_loc1_ in this.var_188)
            {
               removeTrait(_loc1_);
            }
         }
      }
      
      private function method_3460() : void
      {
         class_50.getInstance().method_1772.method_1368(x,y,this);
         this.clicked.dispatch(this);
      }
      
      public function get name_137() : int
      {
         return this.var_724;
      }
   }
}
