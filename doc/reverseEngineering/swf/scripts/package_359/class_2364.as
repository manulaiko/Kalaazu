package package_359
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.map.common.class_2362;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
   import net.bigpoint.darkorbit.mvc.mapElements.common.model.assetProxy.MapAssetLoadVo;
   import package_11.class_38;
   import package_11.class_39;
   import package_11.class_65;
   import package_17.class_62;
   import package_181.class_1104;
   import package_19.class_68;
   import package_19.class_70;
   import package_76.class_215;
   import package_9.ResourceManager;
   
   public class class_2364 extends Sprite implements class_2362
   {
       
      
      public const ready:class_68 = new class_70();
      
      private var var_2308:XML;
      
      private var var_1394:DisplayObject;
      
      private var var_2785:Vector.<String>;
      
      private var _debug:Boolean;
      
      public function class_2364(param1:XML = null, param2:Boolean = false)
      {
         super();
         this.var_2308 = param1 || new XML();
         this._debug = param2;
         if(this.var_2308.attribute("includeIn").length() > 0)
         {
            this.var_2785 = Vector.<String>(String(this.var_2308.@includeIn).split(","));
         }
      }
      
      public function init() : void
      {
         var _loc1_:String = String(this.var_2308.@srcKey);
         var _loc2_:String = String(this.var_2308.@resKey);
         if(_loc1_.length > 0)
         {
            this.load(_loc1_,_loc2_ || true);
         }
         else
         {
            setTimeout(this.ready.dispatch,1);
         }
      }
      
      public function load(param1:String, param2:String) : void
      {
         if(param1)
         {
            class_62.getInstance().sendNotification(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET,new MapAssetLoadVo(this.method_660,param1,Vector.<String>([param2]),String(this.var_2308.@useBitmapClip) == "true" ? class_1104 : DisplayObject));
         }
         else
         {
            ResourceManager.name_15.load(param2,this.method_2414);
         }
      }
      
      private function method_660(param1:Object) : void
      {
         this.asset = param1 as DisplayObject;
      }
      
      private function method_2414(param1:class_38) : void
      {
         if(param1 is class_65)
         {
            this.asset = class_65(param1).getBitmap();
         }
         else if(param1 is class_39)
         {
            this.asset = class_39(param1).getAsDisplayObject();
         }
      }
      
      public function set asset(param1:DisplayObject) : void
      {
         var _loc2_:int = 0;
         class_215.removeDisplayObject(this.var_1394);
         this.var_1394 = param1;
         if(this.var_1394)
         {
            this.var_1394.name = "content";
            if(String(this.var_2308.@center) == "true")
            {
               this.var_1394.x -= Number(this.var_1394.width) >> 1;
               this.var_1394.y -= Number(this.var_1394.height) >> 1;
            }
            if(this.var_1394 is MovieClip)
            {
               _loc2_ = int(int(this.var_2308.@frame) || true);
               if(String(this.var_2308.@autoPlay) == "false")
               {
                  MovieClip(this.var_1394).gotoAndStop(_loc2_);
               }
               else
               {
                  MovieClip(this.var_1394).gotoAndPlay(_loc2_);
               }
            }
            addChildAt(this.var_1394,0);
         }
         setTimeout(this.ready.dispatch,1);
      }
      
      public function handleStateChange(param1:String) : void
      {
         visible = this.var_2785 == null || this.var_2785.indexOf(param1) != -1;
      }
      
      public function get asset() : DisplayObject
      {
         return this.var_1394;
      }
   }
}
