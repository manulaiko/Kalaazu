package package_381
{
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import package_373.class_2134;
   import package_75.class_1868;
   
   public class class_2182 implements class_80, IDisposable
   {
       
      
      private var _uberAsset:class_2134;
      
      private var _effect:class_1868;
      
      public function class_2182(param1:class_1211, param2:class_1868)
      {
         super();
         this._effect = param2;
         this._uberAsset = new class_2134(UberAssetsLib.instance.getDescriptor("cbs-construction",UberAssetsLib.LIB_BATTLE_STATION).display3D[0]);
         this._uberAsset.ready.add(this.method_4695);
         class_1210.instance.method_3528.method_1616.addChild(this._uberAsset);
      }
      
      private function method_4695() : void
      {
         class_1210.instance.method_3528.method_1164(this);
      }
      
      public function updateObj(param1:Number) : void
      {
         this._uberAsset.moveTo(this._effect.source.method_1474,this._effect.source.method_1121,this._effect.source.method_6123);
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         if(this._uberAsset)
         {
            this._uberAsset.disposeView(param1);
            this._uberAsset = null;
         }
         class_1210.instance.method_3528.method_3592(this);
      }
   }
}
