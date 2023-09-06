package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_449 implements ICommand
   {
      
      public static const ID:int = 16258;
       
      
      public var name_93:int = 0;
      
      public function class_449(param1:int = 0)
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
         this.name_93 = Number(this.name_93) >>> 15 | Number(this.name_93) << 17;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(2610);
         param1.writeInt(Number(this.name_93) << 15 | Number(this.name_93) >>> 17);
      }
   }
}
