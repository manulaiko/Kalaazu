package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_726 implements ICommand
   {
      
      public static const ID:int = 4738;
       
      
      public var mapId:int = 0;
      
      public var var_2683:Boolean = false;
      
      public var price:int = 0;
      
      public function class_726(param1:int = 0, param2:int = 0, param3:Boolean = false)
      {
         super();
         this.mapId = param1;
         this.price = param2;
         this.var_2683 = param3;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 9;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.mapId = param1.readInt();
         this.mapId = Number(this.mapId) << 4 | Number(this.mapId) >>> 28;
         this.var_2683 = param1.readBoolean();
         this.price = param1.readInt();
         this.price = Number(this.price) >>> 16 | Number(this.price) << 16;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.mapId) >>> 4 | Number(this.mapId) << 28);
         param1.writeBoolean(this.var_2683);
         param1.writeInt(Number(this.price) << 16 | Number(this.price) >>> 16);
         param1.writeShort(31435);
      }
   }
}
