package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_790 implements ICommand
   {
      
      public static const ID:int = 11695;
       
      
      public var var_1688:int = 0;
      
      public var var_3659:int = 0;
      
      public var instaShield:int = 0;
      
      public var var_4205:int = 0;
      
      public var var_2420:int = 0;
      
      public var var_5025:int = 0;
      
      public var var_889:int = 0;
      
      public var var_2030:int = 0;
      
      public var var_1966:int = 0;
      
      public var var_2899:int = 0;
      
      public var var_1239:int = 0;
      
      public var var_402:int = 0;
      
      public var var_2995:int = 0;
      
      public function class_790(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0, param7:int = 0, param8:int = 0, param9:int = 0, param10:int = 0, param11:int = 0, param12:int = 0, param13:int = 0)
      {
         super();
         this.var_1688 = param1;
         this.var_1239 = param2;
         this.var_1966 = param3;
         this.var_889 = param4;
         this.var_3659 = param5;
         this.instaShield = param6;
         this.var_2899 = param7;
         this.var_4205 = param8;
         this.var_2030 = param9;
         this.var_5025 = param10;
         this.var_402 = param11;
         this.var_2420 = param12;
         this.var_2995 = param13;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 52;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_1688 = param1.readInt();
         this.var_1688 = Number(this.var_1688) << 1 | Number(this.var_1688) >>> 31;
         this.var_3659 = param1.readInt();
         this.var_3659 = Number(this.var_3659) >>> 1 | Number(this.var_3659) << 31;
         this.instaShield = param1.readInt();
         this.instaShield = Number(this.instaShield) >>> 1 | Number(this.instaShield) << 31;
         param1.readShort();
         this.var_4205 = param1.readInt();
         this.var_4205 = Number(this.var_4205) << 12 | Number(this.var_4205) >>> 20;
         this.var_2420 = param1.readInt();
         this.var_2420 = Number(this.var_2420) << 11 | Number(this.var_2420) >>> 21;
         this.var_5025 = param1.readInt();
         this.var_5025 = Number(this.var_5025) << 6 | Number(this.var_5025) >>> 26;
         this.var_889 = param1.readInt();
         this.var_889 = Number(this.var_889) << 7 | Number(this.var_889) >>> 25;
         this.var_2030 = param1.readInt();
         this.var_2030 = Number(this.var_2030) << 2 | Number(this.var_2030) >>> 30;
         this.var_1966 = param1.readInt();
         this.var_1966 = Number(this.var_1966) >>> 2 | Number(this.var_1966) << 30;
         this.var_2899 = param1.readInt();
         this.var_2899 = Number(this.var_2899) << 13 | Number(this.var_2899) >>> 19;
         this.var_1239 = param1.readInt();
         this.var_1239 = Number(this.var_1239) << 16 | Number(this.var_1239) >>> 16;
         this.var_402 = param1.readInt();
         this.var_402 = Number(this.var_402) << 15 | Number(this.var_402) >>> 17;
         this.var_2995 = param1.readInt();
         this.var_2995 = Number(this.var_2995) << 16 | Number(this.var_2995) >>> 16;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_1688) >>> 1 | Number(this.var_1688) << 31);
         param1.writeInt(Number(this.var_3659) << 1 | Number(this.var_3659) >>> 31);
         param1.writeInt(Number(this.instaShield) << 1 | Number(this.instaShield) >>> 31);
         param1.writeShort(-3574);
         param1.writeInt(Number(this.var_4205) >>> 12 | Number(this.var_4205) << 20);
         param1.writeInt(Number(this.var_2420) >>> 11 | Number(this.var_2420) << 21);
         param1.writeInt(Number(this.var_5025) >>> 6 | Number(this.var_5025) << 26);
         param1.writeInt(Number(this.var_889) >>> 7 | Number(this.var_889) << 25);
         param1.writeInt(Number(this.var_2030) >>> 2 | Number(this.var_2030) << 30);
         param1.writeInt(Number(this.var_1966) << 2 | Number(this.var_1966) >>> 30);
         param1.writeInt(Number(this.var_2899) >>> 13 | Number(this.var_2899) << 19);
         param1.writeInt(Number(this.var_1239) >>> 16 | Number(this.var_1239) << 16);
         param1.writeInt(Number(this.var_402) >>> 15 | Number(this.var_402) << 17);
         param1.writeInt(Number(this.var_2995) >>> 16 | Number(this.var_2995) << 16);
      }
   }
}
