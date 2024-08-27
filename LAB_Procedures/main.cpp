#include <iostream>
#include <windows.h>
using namespace std;
extern "C" int __stdcall Sum1(int*, int);
extern "C" int __cdecl Sum2(int*, int);
extern "C" int __stdcall Sum3(int*, int);
extern "C" int __cdecl Sum4(int*, int);
extern "C" int __fastcall Sum5(int*, int);

extern "C" int __stdcall Check(int*, int);

int main() 
{
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	/*int n;
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

	int* mas = new int[n];
	int number;
	for (int i = 0; i < n; i++)
	{
		cin >> number;
		mas[i] = number;
	}*/

	//
	int n = 5;
	int* mas = new int[n];
	mas[0] = 0;
	mas[1] = 1;
	mas[2] = 2;
	mas[3] = 3;
	mas[4] = 0;
	//

	//!!!!!!!!!!!!!!
	//В ЗАДАНИИ СКАЗАНО УБРАТЬ ЗАПРОСЫ К ПОЛЬЗОВАТЕЛЮ
	//НО ЕСЛИ ВАМ НУЖНЫ, ТО РАСКОММЕНТИРУЙТЕ КОД С 16 СТРОЧКИ И УДАЛИТЕ КОД С 40 ПО 46 СТРОЧКУ
	//!!!!!!!!!!!!!!

	if (Check(mas, n))			// ищет: нашли мы второй ноль или нет
	{
		cout << "\n1.Искомая сумма(stdcall 1 способ): " << Sum1(mas, n) << '\n';
		cout << "2.Искомая сумма(cdecl 1 способ): " << Sum2(mas, n) << '\n';
		cout << "3.Искомая сумма(stdcall 2 способ): " << Sum3(mas, n) << '\n';
		cout << "4.Искомая сумма(cdecl 2 способ): " << Sum4(mas, n) << '\n';
		cout << "5.Искомая сумма(fastcall): " << Sum5(mas, n) << '\n';
	}
	else
		cout << "\nВ массиве недостаточно нулей!\n";
	return 0;
}