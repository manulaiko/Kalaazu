package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_680 implements ICommand
   {
      
      public static const ID:int = 30947;
       
      
      public var faction:class_439;
      
      public var var_2469:String = "";
      
      public var var_3184:int = 0;
      
      public var var_1529:int = 0;
      
      public var var_4999:int = 0;
      
      public var var_3593:int = 0;
      
      public var var_3070:int = 0;
      
      public var clanName:String = "";
      
      public var name_156:class_640;
      
      public var state:class_677;
      
      public var var_4869:Boolean = false;
      
      public function class_680(param1:int = 0, param2:int = 0, param3:String = "", param4:String = "", param5:class_439 = null, param6:class_677 = null, param7:class_640 = null, param8:int = 0, param9:int = 0, param10:int = 0, param11:Boolean = false)
      {
         super();
         this.var_3184 = param1;
         this.var_1529 = param2;
         this.var_2469 = param3;
         this.clanName = param4;
         if(param5 == null)
         {
            this.faction = new class_439();
         }
         else
         {
            this.faction = param5;
         }
         if(param6 == null)
         {
            this.state = new class_677();
         }
         else
         {
            this.state = param6;
         }
         if(param7 == null)
         {
            this.name_156 = new class_640();
         }
         else
         {
            this.name_156 = param7;
         }
         this.var_4999 = param8;
         this.var_3593 = param9;
         this.var_3070 = param10;
         this.var_4869 = param11;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 25;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.faction = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.faction.read(param1);
         this.var_2469 = param1.readUTF();
         this.var_3184 = param1.readInt();
         this.var_3184 = Number(this.var_3184) << 8 | Number(this.var_3184) >>> 24;
         this.var_1529 = param1.readInt();
         this.var_1529 = Number(this.var_1529) >>> 5 | Number(this.var_1529) << 27;
         this.var_4999 = param1.readInt();
         this.var_4999 = Number(this.var_4999) << 9 | Number(this.var_4999) >>> 23;
         this.var_3593 = param1.readInt();
         this.var_3593 = Number(this.var_3593) >>> 10 | Number(this.var_3593) << 22;
         param1.readShort();
         this.var_3070 = param1.readInt();
         this.var_3070 = Number(this.var_3070) >>> 14 | Number(this.var_3070) << 18;
         this.clanName = param1.readUTF();
         this.name_156 = class_127.getInstance().createInstance(param1.readShort()) as class_640;
         this.name_156.read(param1);
         this.state = class_127.getInstance().createInstance(param1.readShort()) as class_677;
         this.state.read(param1);
         this.var_4869 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.faction.write(param1);
         param1.writeUTF(this.var_2469);
         param1.writeInt(Number(this.var_3184) >>> 8 | Number(this.var_3184) << 24);
         param1.writeInt(Number(this.var_1529) << 5 | Number(this.var_1529) >>> 27);
         param1.writeInt(Number(this.var_4999) >>> 9 | Number(this.var_4999) << 23);
         param1.writeInt(Number(this.var_3593) << 10 | Number(this.var_3593) >>> 22);
         param1.writeShort(21318);
         param1.writeInt(Number(this.var_3070) << 14 | Number(this.var_3070) >>> 18);
         param1.writeUTF(this.clanName);
         this.name_156.write(param1);
         this.state.write(param1);
         param1.writeBoolean(this.var_4869);
      }
   }
}
