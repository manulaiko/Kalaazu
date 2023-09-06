package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_610 implements ICommand
   {
      
      public static const ID:int = 7787;
       
      
      public var var_4042:int = 0;
      
      public var var_3482:String = "";
      
      public function class_610(param1:String = "", param2:int = 0)
      {
         super();
         this.var_3482 = param1;
         this.var_4042 = param2;
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
         this.var_4042 = param1.readInt();
         this.var_4042 = Number(this.var_4042) << 3 | Number(this.var_4042) >>> 29;
         this.var_3482 = param1.readUTF();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_4042) >>> 3 | Number(this.var_4042) << 29);
         param1.writeUTF(this.var_3482);
         param1.writeShort(-3596);
      }
   }
}
