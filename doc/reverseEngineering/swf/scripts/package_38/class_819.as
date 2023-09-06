package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_819 implements ICommand
   {
      
      public static const ID:int = 21730;
       
      
      public var var_414:Number = 0;
      
      public var name_128:int = 0;
      
      public var duration:Number = 0;
      
      public function class_819(param1:int = 0, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.name_128 = param1;
         this.var_414 = param2;
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
         param1.readShort();
         this.var_414 = param1.readFloat();
         this.name_128 = param1.readInt();
         this.name_128 = Number(this.name_128) >>> 14 | Number(this.name_128) << 18;
         param1.readShort();
         this.duration = param1.readFloat();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-22164);
         param1.writeFloat(this.var_414);
         param1.writeInt(Number(this.name_128) << 14 | Number(this.name_128) >>> 18);
         param1.writeShort(13859);
         param1.writeFloat(this.duration);
      }
   }
}
