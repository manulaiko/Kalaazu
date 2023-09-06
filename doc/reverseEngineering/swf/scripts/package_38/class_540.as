package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_540 implements ICommand
   {
      
      public static const ID:int = 9939;
       
      
      public var name_112:int = 0;
      
      public var var_1629:int = 0;
      
      public function class_540(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_1629 = param1;
         this.name_112 = param2;
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
         this.name_112 = param1.readInt();
         this.name_112 = Number(this.name_112) << 11 | Number(this.name_112) >>> 21;
         param1.readShort();
         this.var_1629 = param1.readInt();
         this.var_1629 = Number(this.var_1629) << 7 | Number(this.var_1629) >>> 25;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_112) >>> 11 | Number(this.name_112) << 21);
         param1.writeShort(8397);
         param1.writeInt(Number(this.var_1629) >>> 7 | Number(this.var_1629) << 25);
      }
   }
}
