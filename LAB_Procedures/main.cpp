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
		cout << "������� ������ �������: ";
		cin >> n;
		if (n <= 0)
		{
			cout << "\n����� ��������� ������ ���� �����������!\n";
			continue;
		}
		break;
	}

	cout << "\n������� �������� �������:\n";		

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
	//� ������� ������� ������ ������� � ������������
	//�� ���� ��� �����, �� ���������������� ��� � 16 ������� � ������� ��� � 40 �� 46 �������
	//!!!!!!!!!!!!!!

	if (Check(mas, n))			// ����: ����� �� ������ ���� ��� ���
	{
		cout << "\n1.������� �����(stdcall 1 ������): " << Sum1(mas, n) << '\n';
		cout << "2.������� �����(cdecl 1 ������): " << Sum2(mas, n) << '\n';
		cout << "3.������� �����(stdcall 2 ������): " << Sum3(mas, n) << '\n';
		cout << "4.������� �����(cdecl 2 ������): " << Sum4(mas, n) << '\n';
		cout << "5.������� �����(fastcall): " << Sum5(mas, n) << '\n';
	}
	else
		cout << "\n� ������� ������������ �����!\n";
	return 0;
}