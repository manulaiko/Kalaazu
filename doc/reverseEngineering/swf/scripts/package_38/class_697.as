package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_697 implements ICommand
   {
      
      public static const ID:int = 2311;
       
      
      public var mapId:int = 0;
      
      public function class_697(param1:int = 0)
      {
         super();
         this.mapId = param1;
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
         this.mapId = param1.readInt();
         this.mapId = Number(this.mapId) >>> 5 | Number(this.mapId) << 27;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.mapId) << 5 | Number(this.mapId) >>> 27);
         param1.writeShort(-21018);
      }
   }
}
