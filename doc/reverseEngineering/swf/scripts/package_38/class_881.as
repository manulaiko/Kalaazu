package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_881 implements ICommand
   {
      
      public static const ID:int = 28501;
       
      
      public var var_1790:int = 0;
      
      public var var_3301:int = 0;
      
      public var var_1154:int = 0;
      
      public function class_881(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.var_1154 = param1;
         this.var_1790 = param2;
         this.var_3301 = param3;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 12;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_1790 = param1.readInt();
         this.var_1790 = Number(this.var_1790) >>> 16 | Number(this.var_1790) << 16;
         this.var_3301 = param1.readInt();
         this.var_3301 = Number(this.var_3301) << 4 | Number(this.var_3301) >>> 28;
         param1.readShort();
         this.var_1154 = param1.readInt();
         this.var_1154 = Number(this.var_1154) >>> 11 | Number(this.var_1154) << 21;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_1790) << 16 | Number(this.var_1790) >>> 16);
         param1.writeInt(Number(this.var_3301) >>> 4 | Number(this.var_3301) << 28);
         param1.writeShort(23430);
         param1.writeInt(Number(this.var_1154) << 11 | Number(this.var_1154) >>> 21);
      }
   }
}
