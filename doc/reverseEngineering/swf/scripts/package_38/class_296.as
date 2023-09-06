package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_296 implements ICommand
   {
      
      public static const ID:int = 17063;
       
      
      public var name_18:int = 0;
      
      public var var_3280:int = 0;
      
      public var name_141:int = 0;
      
      public var var_15:int = 0;
      
      public function class_296(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this.var_3280 = param1;
         this.name_18 = param2;
         this.name_141 = param3;
         this.var_15 = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 16;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name_18 = param1.readInt();
         this.name_18 = Number(this.name_18) << 8 | Number(this.name_18) >>> 24;
         this.var_3280 = param1.readInt();
         this.var_3280 = Number(this.var_3280) << 15 | Number(this.var_3280) >>> 17;
         param1.readShort();
         this.name_141 = param1.readInt();
         this.name_141 = Number(this.name_141) >>> 4 | Number(this.name_141) << 28;
         this.var_15 = param1.readInt();
         this.var_15 = Number(this.var_15) << 5 | Number(this.var_15) >>> 27;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_18) >>> 8 | Number(this.name_18) << 24);
         param1.writeInt(Number(this.var_3280) >>> 15 | Number(this.var_3280) << 17);
         param1.writeShort(-1667);
         param1.writeInt(Number(this.name_141) << 4 | Number(this.name_141) >>> 28);
         param1.writeInt(Number(this.var_15) >>> 5 | Number(this.var_15) << 27);
      }
   }
}
