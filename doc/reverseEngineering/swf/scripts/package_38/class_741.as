package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_741 implements ICommand
   {
      
      public static const ID:int = 31655;
       
      
      public var show:Boolean = false;
      
      public var y:int = 0;
      
      public var x:int = 0;
      
      public function class_741(param1:int = 0, param2:int = 0, param3:Boolean = false)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.show = param3;
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
         this.show = param1.readBoolean();
         param1.readShort();
         this.y = param1.readInt();
         this.y = Number(this.y) >>> 8 | Number(this.y) << 24;
         this.x = param1.readInt();
         this.x = Number(this.x) >>> 5 | Number(this.x) << 27;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.show);
         param1.writeShort(-10965);
         param1.writeInt(Number(this.y) << 8 | Number(this.y) >>> 24);
         param1.writeInt(Number(this.x) << 5 | Number(this.x) >>> 27);
      }
   }
}
