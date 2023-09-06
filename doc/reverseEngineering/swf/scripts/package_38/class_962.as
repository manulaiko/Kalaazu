package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_962 implements ICommand
   {
      
      public static const const_1062:uint = 2;
      
      public static const const_3065:uint = 0;
      
      public static const const_47:uint = 3;
      
      public static const PENDING:uint = 1;
      
      public static const ID:int = 15045;
       
      
      public var done:Boolean = false;
      
      public var state:uint = 0;
      
      public var var_4424:int = 0;
      
      public function class_962(param1:uint = 0, param2:int = 0, param3:Boolean = false)
      {
         super();
         this.state = param1;
         this.var_4424 = param2;
         this.done = param3;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 5;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.done = param1.readBoolean();
         param1.readShort();
         this.state = param1.readShort();
         this.var_4424 = param1.readInt();
         this.var_4424 = Number(this.var_4424) << 4 | Number(this.var_4424) >>> 28;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.done);
         param1.writeShort(12497);
         param1.writeShort(this.state);
         param1.writeInt(Number(this.var_4424) >>> 4 | Number(this.var_4424) << 28);
      }
   }
}
