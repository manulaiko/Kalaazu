package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo
{
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
   import package_335.class_1896;
   import package_335.class_1914;
   import package_38.class_555;
   import package_38.class_730;
   
   public class ItemTimerVO
   {
       
      
      private var _time:Number;
      
      private var _maxTime:Number;
      
      private var _timerState:String;
      
      private var _countDownTimer:class_1914;
      
      public function ItemTimerVO(param1:Number, param2:Number, param3:String)
      {
         super();
         this._time = param1;
         this._maxTime = param2;
         this._timerState = param3;
         if(Boolean(this._time) && this._timerState != ItemsControlMenuConstants.TIMER_STATE_READY)
         {
            this._countDownTimer = new class_1914(this._time);
            this._countDownTimer.addEventListener(class_1896.const_2754,this.countDownFinishHandler,false,0,true);
            this._countDownTimer.start();
         }
      }
      
      public static function parseTimer(param1:class_555) : ItemTimerVO
      {
         return new ItemTimerVO(param1.time,param1.maxTime,ItemsControlMenuConstants.TIMER_STATES_MAP[param1.timerState.var_1772]);
      }
      
      public static function parseCooldownGroupTimer(param1:class_730) : ItemTimerVO
      {
         return new ItemTimerVO(param1.time,param1.maxTime,ItemsControlMenuConstants.TIMER_STATES_MAP[param1.timerState.var_1772]);
      }
      
      private function countDownFinishHandler(param1:class_1896) : void
      {
         this._countDownTimer = null;
      }
      
      public function get time() : Number
      {
         return this._time;
      }
      
      public function get maxTime() : Number
      {
         return this._maxTime;
      }
      
      public function get timerState() : String
      {
         return this._timerState;
      }
      
      public function get countDownTimer() : class_1914
      {
         return this._countDownTimer;
      }
   }
}
