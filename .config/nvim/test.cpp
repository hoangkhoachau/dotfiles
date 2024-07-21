#include <iostream>
using namespace std;

int testReturn(int a=0){
    return 0;
}

int main(){
    int n;
    cin >> n;
    cout << n << testReturn();
}



