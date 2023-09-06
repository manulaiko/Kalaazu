package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_751 implements ICommand
   {
      
      public static const ID:int = 21475;
       
      
      public var hours:int = 0;
      
      public var var_1939:class_441;
      
      public function class_751(param1:class_441 = null, param2:int = 0)
      {
         super();
         if(param1 == null)
         {
            this.var_1939 = new class_441();
         }
         else
         {
            this.var_1939 = param1;
         }
         this.hours = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 4;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.hours = param1.readInt();
         this.hours = Number(this.hours) >>> 13 | Number(this.hours) << 19;
         this.var_1939 = class_127.getInstance().createInstance(param1.readShort()) as class_441;
         this.var_1939.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.hours) << 13 | Number(this.hours) >>> 19);
         this.var_1939.write(param1);
      }
   }
}
