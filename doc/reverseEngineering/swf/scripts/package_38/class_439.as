package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_439 extends class_432 implements ICommand
   {
      
      public static const MMO:uint = 1;
      
      public static const VRU:uint = 3;
      
      public static const EIC:uint = 2;
      
      public static const NONE:uint = 0;
      
      public static const ID:int = 2289;
       
      
      public var faction:uint = 0;
      
      public function class_439(param1:uint = 0)
      {
         super();
         this.faction = param1;
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
         this.faction = param1.readShort();
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
         param1.writeShort(this.faction);
         param1.writeShort(-31859);
      }
   }
}
