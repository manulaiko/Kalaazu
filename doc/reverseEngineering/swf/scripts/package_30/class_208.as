package package_30
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.class_9;
   import package_11.class_39;
   import package_9.ResourceManager;
   
   public class class_208 extends class_91
   {
       
      
      public function class_208()
      {
         super(const_1576);
         this.init();
      }
      
      private function init() : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc1_:class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
         _loc2_ = MovieClip(_loc1_.getEmbeddedMovieClip("connectionWindow"));
         _loc2_.mouseEnabled = class_9.const_3029;
         _loc2_.mouseChildren = class_9.const_3029;
         _loc2_.txtHeader.text = "";
         var _loc3_:TextField = TextField(_loc2_.txtBody);
         _loc3_.defaultTextFormat = class_18.const_1629;
         _loc3_.embedFonts = class_18.var_620;
         _loc3_.text = class_88.getItem("log_verbinde");
         (_loc4_ = TextField(_loc2_.txtBottom)).defaultTextFormat = class_18.const_1629;
         _loc4_.embedFonts = class_18.var_620;
         _loc4_.text = class_88.getItem("log_warten");
         _loc4_.height = NaN;
         this.addChild(_loc2_);
      }
   }
}
