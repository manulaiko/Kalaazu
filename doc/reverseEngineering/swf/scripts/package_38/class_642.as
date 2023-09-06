package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_642 implements ICommand
   {
      
      public static const ID:int = 23543;
       
      
      public var name_85:int = 0;
      
      public function class_642(param1:int = 0)
      {
         super();
         this.name_85 = param1;
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
         this.name_85 = param1.readInt();
         this.name_85 = Number(this.name_85) >>> 13 | Number(this.name_85) << 19;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_85) << 13 | Number(this.name_85) >>> 19);
         param1.writeShort(6442);
      }
   }
}
