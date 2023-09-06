package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_954 implements ICommand
   {
      
      public static const ID:int = 28127;
       
      
      public var var_2527:Boolean = false;
      
      public var name_150:int = 0;
      
      public var var_256:int = 0;
      
      public var name_133:int = 0;
      
      public var var_2935:Boolean = false;
      
      public function class_954(param1:int = 0, param2:int = 0, param3:int = 0, param4:Boolean = false, param5:Boolean = false)
      {
         super();
         this.name_133 = param1;
         this.name_150 = param2;
         this.var_256 = param3;
         this.var_2527 = param4;
         this.var_2935 = param5;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 14;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_2527 = param1.readBoolean();
         this.name_150 = param1.readInt();
         this.name_150 = Number(this.name_150) << 14 | Number(this.name_150) >>> 18;
         this.var_256 = param1.readInt();
         this.var_256 = Number(this.var_256) >>> 10 | Number(this.var_256) << 22;
         this.name_133 = param1.readInt();
         this.name_133 = Number(this.name_133) << 10 | Number(this.name_133) >>> 22;
         this.var_2935 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.var_2527);
         param1.writeInt(Number(this.name_150) >>> 14 | Number(this.name_150) << 18);
         param1.writeInt(Number(this.var_256) << 10 | Number(this.var_256) >>> 22);
         param1.writeInt(Number(this.name_133) >>> 10 | Number(this.name_133) << 22);
         param1.writeBoolean(this.var_2935);
      }
   }
}
