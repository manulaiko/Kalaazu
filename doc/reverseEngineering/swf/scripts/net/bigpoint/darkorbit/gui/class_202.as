package net.bigpoint.darkorbit.gui
{
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import package_11.class_39;
   import package_30.class_185;
   import package_30.class_218;
   import package_30.class_91;
   import package_33.class_93;
   import package_46.class_131;
   import package_65.class_173;
   import package_65.class_214;
   import package_70.SimpleWindowEvent;
   import package_70.class_241;
   import package_71.class_189;
   import package_9.ResourceManager;
   
   public class class_202
   {
       
      
      private var var_841:class_131;
      
      private var guiManager:class_58;
      
      private var var_2186:class_39;
      
      private var var_955:Boolean;
      
      private var var_1701:Dictionary;
      
      private var var_2097:Dictionary;
      
      private var var_1839:int;
      
      public function class_202(param1:class_58, param2:class_131)
      {
         this.var_1701 = new Dictionary();
         this.var_2097 = new Dictionary();
         super();
         this.var_841 = param2;
         this.guiManager = param1;
         this.var_2186 = class_39(ResourceManager.name_15.getFinisher("ui"));
         this.method_2052();
      }
      
      private function method_2052() : void
      {
         var _loc2_:int = 35;
         var _loc3_:class_93 = new class_93(this.guiManager,class_93.const_2684);
         this.method_888(class_185.const_1257,_loc3_,"label_description",false);
         this.method_888(class_185.const_2321,_loc3_,"label_overview",true);
         this.method_888(class_185.const_711,_loc3_,"label_reward",false);
         this.method_489(_loc3_);
         this.var_841.method_1655(_loc3_);
         _loc3_.method_5942(new Point(8,_loc2_));
         _loc3_.method_558();
         _loc2_ += _loc3_.height;
         this.method_4183(class_93.const_680,class_185.const_2321,this.var_841,true);
         this.method_4183(class_93.const_2766,class_185.const_711,this.var_841,false);
         this.method_4183(class_93.const_2494,class_185.const_1257,this.var_841,false);
         this.var_1839 = class_185.const_2321;
         var _loc4_:class_173;
         (_loc4_ = new class_173(this.guiManager.method_6185())).y = 8;
         this.var_841.method_1655(_loc4_);
         var _loc5_:class_93;
         (_loc5_ = new class_93(this.guiManager,class_93.const_1649)).visible = false;
         var _loc6_:class_218 = new class_218(class_185.const_635,class_88.getItem("btn_quest_cancel"),this.var_2186.getEmbeddedMovieClip("button1"));
         _loc5_.addElement(_loc6_,class_93.const_2568);
         this.var_841.method_1655(_loc5_);
         this.method_3315();
         this.var_841.addEventListener(SimpleWindowEvent.const_1674,this.method_3315);
         this.var_841.addEventListener(SimpleWindowEvent.SHOW_POPUP,this.method_4032);
         this.var_841.addEventListener(SimpleWindowEvent.HIDE_POPUP,this.method_5965);
      }
      
      private function method_4032(param1:SimpleWindowEvent) : void
      {
         this.var_955 = false;
         this.method_5289 = false;
         this.method_3315(null,true);
      }
      
      private function method_5965(param1:SimpleWindowEvent) : void
      {
         this.method_5289 = true;
         this.method_3315();
      }
      
      private function set method_5289(param1:Boolean) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:class_131 = this.guiManager.method_5764();
         if(!this.var_955)
         {
            _loc6_ = _loc2_.method_3694(class_93.const_1649);
            _loc7_ = _loc2_.method_3694(class_93.const_2684);
            _loc6_.visible = _loc7_.visible = param1;
         }
         var _loc3_:class_214 = this.guiManager.method_5503();
         _loc3_.visible = param1 && this.var_1839 == class_185.const_2321;
         var _loc4_:class_189;
         (_loc4_ = this.guiManager.method_1919()).visible = param1 && this.var_1839 == class_185.const_711;
         var _loc5_:class_93;
         (_loc5_ = this.guiManager.method_1092()).visible = param1 && this.var_1839 == class_185.const_1257;
      }
      
      private function method_888(param1:int, param2:class_93, param3:String, param4:Boolean = false) : void
      {
         var _loc5_:class_218;
         (_loc5_ = new class_218(param1,class_88.getItem(param3),this.var_2186.getEmbeddedMovieClip("button1"))).selected = param4;
         _loc5_.addEventListener(MouseEvent.CLICK,this.method_5855);
         param2.addElement(_loc5_,class_93.const_2568);
         this.var_1701[param1] = _loc5_;
      }
      
      private function method_489(param1:class_93) : void
      {
         var _loc2_:class_91 = new class_91(class_91.const_38);
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.lineStyle(1,8289918);
         _loc3_.graphics.moveTo(0,0);
         _loc3_.graphics.lineTo(240,0);
         _loc2_.addChild(_loc3_);
         _loc2_.y = 20;
         param1.addElement(_loc2_,class_93.const_2374,0);
      }
      
      private function method_4183(param1:int, param2:int, param3:class_131, param4:Boolean = true) : class_93
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         switch(param1)
         {
            case class_93.const_680:
               (_loc7_ = new class_214(this.guiManager.method_6185())).x = 8;
               _loc7_.y = 60;
               _loc7_.isDefaultVisible = true;
               _loc7_.setSize(Number(param3.method_468().width) - 20,Number(param3.method_468().height) - 30);
               _loc7_.visible = param4;
               param3.method_1655(_loc7_);
               this.var_2097[param2] = _loc7_;
               _loc7_.addEventListener(class_241.const_1530,this.method_5327);
               break;
            case class_93.const_2766:
               (_loc8_ = new class_189(this.guiManager.method_6185())).x = 8;
               _loc8_.y = 60;
               _loc8_.visible = param4;
               param3.method_1655(_loc8_);
               this.var_2097[param2] = _loc8_;
               _loc8_.addEventListener(class_241.const_1530,this.method_5327);
               break;
            case class_93.const_2494:
               (_loc9_ = new class_165(this.guiManager)).x = 8;
               _loc9_.y = 60;
               _loc9_.visible = param4;
               param3.method_1655(_loc9_);
               this.var_2097[param2] = _loc9_;
               _loc9_.addEventListener(class_241.const_1530,this.method_5327);
         }
         return _loc8_;
      }
      
      private function method_5327(param1:class_241) : void
      {
         this.var_955 = param1.method_6030;
         this.method_4134(param1.method_4444);
      }
      
      private function method_5855(param1:MouseEvent) : void
      {
         var _loc2_:int = int((param1.currentTarget as class_218).getType());
         this.method_4134(_loc2_);
      }
      
      private function method_4134(param1:int) : void
      {
         this.var_1839 = param1;
         (this.var_1701[class_185.const_2321] as class_218).selected = param1 == class_185.const_2321;
         (this.var_1701[class_185.const_711] as class_218).selected = param1 == class_185.const_711;
         (this.var_1701[class_185.const_1257] as class_218).selected = param1 == class_185.const_1257;
         (this.var_2097[class_185.const_2321] as class_93).visible = param1 == class_185.const_2321;
         (this.var_2097[class_185.const_711] as class_93).visible = param1 == class_185.const_711;
         (this.var_2097[class_185.const_1257] as class_93).visible = param1 == class_185.const_1257;
         this.method_3315();
      }
      
      private function method_3315(param1:Event = null, param2:Boolean = false) : void
      {
         var _loc7_:Number = NaN;
         var _loc3_:class_93 = this.var_841.method_3694(class_93.const_2684);
         var _loc4_:class_93 = this.var_841.method_3694(class_93.const_1649);
         var _loc5_:class_214 = this.guiManager.method_5503();
         if(param2)
         {
            this.var_841.setSize(_loc5_.width,138);
            return;
         }
         var _loc6_:DisplayObject;
         if(_loc6_ = this.method_4763())
         {
            _loc4_.x = Math.max(_loc6_.width / 2 - Number(_loc4_.width) / 2,10);
            _loc4_.y = _loc6_.y + _loc6_.height + _loc4_.height;
            _loc7_ = Math.max(_loc6_.width + _loc6_.x,_loc3_.x + _loc3_.width);
            this.var_841.setSize(_loc7_,_loc4_.height + _loc4_.y);
         }
         _loc4_.visible = !!_loc5_.isDefaultVisible ? false : true;
         _loc3_.visible = false;
         this.method_5101();
      }
      
      private function method_5101() : void
      {
         var _loc1_:class_173 = class_173(this.var_841.method_3694(class_93.const_3185));
         _loc1_.x = Number(this.var_841.method_468().width) - Number(_loc1_.width) - 0;
      }
      
      private function method_4763() : DisplayObject
      {
         return this.var_2097[this.var_1839] as DisplayObject;
      }
   }
}
