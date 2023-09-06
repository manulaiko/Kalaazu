package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_964 implements ICommand
   {
      
      public static const ID:int = 770;
       
      
      public var progress:class_547;
      
      public var var_1390:int = 0;
      
      public var var_2469:String = "";
      
      public var var_3184:int = 0;
      
      public var var_2329:int = 0;
      
      public var var_2870:int = 0;
      
      public var var_1529:int = 0;
      
      public var name_156:class_640;
      
      public function class_964(param1:int = 0, param2:int = 0, param3:String = "", param4:class_547 = null, param5:class_640 = null, param6:int = 0, param7:int = 0, param8:int = 0)
      {
         super();
         this.var_3184 = param1;
         this.var_1529 = param2;
         this.var_2469 = param3;
         if(param4 == null)
         {
            this.progress = new class_547();
         }
         else
         {
            this.progress = param4;
         }
         if(param5 == null)
         {
            this.name_156 = new class_640();
         }
         else
         {
            this.name_156 = param5;
         }
         this.var_2329 = param6;
         this.var_1390 = param7;
         this.var_2870 = param8;
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
         this.progress = class_127.getInstance().createInstance(param1.readShort()) as class_547;
         this.progress.read(param1);
         this.var_1390 = param1.readInt();
         this.var_1390 = Number(this.var_1390) >>> 4 | Number(this.var_1390) << 28;
         this.var_2469 = param1.readUTF();
         this.var_3184 = param1.readInt();
         this.var_3184 = Number(this.var_3184) >>> 14 | Number(this.var_3184) << 18;
         this.var_2329 = param1.readInt();
         this.var_2329 = Number(this.var_2329) << 14 | Number(this.var_2329) >>> 18;
         this.var_2870 = param1.readInt();
         this.var_2870 = Number(this.var_2870) >>> 14 | Number(this.var_2870) << 18;
         this.var_1529 = param1.readInt();
         this.var_1529 = Number(this.var_1529) >>> 3 | Number(this.var_1529) << 29;
         param1.readShort();
         this.name_156 = class_127.getInstance().createInstance(param1.readShort()) as class_640;
         this.name_156.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.progress.write(param1);
         param1.writeInt(Number(this.var_1390) << 4 | Number(this.var_1390) >>> 28);
         param1.writeUTF(this.var_2469);
         param1.writeInt(Number(this.var_3184) << 14 | Number(this.var_3184) >>> 18);
         param1.writeInt(Number(this.var_2329) >>> 14 | Number(this.var_2329) << 18);
         param1.writeInt(Number(this.var_2870) << 14 | Number(this.var_2870) >>> 18);
         param1.writeInt(Number(this.var_1529) << 3 | Number(this.var_1529) >>> 29);
         param1.writeShort(-7693);
         this.name_156.write(param1);
      }
   }
}
