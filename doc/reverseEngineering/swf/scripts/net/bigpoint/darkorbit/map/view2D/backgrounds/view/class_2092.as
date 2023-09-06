package net.bigpoint.darkorbit.map.view2D.backgrounds.view
{
   import flash.geom.Rectangle;
   import net.bigpoint.as3toolbox.filecollection.class_66;
   import net.bigpoint.darkorbit.mvc.display.IDisplayObject;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_361.class_2090;
   import package_9.ResourceManager;
   
   public class class_2092 extends class_2087
   {
       
      
      public var offsetX:int = 0;
      
      public var offsetY:int = 0;
      
      private var _tiles:Vector.<class_2385>;
      
      public function class_2092(param1:IDisplayObject, param2:class_2090)
      {
         this._tiles = new Vector.<class_2385>();
         super(param1,param2);
         this.offsetX = param2.shiftX + param2.pattern.offsetX;
         this.offsetY = param2.shiftY + param2.pattern.offsetY;
      }
      
      override public function update(param1:int, param2:int, param3:int, param4:int) : void
      {
         view.x = int(-param1 / Number(this.method_1134.parallaxFactor) + param3 + this.offsetX);
         view.y = int(-param2 / Number(this.method_1134.parallaxFactor) + param4 + this.offsetY);
      }
      
      public function get method_1134() : class_2090
      {
         return data as class_2090;
      }
      
      override protected function method_3258() : Boolean
      {
         return Settings.qualityBackground.value == Settings.QUALITY_HIGH || Boolean(this.method_1134.isMain) && Settings.qualityBackground.value > Settings.QUALITY_LOW;
      }
      
      override protected function method_352() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         super.method_352();
         if(Boolean(this.method_1134.pattern.showInStarlingMode) || true)
         {
            _loc1_ = this.method_1134.pattern.resKey;
            _loc2_ = ResourceManager.name_15;
            if(Boolean(_loc2_.method_5888(_loc1_ + "_01")) && Boolean(_loc2_.method_5888(_loc1_ + "_02")) && Boolean(_loc2_.method_5888(_loc1_ + "_03")) && Boolean(_loc2_.method_5888(_loc1_ + "_04")))
            {
               this._tiles.push(new class_2385(_loc1_ + "_01",view,0,0,this.method_6244(this.method_1134.region,0,0)));
               this._tiles.push(new class_2385(_loc1_ + "_02",view,2048,0,this.method_6244(this.method_1134.region,2048,0)));
               this._tiles.push(new class_2385(_loc1_ + "_03",view,0,2048,this.method_6244(this.method_1134.region,0,2048)));
               this._tiles.push(new class_2385(_loc1_ + "_04",view,2048,2048,this.method_6244(this.method_1134.region,2048,2048)));
            }
            else if(_loc2_.method_5888(_loc1_))
            {
               this._tiles.push(new class_2385(_loc1_,view,0,0,this.method_1134.region));
            }
         }
      }
      
      private function method_6244(param1:Rectangle, param2:int, param3:int) : Rectangle
      {
         if(param1)
         {
            param1 = param1.clone();
            param1.width = Math.min(2048,param1.width - param2);
            param1.height = Math.min(2048,param1.height - param3);
         }
         return param1;
      }
      
      override protected function unloadView() : void
      {
         while(this._tiles.length > 0)
         {
            this._tiles.pop().unloadView();
         }
         super.unloadView();
      }
   }
}
