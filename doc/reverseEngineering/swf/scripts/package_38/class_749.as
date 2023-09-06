package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_749 implements ICommand
   {
      
      public static const ID:int = 29508;
       
      
      public var enemyCount:int = 0;
      
      public function class_749(param1:int = 0)
      {
         super();
         this.enemyCount = param1;
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
         this.enemyCount = param1.readInt();
         this.enemyCount = Number(this.enemyCount) >>> 15 | Number(this.enemyCount) << 17;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(17668);
         param1.writeInt(Number(this.enemyCount) << 15 | Number(this.enemyCount) >>> 17);
      }
   }
}
