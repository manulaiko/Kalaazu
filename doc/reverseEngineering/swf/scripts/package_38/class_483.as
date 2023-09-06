package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_483 implements ICommand
   {
      
      public static const ID:int = 21036;
       
      
      public var amount:int = 0;
      
      public var var_861:class_427;
      
      public function class_483(param1:class_427 = null, param2:int = 0)
      {
         super();
         if(param1 == null)
         {
            this.var_861 = new class_427();
         }
         else
         {
            this.var_861 = param1;
         }
         this.amount = param2;
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
         this.amount = param1.readInt();
         this.amount = Number(this.amount) >>> 7 | Number(this.amount) << 25;
         this.var_861 = class_127.getInstance().createInstance(param1.readShort()) as class_427;
         this.var_861.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.amount) << 7 | Number(this.amount) >>> 25);
         this.var_861.write(param1);
      }
   }
}
