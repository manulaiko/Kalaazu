package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_955 implements ICommand
   {
      
      public static const ID:int = 3612;
       
      
      public var name_126:String = "";
      
      public var var_2618:int = 0;
      
      public var var_1235:int = 0;
      
      public var var_4881:int = 0;
      
      public var var_1694:int = 0;
      
      public var var_3441:String = "";
      
      public var var_3141:String = "";
      
      public function class_955(param1:int = 0, param2:String = "", param3:String = "", param4:int = 0, param5:int = 0, param6:int = 0, param7:String = "")
      {
         super();
         this.var_2618 = param1;
         this.name_126 = param2;
         this.var_3141 = param3;
         this.var_1235 = param4;
         this.var_1694 = param5;
         this.var_4881 = param6;
         this.var_3441 = param7;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 22;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name_126 = param1.readUTF();
         this.var_2618 = param1.readInt();
         this.var_2618 = Number(this.var_2618) << 3 | Number(this.var_2618) >>> 29;
         this.var_1235 = param1.readInt();
         this.var_1235 = Number(this.var_1235) << 7 | Number(this.var_1235) >>> 25;
         this.var_4881 = param1.readInt();
         this.var_4881 = Number(this.var_4881) << 13 | Number(this.var_4881) >>> 19;
         this.var_1694 = param1.readInt();
         this.var_1694 = Number(this.var_1694) << 10 | Number(this.var_1694) >>> 22;
         this.var_3441 = param1.readUTF();
         this.var_3141 = param1.readUTF();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeUTF(this.name_126);
         param1.writeInt(Number(this.var_2618) >>> 3 | Number(this.var_2618) << 29);
         param1.writeInt(Number(this.var_1235) >>> 7 | Number(this.var_1235) << 25);
         param1.writeInt(Number(this.var_4881) >>> 13 | Number(this.var_4881) << 19);
         param1.writeInt(Number(this.var_1694) >>> 10 | Number(this.var_1694) << 22);
         param1.writeUTF(this.var_3441);
         param1.writeUTF(this.var_3141);
      }
   }
}
