package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_849 implements ICommand
   {
      
      public static const ID:int = 3758;
       
      
      public var var_1623:int = 0;
      
      public var name_133:int = 0;
      
      public var var_4934:Boolean = false;
      
      public var var_2806:class_630;
      
      public var var_4862:int = 0;
      
      public var damage:int = 0;
      
      public var var_1551:int = 0;
      
      public var var_2147:int = 0;
      
      public function class_849(param1:class_630 = null, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0, param7:int = 0, param8:Boolean = false)
      {
         super();
         if(param1 == null)
         {
            this.var_2806 = new class_630();
         }
         else
         {
            this.var_2806 = param1;
         }
         this.name_133 = param2;
         this.var_4862 = param3;
         this.var_2147 = param4;
         this.var_1551 = param5;
         this.var_1623 = param6;
         this.damage = param7;
         this.var_4934 = param8;
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
         this.var_1623 = param1.readInt();
         this.var_1623 = Number(this.var_1623) >>> 2 | Number(this.var_1623) << 30;
         this.name_133 = param1.readInt();
         this.name_133 = Number(this.name_133) << 13 | Number(this.name_133) >>> 19;
         this.var_4934 = param1.readBoolean();
         this.var_2806 = class_127.getInstance().createInstance(param1.readShort()) as class_630;
         this.var_2806.read(param1);
         this.var_4862 = param1.readInt();
         this.var_4862 = Number(this.var_4862) >>> 15 | Number(this.var_4862) << 17;
         this.damage = param1.readInt();
         this.damage = Number(this.damage) << 2 | Number(this.damage) >>> 30;
         this.var_1551 = param1.readInt();
         this.var_1551 = Number(this.var_1551) << 15 | Number(this.var_1551) >>> 17;
         this.var_2147 = param1.readInt();
         this.var_2147 = Number(this.var_2147) >>> 9 | Number(this.var_2147) << 23;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_1623) << 2 | Number(this.var_1623) >>> 30);
         param1.writeInt(Number(this.name_133) >>> 13 | Number(this.name_133) << 19);
         param1.writeBoolean(this.var_4934);
         this.var_2806.write(param1);
         param1.writeInt(Number(this.var_4862) << 15 | Number(this.var_4862) >>> 17);
         param1.writeInt(Number(this.damage) >>> 2 | Number(this.damage) << 30);
         param1.writeInt(Number(this.var_1551) >>> 15 | Number(this.var_1551) << 17);
         param1.writeInt(Number(this.var_2147) << 9 | Number(this.var_2147) >>> 23);
      }
   }
}
