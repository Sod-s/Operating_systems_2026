#include <iostream>
#include "math_functions.h" // Подключаем наши функции
using namespace std;

int main() {
    int num = 10;
    cout << "Factorial of " << num << " is " << factorial(num) << "\n";
    cout << "Fibonacci of " << num << " is " << fibonacci(num) << "\n";
    return 0;
}