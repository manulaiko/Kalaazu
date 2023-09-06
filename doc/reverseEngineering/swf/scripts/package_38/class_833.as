package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_833 implements ICommand
   {
      
      public static const ID:int = 9515;
       
      
      public var var_5014:int = 0;
      
      public var var_1301:int = 0;
      
      public function class_833(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_5014 = param1;
         this.var_1301 = param2;
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
         param1.readShort();
         this.var_5014 = param1.readInt();
         this.var_5014 = Number(this.var_5014) >>> 2 | Number(this.var_5014) << 30;
         this.var_1301 = param1.readInt();
         this.var_1301 = Number(this.var_1301) >>> 12 | Number(this.var_1301) << 20;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-17199);
         param1.writeInt(Number(this.var_5014) << 2 | Number(this.var_5014) >>> 30);
         param1.writeInt(Number(this.var_1301) << 12 | Number(this.var_1301) >>> 20);
         param1.writeShort(-2469);
      }
   }
}
