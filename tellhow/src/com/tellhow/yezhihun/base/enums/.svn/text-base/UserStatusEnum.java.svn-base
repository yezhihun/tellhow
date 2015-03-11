package com.tellhow.yezhihun.base.enums;


public enum UserStatusEnum implements BaseEnum {

	NOROML (0,"正常"),
	
	EXCEPTION(1,"异常");
	
	
	private Byte value;
	private String desc;
	
	UserStatusEnum(int value,String desc){
		this.value = (byte)value ;
		this.desc = desc;
	}
	
	@Override
	public String getDesc(){
		return desc;
	}
	@Override
	public Byte getValue() {
		return value;
	}
	
	public static UserStatusEnum getStatusByValue(int value){
		UserStatusEnum[] s = UserStatusEnum.values();
		for(int i=0;i<s.length;i++){
			if(s[i].getValue() == value){
				return s[i];
			}
		}
		return null;
	}
}
