package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.counterDots
{
   import flash.display.DisplayObjectContainer;
   import package_11.class_39;
   import package_141.class_969;
   import package_241.class_2287;
   
   public class CounterDots extends class_969
   {
      
      private static const DOTS_IN_ROW:int = 5;
      
      private static const FIRST_ROW:String = "firstRow";
      
      private static const SECOND_ROW:String = "secondRow";
       
      
      public var firsRow:class_2287;
      
      public var secondRow:class_2287;
      
      private var _dotColor:Number = 16777215;
      
      public function CounterDots(param1:DisplayObjectContainer, param2:class_39)
      {
         super(param1,param2);
      }
      
      override public function decorate() : void
      {
         method_4210(this.firsRow = new class_2287(method_4492(FIRST_ROW)));
         method_4210(this.secondRow = new class_2287(method_4492(SECOND_ROW)));
      }
      
      public function setProgress(param1:int, param2:int, param3:Number, param4:Boolean = true) : void
      {
         this.firsRow.method_3928();
         this.secondRow.method_3928();
         this._dotColor = param3;
         this.showDots(this.firsRow,Math.min(param1,DOTS_IN_ROW),Math.min(param2,DOTS_IN_ROW));
         if(param2 > 5)
         {
            this.showDots(this.secondRow,Math.max(0,param1 - DOTS_IN_ROW),Math.max(0,param2 - DOTS_IN_ROW));
         }
         if(param4)
         {
            visible = true;
            alpha = 1;
         }
         this.updateLayout();
      }
      
      private function showDots(param1:class_2287, param2:int, param3:Number) : void
      {
         var _loc5_:* = null;
         param1.method_3928();
         var _loc4_:int = 0;
         while(_loc4_ != param3)
         {
            (_loc5_ = new Dot(_swfFinisher)).setData(_loc4_ < param2,this._dotColor);
            param1.addItem(_loc5_,1,0);
            _loc4_++;
         }
      }
      
      override public function updateLayout() : void
      {
         this.firsRow.x = Number(width) - Number(this.firsRow.width) >> 1;
         this.secondRow.x = Number(width) - Number(this.secondRow.width) >> 1;
      }
   }
}
