package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_542 implements ICommand
   {
      
      public static const ID:int = 29946;
       
      
      public var var_4266:int = 0;
      
      public var x:int = 0;
      
      public var y:int = 0;
      
      public function class_542(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.var_4266 = param1;
         this.x = param2;
         this.y = param3;
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
         this.var_4266 = param1.readInt();
         this.var_4266 = Number(this.var_4266) >>> 10 | Number(this.var_4266) << 22;
         param1.readShort();
         this.x = param1.readInt();
         this.x = Number(this.x) << 16 | Number(this.x) >>> 16;
         this.y = param1.readInt();
         this.y = Number(this.y) << 15 | Number(this.y) >>> 17;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_4266) << 10 | Number(this.var_4266) >>> 22);
         param1.writeShort(-28688);
         param1.writeInt(Number(this.x) >>> 16 | Number(this.x) << 16);
         param1.writeInt(Number(this.y) >>> 15 | Number(this.y) << 17);
      }
   }
}
