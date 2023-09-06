package package_279
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.model.traits.class_308;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_11.class_39;
   import package_112.class_307;
   import package_113.class_404;
   import package_116.class_317;
   import package_29.class_85;
   import package_76.class_215;
   import package_9.ResourceManager;
   
   public class TopDisplay extends Sprite implements IDisposable
   {
       
      
      private var _owner:class_85;
      
      private var _container:Sprite;
      
      private var var_4650:Bitmap;
      
      private var var_887:TextField;
      
      private var var_4194:class_2322;
      
      private var var_3549:class_2014;
      
      private var var_669:class_317;
      
      public function TopDisplay(param1:class_85)
      {
         this._container = new Sprite();
         this.var_4650 = new Bitmap();
         this.var_887 = new TextField();
         this.var_4194 = new class_2322();
         super();
         this._owner = param1;
         this.var_4194.alignment = class_2322.BOTTOM;
         this.var_4194.method_5943 = class_2322.CENTER;
         this.var_4194.gap = 5;
         this._container.addChild(this.var_4650);
         addChild(this.var_4194);
         if(this.hp)
         {
            this.var_3549 = new class_2014(this.hp);
            this._container.addChild(this.var_3549);
            this.hp.changed.add(this.updateLayout);
         }
         addChild(this._container);
         this._owner.name_110.add(this.method_672);
         this._owner.name_33.add(this.method_672);
         if(this._owner is class_86)
         {
            this.var_669 = (this._owner as class_86).drones;
            if(this.var_669)
            {
               Settings.displayDrones.changed.add(this.method_672);
               this.var_669.const_1831.add(this.method_672);
               this.var_669.const_1693.changed.add(this.method_672);
            }
         }
         this.redraw();
      }
      
      private function get hp() : class_308
      {
         return this._owner.method_1954(class_308) as class_308;
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         if(this.var_669)
         {
            this.var_669.const_1831.remove(this.method_672);
            this.var_669.const_1693.changed.remove(this.method_672);
         }
         if(this.hp)
         {
            this.hp.changed.remove(this.updateLayout);
         }
         if(this.var_3549)
         {
            this.var_3549.disposeView();
         }
         this._owner.name_110.remove(this.method_672);
         this._owner.name_33.remove(this.method_672);
         Settings.displayDrones.changed.remove(this.method_672);
      }
      
      private function method_672(... rest) : void
      {
         if(hasEventListener(Event.ENTER_FRAME))
         {
            return;
         }
         addEventListener(Event.ENTER_FRAME,this.listener);
      }
      
      private function listener(param1:Event) : void
      {
         this.redraw();
      }
      
      public function redraw() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.listener);
         this.method_5126();
         this.method_2922();
         this.method_5619();
         this.updateLayout();
      }
      
      private function updateLayout() : void
      {
         this.var_4194.y = -40;
         this.var_4650.y = -Number(this.var_4650.height);
         this.var_887.x = 0;
         this.var_887.y = 0;
         if(Boolean(this.var_3549) && Boolean(this.var_3549.visible))
         {
            this.var_4194.y -= -10;
            this.var_3549.x = this.var_4650.width + 5;
            this.var_3549.y = -18;
            this.var_887.x = this.var_3549.x + Number(this.var_3549.width) / 2 - Number(this.var_887.width) / 2;
            this.var_887.y = this.var_3549.y + this.var_3549.height + 3;
            if(this._owner is class_307)
            {
               this.var_3549.y -= 15;
            }
         }
         else
         {
            this.var_887.y = -12;
            this.var_887.x = this.var_4650.width;
         }
         this._container.x = -Number(this._container.width) * 0.5;
      }
      
      private function method_5619() : void
      {
         if(Settings.displayDrones.value || this.var_669 == null)
         {
            class_215.removeDisplayObject(this.var_887);
         }
         else
         {
            this.var_887.defaultTextFormat = class_18.const_1801;
            this.var_887.embedFonts = class_18.var_4441;
            this.var_887.antiAliasType = AntiAliasType.ADVANCED;
            this.var_887.autoSize = TextFieldAutoSize.LEFT;
            this.var_887.htmlText = this.var_669.method_6136();
            this._container.addChild(this.var_887);
         }
      }
      
      private function method_2922() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(Boolean(this.var_669) && this.var_669.drones.length > 0)
         {
            _loc1_ = class_126.instance.method_2227[this.var_669.const_1693.value];
            _loc2_ = class_39(ResourceManager.name_15.getFinisher("icons"));
            this.var_4650.bitmapData = _loc2_.getEmbeddedBitmapData(_loc1_);
         }
         else
         {
            this.var_4650.bitmapData = null;
         }
      }
      
      private function method_5126() : void
      {
         var _loc5_:* = null;
         var _loc1_:Vector.<DisplayObject> = this.var_4194.elements;
         var _loc2_:int = _loc1_.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            (_loc1_[_loc3_] as class_2323).sizeChanged.remove(this.var_4194.updateLayout);
            _loc3_++;
         }
         var _loc4_:Vector.<class_404>;
         _loc2_ = (_loc4_ = Vector.<class_404>(this._owner.getTraits(class_404))).length;
         this.var_4194.reset();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            (_loc5_ = this.buildObject(_loc4_[_loc3_] as class_404)).sizeChanged.add(this.var_4194.updateLayout);
            this.var_4194.addElement(_loc5_);
            _loc3_++;
         }
      }
      
      private function buildObject(param1:class_404) : class_2323
      {
         return Builder.buildObject(param1);
      }
   }
}

import avmplus.getQualifiedClassName;
import flash.utils.Dictionary;
import package_107.ClassUtils;
import package_113.class_2285;
import package_113.class_2286;
import package_113.class_404;
import package_113.class_405;
import package_279.class_2323;
import package_279.class_2324;
import package_279.class_2325;
import package_279.class_2326;
import package_279.class_2327;

class Builder
{
   
   private static const MAPPING:Dictionary = new Dictionary();
   
   {
      MAPPING[ClassUtils.method_3656(class_404)] = class_2327;
      MAPPING[ClassUtils.method_3656(class_405)] = class_2326;
      MAPPING[ClassUtils.method_3656(class_2285)] = class_2325;
      MAPPING[ClassUtils.method_3656(class_2286)] = class_2324;
   }
   
   function Builder()
   {
      super();
   }
   
   public static function buildObject(param1:class_404) : class_2323
   {
      return new MAPPING[getQualifiedClassName(param1)](param1);
   }
}
