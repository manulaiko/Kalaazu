package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_475 implements ICommand
   {
      
      public static const ID:int = 18410;
       
      
      public var x:int = 0;
      
      public var y:int = 0;
      
      public var id:int = 0;
      
      public var name_92:Boolean = false;
      
      public var var_4338:int = 0;
      
      public function class_475(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:Boolean = false)
      {
         super();
         this.id = param1;
         this.x = param2;
         this.y = param3;
         this.var_4338 = param4;
         this.name_92 = param5;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 17;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.x = param1.readInt();
         this.x = Number(this.x) >>> 1 | Number(this.x) << 31;
         param1.readShort();
         this.y = param1.readInt();
         this.y = Number(this.y) >>> 4 | Number(this.y) << 28;
         this.id = param1.readInt();
         this.id = Number(this.id) >>> 5 | Number(this.id) << 27;
         this.name_92 = param1.readBoolean();
         this.var_4338 = param1.readInt();
         this.var_4338 = Number(this.var_4338) >>> 6 | Number(this.var_4338) << 26;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.x) << 1 | Number(this.x) >>> 31);
         param1.writeShort(-21288);
         param1.writeInt(Number(this.y) << 4 | Number(this.y) >>> 28);
         param1.writeInt(Number(this.id) << 5 | Number(this.id) >>> 27);
         param1.writeBoolean(this.name_92);
         param1.writeInt(Number(this.var_4338) << 6 | Number(this.var_4338) >>> 26);
      }
   }
}
