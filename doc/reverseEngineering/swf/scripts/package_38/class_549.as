package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_549 implements ICommand
   {
      
      public static const ID:int = 9191;
       
      
      public var type:class_436;
      
      public var duration:int = 0;
      
      public function class_549(param1:class_436 = null, param2:int = 0)
      {
         super();
         if(param1 == null)
         {
            this.type = new class_436();
         }
         else
         {
            this.type = param1;
         }
         this.duration = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 4;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.type = class_127.getInstance().createInstance(param1.readShort()) as class_436;
         this.type.read(param1);
         param1.readShort();
         this.duration = param1.readInt();
         this.duration = Number(this.duration) << 4 | Number(this.duration) >>> 28;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.type.write(param1);
         param1.writeShort(-24891);
         param1.writeInt(Number(this.duration) >>> 4 | Number(this.duration) << 28);
      }
   }
}
