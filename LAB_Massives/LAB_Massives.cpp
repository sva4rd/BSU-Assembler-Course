#include <iostream>
#include <windows.h>

using namespace std;

int main()
{
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	int n;

	while (true)
	{
		cout << "Введите размер массива: ";
		cin >> n;
		if (n <= 0)
		{
			cout << "\nЧисло элементов должно быть натуральным!\n";
			continue;
		}
		break;
	}

	cout << "\nВведите элементы массива:\n";

	int sum = 0, flag = 0;		// флаг хранит нашли мы второй ноль или нет

	int* mas = new int[n];
	int number;
	for (int i = 0; i < n; i++)
	{
		cin >> number;
		mas[i] = number;
	}

	_asm
	{
		mov ecx, n		//число элементов
		mov esi, mas		//адрес массива
		xor ebx, ebx	//здесь сумма

		sub esi, 4		//уменьшаем на байт тк в цикле увеличим(исключение для первого элемента)
		cycle:
		add esi, 4
		cmp dword ptr [esi], 0
		je start			//нашли ноль идем в старт
		
		loop cycle
		jmp the_end			//прошли все элементы и не нашли ноль, конец


		dop_add:
		add ebx, eax		//добавляем доп сумму к обычной и идем считать новую доп сумму
		jmp cycle_after_2zero


		count_sum:
		add ebx, dword ptr [esi]	//добавляем элемент в сумму
		

		start:
		dec ecx			//уменьшаем кол-во оставшихся
		add esi, 4		//переходим к следующему
		cmp ecx, 0
		jle the_end		//кол-во ноль, закончили
		cmp dword ptr [esi], 0
		jne count_sum	//если элемент не равен 0, в сумму его

		mov flag, 1		// если эл равный 0, то это второй, изменяем флаг
		
		cycle_after_2zero:
		dec ecx			// уменьшаем кол-во не обработанных элементов
		cmp ecx, 0
		jle the_end		//закончились->конец
		
		xor eax, eax	// это доп сумма после 2-ого нуля, обнуляем
		dop_sum:
		add esi, 4		// переходим к следующему числу
		add eax, dword ptr [esi]	//добовляем элемент в доп суммму
		cmp dword ptr [esi], 0		//сравниваем этот элемент с нулем

		je dop_add		// равен, тогда считаем что это второй ноль и добавляем доп сумму к обычной

		dec ecx
		cmp ecx, 0
		jle the_end		//проверяем что не последнее число, иначе конец

		jmp dop_sum		//если этот элемент не равен, продолжаем считать доп сумму
		

		the_end :
		mov sum, ebx
	}

	//если флаг = 1, то есть 2 нуля и надо вывести сумму, иначе нулей меньше 2 и ответ 0
	if (flag)
		cout << "Ответ: " << sum;
	else
		cout << "Ответ: " << 0;
}