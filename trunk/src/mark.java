import java.util.Scanner;


public class mark {

	public static void main(String[] a){
		
		double weight = 0.6;
		double givenMark = 70;
		
		System.out.print("Please type the weight from 0 to 1 ");
		Scanner input = new Scanner(System.in);
		weight = input.nextDouble();
		
		System.out.print("Please type the group mark  ");
		Scanner input2 = new Scanner(System.in);
		givenMark = input.nextDouble();
		
		
		
		/*double[][] student = new double[4][];
		
		for(int n =0; n <= student.length-1; n++){
			System.out.print("type");
			Scanner input3 = new Scanner(System.in);
			student[n][0] = input.nextDouble();
			student[n][1] = input.nextDouble();
			student[n][2] = input.nextDouble();
			student[n][3] = input.nextDouble();
		}*/
		
		
		double[][] student= {{5,5,5,5,5,5},{2,3,1,1,3,4},{3,5,4,1,5,0},{1,4,2,2,3,1},{1,1,3,4,5,0},{1,2,3,5,4,1}};
		
		
		
		double[] Average= new double[student.length];
		
		
		for(int n =0; n <= student.length-1; n++){
			
			Average[n] = average(student[n]);
				
		}
		
		double AverageGroup = average(Average);
		
		double[] individual = new double[student.length];
		
		for(int n =0; n <= student.length-1; n++){
			
			individual[n] = (1 + weight * (Average[n] / AverageGroup - 1)) * givenMark;
				
		}
        
        
		//(1 + k * (IRNPR / AVGIRNPR - 1)) * M
		
		for(int n = 0; n<=individual.length-1;n++){
		
			if((int)individual[n]>100) System.out.print("The NO."+ (n+1)+" student's individual mark is 100"+"\n");
			else System.out.print("The NO."+ (n+1)+" student's individual mark is "+(int)individual[n]+"\n");
			System.out.print("The NO."+ (n+1)+" student's individual mark is "+(int)individual[n]+"\n");
			
		}
		
	}
	
	
	static double average(double[] data){
		
		double x = 0;
		int len = data.length;
		
		for(int n =0; n <= len-1; n++){
			
			x= x + data[n];
					
		}
		
		return (double)x/len;
		
		
	}
	
	
	
	
}
