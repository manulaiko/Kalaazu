package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_873 implements ICommand
   {
      
      public static const const_15:uint = 0;
      
      public static const const_919:uint = 1;
      
      public static const const_2091:uint = 2;
      
      public static const LOG:uint = 0;
      
      public static const SCREEN:uint = 1;
      
      public static const ID:int = 15000;
       
      
      public var visibility:uint = 0;
      
      public var message:class_359;
      
      public var style:uint = 0;
      
      public function class_873(param1:uint = 0, param2:uint = 0, param3:class_359 = null)
      {
         super();
         this.visibility = param1;
         this.style = param2;
         if(param3 == null)
         {
            this.message = new class_359();
         }
         else
         {
            this.message = param3;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 0;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.visibility = param1.readShort();
         param1.readShort();
         param1.readShort();
         this.message = class_127.getInstance().createInstance(param1.readShort()) as class_359;
         this.message.read(param1);
         this.style = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.visibility);
         param1.writeShort(19220);
         param1.writeShort(3342);
         this.message.write(param1);
         param1.writeShort(this.style);
      }
   }
}
