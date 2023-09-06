package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_646 implements ICommand
   {
      
      public static const ID:int = 2599;
       
      
      public var maxValue:int = 0;
      
      public var var_1818:String = "";
      
      public var currentValue:int = 0;
      
      public function class_646(param1:String = "", param2:int = 0, param3:int = 0)
      {
         super();
         this.var_1818 = param1;
         this.currentValue = param2;
         this.maxValue = param3;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 10;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.maxValue = param1.readInt();
         this.maxValue = Number(this.maxValue) << 10 | Number(this.maxValue) >>> 22;
         this.var_1818 = param1.readUTF();
         this.currentValue = param1.readInt();
         this.currentValue = Number(this.currentValue) >>> 9 | Number(this.currentValue) << 23;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.maxValue) >>> 10 | Number(this.maxValue) << 22);
         param1.writeUTF(this.var_1818);
         param1.writeInt(Number(this.currentValue) << 9 | Number(this.currentValue) >>> 23);
         param1.writeShort(29670);
      }
   }
}
