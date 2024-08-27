#include <iostream>
#include <windows.h>

using namespace std;

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    int N, x, y = -1, d = 10, number;   // игреки это числа от 1 до эн
    cout << "Введите число: ";
    cin >> N;
    cout << '\n';
    
    _asm mov ebx, N
    _asm jmp main_block
out :
    cout << y << ' ';   //вывод исходного числа
    _asm jmp main_block


    _asm
    {
    main_block:
        inc y       //переход к следующему числу
        mov eax, y
        mov x, eax   // дублируем его в икс
        cmp ebx, x    // сравниваем эн и текущее число
        
        jg First_Count    // эн больше - считаем
        jle the_end     // эн меньше или равно текущему - конец
    }

    _asm
    {
    First_Count:
        cdq
        idiv d
        mov number, edx    // number - последняя цифра

    Circle_count_for_number:    // сравниваем последнюю цифру с остальными

        cmp eax, 0
        je Move_to_next_number   // делимое ноль - закончили сравнивать и идем к следующей цифре

        cdq
        idiv d
        cmp number, edx
        je main_block            // нашли совпадение - идем к следующему числу(не выводя это)
        jne Circle_count_for_number  // если нет - продолжаем сравнивать циклично


    Move_to_next_number:
        mov eax, x    //в регистр наше число
        cdq
        idiv d
        mov x, eax    // наше число теперь без последней цифры
        cmp eax, 0
        je out        // если после удаления последней цифры, других нет, число подходит тк не нашло совпадений
        jmp First_Count   // иначе продолжаем
    }

the_end:
    exit(0);

}
