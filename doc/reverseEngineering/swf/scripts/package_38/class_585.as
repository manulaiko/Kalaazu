package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_585 implements ICommand
   {
      
      public static const ID:int = 29002;
       
      
      public var var_4266:int = 0;
      
      public var var_1062:Boolean = false;
      
      public var var_2632:int = 0;
      
      public function class_585(param1:int = 0, param2:int = 0, param3:Boolean = false)
      {
         super();
         this.var_2632 = param1;
         this.var_4266 = param2;
         this.var_1062 = param3;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 9;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_4266 = param1.readInt();
         this.var_4266 = Number(this.var_4266) >>> 2 | Number(this.var_4266) << 30;
         this.var_1062 = param1.readBoolean();
         this.var_2632 = param1.readInt();
         this.var_2632 = Number(this.var_2632) >>> 2 | Number(this.var_2632) << 30;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_4266) << 2 | Number(this.var_4266) >>> 30);
         param1.writeBoolean(this.var_1062);
         param1.writeInt(Number(this.var_2632) << 2 | Number(this.var_2632) >>> 30);
         param1.writeShort(-1111);
      }
   }
}
