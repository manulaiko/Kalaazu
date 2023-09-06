package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_654 implements ICommand
   {
      
      public static const const_1921:uint = 6;
      
      public static const const_3268:uint = 4;
      
      public static const const_3141:uint = 5;
      
      public static const const_1681:uint = 2;
      
      public static const const_90:uint = 3;
      
      public static const const_2419:uint = 0;
      
      public static const const_2147:uint = 1;
      
      public static const ID:int = 22136;
       
      
      public var errorCode:uint = 0;
      
      public var mapId:int = 0;
      
      public function class_654(param1:uint = 0, param2:int = 0)
      {
         super();
         this.errorCode = param1;
         this.mapId = param2;
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
         this.errorCode = param1.readShort();
         this.mapId = param1.readInt();
         this.mapId = Number(this.mapId) >>> 12 | Number(this.mapId) << 20;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.errorCode);
         param1.writeInt(Number(this.mapId) << 12 | Number(this.mapId) >>> 20);
         param1.writeShort(-31262);
      }
   }
}
