package package_280
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.map.class_87;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.common.class_1699;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.model.traits.class_1180;
   import package_10.class_305;
   import package_11.class_39;
   import package_195.class_1203;
   import package_9.ResourceManager;
   
   public class class_1701 extends class_1203 implements class_1699, class_80, IDisposable
   {
      
      private static const const_1694:Number = 0.3;
      
      private static const const_1318:Array = [];
      
      {
         const_1318[class_1180.const_994] = class_18.const_81;
         const_1318[class_1180.const_2201] = class_18.const_1050;
      }
      
      private var var_2005:MovieClip;
      
      private var var_3155:TextField;
      
      private var _data:class_1180;
      
      private var var_4311:class_2013;
      
      public function class_1701(param1:class_87, param2:class_1180)
      {
         this.var_2005 = new MovieClip();
         super(param1,new class_305());
         this._data = param2;
         this._data.enabled.changed.add(this.method_1089);
         this._data.highlight.changed.add(this.method_2291);
         this._data.const_2955.add(this.method_1698);
         this._data.const_1038.add(this.method_5757);
         this._data.text.changed.add(this.handleTextChanged);
         this._data.const_250.changed.add(this.setTextFormat);
         ResourceManager.name_15.load(param2.method_3109.srcKey,this.method_4938);
      }
      
      private function method_5757() : void
      {
         if(this.var_2005)
         {
            this.var_2005.gotoAndStop(1);
         }
      }
      
      private function method_1698() : void
      {
         if(this.var_2005)
         {
            this.var_2005.gotoAndStop(2);
         }
      }
      
      override public function updateObj(param1:Number) : void
      {
         var _loc2_:* = null;
         _loc2_ = this._data.method_1974(_mapView);
         x = Number(_loc2_.x) - Number(this._data.const_649.x);
         y = Number(_loc2_.y) - Number(this._data.const_649.y);
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         if(this.var_4311)
         {
            this.var_4311.deactivate();
         }
         super.disposeView(param1);
      }
      
      private function method_4938(param1:class_39) : void
      {
         this.var_2005 = param1.method_2545(this._data.method_3109.resKey) as MovieClip;
         this.var_2005.gotoAndStop(1);
         addChildAt(this.var_2005,0);
         this.method_1089(false);
         this.var_4311 = new class_2013(this.var_2005);
         if(this.var_3155)
         {
            this.method_2349();
         }
         this.method_2291();
      }
      
      private function method_1089(param1:Boolean = true) : void
      {
         this.var_2005.gotoAndStop(1);
         if(this._data.enabled.value)
         {
            TweenLite.to(this.var_2005,param1 ? Number(const_1694) : 0,{
               "alpha":1,
               "scaleX":1,
               "scaleY":1
            });
         }
         else
         {
            TweenLite.to(this.var_2005,param1 ? Number(const_1694) : 0,{
               "alpha":0.5,
               "scaleX":0.75,
               "scaleY":0.75
            });
         }
      }
      
      private function method_2291() : void
      {
         if(this.var_4311)
         {
            if(this._data.highlight.value)
            {
               this.var_4311.activate();
            }
            else
            {
               this.var_4311.deactivate();
            }
         }
      }
      
      private function handleTextChanged() : void
      {
         if(this.var_3155 == null)
         {
            this.method_4509();
         }
         this.var_3155.text = this._data.text.value || false;
      }
      
      private function method_4509() : void
      {
         this.var_3155 = !!this.var_3155 ? this.var_3155 : new TextField();
         this.var_3155.text = " ";
         this.setTextFormat();
         this.var_3155.embedFonts = class_18.var_3911;
         this.var_3155.autoSize = TextFieldAutoSize.CENTER;
         this.var_3155.y = Number(this.var_3155.height) - 70;
         this.var_3155.x = 0;
         this.method_2349();
      }
      
      private function method_2349() : void
      {
         var _loc1_:int = 0;
         if(this.var_2005)
         {
            _loc1_ = int(this.var_2005.currentFrame);
            this.var_2005.gotoAndStop(1);
            this.var_2005.addChild(this.var_3155);
            this.var_2005.gotoAndStop(_loc1_);
         }
      }
      
      private function setTextFormat() : void
      {
         if(this.var_3155)
         {
            this.var_3155.defaultTextFormat = false || false;
         }
      }
      
      public function get layer() : int
      {
         return 4;
      }
   }
}
