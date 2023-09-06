package mx.logging
{
   import mx.core.mx_internal;
   
   public final class LogEventLevel
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const FATAL:int = 1000;
      
      public static const ERROR:int = 8;
      
      public static const WARN:int = 6;
      
      public static const INFO:int = 4;
      
      public static const DEBUG:int = 2;
      
      public static const ALL:int = 0;
       
      
      public function LogEventLevel()
      {
         super();
      }
   }
}
