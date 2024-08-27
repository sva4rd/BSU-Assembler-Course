#include <iostream>
#include <windows.h>
using namespace std;

int main()
{
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	char s1[255] = "qqAAAAfgdjAAAejjAdbAAA";
	char s2[255] = "AAA";
	int len1 = strlen(s1);
	int len2 = strlen(s2);
	_asm
	{
		mov eax, len2			//проверка, что подстрока не пустая
		cmp eax, 0
		je wrong_substr

		mov eax, len1			//проверка, что подстрока не больше строки
		cmp eax, len2
		jl wrong_substr

		cld
		mov ecx, len1
		mov al, s2
		lea edi, s1

		Begin:
		repne scasb				// поиск первого символа s2 в s1
		jecxz not_found			// подстрока не найдена
		push edi
		push ecx				//сохраняем строку со смещен и счетчик на первом эл подстроки
		mov ecx, len2
		dec ecx
		lea esi, s2 + 1			// сравнение s2, начиная со второго символа, с частью s1

		repe cmpsb
		jz found				// подстрока найдена

		pop ecx					// если не совпали, то продолжим
		pop edi
		jmp Begin

		not_found:				// доп метка, чтобы достать до нужной
		jmp Not_Found_output

		found:
		pop ecx
		mov eax, ecx			//закидываем сохр счетчик
		pop edi

		push ecx				//ecx перед подстрокой в стек

		mov ecx, len1
		sub ecx, eax
		dec ecx					//ecx - коорд первого символа подстроки
		lea esi, s1
		lea edi, s1
		add edi, ecx			//доходим до первого в строке приемнике
		add ecx, len2

		add esi, ecx			//доходим до первого после подстроки в источнике(приемник в стеке)

		pop ecx					//перед подстр
		sub ecx, len2			//сколько осталось после подстр (+1 нужна)
		inc ecx

		rep movsb				//перемещаем часть строки(после подстр) вместо подстр 

		mov al, 0
		stosb					//обрезаем хвост из повторяющихся элементов(или саму подстр, если она в конце)
	}

	if (s1[0] == '\0')
	{
		cout << "\nНовая строка пуста!\n";
		return 0;
	}
	cout << "\nНовая строка: " << s1 << '\n';
	return 0;

Not_Found_output:
	cout << "\nПодстрока не найдена!\n";
	return 0;

wrong_substr:
	cout << "\nНеправильная подстрока!\n";
	return 0;
}