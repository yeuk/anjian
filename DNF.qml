[General]
SyntaxVersion=2
MacroID=703c757b-2ea1-46a1-8191-3111913e3930
[Comment]
命令库是按键精灵8.0版推出的全新功能
您可以把自己常用的函数和子程序写在命令库里让很多个脚本去调用
命令库最大的优势是让多个脚本共享一个命令，修改一处就等于修改多处
目前命令库功能还在测试当中，有任何建议可以在按键精灵论坛提出，网址：http://bbs.ajjl.cn
******注意！这是官方提供的命令库，请勿修改！避免以后按键精灵升级时覆盖您的修改。******//
******          如需新增命令库，可在命令库点击右键选择“新建”命令库            ******//

[Script]



Function 放小技能()

	Randomize

	TracePrint "放技能：P"
	KeyPress "P", 1
	Delay int(Rnd() * 10 + 13)

	TracePrint "放技能：U"
	KeyDown "U", 1
	Delay 555
	Delay int(Rnd() * 10 + 13)
	KeyUp "U", 1
	Delay 99

	TracePrint "放技能：I"
	KeyPress "I", 1
	Delay int(Rnd() * 10 + 13)

	TracePrint "放技能：O"
	KeyPress "O", 1
	Delay int(Rnd() * 10 + 13)
	
	KeyPress "L", 1
	
End Function


Function 放小技能2()

	Randomize
	
    FindPic 0, 0, 1024, 768, "C:\anjian\dnf\jineng\u.bmp", 0.7, ux, uy
	If ux > 0 And uy > 0 Then 
		TracePrint "放技能：U"
		KeyDown "U", 1
		Delay 555
		Delay int(Rnd() * 10 + 13)
		KeyUp "U", 1
		Delay 99
	End If
	
    FindPic 0, 0, 1024, 768, "C:\anjian\dnf\jineng\i.bmp", 0.7, ix, iy
	If ix > 0 And iy > 0 Then 
		TracePrint "放技能：I"
		KeyPress "I", 1
		Delay int(Rnd() * 10 + 13)
		Delay 99
	End If
	
    FindPic 0, 0, 1024, 768, "C:\anjian\dnf\jineng\o.bmp", 0.7, ox, oy
	If ox > 0 And oy > 0 Then 
		TracePrint "放技能：O"
		KeyPress "O", 1
		Delay int(Rnd() * 10 + 13)
		Delay 88
	End If
	
    FindPic 0, 0, 1024, 768, "C:\anjian\dnf\jineng\p.bmp", 0.7, px, py
	If px > 0 And py > 0 Then 
		TracePrint "放技能：P"
		KeyPress "P", 1
		Delay int(Rnd() * 10 + 13)
		Delay 88
	End If
	
	KeyPress "L", 1
	
End Function


Function 是否开启被动状态()
	TracePrint "？？是否开启N状态"
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
 * 系统 方法
 *****************/

Function 句柄DNF(干什么, 第二参数)

	DNFHwnd = Plugin.Window.Find(0, "地下城与勇士")
	 
	Select Case 干什么
	Case "获取位置"
    	sRect = Plugin.Window.GetWindowRect(DNFHwnd) 
		dim MyArray   
		MyArray = Split(sRect, "|")
		L = Clng(MyArray(0)): T = Clng(MyArray(1))   
		R = Clng(MyArray(2)) : B = Clng(MyArray(3))
		// Msgbox "左" & L & ",右 "& R & ",上" & T & ",下" & B  
		Select Case 第二参数
		Case "左"    // 0
    		句柄DNF = L
		Case "右"    // 2
			句柄DNF = R
		Case "上"    // 1
    		句柄DNF = T
		Case "下"    // 3
    		句柄DNF = B
		Case Else
    		句柄DNF = MyArray
		End Select

	Case 1
    	//情况2
	Case Else
    	//否则
    	句柄DNF = DNFHwnd
	End Select
	
End Function



Function 系统_是否出现黄金宝箱()

	DNF窗口 = 句柄DNF("获取位置", "")
	左标 = DNF窗口(0)
	上标 = DNF窗口(1)
	右标 = DNF窗口(2)
	下标 = DNF窗口(3)

    FindPic 左标, 上标, 右标, 下标, "C:\anjian\dnf\end\baoxiang.bmp", 0.8, startX, startY

    If startX > 0 And startY > 0 Then 
    	系统_是否出现黄金宝箱 = 1
    Else 
    	系统_是否出现黄金宝箱 = 0
    End If
    
End Function


/*****************
 * 跑 方法
 *****************/
 
Function 跑_随机走位()
	Randomize
	If int(Rnd() * 100) Mod 2 = 0 Then 
		Call 跑 ("E", 1500)
	Else 
		Call 跑 ("D", 1500)
	End If
	If int(Rnd() * 100) Mod 2 = 0 Then 
		Call 跑("S", 1500)
		Delay 33
		KeyPress "F", 1
	Else 
		Call 跑("F", 1500)
		Delay 33
		KeyPress "S", 1
	End If
End Function


Function 跑(跑位键, 跑时间)
	Randomize
	KeyPress 跑位键, 1
	Delay int(Rnd() * 20 + 50)
	KeyDown 跑位键, 1
	Delay 跑时间
	KeyUp 跑位键, 1
	Delay 99
End Function

Function 跑_上下随机(跑时间)
	Randomize
	If int(Rnd() * 100) Mod 2 = 0 Then 
		Call 跑 ("E", 跑时间)
	Else 
		Call 跑 ("D", 跑时间)
	End If
End Function

Function 跑_左右随机(跑时间)
	Randomize
	If int(Rnd() * 100) Mod 2 = 0 Then 
		Call 跑 ("S", 跑时间)
	Else 
		Call 跑 ("F", 跑时间)
	End If
End Function

Function 跑_偏右()
	Randomize
	Call 跑_上下随机 (1500)
	Call 跑 ("F", 2000)
	Call 跑_上下随机 (1500)
	Call 跑 ("S", 800)
End Function


/*****************
 * 房间方法
 *****************/



Function 房间_当前在哪个(所有房间坐标, 辨别小人儿颜色, 辨别扩大范围)
	Dim i, Room
	i = 0
    For UBound(所有房间坐标) + 1
        Room = 所有房间坐标(i)
		FindColor Room(0), Room(1), Room(0) + 辨别扩大范围, Room(1) + 辨别扩大范围, 辨别小人儿颜色, intX, intY
		If intX > 0 And intY > 0 Then 
			房间_当前在哪个 = i + 1
			Exit For
		Else 
			房间_当前在哪个 = 0
		End If
        i = i + 1
    Next
End Function

Function 房间_是否打完()

    FindPic 601, 73, 823, 246, "C:\anjian\dnf\map\wenhao1.bmp", 0.7, x1, y1
    Delay 33
    FindPic 601, 73, 823, 246, "C:\anjian\dnf\map\wenhao2.bmp", 0.7, x2, y2
    total = x1 + x2 + y1 + y1
    If total > 0 Then
        房间_是否打完 = 1
    Else 
        //
        TracePrint "第一图刷怪中..."
        房间_是否打完 = 0
    End If
End Function


Function 房间_下个开了吗(下个房间坐标数组)
	// 0.23 闪烁颜色
	GetColor1 = GetPixelColor(下个房间坐标数组(0) + 2, 下个房间坐标数组(1) + 2)
	Delay 230
	GetColor2 = GetPixelColor(下个房间坐标数组(0) + 2, 下个房间坐标数组(1) + 2)
	// 颜色不偏红才行
	Call Plugin.Color.ColorToRGB(GetColor1, R1, G1, B1)   
	Call Plugin.Color.ColorToRGB(GetColor2, R2, G2, B2)  
	If GetColor1 <> GetColor2 Then 
		房间_下个开了吗 = 1
	Else 
		房间_下个开了吗 = 0
	End If
End Function