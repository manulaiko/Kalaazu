package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_543 implements ICommand
   {
      
      public static const ID:int = 3734;
       
      
      public var name_128:int = 0;
      
      public var var_3438:String = "";
      
      public function class_543(param1:int = 0, param2:String = "")
      {
         super();
         this.name_128 = param1;
         this.var_3438 = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 6;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name_128 = param1.readInt();
         this.name_128 = Number(this.name_128) << 11 | Number(this.name_128) >>> 21;
         this.var_3438 = param1.readUTF();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_128) >>> 11 | Number(this.name_128) << 21);
         param1.writeUTF(this.var_3438);
      }
   }
}
