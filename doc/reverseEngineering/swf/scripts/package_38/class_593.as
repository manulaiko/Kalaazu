package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_593 implements ICommand
   {
      
      public static const ID:int = 30161;
       
      
      public var level:int = 0;
      
      public var amount:int = 0;
      
      public var var_384:class_424;
      
      public function class_593(param1:class_424 = null, param2:int = 0, param3:int = 0)
      {
         super();
         if(param1 == null)
         {
            this.var_384 = new class_424();
         }
         else
         {
            this.var_384 = param1;
         }
         this.level = param2;
         this.amount = param3;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 8;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.level = param1.readInt();
         this.level = Number(this.level) >>> 4 | Number(this.level) << 28;
         this.amount = param1.readInt();
         this.amount = Number(this.amount) >>> 2 | Number(this.amount) << 30;
         param1.readShort();
         this.var_384 = class_127.getInstance().createInstance(param1.readShort()) as class_424;
         this.var_384.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.level) << 4 | Number(this.level) >>> 28);
         param1.writeInt(Number(this.amount) << 2 | Number(this.amount) >>> 30);
         param1.writeShort(-19490);
         this.var_384.write(param1);
      }
   }
}
