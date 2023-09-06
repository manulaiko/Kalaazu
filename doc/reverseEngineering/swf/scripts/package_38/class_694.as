package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_694 implements ICommand
   {
      
      public static const const_2746:uint = 1;
      
      public static const const_2158:uint = 0;
      
      public static const ID:int = 23446;
       
      
      public var var_2025:int = 0;
      
      public var name_93:int = 0;
      
      public var var_572:uint = 0;
      
      public var var_726:int = 0;
      
      public var totalTickets:int = 0;
      
      public var var_2994:int = 0;
      
      public var var_3699:int = 0;
      
      public function class_694(param1:int = 0, param2:uint = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0, param7:int = 0)
      {
         super();
         this.name_93 = param1;
         this.var_572 = param2;
         this.var_726 = param3;
         this.var_2025 = param4;
         this.var_2994 = param5;
         this.totalTickets = param6;
         this.var_3699 = param7;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 24;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_2025 = param1.readInt();
         this.var_2025 = Number(this.var_2025) << 15 | Number(this.var_2025) >>> 17;
         this.name_93 = param1.readInt();
         this.name_93 = Number(this.name_93) << 3 | Number(this.name_93) >>> 29;
         this.var_572 = param1.readShort();
         this.var_726 = param1.readInt();
         this.var_726 = Number(this.var_726) >>> 14 | Number(this.var_726) << 18;
         this.totalTickets = param1.readInt();
         this.totalTickets = Number(this.totalTickets) >>> 6 | Number(this.totalTickets) << 26;
         this.var_2994 = param1.readInt();
         this.var_2994 = Number(this.var_2994) << 8 | Number(this.var_2994) >>> 24;
         this.var_3699 = param1.readInt();
         this.var_3699 = Number(this.var_3699) << 1 | Number(this.var_3699) >>> 31;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_2025) >>> 15 | Number(this.var_2025) << 17);
         param1.writeInt(Number(this.name_93) >>> 3 | Number(this.name_93) << 29);
         param1.writeShort(this.var_572);
         param1.writeInt(Number(this.var_726) << 14 | Number(this.var_726) >>> 18);
         param1.writeInt(Number(this.totalTickets) << 6 | Number(this.totalTickets) >>> 26);
         param1.writeInt(Number(this.var_2994) >>> 8 | Number(this.var_2994) << 24);
         param1.writeInt(Number(this.var_3699) >>> 1 | Number(this.var_3699) << 31);
      }
   }
}
