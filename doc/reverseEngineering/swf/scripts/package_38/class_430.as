package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_430 implements ICommand
   {
      
      public static const const_145:uint = 5;
      
      public static const const_1366:uint = 3;
      
      public static const const_106:uint = 0;
      
      public static const const_609:uint = 9;
      
      public static const const_907:uint = 7;
      
      public static const const_1242:uint = 1;
      
      public static const const_512:uint = 4;
      
      public static const const_2143:uint = 6;
      
      public static const const_2330:uint = 8;
      
      public static const const_1836:uint = 2;
      
      public static const ID:int = 4349;
       
      
      public var var_5058:int = 0;
      
      public var var_3814:int = 0;
      
      public var error:uint = 0;
      
      public function class_430(param1:int = 0, param2:int = 0, param3:uint = 0)
      {
         super();
         this.var_3814 = param1;
         this.var_5058 = param2;
         this.error = param3;
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
         this.var_5058 = param1.readInt();
         this.var_5058 = Number(this.var_5058) << 11 | Number(this.var_5058) >>> 21;
         this.var_3814 = param1.readInt();
         this.var_3814 = Number(this.var_3814) << 13 | Number(this.var_3814) >>> 19;
         param1.readShort();
         this.error = param1.readShort();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_5058) >>> 11 | Number(this.var_5058) << 21);
         param1.writeInt(Number(this.var_3814) >>> 13 | Number(this.var_3814) << 19);
         param1.writeShort(4659);
         param1.writeShort(this.error);
         param1.writeShort(-29301);
      }
   }
}
