package package_183
{
   import com.bigpoint.utils.class_129;
   import package_14.class_52;
   import package_17.class_62;
   import package_329.class_1918;
   import package_9.class_50;
   
   public class class_1591 extends Condition implements class_52
   {
       
      
      private var name_12:int;
      
      private var name_11:int;
      
      private var facade:class_62;
      
      public function class_1591()
      {
         this.facade = class_62.getInstance();
         super();
      }
      
      override public function set runstate(param1:Boolean) : void
      {
         super.runstate = param1;
      }
      
      override public function set current(param1:int) : void
      {
         _current = param1;
         this.method_1749();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         super.method_153(param1);
         _description = _description.replace(/%TIME%/,class_129.method_1101(Math.ceil(Number(_target) * 0.001)));
      }
      
      private function method_5725(param1:Boolean) : void
      {
         this.method_1749();
         if(param1)
         {
            class_50.method_5621(this);
         }
         else
         {
            class_50.removeObserver(this);
         }
      }
      
      private function method_1749() : void
      {
         this.name_11 = Math.ceil(Number(current) * 0.001);
      }
      
      public function updateTimer(param1:Number) : void
      {
         this.name_12 += param1;
         while(this.name_12 > 1000)
         {
            this.name_12 -= 1000;
            --this.name_11;
            this.current = Number(current) - 1000;
            var_106 = class_129.method_1101(this.name_11);
            this.facade.method_2407(class_1918.UPDATE_QUEST_CONDITION_VIEW,this);
         }
      }
      
      override public function set questIsRunning(param1:Boolean) : void
      {
         super.questIsRunning = param1;
         this.method_5725(param1);
      }
   }
}
