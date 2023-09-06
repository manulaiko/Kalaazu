package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_649 implements ICommand
   {
      
      public static const const_2604:uint = 2;
      
      public static const const_150:uint = 6;
      
      public static const const_2399:uint = 4;
      
      public static const const_636:uint = 1;
      
      public static const const_866:uint = 3;
      
      public static const const_1416:uint = 5;
      
      public static const const_3111:uint = 0;
      
      public static const ID:int = 32081;
       
      
      public var var_3438:String = "";
      
      public var name_128:int = 0;
      
      public var var_927:uint = 0;
      
      public function class_649(param1:String = "", param2:int = 0, param3:uint = 0)
      {
         super();
         this.var_3438 = param1;
         this.name_128 = param2;
         this.var_927 = param3;
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
         this.var_3438 = param1.readUTF();
         this.name_128 = param1.readInt();
         this.name_128 = Number(this.name_128) << 5 | Number(this.name_128) >>> 27;
         this.var_927 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeUTF(this.var_3438);
         param1.writeInt(Number(this.name_128) >>> 5 | Number(this.name_128) << 27);
         param1.writeShort(this.var_927);
      }
   }
}
