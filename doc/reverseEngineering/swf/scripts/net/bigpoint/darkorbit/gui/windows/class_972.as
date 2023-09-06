package net.bigpoint.darkorbit.gui.windows
{
   import com.greensock.TweenLite;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.components.FeatureBtn;
   import package_11.class_39;
   
   public class class_972 extends FeatureBtn
   {
      
      public static const const_1343:int = 0;
      
      public static const const_2757:int = 7;
       
      
      private var _minimizable:Boolean;
      
      public function class_972(param1:class_39, param2:BitmapData, param3:BitmapData, param4:Boolean = true)
      {
         super(param1,null,param2,param3,null);
         x = -Number(const_1343);
         y = -Number(const_2757);
         this._minimizable = param4;
         this.method_5156(true,false);
      }
      
      override public function rollHandler(param1:MouseEvent) : void
      {
         if(this._minimizable)
         {
            iconsStates.rollHandler(param1);
         }
      }
      
      override public function mouseUpDownHandler(param1:MouseEvent) : void
      {
         if(this._minimizable)
         {
            iconsStates.mouseUpDownHandler(param1);
         }
      }
      
      public function method_5156(param1:Boolean, param2:Boolean = true) : void
      {
         var _loc3_:Number = param2 ? 0.4 : 0;
         if(param1)
         {
            if(param2)
            {
               background.visible = true;
               background.alpha = 1;
            }
            method_4622(!param1,background,_loc3_);
         }
         else if(param2)
         {
            TweenLite.delayedCall(0.3,method_4622,[!param1,background,_loc3_]);
         }
         else
         {
            method_4622(!param1,background,_loc3_);
         }
      }
   }
}
