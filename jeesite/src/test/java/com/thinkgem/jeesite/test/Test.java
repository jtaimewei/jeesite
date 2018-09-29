package com.thinkgem.jeesite.test;

import java.util.ArrayList;
import java.util.List;

public class Test {

	public static void main(String[] args) {
		int[] array = {3,4,1,19,20,5,9,8,10,13,11,6,7,12};
		List<Integer> list = new ArrayList<Integer>();
		int temp;
		for(int i = 0; i < 14; i ++){
			for( int j = 0 ;j < 14; j ++){
				if(array[i] < array[j]){
					temp = array[j];
					array[j] = array[i];
					array[i] = temp;
				}
			}
		}
		int time = 0;
		int[] arr = new int[3];
		for(int j = 0; j < 14 ; j ++){
			if(j != 13){
				if((array[j] + 1 == array[j+1]) || (time == 2 && array[j]-1 == array[j-1])){
					arr[time] = array[j];
					time ++;
				}else{
					if(time != 0){
						for(int k = 0; k < time ; k ++){
							list.add(array[j-k-1]);
						}
					}else{
						list.add(array[j]);
					}
					time = 0;
					arr = new int[3];
					continue;
				}
				if(array[j] == 10 && (time == 1 || time == 2)){
					if(time != 0){
						for(int k = 0; k < time ; k ++){
							list.add(array[j-k]);
						}
					}
					time = 0;
					arr = new int[3];
					continue;
				}
				if(time == 3){
					for(int a = 0 ; a < 3 ; a ++){
						System.out.print(arr[a]+",");
					}
					System.out.println();
					time = 0;
					arr = new int[3];
				}
			}else{
				if(time != 0){
					for(int k = 0; k < time ; k ++){
						list.add(array[j-k-1]);
					}
				}
				list.add(array[j]);
			}
		}
		for(Integer value : list){
			System.out.println(value);
		}
	}
}
