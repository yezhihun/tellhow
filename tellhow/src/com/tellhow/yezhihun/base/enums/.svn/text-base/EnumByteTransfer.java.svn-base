package com.tellhow.yezhihun.base.enums;


import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import org.apache.commons.lang.ObjectUtils;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.usertype.EnhancedUserType;
import org.hibernate.usertype.ParameterizedType;

public class EnumByteTransfer implements EnhancedUserType, ParameterizedType {

   private static final String PARAM_ENUM_CLASS = "name";

   private static final int[] SQL_TYPES = new int[] {Hibernate.BYTE.sqlType()};

   private Class<? extends BaseEnum> enumClass;
   
   @Override
   public Serializable disassemble(Object value) {
      return (Serializable) value;
   }

   @Override
   public Object assemble(Serializable cached, Object owner) {
      return cached;
   }

   @Override
   public Object deepCopy(Object value) {
      return value;
   }

   @Override
   public boolean equals(Object x, Object y) {
      return ObjectUtils.equals(x, y);
   }

   @Override
   public int hashCode(Object x) {
      return x.hashCode();
   }

   @Override
   public boolean isMutable() {
      return false;
   }

   @Override
   public Object nullSafeGet(ResultSet rs, String[] names, Object owner) throws SQLException {
      byte value = rs.getByte(names[0]);
      if (rs.wasNull()) {
         return null;
      }
      
      for (BaseEnum e : enumClass.getEnumConstants()) {
         if (e.getValue() == value) {
            return e;
         }
      }
      
      throw new HibernateException("值： " + value + " 不存在 " + enumClass.getCanonicalName()+"枚举类型中");
   }

   @Override
   public void nullSafeSet(PreparedStatement st, Object value, int index) throws SQLException {
      if (value == null) {
         st.setNull(index, Hibernate.BYTE.sqlType());
      }
      else {
         st.setByte(index, ((BaseEnum)value).getValue());
      }
   }

   @Override
   public Object replace(Object original, Object target, Object owner) {
      return original;
   }

   @Override
   public Class returnedClass() {
      return enumClass;
   }

   @Override
   public int[] sqlTypes() {
      return SQL_TYPES;
   }

   @Override
   public void setParameterValues(Properties parameters) {
	   String enumClassName = parameters.getProperty(PARAM_ENUM_CLASS);
	      try {
	         enumClass = Class.forName(enumClassName).asSubclass(BaseEnum.class);
	      }
	      catch (ClassNotFoundException e) {
	         throw new HibernateException("Enum class没找到: " + enumClassName, e);
	      }
	      
	      if (!enumClass.isEnum()) {
	         throw new ClassCastException(enumClass.getCanonicalName() + " 必须是一个enum类型.");
	      }
   }

   @Override
   public String toXMLString(Object value) {
      return ((Enum)value).name();
   }

   @Override
   public Object fromXMLString(String name) {
      return Enum.valueOf(enumClass.asSubclass(Enum.class), name);
   }

   @Override
   public String objectToSQLString(Object value) {
      return Byte.toString(((BaseEnum)value).getValue());
   }
}
