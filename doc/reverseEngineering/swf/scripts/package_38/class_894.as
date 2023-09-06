package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_894 implements ICommand
   {
      
      public static const const_2885:uint = 1;
      
      public static const const_1469:uint = 3;
      
      public static const const_1031:uint = 0;
      
      public static const NONE:uint = 7;
      
      public static const const_1125:uint = 4;
      
      public static const DONE:uint = 5;
      
      public static const const_2747:uint = 6;
      
      public static const COUNTDOWN:uint = 2;
      
      public static const const_3189:uint = 0;
      
      public static const ID:int = 6838;
       
      
      public var var_3529:int = 0;
      
      public var var_3115:uint = 0;
      
      public var var_1497:int = 0;
      
      public var var_3301:int = 0;
      
      public var var_1761:int = 0;
      
      public var var_1790:int = 0;
      
      public var var_970:int = 0;
      
      public var var_4796:int = 0;
      
      public var name_158:String = "";
      
      public var status:uint = 0;
      
      public function class_894(param1:uint = 0, param2:uint = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:String = "", param7:int = 0, param8:int = 0, param9:int = 0, param10:int = 0)
      {
         super();
         this.var_3115 = param1;
         this.status = param2;
         this.var_1497 = param3;
         this.var_1790 = param4;
         this.var_3301 = param5;
         this.name_158 = param6;
         this.var_1761 = param7;
         this.var_970 = param8;
         this.var_4796 = param9;
         this.var_3529 = param10;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 30;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_3529 = param1.readInt();
         this.var_3529 = Number(this.var_3529) >>> 16 | Number(this.var_3529) << 16;
         this.var_3115 = param1.readShort();
         this.var_1497 = param1.readInt();
         this.var_1497 = Number(this.var_1497) >>> 7 | Number(this.var_1497) << 25;
         this.var_3301 = param1.readInt();
         this.var_3301 = Number(this.var_3301) >>> 13 | Number(this.var_3301) << 19;
         this.var_1761 = param1.readInt();
         this.var_1761 = Number(this.var_1761) << 10 | Number(this.var_1761) >>> 22;
         this.var_1790 = param1.readInt();
         this.var_1790 = Number(this.var_1790) >>> 2 | Number(this.var_1790) << 30;
         this.var_970 = param1.readInt();
         this.var_970 = Number(this.var_970) << 15 | Number(this.var_970) >>> 17;
         this.var_4796 = param1.readInt();
         this.var_4796 = Number(this.var_4796) >>> 12 | Number(this.var_4796) << 20;
         this.name_158 = param1.readUTF();
         param1.readShort();
         this.status = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_3529) << 16 | Number(this.var_3529) >>> 16);
         param1.writeShort(this.var_3115);
         param1.writeInt(Number(this.var_1497) << 7 | Number(this.var_1497) >>> 25);
         param1.writeInt(Number(this.var_3301) << 13 | Number(this.var_3301) >>> 19);
         param1.writeInt(Number(this.var_1761) >>> 10 | Number(this.var_1761) << 22);
         param1.writeInt(Number(this.var_1790) << 2 | Number(this.var_1790) >>> 30);
         param1.writeInt(Number(this.var_970) >>> 15 | Number(this.var_970) << 17);
         param1.writeInt(Number(this.var_4796) << 12 | Number(this.var_4796) >>> 20);
         param1.writeUTF(this.name_158);
         param1.writeShort(29380);
         param1.writeShort(this.status);
      }
   }
}
