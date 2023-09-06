package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_884 implements ICommand
   {
      
      public static const ID:int = 17524;
       
      
      public var name_121:int = 0;
      
      public var points:Number = 0;
      
      public var name_143:int = 0;
      
      public var rank:int = 0;
      
      public function class_884(param1:int = 0, param2:int = 0, param3:int = 0, param4:Number = 0)
      {
         super();
         this.name_121 = param1;
         this.name_143 = param2;
         this.rank = param3;
         this.points = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 16;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name_121 = param1.readInt();
         this.name_121 = Number(this.name_121) >>> 1 | Number(this.name_121) << 31;
         this.points = param1.readFloat();
         this.name_143 = param1.readInt();
         this.name_143 = Number(this.name_143) << 12 | Number(this.name_143) >>> 20;
         param1.readShort();
         this.rank = param1.readInt();
         this.rank = Number(this.rank) << 4 | Number(this.rank) >>> 28;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_121) << 1 | Number(this.name_121) >>> 31);
         param1.writeFloat(this.points);
         param1.writeInt(Number(this.name_143) >>> 12 | Number(this.name_143) << 20);
         param1.writeShort(-21702);
         param1.writeInt(Number(this.rank) >>> 4 | Number(this.rank) << 28);
      }
   }
}
