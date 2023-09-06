package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_914 implements ICommand
   {
      
      public static const ID:int = 28700;
       
      
      public var var_1199:int = 0;
      
      public var level:int = 0;
      
      public var var_4705:int = 0;
      
      public function class_914(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.level = param1;
         this.var_1199 = param2;
         this.var_4705 = param3;
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
         this.var_1199 = param1.readInt();
         this.var_1199 = Number(this.var_1199) >>> 6 | Number(this.var_1199) << 26;
         this.level = param1.readInt();
         this.level = Number(this.level) << 12 | Number(this.level) >>> 20;
         this.var_4705 = param1.readInt();
         this.var_4705 = Number(this.var_4705) << 5 | Number(this.var_4705) >>> 27;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_1199) << 6 | Number(this.var_1199) >>> 26);
         param1.writeInt(Number(this.level) >>> 12 | Number(this.level) << 20);
         param1.writeInt(Number(this.var_4705) >>> 5 | Number(this.var_4705) << 27);
      }
   }
}
