package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_478 implements ICommand
   {
      
      public static const ID:int = 23618;
       
      
      public var name_93:int = 0;
      
      public function class_478(param1:int = 0)
      {
         super();
         this.name_93 = param1;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 4;
      }
      
      public function read(param1:IDataInput) : void
      {
         param1.readShort();
         this.name_93 = param1.readInt();
         this.name_93 = Number(this.name_93) << 11 | Number(this.name_93) >>> 21;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-20319);
         param1.writeInt(Number(this.name_93) >>> 11 | Number(this.name_93) << 21);
      }
   }
}
