package com.finalc.chatting.gsontest;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

/*
	Member 클래스와 Family클래스의 Gson객체를 이용하여 JSON표현식으로 변환 후
	다시 자바 객체로 되돌리는 연습을 해보도록 한다.
*/
public class GsonTestMain {

	public static void main(String[] args) {
		List<Family> familyList1 = new ArrayList<Family>();
		familyList1.add(new Family("아버지", "길동아빠", 50));
		familyList1.add(new Family("어머니", "길동엄마", 45));
		familyList1.add(new Family("형", "홍형님", 30));
		familyList1.add(new Family("동생", "홍동생", 23));
		
		Member member1 = new Member("홍길동", 26, familyList1);
		
		Gson gson = new Gson();
		String json_member1 = gson.toJson(member1);
		System.out.println(">>>> json_member1 : " + json_member1);
		// >>>> json_member1 : {"name":"홍길동","age":26,"familys":[{"relation":"아버지","name":"길동아빠","age":50},{"relation":"어머니","name":"길동엄마","age":45},{"relation":"형","name":"홍형님","age":30},{"relation":"동생","name":"홍동생","age":23}]}
		System.out.println("\n##################################\n");
		String json_member2 = "{\"name\":\"이순신\",\"age\":27,\"familys\":[{\"relation\":\"아버지\",\"name\":\"순신아빠\",\"age\":52},{\"relation\":\"어머니\",\"name\":\"순신엄마\",\"age\":48},{\"relation\":\"동생\",\"name\":\"이동국\",\"age\":25}]}";
		System.out.println("===== JSON표현식을 자바객체로 복원 =====");
		Member mem1 = gson.fromJson(json_member1, Member.class);
		Member mem2 = gson.fromJson(json_member2, Member.class);
		
		System.out.println("1. 직원명 : " + mem1.getName());
		System.out.println("2. 나이 : " + mem1.getAge());
		System.out.println("3. 가족정보 : ");
		for(Family fm : mem1.getFamilys()) {
			StringBuilder sb = new StringBuilder();
			sb.append(" 가족관계 => ");
			sb.append(fm.getRelation());
			sb.append(" 성명 => ");
			sb.append(fm.getName());
			sb.append(" 나이 => ");
			sb.append(fm.getAge());
			String faminlyInfo = sb.toString();
			System.out.println(faminlyInfo);
		}
		
		System.out.println("----------------------------------------");
		
		System.out.println("1. 직원명 : " + mem2.getName());
		System.out.println("2. 나이 : " + mem2.getAge());
		System.out.println("3. 가족정보 : ");
		for(Family fm : mem2.getFamilys()) {
			StringBuilder sb = new StringBuilder();
			sb.append(" 가족관계 => ");
			sb.append(fm.getRelation());
			sb.append(", 성명 => ");
			sb.append(fm.getName());
			sb.append(", 나이 => ");
			sb.append(fm.getAge());
			String faminlyInfo = sb.toString();
			System.out.println(faminlyInfo);
		}
	}

}
