package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_805 implements ICommand
   {
      
      public static const const_554:uint = 0;
      
      public static const const_2711:uint = 1;
      
      public static const const_101:uint = 3;
      
      public static const const_483:uint = 1;
      
      public static const const_3297:uint = 0;
      
      public static const const_910:uint = 2;
      
      public static const ID:int = 71;
       
      
      public var titleKey:String = "";
      
      public var var_2877:uint = 0;
      
      public var name_128:int = 0;
      
      public var type:uint = 0;
      
      public function class_805(param1:uint = 0, param2:uint = 0, param3:int = 0, param4:String = "")
      {
         super();
         this.type = param1;
         this.var_2877 = param2;
         this.name_128 = param3;
         this.titleKey = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 6;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.titleKey = param1.readUTF();
         param1.readShort();
         this.var_2877 = param1.readShort();
         this.name_128 = param1.readInt();
         this.name_128 = Number(this.name_128) << 10 | Number(this.name_128) >>> 22;
         this.type = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeUTF(this.titleKey);
         param1.writeShort(-8208);
         param1.writeShort(this.var_2877);
         param1.writeInt(Number(this.name_128) >>> 10 | Number(this.name_128) << 22);
         param1.writeShort(this.type);
      }
   }
}
