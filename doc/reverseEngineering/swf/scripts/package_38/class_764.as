package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_764 implements ICommand
   {
      
      public static const SHIELD:uint = 1;
      
      public static const const_143:uint = 2;
      
      public static const DAMAGE:uint = 0;
      
      public static const ID:int = 39;
       
      
      public var y:int = 0;
      
      public var radius:int = 0;
      
      public var x:int = 0;
      
      public var var_4163:int = 0;
      
      public var type:uint = 0;
      
      public function class_764(param1:uint = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0)
      {
         super();
         this.type = param1;
         this.x = param2;
         this.y = param3;
         this.var_4163 = param4;
         this.radius = param5;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 16;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.y = param1.readInt();
         this.y = Number(this.y) >>> 10 | Number(this.y) << 22;
         this.radius = param1.readInt();
         this.radius = Number(this.radius) >>> 1 | Number(this.radius) << 31;
         param1.readShort();
         this.x = param1.readInt();
         this.x = Number(this.x) >>> 5 | Number(this.x) << 27;
         this.var_4163 = param1.readInt();
         this.var_4163 = Number(this.var_4163) >>> 7 | Number(this.var_4163) << 25;
         this.type = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.y) << 10 | Number(this.y) >>> 22);
         param1.writeInt(Number(this.radius) << 1 | Number(this.radius) >>> 31);
         param1.writeShort(-25405);
         param1.writeInt(Number(this.x) << 5 | Number(this.x) >>> 27);
         param1.writeInt(Number(this.var_4163) << 7 | Number(this.var_4163) >>> 25);
         param1.writeShort(this.type);
      }
   }
}
