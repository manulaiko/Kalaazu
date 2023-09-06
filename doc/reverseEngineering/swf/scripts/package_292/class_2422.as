package package_292
{
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import package_11.class_261;
   import package_199.LoaderEvent;
   import package_199.class_2123;
   import package_293.class_1751;
   import package_293.class_2131;
   import package_366.class_2105;
   import package_367.class_2107;
   import package_368.class_2412;
   import package_369.class_2116;
   
   public class class_2422 extends class_2412
   {
       
      
      private var var_3204:uint;
      
      public function class_2422(param1:uint, param2:uint)
      {
         super(param2);
         this.var_3204 = param1;
      }
      
      override public function load(param1:URLRequest, param2:class_2105 = null, param3:Boolean = false) : void
      {
         var_1449 = param3;
         var_1272 = param1;
         method_2625(var_1272.url);
         if(!var_1449)
         {
            _parser = param2 || method_5649();
         }
         if(param1.url.indexOf(".atf") != -1)
         {
            class_1210.instance.method_3562.loadTexture(param1.url,this.var_3204,class_1210.instance.method_2936).addOnce(this.method_1113);
         }
         else if(param1.url.indexOf(".awd") != -1)
         {
            class_1210.instance.method_3761.method_3479(param1.url,this.var_3204,class_1210.instance.method_2936).addOnce(this.method_2874);
         }
         else
         {
            class_1210.instance.method_2936.load(param1.url,this.method_4454,this.method_696);
         }
      }
      
      private function method_1113(param1:class_2116) : void
      {
         this.method_3342(param1);
         dispatchEvent(new LoaderEvent(LoaderEvent.const_1253,this.url));
      }
      
      private function method_2874(param1:class_2107) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1.assets)
         {
            this.method_3342(_loc2_);
         }
         dispatchEvent(new LoaderEvent(LoaderEvent.const_1253,this.url));
      }
      
      private function method_4454(param1:class_261) : void
      {
         _data = ByteArray(param1.data);
         _data.position = 0;
         if(var_1449)
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.const_1253));
         }
         else
         {
            parse(_data);
         }
      }
      
      private function method_696(... rest) : void
      {
      }
      
      protected function method_3342(param1:class_1751, param2:String = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param2 != null)
         {
            param1.name = param2;
         }
         switch(param1.assetType)
         {
            case class_2131.const_133:
               _loc4_ = "lightPicker";
               _loc3_ = "null";
               break;
            case class_2131.const_1414:
               _loc4_ = "light";
               _loc3_ = "null";
               break;
            case class_2131.const_700:
               _loc4_ = "animator";
               _loc3_ = "null";
               break;
            case class_2131.const_2058:
               _loc4_ = "animationSet";
               _loc3_ = "null";
               break;
            case class_2131.const_1841:
               _loc4_ = "animationState";
               _loc3_ = "null";
               break;
            case class_2131.const_800:
               _loc4_ = "animationNode";
               _loc3_ = "null";
               break;
            case class_2131.const_2589:
               _loc4_ = "stateTransition";
               _loc3_ = "null";
               break;
            case class_2131.TEXTURE:
               _loc4_ = "texture";
               _loc3_ = "null";
               break;
            case class_2131.const_2510:
               _loc4_ = "textureProjector";
               _loc3_ = "null";
               break;
            case class_2131.CONTAINER:
               _loc4_ = "container";
               _loc3_ = "null";
               break;
            case class_2131.GEOMETRY:
               _loc4_ = "geometry";
               _loc3_ = "null";
               break;
            case class_2131.const_808:
               _loc4_ = "material";
               _loc3_ = "null";
               break;
            case class_2131.const_3013:
               _loc4_ = "mesh";
               _loc3_ = "null";
               break;
            case class_2131.const_1226:
               _loc4_ = "skeleton";
               _loc3_ = "null";
               break;
            case class_2131.const_3077:
               _loc4_ = "skelpose";
               _loc3_ = "null";
               break;
            case class_2131.const_2930:
               _loc4_ = "entity";
               _loc3_ = "null";
               break;
            case class_2131.const_563:
               _loc4_ = "skybox";
               _loc3_ = "null";
               break;
            case class_2131.CAMERA:
               _loc4_ = "camera";
               _loc3_ = "null";
               break;
            case class_2131.const_2748:
               _loc4_ = "segmentSet";
               _loc3_ = "null";
               break;
            case class_2131.const_1565:
               _loc4_ = "effectsMethod";
               _loc3_ = "null";
               break;
            case class_2131.const_3103:
               _loc4_ = "effectsMethod";
               _loc3_ = "null";
               break;
            default:
               throw new Error("Unhandled asset type " + param1.assetType + ". Report as bug!");
         }
         if(!param1.name)
         {
            param1.name = _loc4_;
         }
         dispatchEvent(new class_2123(class_2123.const_269,param1));
         dispatchEvent(new class_2123(_loc3_,param1));
      }
   }
}
