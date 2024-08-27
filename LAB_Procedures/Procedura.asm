.486
PUBLIC _Sum1@8
PUBLIC _Sum2
PUBLIC Sum3
PUBLIC Sum4
PUBLIC @Sum5@8

PUBLIC _Check@8

.model flat
.data
.code


_Sum1@8 proc
	push ebp
	mov ebp, esp

	mov edx, [ebp + 8]		;адрес массива
	xor eax, eax

	mov ecx, [ebp + 12]		;число элементов		
	xor ebx, ebx	;здесь сумма

	sub edx, 4		;уменьшаем на байт тк в цикле увеличим(исключение для первого элемента)
	cycle:
	add edx, 4
		cmp dword ptr[edx], 0
		je start			;нашли ноль идем в старт

		loop cycle
		jmp the_end			;прошли все элементы и не нашли ноль, конец


		dop_add :
		add ebx, eax		;добавляем доп сумму к обычной и идем считать новую доп сумму
		jmp cycle_after_2zero


		count_sum :
		add ebx, dword ptr[edx]		;добавляем элемент в сумму


		start :
		dec ecx			;уменьшаем кол-во оставшихся
		add edx, 4		;переходим к следующему
		cmp ecx, 0
		jle the_end		;кол-во ноль, закончили
		cmp dword ptr[edx], 0
		jne count_sum	;если элемент не равен 0, в сумму его



		cycle_after_2zero:
		dec ecx			; уменьшаем кол-во не обработанных элементов
		cmp ecx, 0
		jle the_end		;закончились->конец

		xor eax, eax	; это доп сумма после 2-ого нуля, обнуляем
		dop_sum :
		add edx, 4		; переходим к следующему числу
		add eax, dword ptr[edx]	;добовляем элемент в доп суммму
		cmp dword ptr[edx], 0		;сравниваем этот элемент с нулем

		je dop_add		; равен, тогда считаем что это второй ноль и добавляем доп сумму к обычной

		dec ecx
		cmp ecx, 0
		jle the_end		;проверяем что не последнее число, иначе конец

		jmp dop_sum		;если этот элемент не равен, продолжаем считать доп сумму


		the_end :
		mov eax, ebx

	mov esp,ebp
	pop ebp
	ret 8
_Sum1@8	endp


; *********************************************


_Sum2 proc
	push ebp
	mov ebp, esp

	mov edx, [ebp + 8]		;адрес массива
	xor eax, eax

	mov ecx, [ebp + 12]		;число элементов		
	xor ebx, ebx	;здесь сумма

	sub edx, 4		;уменьшаем на байт тк в цикле увеличим(исключение для первого элемента)
	cycle:
	add edx, 4
		cmp dword ptr[edx], 0
		je start			;нашли ноль идем в старт

		loop cycle
		jmp the_end			;прошли все элементы и не нашли ноль, конец


		dop_add :
		add ebx, eax		;добавляем доп сумму к обычной и идем считать новую доп сумму
		jmp cycle_after_2zero


		count_sum :
		add ebx, dword ptr[edx]		;добавляем элемент в сумму


		start :
		dec ecx			;уменьшаем кол-во оставшихся
		add edx, 4		;переходим к следующему
		cmp ecx, 0
		jle the_end		;кол-во ноль, закончили
		cmp dword ptr[edx], 0
		jne count_sum	;если элемент не равен 0, в сумму его



		cycle_after_2zero:
		dec ecx			; уменьшаем кол-во не обработанных элементов
		cmp ecx, 0
		jle the_end		;закончились->конец

		xor eax, eax	; это доп сумма после 2-ого нуля, обнуляем
		dop_sum :
		add edx, 4		; переходим к следующему числу
		add eax, dword ptr[edx]	;добовляем элемент в доп суммму
		cmp dword ptr[edx], 0		;сравниваем этот элемент с нулем

		je dop_add		; равен, тогда считаем что это второй ноль и добавляем доп сумму к обычной

		dec ecx
		cmp ecx, 0
		jle the_end		;проверяем что не последнее число, иначе конец

		jmp dop_sum		;если этот элемент не равен, продолжаем считать доп сумму


		the_end :
		mov eax, ebx

	mov esp,ebp
	pop ebp
	ret
_Sum2	endp


; ***********************************************


Sum3	proc stdcall, array:dword, num:dword
	mov edx, array		;адрес массива
	xor eax, eax

	mov ecx, num		;число элементов		
	xor ebx, ebx	;здесь сумма

	sub edx, 4		;уменьшаем на байт тк в цикле увеличим(исключение для первого элемента)
	cycle:
	add edx, 4
		cmp dword ptr[edx], 0
		je start			;нашли ноль идем в старт

		loop cycle
		jmp the_end			;прошли все элементы и не нашли ноль, конец


		dop_add :
		add ebx, eax		;добавляем доп сумму к обычной и идем считать новую доп сумму
		jmp cycle_after_2zero


		count_sum :
		add ebx, dword ptr[edx]		;добавляем элемент в сумму


		start :
		dec ecx			;уменьшаем кол-во оставшихся
		add edx, 4		;переходим к следующему
		cmp ecx, 0
		jle the_end		;кол-во ноль, закончили
		cmp dword ptr[edx], 0
		jne count_sum	;если элемент не равен 0, в сумму его



		cycle_after_2zero:
		dec ecx			; уменьшаем кол-во не обработанных элементов
		cmp ecx, 0
		jle the_end		;закончились->конец

		xor eax, eax	; это доп сумма после 2-ого нуля, обнуляем
		dop_sum :
		add edx, 4		; переходим к следующему числу
		add eax, dword ptr[edx]	;добовляем элемент в доп суммму
		cmp dword ptr[edx], 0		;сравниваем этот элемент с нулем

		je dop_add		; равен, тогда считаем что это второй ноль и добавляем доп сумму к обычной

		dec ecx
		cmp ecx, 0
		jle the_end		;проверяем что не последнее число, иначе конец

		jmp dop_sum		;если этот элемент не равен, продолжаем считать доп сумму


		the_end :
		mov eax, ebx
	ret	8
Sum3	endp
; **************************************************

Sum4 proc C, array:dword, num:dword
	mov edx, array		;адрес массива
	xor eax, eax

	mov ecx, num	;число элементов		
	xor ebx, ebx	;здесь сумма

	sub edx, 4		;уменьшаем на байт тк в цикле увеличим(исключение для первого элемента)
	cycle:
	add edx, 4
		cmp dword ptr[edx], 0
		je start			;нашли ноль идем в старт

		loop cycle
		jmp the_end			;прошли все элементы и не нашли ноль, конец


		dop_add :
		add ebx, eax		;добавляем доп сумму к обычной и идем считать новую доп сумму
		jmp cycle_after_2zero


		count_sum :
		add ebx, dword ptr[edx]		;добавляем элемент в сумму


		start :
		dec ecx			;уменьшаем кол-во оставшихся
		add edx, 4		;переходим к следующему
		cmp ecx, 0
		jle the_end		;кол-во ноль, закончили
		cmp dword ptr[edx], 0
		jne count_sum	;если элемент не равен 0, в сумму его



		cycle_after_2zero:
		dec ecx			; уменьшаем кол-во не обработанных элементов
		cmp ecx, 0
		jle the_end		;закончились->конец

		xor eax, eax	; это доп сумма после 2-ого нуля, обнуляем
		dop_sum :
		add edx, 4		; переходим к следующему числу
		add eax, dword ptr[edx]	;добовляем элемент в доп суммму
		cmp dword ptr[edx], 0		;сравниваем этот элемент с нулем

		je dop_add		; равен, тогда считаем что это второй ноль и добавляем доп сумму к обычной

		dec ecx
		cmp ecx, 0
		jle the_end		;проверяем что не последнее число, иначе конец

		jmp dop_sum		;если этот элемент не равен, продолжаем считать доп сумму


		the_end :
		mov eax, ebx
	ret
Sum4	endp


; ********************************************************


@Sum5@8 proc
	mov eax, edx
	mov edx, ecx		;адрес массива
	

	mov ecx, eax		;число элементов		
	xor ebx, ebx	;здесь сумма
	xor eax, eax

	sub edx, 4		;уменьшаем на байт тк в цикле увеличим(исключение для первого элемента)
	cycle:
	add edx, 4
		cmp dword ptr[edx], 0
		je start			;нашли ноль идем в старт

		loop cycle
		jmp the_end			;прошли все элементы и не нашли ноль, конец


		dop_add :
		add ebx, eax		;добавляем доп сумму к обычной и идем считать новую доп сумму
		jmp cycle_after_2zero


		count_sum :
		add ebx, dword ptr[edx]		;добавляем элемент в сумму


		start :
		dec ecx			;уменьшаем кол-во оставшихся
		add edx, 4		;переходим к следующему
		cmp ecx, 0
		jle the_end		;кол-во ноль, закончили
		cmp dword ptr[edx], 0
		jne count_sum	;если элемент не равен 0, в сумму его



		cycle_after_2zero:
		dec ecx			; уменьшаем кол-во не обработанных элементов
		cmp ecx, 0
		jle the_end		;закончились->конец

		xor eax, eax	; это доп сумма после 2-ого нуля, обнуляем
		dop_sum :
		add edx, 4		; переходим к следующему числу
		add eax, dword ptr[edx]	;добовляем элемент в доп суммму
		cmp dword ptr[edx], 0		;сравниваем этот элемент с нулем

		je dop_add		; равен, тогда считаем что это второй ноль и добавляем доп сумму к обычной

		dec ecx
		cmp ecx, 0
		jle the_end		;проверяем что не последнее число, иначе конец

		jmp dop_sum		;если этот элемент не равен, продолжаем считать доп сумму


		the_end :
		mov eax, ebx
	ret
@Sum5@8	endp


;****************************************************

_Check@8 proc
	push ebp
	mov ebp, esp

	mov edx, [ebp + 8]		;адрес массива
	xor eax, eax

	mov ecx, [ebp + 12]		;число элементов		
	xor ebx, ebx	;здесь сумма

	sub edx, 4		;уменьшаем на байт тк в цикле увеличим(исключение для первого элемента)
	cycle:
	add edx, 4
		cmp dword ptr[edx], 0
		je start			;нашли ноль идем в старт

		loop cycle
		jmp the_end			;прошли все элементы и не нашли ноль, конец

		start :
		dec ecx			;уменьшаем кол-во оставшихся
		add edx, 4		;переходим к следующему
		cmp ecx, 0
		jle the_end		;кол-во ноль, закончили
		cmp dword ptr[edx], 0
		jne start		;если элемент не равен 0, продолжаем

		mov eax, 1		; если эл равный 0, то это второй, изменяем флаг
		the_end:
	mov esp,ebp
	pop ebp
	ret 8
_Check@8 endp
end