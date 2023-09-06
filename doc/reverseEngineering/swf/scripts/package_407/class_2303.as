package package_407
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.fui.components.core.data.VectorCollection;
   import net.bigpoint.darkorbit.fui.components.custom.ResultLabel;
   import net.bigpoint.darkorbit.fui.components.list.itemlist.ItemList;
   import net.bigpoint.darkorbit.fui.components.scroll.ScrollEvent;
   import net.bigpoint.darkorbit.fui.components.scroll.Scrollbar;
   import net.bigpoint.darkorbit.fui.components.text.label.Label;
   import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;
   import package_184.class_1654;
   import package_456.class_2538;
   import package_456.class_2539;
   import package_70.SimpleWindowEvent;
   import package_9.ResourceManager;
   
   public class class_2303 extends Sprite
   {
       
      
      private const const_851:Dictionary = new Dictionary();
      
      private var var_3047:IWindow;
      
      private var var_2805:DisplayObjectContainer;
      
      private var var_1805:ItemList;
      
      private var var_4524:ItemList;
      
      private var var_1947:Scrollbar;
      
      private var var_3493:Label;
      
      private var var_3762:Label;
      
      private var var_1972:ResultLabel;
      
      public function class_2303(param1:IWindow)
      {
         super();
         this.const_851[class_1654.const_2032] = this.method_5131;
         this.const_851[class_1654.const_1328] = this.method_5553;
         this.const_851[class_1654.const_474] = this.method_1975;
         this.var_3047 = param1;
         this.var_3047.addEventListener(SimpleWindowEvent.ON_CLOSE,this.method_2519);
      }
      
      private function method_1975() : void
      {
         this.var_1972.background = ResourceManager.getBitmapData(class_2541.const_2054,class_2541.const_2466);
         this.var_1972.localizedText = "label_traininggrounds_results_draw";
         this.var_1972.gradient = ResourceManager.getBitmapData(class_2541.const_357,class_2541.const_751);
      }
      
      private function method_5553() : void
      {
         this.var_1972.background = ResourceManager.getBitmapData(class_2541.const_2054,class_2541.const_2499);
         this.var_1972.localizedText = "label_traininggrounds_results_defeat";
         this.var_1972.gradient = ResourceManager.getBitmapData(class_2541.const_357,class_2541.const_823);
         this.var_1972.texture = ResourceManager.getBitmapData(class_2541.const_357,class_2541.const_1249);
      }
      
      private function method_5131() : void
      {
         this.var_1972.background = ResourceManager.getBitmapData(class_2541.const_2054,class_2541.const_507);
         this.var_1972.localizedText = "label_traininggrounds_results_victory";
         this.var_1972.gradient = ResourceManager.getBitmapData(class_2541.const_357,class_2541.const_2899);
         this.var_1972.shine = ResourceManager.getBitmapData(class_2541.const_357,class_2541.const_2284);
         this.var_1972.flash = ResourceManager.getBitmapData(class_2541.const_357,class_2541.const_2276);
      }
      
      public function method_866() : void
      {
         var _loc1_:* = null;
         this.var_2805 = this.getChildByName("windowContentContainer") as DisplayObjectContainer;
         if(this.var_2805)
         {
            this.var_1805 = this.var_2805.getChildByName("traininggroundsScoreItemlist") as ItemList;
            if(this.var_1805)
            {
               this.var_1805.itemDataAssigner = class_2539;
            }
            this.var_4524 = this.var_2805.getChildByName("traininggroundsRewardsItemlist") as ItemList;
            if(this.var_4524)
            {
               this.var_4524.itemDataAssigner = class_2538;
               this.var_4524.addEventListener(ScrollEvent.SCROLLCONTAINER_VERTICAL_SIZE_CHANGED,this.method_4041);
            }
            this.var_1947 = this.var_2805.getChildByName("rewardScrollbar") as Scrollbar;
            this.var_1947.addEventListener(ScrollEvent.SCROLLBAR_POSITION_CHANGED,this.method_4284);
            this.var_3493 = this.var_2805.getChildByName("headerWinner") as Label;
            this.var_3762 = this.var_2805.getChildByName("headerLoser") as Label;
            _loc1_ = this.var_2805.getChildByName("result");
            this.var_1972 = _loc1_ as ResultLabel;
         }
      }
      
      public function method_5936(param1:uint, param2:Vector.<String>, param3:Vector.<Vector.<String>>, param4:Vector.<Vector.<String>>) : void
      {
         this.var_3493.text = param2[0];
         this.var_3762.text = param2[1];
         this.const_851[param1]();
         this.var_1805.list = new VectorCollection(param3);
         this.var_4524.list = new VectorCollection(param4);
      }
      
      private function method_4041(param1:ScrollEvent) : void
      {
         var _loc2_:Number = param1.viewSize;
         var _loc3_:Number = param1.contentSize;
         if(this.var_1947)
         {
            this.var_1947.updateBySizes(_loc2_,_loc3_);
         }
      }
      
      private function method_4284(param1:ScrollEvent) : void
      {
         var _loc2_:Number = NaN;
         if(this.var_1947)
         {
            _loc2_ = Number(this.var_1947.getScrollPositionInPercent());
            this.var_4524.setScrollPositionInPercent(_loc2_);
         }
      }
      
      private function method_2519(param1:SimpleWindowEvent) : void
      {
         dispatchEvent(new class_2540(class_2540.RESULTS_CLOSED));
      }
   }
}
