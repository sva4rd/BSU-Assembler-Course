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

	mov edx, [ebp + 8]		;����� �������
	xor eax, eax

	mov ecx, [ebp + 12]		;����� ���������		
	xor ebx, ebx	;����� �����

	sub edx, 4		;��������� �� ���� �� � ����� ��������(���������� ��� ������� ��������)
	cycle:
	add edx, 4
		cmp dword ptr[edx], 0
		je start			;����� ���� ���� � �����

		loop cycle
		jmp the_end			;������ ��� �������� � �� ����� ����, �����


		dop_add :
		add ebx, eax		;��������� ��� ����� � ������� � ���� ������� ����� ��� �����
		jmp cycle_after_2zero


		count_sum :
		add ebx, dword ptr[edx]		;��������� ������� � �����


		start :
		dec ecx			;��������� ���-�� ����������
		add edx, 4		;��������� � ����������
		cmp ecx, 0
		jle the_end		;���-�� ����, ���������
		cmp dword ptr[edx], 0
		jne count_sum	;���� ������� �� ����� 0, � ����� ���



		cycle_after_2zero:
		dec ecx			; ��������� ���-�� �� ������������ ���������
		cmp ecx, 0
		jle the_end		;�����������->�����

		xor eax, eax	; ��� ��� ����� ����� 2-��� ����, ��������
		dop_sum :
		add edx, 4		; ��������� � ���������� �����
		add eax, dword ptr[edx]	;��������� ������� � ��� ������
		cmp dword ptr[edx], 0		;���������� ���� ������� � �����

		je dop_add		; �����, ����� ������� ��� ��� ������ ���� � ��������� ��� ����� � �������

		dec ecx
		cmp ecx, 0
		jle the_end		;��������� ��� �� ��������� �����, ����� �����

		jmp dop_sum		;���� ���� ������� �� �����, ���������� ������� ��� �����


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

	mov edx, [ebp + 8]		;����� �������
	xor eax, eax

	mov ecx, [ebp + 12]		;����� ���������		
	xor ebx, ebx	;����� �����

	sub edx, 4		;��������� �� ���� �� � ����� ��������(���������� ��� ������� ��������)
	cycle:
	add edx, 4
		cmp dword ptr[edx], 0
		je start			;����� ���� ���� � �����

		loop cycle
		jmp the_end			;������ ��� �������� � �� ����� ����, �����


		dop_add :
		add ebx, eax		;��������� ��� ����� � ������� � ���� ������� ����� ��� �����
		jmp cycle_after_2zero


		count_sum :
		add ebx, dword ptr[edx]		;��������� ������� � �����


		start :
		dec ecx			;��������� ���-�� ����������
		add edx, 4		;��������� � ����������
		cmp ecx, 0
		jle the_end		;���-�� ����, ���������
		cmp dword ptr[edx], 0
		jne count_sum	;���� ������� �� ����� 0, � ����� ���



		cycle_after_2zero:
		dec ecx			; ��������� ���-�� �� ������������ ���������
		cmp ecx, 0
		jle the_end		;�����������->�����

		xor eax, eax	; ��� ��� ����� ����� 2-��� ����, ��������
		dop_sum :
		add edx, 4		; ��������� � ���������� �����
		add eax, dword ptr[edx]	;��������� ������� � ��� ������
		cmp dword ptr[edx], 0		;���������� ���� ������� � �����

		je dop_add		; �����, ����� ������� ��� ��� ������ ���� � ��������� ��� ����� � �������

		dec ecx
		cmp ecx, 0
		jle the_end		;��������� ��� �� ��������� �����, ����� �����

		jmp dop_sum		;���� ���� ������� �� �����, ���������� ������� ��� �����


		the_end :
		mov eax, ebx

	mov esp,ebp
	pop ebp
	ret
_Sum2	endp


; ***********************************************


Sum3	proc stdcall, array:dword, num:dword
	mov edx, array		;����� �������
	xor eax, eax

	mov ecx, num		;����� ���������		
	xor ebx, ebx	;����� �����

	sub edx, 4		;��������� �� ���� �� � ����� ��������(���������� ��� ������� ��������)
	cycle:
	add edx, 4
		cmp dword ptr[edx], 0
		je start			;����� ���� ���� � �����

		loop cycle
		jmp the_end			;������ ��� �������� � �� ����� ����, �����


		dop_add :
		add ebx, eax		;��������� ��� ����� � ������� � ���� ������� ����� ��� �����
		jmp cycle_after_2zero


		count_sum :
		add ebx, dword ptr[edx]		;��������� ������� � �����


		start :
		dec ecx			;��������� ���-�� ����������
		add edx, 4		;��������� � ����������
		cmp ecx, 0
		jle the_end		;���-�� ����, ���������
		cmp dword ptr[edx], 0
		jne count_sum	;���� ������� �� ����� 0, � ����� ���



		cycle_after_2zero:
		dec ecx			; ��������� ���-�� �� ������������ ���������
		cmp ecx, 0
		jle the_end		;�����������->�����

		xor eax, eax	; ��� ��� ����� ����� 2-��� ����, ��������
		dop_sum :
		add edx, 4		; ��������� � ���������� �����
		add eax, dword ptr[edx]	;��������� ������� � ��� ������
		cmp dword ptr[edx], 0		;���������� ���� ������� � �����

		je dop_add		; �����, ����� ������� ��� ��� ������ ���� � ��������� ��� ����� � �������

		dec ecx
		cmp ecx, 0
		jle the_end		;��������� ��� �� ��������� �����, ����� �����

		jmp dop_sum		;���� ���� ������� �� �����, ���������� ������� ��� �����


		the_end :
		mov eax, ebx
	ret	8
Sum3	endp
; **************************************************

Sum4 proc C, array:dword, num:dword
	mov edx, array		;����� �������
	xor eax, eax

	mov ecx, num	;����� ���������		
	xor ebx, ebx	;����� �����

	sub edx, 4		;��������� �� ���� �� � ����� ��������(���������� ��� ������� ��������)
	cycle:
	add edx, 4
		cmp dword ptr[edx], 0
		je start			;����� ���� ���� � �����

		loop cycle
		jmp the_end			;������ ��� �������� � �� ����� ����, �����


		dop_add :
		add ebx, eax		;��������� ��� ����� � ������� � ���� ������� ����� ��� �����
		jmp cycle_after_2zero


		count_sum :
		add ebx, dword ptr[edx]		;��������� ������� � �����


		start :
		dec ecx			;��������� ���-�� ����������
		add edx, 4		;��������� � ����������
		cmp ecx, 0
		jle the_end		;���-�� ����, ���������
		cmp dword ptr[edx], 0
		jne count_sum	;���� ������� �� ����� 0, � ����� ���



		cycle_after_2zero:
		dec ecx			; ��������� ���-�� �� ������������ ���������
		cmp ecx, 0
		jle the_end		;�����������->�����

		xor eax, eax	; ��� ��� ����� ����� 2-��� ����, ��������
		dop_sum :
		add edx, 4		; ��������� � ���������� �����
		add eax, dword ptr[edx]	;��������� ������� � ��� ������
		cmp dword ptr[edx], 0		;���������� ���� ������� � �����

		je dop_add		; �����, ����� ������� ��� ��� ������ ���� � ��������� ��� ����� � �������

		dec ecx
		cmp ecx, 0
		jle the_end		;��������� ��� �� ��������� �����, ����� �����

		jmp dop_sum		;���� ���� ������� �� �����, ���������� ������� ��� �����


		the_end :
		mov eax, ebx
	ret
Sum4	endp


; ********************************************************


@Sum5@8 proc
	mov eax, edx
	mov edx, ecx		;����� �������
	

	mov ecx, eax		;����� ���������		
	xor ebx, ebx	;����� �����
	xor eax, eax

	sub edx, 4		;��������� �� ���� �� � ����� ��������(���������� ��� ������� ��������)
	cycle:
	add edx, 4
		cmp dword ptr[edx], 0
		je start			;����� ���� ���� � �����

		loop cycle
		jmp the_end			;������ ��� �������� � �� ����� ����, �����


		dop_add :
		add ebx, eax		;��������� ��� ����� � ������� � ���� ������� ����� ��� �����
		jmp cycle_after_2zero


		count_sum :
		add ebx, dword ptr[edx]		;��������� ������� � �����


		start :
		dec ecx			;��������� ���-�� ����������
		add edx, 4		;��������� � ����������
		cmp ecx, 0
		jle the_end		;���-�� ����, ���������
		cmp dword ptr[edx], 0
		jne count_sum	;���� ������� �� ����� 0, � ����� ���



		cycle_after_2zero:
		dec ecx			; ��������� ���-�� �� ������������ ���������
		cmp ecx, 0
		jle the_end		;�����������->�����

		xor eax, eax	; ��� ��� ����� ����� 2-��� ����, ��������
		dop_sum :
		add edx, 4		; ��������� � ���������� �����
		add eax, dword ptr[edx]	;��������� ������� � ��� ������
		cmp dword ptr[edx], 0		;���������� ���� ������� � �����

		je dop_add		; �����, ����� ������� ��� ��� ������ ���� � ��������� ��� ����� � �������

		dec ecx
		cmp ecx, 0
		jle the_end		;��������� ��� �� ��������� �����, ����� �����

		jmp dop_sum		;���� ���� ������� �� �����, ���������� ������� ��� �����


		the_end :
		mov eax, ebx
	ret
@Sum5@8	endp


;****************************************************

_Check@8 proc
	push ebp
	mov ebp, esp

	mov edx, [ebp + 8]		;����� �������
	xor eax, eax

	mov ecx, [ebp + 12]		;����� ���������		
	xor ebx, ebx	;����� �����

	sub edx, 4		;��������� �� ���� �� � ����� ��������(���������� ��� ������� ��������)
	cycle:
	add edx, 4
		cmp dword ptr[edx], 0
		je start			;����� ���� ���� � �����

		loop cycle
		jmp the_end			;������ ��� �������� � �� ����� ����, �����

		start :
		dec ecx			;��������� ���-�� ����������
		add edx, 4		;��������� � ����������
		cmp ecx, 0
		jle the_end		;���-�� ����, ���������
		cmp dword ptr[edx], 0
		jne start		;���� ������� �� ����� 0, ����������

		mov eax, 1		; ���� �� ������ 0, �� ��� ������, �������� ����
		the_end:
	mov esp,ebp
	pop ebp
	ret 8
_Check@8 endp
end