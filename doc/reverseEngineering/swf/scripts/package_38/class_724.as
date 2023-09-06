package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_724 implements ICommand
   {
      
      public static const ID:int = 22801;
       
      
      public var name_150:int = 0;
      
      public var name_141:int = 0;
      
      public var name_18:int = 0;
      
      public function class_724(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.name_150 = param1;
         this.name_141 = param2;
         this.name_18 = param3;
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
         this.name_150 = param1.readInt();
         this.name_150 = Number(this.name_150) >>> 13 | Number(this.name_150) << 19;
         this.name_141 = param1.readInt();
         this.name_141 = Number(this.name_141) << 2 | Number(this.name_141) >>> 30;
         this.name_18 = param1.readInt();
         this.name_18 = Number(this.name_18) >>> 4 | Number(this.name_18) << 28;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_150) << 13 | Number(this.name_150) >>> 19);
         param1.writeInt(Number(this.name_141) >>> 2 | Number(this.name_141) << 30);
         param1.writeInt(Number(this.name_18) << 4 | Number(this.name_18) >>> 28);
      }
   }
}
