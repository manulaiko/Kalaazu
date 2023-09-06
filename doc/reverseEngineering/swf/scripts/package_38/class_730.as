package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_730 implements ICommand
   {
      
      public static const ID:int = 2072;
       
      
      public var timerState:class_862;
      
      public var var_3941:class_745;
      
      public var time:Number = 0;
      
      public var maxTime:Number = 0;
      
      public function class_730(param1:class_745 = null, param2:class_862 = null, param3:Number = 0, param4:Number = 0)
      {
         super();
         if(param1 == null)
         {
            this.var_3941 = new class_745();
         }
         else
         {
            this.var_3941 = param1;
         }
         if(param2 == null)
         {
            this.timerState = new class_862();
         }
         else
         {
            this.timerState = param2;
         }
         this.time = param3;
         this.maxTime = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 16;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.timerState = class_127.getInstance().createInstance(param1.readShort()) as class_862;
         this.timerState.read(param1);
         this.var_3941 = class_127.getInstance().createInstance(param1.readShort()) as class_745;
         this.var_3941.read(param1);
         this.time = param1.readDouble();
         this.maxTime = param1.readDouble();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.timerState.write(param1);
         this.var_3941.write(param1);
         param1.writeDouble(this.time);
         param1.writeDouble(this.maxTime);
         param1.writeShort(-3269);
      }
   }
}
