package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_837 implements ICommand
   {
      
      public static const ID:int = 4585;
       
      
      public var var_414:Number = 0;
      
      public var duration:Number = 0;
      
      public var var_3902:int = 0;
      
      public function class_837(param1:int = 0, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.var_3902 = param1;
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
         this.var_414 = param1.readFloat();
         this.duration = param1.readFloat();
         this.var_3902 = param1.readInt();
         this.var_3902 = Number(this.var_3902) >>> 6 | Number(this.var_3902) << 26;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeFloat(this.var_414);
         param1.writeFloat(this.duration);
         param1.writeInt(Number(this.var_3902) << 6 | Number(this.var_3902) >>> 26);
      }
   }
}
