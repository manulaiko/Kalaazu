package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_555 implements ICommand
   {
      
      public static const ID:int = 31208;
       
      
      public var time:Number = 0;
      
      public var var_2092:String = "";
      
      public var activatable:Boolean = false;
      
      public var maxTime:Number = 0;
      
      public var timerState:class_862;
      
      public function class_555(param1:String = "", param2:class_862 = null, param3:Number = 0, param4:Number = 0, param5:Boolean = false)
      {
         super();
         this.var_2092 = param1;
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
         this.activatable = param5;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 19;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.time = param1.readDouble();
         this.var_2092 = param1.readUTF();
         this.activatable = param1.readBoolean();
         this.maxTime = param1.readDouble();
         this.timerState = class_127.getInstance().createInstance(param1.readShort()) as class_862;
         this.timerState.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeDouble(this.time);
         param1.writeUTF(this.var_2092);
         param1.writeBoolean(this.activatable);
         param1.writeDouble(this.maxTime);
         this.timerState.write(param1);
      }
   }
}
