package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_789 implements ICommand
   {
      
      public static const ID:int = 21460;
       
      
      public var var_1156:int = 0;
      
      public var mapId:int = 0;
      
      public function class_789(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_1156 = param1;
         this.mapId = param2;
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
         this.var_1156 = param1.readInt();
         this.var_1156 = Number(this.var_1156) >>> 12 | Number(this.var_1156) << 20;
         this.mapId = param1.readInt();
         this.mapId = Number(this.mapId) << 7 | Number(this.mapId) >>> 25;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_1156) << 12 | Number(this.var_1156) >>> 20);
         param1.writeInt(Number(this.mapId) >>> 7 | Number(this.mapId) << 25);
         param1.writeShort(-18305);
      }
   }
}
