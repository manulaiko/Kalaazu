package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_503 implements ICommand
   {
      
      public static const ID:int = 27329;
       
      
      public var color:int = 0;
      
      public var uid:int = 0;
      
      public var var_3097:int = 0;
      
      public var range:int = 0;
      
      public function class_503(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this.uid = param1;
         this.range = param2;
         this.color = param3;
         this.var_3097 = param4;
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
         param1.readShort();
         this.color = param1.readInt();
         this.color = Number(this.color) << 9 | Number(this.color) >>> 23;
         this.uid = param1.readInt();
         this.uid = Number(this.uid) << 9 | Number(this.uid) >>> 23;
         this.var_3097 = param1.readInt();
         this.var_3097 = Number(this.var_3097) >>> 12 | Number(this.var_3097) << 20;
         this.range = param1.readInt();
         this.range = Number(this.range) << 2 | Number(this.range) >>> 30;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-30759);
         param1.writeInt(Number(this.color) >>> 9 | Number(this.color) << 23);
         param1.writeInt(Number(this.uid) >>> 9 | Number(this.uid) << 23);
         param1.writeInt(Number(this.var_3097) << 12 | Number(this.var_3097) >>> 20);
         param1.writeInt(Number(this.range) >>> 2 | Number(this.range) << 30);
      }
   }
}
