package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_625 extends class_606 implements ICommand
   {
      
      public static const ID:int = 8793;
       
      
      public var faction:class_439;
      
      public function class_625(param1:class_439 = null)
      {
         super();
         if(param1 == null)
         {
            this.faction = new class_439();
         }
         else
         {
            this.faction = param1;
         }
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 0;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         param1.readShort();
         this.faction = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.faction.read(param1);
         param1.readShort();
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         param1.writeShort(-20856);
         this.faction.write(param1);
         param1.writeShort(21441);
      }
   }
}
