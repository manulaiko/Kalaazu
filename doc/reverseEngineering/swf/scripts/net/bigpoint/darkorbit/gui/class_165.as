package net.bigpoint.darkorbit.gui
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.text.TextFormatAlign;
   import net.bigpoint.darkorbit.class_126;
   import package_30.class_209;
   import package_30.class_268;
   import package_33.class_93;
   import package_65.class_203;
   import package_76.class_215;
   import package_9.ResourceManager;
   import package_9.class_50;
   
   public class class_165 extends class_93
   {
       
      
      private var _height:int;
      
      private var var_3305:class_268;
      
      private var var_2035:class_203;
      
      private var var_3939:class_209;
      
      private var var_1108:DisplayObjectContainer;
      
      private var var_3646:DisplayObject;
      
      private var var_1048:String;
      
      public function class_165(param1:class_58)
      {
         super(param1,class_93.const_1574);
         this.var_3939 = new class_209(200,50,TextFormatAlign.LEFT);
         this.var_3939.textArea.editable = false;
         this.var_3939.textArea.focusEnabled = false;
         this.var_1108 = new Sprite();
         this.addElement(this.var_1108);
         this.addElement(this.var_3939,class_93.const_2568);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_267);
         addEventListener(Event.ADDED_TO_STAGE,this.method_1618);
      }
      
      private function method_1618(param1:Event) : void
      {
         class_126.getInstance().const_1548.add(this.method_293);
      }
      
      private function method_267(param1:Event) : void
      {
         class_126.getInstance().const_1548.remove(this.method_293);
      }
      
      public function set quest(param1:class_203) : void
      {
         if(!this.var_2035 || param1.id != this.var_2035.id)
         {
            this.var_2035 = param1;
            this.method_293();
            this.update();
         }
      }
      
      private function method_293() : void
      {
         var _loc2_:* = null;
         var _loc1_:String = !!this.var_2035.name_19 ? "questfm_" + this.var_2035.name_19 : class_126.instance.method_3327(this.var_2035.id);
         if(this.var_1048 == _loc1_)
         {
            return;
         }
         _loc2_ = ResourceManager.getMovieClip("questWin","questfm_portrait");
         if(!_loc2_)
         {
            return;
         }
         this.var_1048 = _loc1_;
         this._height = _loc2_.height;
         this.var_3305 = new class_268(_loc2_.width,_loc2_.height);
         this.var_3305.fadeOut = false;
         this.var_3305.alpha = 0.1;
         this.var_3305.name_92 = false;
         this.var_3305.start();
         class_215.method_5129(this.var_1108);
         this.var_1108.addChild(_loc2_);
         this.var_3939.x = this.var_1108.x + this.var_1108.width;
         this.var_3939.y = this.var_1108.y;
         this.var_3939.textArea.height = this._height;
         this.var_3646 = ResourceManager.getDisplayObject("questWin",this.var_1048);
         this.var_3646.scrollRect = new Rectangle(0,0,_loc2_.width,_loc2_.height);
         _loc2_.content.addChild(this.var_3646);
         _loc2_.content.addChild(this.var_3305);
      }
      
      private function update() : void
      {
         this.var_3939.textArea.text = this.var_2035.description;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(Boolean(this.var_3305) && param1 != visible)
         {
            if(param1)
            {
               class_50.method_5621(this.var_3305);
            }
            else
            {
               class_50.removeObserver(this.var_3305);
            }
         }
         if(param1 && this.var_3646 is MovieClip)
         {
            MovieClip(this.var_3646).gotoAndPlay(1);
         }
         super.visible = param1;
      }
   }
}
