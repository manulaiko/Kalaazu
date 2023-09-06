package net.bigpoint.darkorbit.gui
{
   import package_14.class_52;
   import package_9.class_50;
   
   public class class_1051 implements class_52
   {
       
      
      public var var_3245:int = 1;
      
      public var seconds:int;
      
      public var var_531:int;
      
      public var var_4559:int;
      
      public var isRunning:Boolean;
      
      private var name_134:Number = 0;
      
      public var onCompleteCallback:Function;
      
      public function class_1051(param1:int, param2:int)
      {
         super();
         this.var_4559 = param1;
         this.seconds = param2;
         this.var_531 = param2;
      }
      
      public function cleanup() : void
      {
      }
      
      public function update() : void
      {
         if(this.seconds > 0 && !this.isRunning)
         {
            this.isRunning = true;
            class_50.method_5621(this);
         }
      }
      
      public function updateTimer(param1:Number) : void
      {
         this.name_134 += param1;
         if(this.name_134 > 999)
         {
            --this.seconds;
            if(this.seconds <= 0)
            {
               this.seconds = 0;
               this.isRunning = false;
               class_50.removeObserver(this);
               if(this.onCompleteCallback != null)
               {
                  this.onCompleteCallback(this.var_4559);
               }
            }
            this.name_134 = 0;
         }
      }
   }
}
