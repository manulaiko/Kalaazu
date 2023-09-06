package package_282
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import net.bigpoint.darkorbit.mvc.display.class_1705;
   import package_266.class_1713;
   import starling.core.Starling;
   import starling.display.DisplayObject;
   import starling.display.MovieClip;
   import starling.events.Event;
   import starling.filters.FragmentFilter;
   import starling.textures.TextureAtlas;
   
   public class class_1706 extends MovieClip implements class_1705
   {
       
      
      private var var_1057:Boolean = false;
      
      public function class_1706(param1:class_1713, param2:String = null, param3:Number = 30)
      {
         var _loc4_:TextureAtlas = new TextureAtlas(TexturesCache.getTexture(param1.texture),param1.atlas.source);
         super(_loc4_.getTextures(param2),param3);
         addEventListener(Event.ADDED_TO_STAGE,this.method_396);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_267);
      }
      
      private function method_396(param1:Event) : void
      {
         if(!this.var_1057)
         {
            Starling.juggler.add(this);
         }
      }
      
      private function method_267(param1:Event) : void
      {
         Starling.juggler.remove(this);
      }
      
      public function set freezed(param1:Boolean) : void
      {
         if(this.var_1057 != param1)
         {
            this.var_1057 = param1;
            if(this.var_1057)
            {
               stop();
            }
            else
            {
               play();
            }
         }
      }
      
      public function get method_1052() : Object
      {
         return parent;
      }
      
      public function method_990(param1:Point) : Point
      {
         return localToGlobal(param1);
      }
      
      public function method_4347(param1:Point) : Point
      {
         return globalToLocal(param1);
      }
      
      public function get method_2826() : Object
      {
         return root;
      }
      
      public function get method_5539() : Object
      {
         return stage;
      }
      
      public function method_2392(param1:Object, param2:Rectangle = null) : Rectangle
      {
         return getBounds(param1 as DisplayObject);
      }
      
      public function set method_3211(param1:Object) : void
      {
         this.filter = param1 as FragmentFilter;
      }
      
      public function get method_3211() : Object
      {
         return filter;
      }
   }
}
