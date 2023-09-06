package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_544 implements ICommand
   {
      
      public static const ID:int = 11416;
       
      
      public var x:int = 0;
      
      public var duration:Number = 0;
      
      public var y:int = 0;
      
      public function class_544(param1:int = 0, param2:int = 0, param3:Number = 0)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.duration = param3;
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
         this.x = param1.readInt();
         this.x = Number(this.x) << 11 | Number(this.x) >>> 21;
         this.duration = param1.readFloat();
         this.y = param1.readInt();
         this.y = Number(this.y) >>> 13 | Number(this.y) << 19;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.x) >>> 11 | Number(this.x) << 21);
         param1.writeFloat(this.duration);
         param1.writeInt(Number(this.y) << 13 | Number(this.y) >>> 19);
      }
   }
}
