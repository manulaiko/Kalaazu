package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_763 implements ICommand
   {
      
      public static const ID:int = 13473;
       
      
      public var var_304:int = 0;
      
      public var mapID:int = 0;
      
      public function class_763(param1:int = 0, param2:int = 0)
      {
         super();
         this.mapID = param1;
         this.var_304 = param2;
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
         this.var_304 = param1.readInt();
         this.var_304 = Number(this.var_304) >>> 8 | Number(this.var_304) << 24;
         param1.readShort();
         this.mapID = param1.readInt();
         this.mapID = Number(this.mapID) << 3 | Number(this.mapID) >>> 29;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_304) << 8 | Number(this.var_304) >>> 24);
         param1.writeShort(-28611);
         param1.writeInt(Number(this.mapID) >>> 3 | Number(this.mapID) << 29);
      }
   }
}
