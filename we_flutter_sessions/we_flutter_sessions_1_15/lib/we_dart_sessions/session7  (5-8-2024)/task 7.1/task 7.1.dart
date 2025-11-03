//---------Task1-------------

main(){
  int x = 2;
  int y = 3;
  int z = 5;

  int f = fact(x);
  print("The factorial is: $f");

  int s = sumNumber(x);
  print("The sum is: $s");

  int p = power(x, y);
  print("The power is: $p");

  double re1 = (fact(x) * power(x, y) + sumNumber(z)) / (power(z, y) * fact(y));
  print(re1);

  double re2 = (power(x, y) * power(x, z)) / (sumNumber(x) * sumNumber(y) + fact(z) * fact(y));
  print(re2);
}

//---factorial number
int fact(int x){
  int fact=1;
  while(x>0){
    fact *=x;
    x--;
  }
  return fact;
}

//---sum
int sumNumber(int x){
  int sum=0;
  while(x>0){
    sum +=x;
    x--;
  }
  return sum;
}

//---power
int power(int x,int y){
    int result = 1;
    for (int i = 0; i < y; i++) {
      result *= x;
    }
    return result;
  }