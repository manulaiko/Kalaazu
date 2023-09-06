package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_568 extends class_432 implements ICommand
   {
      
      public static const ID:int = 20116;
       
      
      public var mapId:int = 0;
      
      public var y:int = 0;
      
      public var x:int = 0;
      
      public function class_568(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.mapId = param1;
         this.x = param3;
         this.y = param2;
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 12;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         param1.readShort();
         this.mapId = param1.readInt();
         this.mapId = Number(this.mapId) >>> 11 | Number(this.mapId) << 21;
         this.y = param1.readInt();
         this.y = Number(this.y) << 3 | Number(this.y) >>> 29;
         this.x = param1.readInt();
         this.x = Number(this.x) << 10 | Number(this.x) >>> 22;
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         param1.writeShort(-28720);
         param1.writeInt(Number(this.mapId) << 11 | Number(this.mapId) >>> 21);
         param1.writeInt(Number(this.y) >>> 3 | Number(this.y) << 29);
         param1.writeInt(Number(this.x) >>> 10 | Number(this.x) << 22);
      }
   }
}
