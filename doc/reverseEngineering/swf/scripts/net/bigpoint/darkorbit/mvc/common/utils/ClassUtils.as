package net.bigpoint.darkorbit.mvc.common.utils
{
   import avmplus.getQualifiedClassName;
   import flash.utils.getDefinitionByName;
   
   public class ClassUtils
   {
       
      
      public function ClassUtils()
      {
         super();
      }
      
      public static function getClass(param1:Object) : Class
      {
         return Class(getDefinitionByName(getQualifiedClassName(param1)));
      }
   }
}
