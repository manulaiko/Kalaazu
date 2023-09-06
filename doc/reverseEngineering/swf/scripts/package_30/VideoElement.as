package package_30
{
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import net.bigpoint.darkorbit.class_81;
   import package_11.class_39;
   import package_76.class_215;
   import package_9.ResourceManager;
   
   public class VideoElement extends class_91
   {
      
      public static const const_1684:int = 0;
      
      public static const const_2648:int = 1;
       
      
      private var var_1822:int;
      
      private var var_1102:int;
      
      private var factionID:int;
      
      private var video:MovieClip;
      
      private var cMask:MovieClip;
      
      public var var_1881:class_268;
      
      private var border:Bitmap;
      
      public function VideoElement(param1:int, param2:int = 0, param3:int = 0)
      {
         super(const_3296);
         if(param1 != -1)
         {
            this.var_1822 = param1;
            this.var_1102 = param2;
            this.factionID = param3;
            this.init();
         }
      }
      
      public static function method_5060(param1:int, param2:int) : String
      {
         var _loc3_:String = "";
         if(param1 == const_1684)
         {
            _loc3_ = "videoPic";
         }
         else if(param1 == const_2648)
         {
            _loc3_ = "helpmovie";
         }
         _loc3_ += "_" + param2;
         if(param1 == const_2648 && param2 == 1)
         {
            _loc3_ += "_factionundefined";
         }
         return _loc3_;
      }
      
      public function init() : void
      {
         var _loc1_:String = method_5060(this.var_1102,this.var_1822);
         this.video = ResourceManager.getMovieClip(_loc1_,"video");
         this.video.mask = this.cMask;
         class_215.method_6420(this.video,20,true);
         this.var_1881 = new class_268(this.video.width,this.video.height);
         this.var_1881.name_92 = false;
         if(this.var_1102 == const_1684)
         {
            this.var_1881.fadeOut = false;
            this.var_1881.start();
            this.video.addChild(this.var_1881);
         }
         this.addChild(this.video);
         var _loc2_:class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
         this.cMask = _loc2_.getEmbeddedMovieClip("cMask");
         this.addChild(this.cMask);
         this.video.mask = this.cMask;
         this.border = _loc2_.getEmbeddedBitmap("border");
         this.addChild(this.border);
      }
      
      override public function get width() : Number
      {
         if(this.border != null)
         {
            return this.border.width;
         }
         return super.width;
      }
      
      override public function get height() : Number
      {
         if(this.border != null)
         {
            return this.border.height;
         }
         return super.height;
      }
      
      public function cleanup() : void
      {
         if(this.var_1881)
         {
            this.var_1881.cleanup();
         }
         if(Boolean(this.cMask) && Boolean(this.cMask.parent))
         {
            this.cMask.parent.removeChild(this.cMask);
         }
         if(Boolean(this.border) && Boolean(this.border.parent))
         {
            this.border.parent.removeChild(this.border);
         }
         if(this.video)
         {
            class_215.stopAnimation(this.video);
            this.video.mask = null;
            if(this.video.parent)
            {
               this.video.parent.removeChild(this.video);
            }
         }
      }
   }
}
