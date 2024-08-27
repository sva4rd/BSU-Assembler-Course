#include <iostream>
using namespace std;

int main()
{
    long long xx;
    short x1 = 0, result1;
    int x2 = 0, result2;
    do
    {
        cout << "Enter a short x: ";
        cin >> xx;
    } while (abs(xx) > INT16_MAX);
    x1 = xx;
    _asm {
        mov ax, x1
        mov ecx, 16     //2 байта в слове
        xor bx, bx
        cycle:
        shr eax, 1      //сдвиг враво на 1 бит
        adc bx, 0       //0 + CF(1: бит=1, 0: бит=0)
        loop cycle
        mov result1, bx
    }
    cout << "Number of 1 in x = " << result1;

    cout << "\n==============\n";

    int maxX = INT32_MAX/15;
    do
    {
        cout << "Enter an integer x(condition: abs(x) < 143165576): ";
        cin >> xx;
    } while (abs(xx) > maxX);
    x2 = xx;
    _asm
    {
        mov eax, x2
        mov ebx, eax
        sal eax, 3      //сдвиг влево на 3 бита(x*2^3=x*8)
        sal ebx, 3      //сдвиг влево на 3 бита(x*2^3=x*8)
        sub ebx, x2     //=x*7
        add eax, ebx    //x*8+x*7=x*15
        mov result2, eax
    }
    cout << "x * 15 = " << result2;
}