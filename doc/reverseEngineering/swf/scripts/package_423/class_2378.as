package package_423
{
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import package_119.class_1191;
   import package_359.class_2082;
   import package_360.class_2084;
   
   public class class_2378
   {
       
      
      private var var_176:class_1191;
      
      private var var_1394:class_2082;
      
      private var var_127:class_2084;
      
      public function class_2378(param1:class_1191, param2:class_2084)
      {
         super();
         this.var_176 = param1;
         this.var_127 = param2;
         this.var_176.const_523.changed.add(this.method_357);
         this.method_357();
      }
      
      private function method_357() : void
      {
         if(this.var_1394)
         {
            this.var_1394.disposeView();
            if(this.var_1394.parent)
            {
               this.var_1394.parent.removeChild(this.var_1394);
            }
         }
         var _loc1_:XML = UberAssetsLib.instance.getDescriptor("beacon_" + this.var_176.const_523.value,UberAssetsLib.LIB_COLLECTABLES);
         if(_loc1_)
         {
            this.var_1394 = new class_2082(_loc1_.display2D[0]);
            this.var_1394.y = -50;
            this.var_127.addChild(this.var_1394);
         }
      }
   }
}
