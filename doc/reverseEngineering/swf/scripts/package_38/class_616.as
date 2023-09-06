package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_616 implements ICommand
   {
      
      public static const ID:int = 2310;
       
      
      public var mapId:int = 0;
      
      public var var_5014:int = 0;
      
      public function class_616(param1:int = 0, param2:int = 0)
      {
         super();
         this.mapId = param1;
         this.var_5014 = param2;
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
         this.mapId = param1.readInt();
         this.mapId = Number(this.mapId) << 3 | Number(this.mapId) >>> 29;
         this.var_5014 = param1.readInt();
         this.var_5014 = Number(this.var_5014) >>> 15 | Number(this.var_5014) << 17;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.mapId) >>> 3 | Number(this.mapId) << 29);
         param1.writeInt(Number(this.var_5014) << 15 | Number(this.var_5014) >>> 17);
         param1.writeShort(20220);
      }
   }
}
