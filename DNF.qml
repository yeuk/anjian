[General]
SyntaxVersion=2
MacroID=703c757b-2ea1-46a1-8191-3111913e3930
[Comment]
������ǰ�������8.0���Ƴ���ȫ�¹���
�����԰��Լ����õĺ������ӳ���д����������úܶ���ű�ȥ����
����������������ö���ű�����һ������޸�һ���͵����޸Ķദ
Ŀǰ����⹦�ܻ��ڲ��Ե��У����κν�������ڰ���������̳�������ַ��http://bbs.ajjl.cn
******ע�⣡���ǹٷ��ṩ������⣬�����޸ģ������Ժ󰴼���������ʱ���������޸ġ�******//
******          ������������⣬������������Ҽ�ѡ���½��������            ******//

[Script]



Function ��С����()

	Randomize

	TracePrint "�ż��ܣ�P"
	KeyPress "P", 1
	Delay int(Rnd() * 10 + 13)

	TracePrint "�ż��ܣ�U"
	KeyDown "U", 1
	Delay 555
	Delay int(Rnd() * 10 + 13)
	KeyUp "U", 1
	Delay 99

	TracePrint "�ż��ܣ�I"
	KeyPress "I", 1
	Delay int(Rnd() * 10 + 13)

	TracePrint "�ż��ܣ�O"
	KeyPress "O", 1
	Delay int(Rnd() * 10 + 13)
	
	KeyPress "L", 1
	
End Function


Function ��С����2()

	Randomize
	
    FindPic 0, 0, 1024, 768, "C:\anjian\dnf\jineng\u.bmp", 0.7, ux, uy
	If ux > 0 And uy > 0 Then 
		TracePrint "�ż��ܣ�U"
		KeyDown "U", 1
		Delay 555
		Delay int(Rnd() * 10 + 13)
		KeyUp "U", 1
		Delay 99
	End If
	
    FindPic 0, 0, 1024, 768, "C:\anjian\dnf\jineng\i.bmp", 0.7, ix, iy
	If ix > 0 And iy > 0 Then 
		TracePrint "�ż��ܣ�I"
		KeyPress "I", 1
		Delay int(Rnd() * 10 + 13)
		Delay 99
	End If
	
    FindPic 0, 0, 1024, 768, "C:\anjian\dnf\jineng\o.bmp", 0.7, ox, oy
	If ox > 0 And oy > 0 Then 
		TracePrint "�ż��ܣ�O"
		KeyPress "O", 1
		Delay int(Rnd() * 10 + 13)
		Delay 88
	End If
	
    FindPic 0, 0, 1024, 768, "C:\anjian\dnf\jineng\p.bmp", 0.7, px, py
	If px > 0 And py > 0 Then 
		TracePrint "�ż��ܣ�P"
		KeyPress "P", 1
		Delay int(Rnd() * 10 + 13)
		Delay 88
	End If
	
	KeyPress "L", 1
	
End Function


Function �Ƿ�������״̬()
	TracePrint "�����Ƿ���N״̬"
	FindPic 0, 0, 1024, 768, "C:\anjian\dnf\zhuangtai\n.bmp", 0.7, tx, ty
	If tx > 0 And ty > 0 Then 
	Else 
		Delay 444
		KeyPress "N", 1
		Delay 444
		KeyPress "[", 1
	End If
End Function


/*****************
 * ϵͳ ����
 *****************/

Function ���DNF(��ʲô, �ڶ�����)

	DNFHwnd = Plugin.Window.Find(0, "���³�����ʿ")
	 
	Select Case ��ʲô
	Case "��ȡλ��"
    	sRect = Plugin.Window.GetWindowRect(DNFHwnd) 
		dim MyArray   
		MyArray = Split(sRect, "|")
		L = Clng(MyArray(0)): T = Clng(MyArray(1))   
		R = Clng(MyArray(2)) : B = Clng(MyArray(3))
		// Msgbox "��" & L & ",�� "& R & ",��" & T & ",��" & B  
		Select Case �ڶ�����
		Case "��"    // 0
    		���DNF = L
		Case "��"    // 2
			���DNF = R
		Case "��"    // 1
    		���DNF = T
		Case "��"    // 3
    		���DNF = B
		Case Else
    		���DNF = MyArray
		End Select

	Case 1
    	//���2
	Case Else
    	//����
    	���DNF = DNFHwnd
	End Select
	
End Function



Function ϵͳ_�Ƿ���ֻƽ���()

	DNF���� = ���DNF("��ȡλ��", "")
	��� = DNF����(0)
	�ϱ� = DNF����(1)
	�ұ� = DNF����(2)
	�±� = DNF����(3)

    FindPic ���, �ϱ�, �ұ�, �±�, "C:\anjian\dnf\end\baoxiang.bmp", 0.8, startX, startY

    If startX > 0 And startY > 0 Then 
    	ϵͳ_�Ƿ���ֻƽ��� = 1
    Else 
    	ϵͳ_�Ƿ���ֻƽ��� = 0
    End If
    
End Function


/*****************
 * �� ����
 *****************/
 
Function ��_�����λ()
	Randomize
	If int(Rnd() * 100) Mod 2 = 0 Then 
		Call �� ("E", 1500)
	Else 
		Call �� ("D", 1500)
	End If
	If int(Rnd() * 100) Mod 2 = 0 Then 
		Call ��("S", 1500)
		Delay 33
		KeyPress "F", 1
	Else 
		Call ��("F", 1500)
		Delay 33
		KeyPress "S", 1
	End If
End Function


Function ��(��λ��, ��ʱ��)
	Randomize
	KeyPress ��λ��, 1
	Delay int(Rnd() * 20 + 50)
	KeyDown ��λ��, 1
	Delay ��ʱ��
	KeyUp ��λ��, 1
	Delay 99
End Function

Function ��_�������(��ʱ��)
	Randomize
	If int(Rnd() * 100) Mod 2 = 0 Then 
		Call �� ("E", ��ʱ��)
	Else 
		Call �� ("D", ��ʱ��)
	End If
End Function

Function ��_�������(��ʱ��)
	Randomize
	If int(Rnd() * 100) Mod 2 = 0 Then 
		Call �� ("S", ��ʱ��)
	Else 
		Call �� ("F", ��ʱ��)
	End If
End Function

Function ��_ƫ��()
	Randomize
	Call ��_������� (1500)
	Call �� ("F", 2000)
	Call ��_������� (1500)
	Call �� ("S", 800)
End Function


/*****************
 * ���䷽��
 *****************/



Function ����_��ǰ���ĸ�(���з�������, ���С�˶���ɫ, �������Χ)
	Dim i, Room
	i = 0
    For UBound(���з�������) + 1
        Room = ���з�������(i)
		FindColor Room(0), Room(1), Room(0) + �������Χ, Room(1) + �������Χ, ���С�˶���ɫ, intX, intY
		If intX > 0 And intY > 0 Then 
			����_��ǰ���ĸ� = i + 1
			Exit For
		Else 
			����_��ǰ���ĸ� = 0
		End If
        i = i + 1
    Next
End Function

Function ����_�Ƿ����()

    FindPic 601, 73, 823, 246, "C:\anjian\dnf\map\wenhao1.bmp", 0.7, x1, y1
    Delay 33
    FindPic 601, 73, 823, 246, "C:\anjian\dnf\map\wenhao2.bmp", 0.7, x2, y2
    total = x1 + x2 + y1 + y1
    If total > 0 Then
        ����_�Ƿ���� = 1
    Else 
        //
        TracePrint "��һͼˢ����..."
        ����_�Ƿ���� = 0
    End If
End Function


Function ����_�¸�������(�¸�������������)
	// 0.23 ��˸��ɫ
	GetColor1 = GetPixelColor(�¸�������������(0) + 2, �¸�������������(1) + 2)
	Delay 230
	GetColor2 = GetPixelColor(�¸�������������(0) + 2, �¸�������������(1) + 2)
	// ��ɫ��ƫ�����
	Call Plugin.Color.ColorToRGB(GetColor1, R1, G1, B1)   
	Call Plugin.Color.ColorToRGB(GetColor2, R2, G2, B2)  
	If GetColor1 <> GetColor2 Then 
		����_�¸������� = 1
	Else 
		����_�¸������� = 0
	End If
End Function