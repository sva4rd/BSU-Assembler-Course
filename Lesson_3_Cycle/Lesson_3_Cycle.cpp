#include <iostream>

using namespace std;

int main()
{
    // 3.4
    int y, little_sum, k = 5;
    _asm
    {
        mov ecx, 5
        mov esi, ecx
        xor ebx, ebx
        lab2 : push ecx
        mov k, ecx
        mov esi, ecx

        mov ecx, 5
        sub ecx, esi
        add ecx, 1
        lab1 : mov eax, esi
        mul esi

        add eax, k
        mov little_sum, eax
        mul little_sum

        add ebx, eax
        inc esi
        loop lab1
        pop ecx
        loop lab2
        mov y, ebx
    }
    cout << "3.4 y = " << y << endl;


    cout << "===========" << '\n';

    //3.5
    int double_n, sqr;
    y = 0;
    _asm
    {
        mov ecx, 5
        mov esi, ecx
        xor ebx, ebx
        lab22 : push ecx
        mov k, ecx
        mov esi, ecx

        mov ecx, 5
        sub ecx, esi
        add ecx, 1
        lab11 : mov eax, esi
        mul esi

        mov double_n, eax
        mov eax, k
        mul k
        add eax, double_n

        mov sqr, eax
        mul sqr

        add ebx, eax
        inc esi
        loop lab11
        pop ecx
        loop lab22
        mov y, ebx
    }
    cout << "3.5 y = " << y << endl;


}