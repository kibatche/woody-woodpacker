
test:     format de fichier binary


Déassemblage de la section .data :

0000000000000000 <.data>:
       0:	7f 45                	jg     0x47
       2:	4c                   	rex.WR
       3:	46 02 01             	rex.RX add r8b,BYTE PTR [rcx]
       6:	01 00                	add    DWORD PTR [rax],eax
	...
      10:	02 00                	add    al,BYTE PTR [rax]
      12:	3e 00 01             	ds add BYTE PTR [rcx],al
      15:	00 00                	add    BYTE PTR [rax],al
      17:	00 50 10             	add    BYTE PTR [rax+0x10],dl
      1a:	40 00 00             	rex add BYTE PTR [rax],al
      1d:	00 00                	add    BYTE PTR [rax],al
      1f:	00 40 00             	add    BYTE PTR [rax+0x0],al
      22:	00 00                	add    BYTE PTR [rax],al
      24:	00 00                	add    BYTE PTR [rax],al
      26:	00 00                	add    BYTE PTR [rax],al
      28:	58                   	pop    rax
      29:	36 00 00             	ss add BYTE PTR [rax],al
	...
      34:	40 00 38             	add    BYTE PTR [rax],dil
      37:	00 0d 00 40 00 1f    	add    BYTE PTR [rip+0x1f004000],cl        # 0x1f00403d
      3d:	00 1e                	add    BYTE PTR [rsi],bl
      3f:	00 06                	add    BYTE PTR [rsi],al
      41:	00 00                	add    BYTE PTR [rax],al
      43:	00 04 00             	add    BYTE PTR [rax+rax*1],al
      46:	00 00                	add    BYTE PTR [rax],al
      48:	40 00 00             	rex add BYTE PTR [rax],al
      4b:	00 00                	add    BYTE PTR [rax],al
      4d:	00 00                	add    BYTE PTR [rax],al
      4f:	00 40 00             	add    BYTE PTR [rax+0x0],al
      52:	40 00 00             	rex add BYTE PTR [rax],al
      55:	00 00                	add    BYTE PTR [rax],al
      57:	00 40 00             	add    BYTE PTR [rax+0x0],al
      5a:	40 00 00             	rex add BYTE PTR [rax],al
      5d:	00 00                	add    BYTE PTR [rax],al
      5f:	00 d8                	add    al,bl
      61:	02 00                	add    al,BYTE PTR [rax]
      63:	00 00                	add    BYTE PTR [rax],al
      65:	00 00                	add    BYTE PTR [rax],al
      67:	00 d8                	add    al,bl
      69:	02 00                	add    al,BYTE PTR [rax]
      6b:	00 00                	add    BYTE PTR [rax],al
      6d:	00 00                	add    BYTE PTR [rax],al
      6f:	00 08                	add    BYTE PTR [rax],cl
      71:	00 00                	add    BYTE PTR [rax],al
      73:	00 00                	add    BYTE PTR [rax],al
      75:	00 00                	add    BYTE PTR [rax],al
      77:	00 03                	add    BYTE PTR [rbx],al
      79:	00 00                	add    BYTE PTR [rax],al
      7b:	00 04 00             	add    BYTE PTR [rax+rax*1],al
      7e:	00 00                	add    BYTE PTR [rax],al
      80:	18 03                	sbb    BYTE PTR [rbx],al
      82:	00 00                	add    BYTE PTR [rax],al
      84:	00 00                	add    BYTE PTR [rax],al
      86:	00 00                	add    BYTE PTR [rax],al
      88:	18 03                	sbb    BYTE PTR [rbx],al
      8a:	40 00 00             	rex add BYTE PTR [rax],al
      8d:	00 00                	add    BYTE PTR [rax],al
      8f:	00 18                	add    BYTE PTR [rax],bl
      91:	03 40 00             	add    eax,DWORD PTR [rax+0x0]
      94:	00 00                	add    BYTE PTR [rax],al
      96:	00 00                	add    BYTE PTR [rax],al
      98:	1c 00                	sbb    al,0x0
      9a:	00 00                	add    BYTE PTR [rax],al
      9c:	00 00                	add    BYTE PTR [rax],al
      9e:	00 00                	add    BYTE PTR [rax],al
      a0:	1c 00                	sbb    al,0x0
      a2:	00 00                	add    BYTE PTR [rax],al
      a4:	00 00                	add    BYTE PTR [rax],al
      a6:	00 00                	add    BYTE PTR [rax],al
      a8:	01 00                	add    DWORD PTR [rax],eax
      aa:	00 00                	add    BYTE PTR [rax],al
      ac:	00 00                	add    BYTE PTR [rax],al
      ae:	00 00                	add    BYTE PTR [rax],al
      b0:	01 00                	add    DWORD PTR [rax],eax
      b2:	00 00                	add    BYTE PTR [rax],al
      b4:	04 00                	add    al,0x0
	...
      c2:	40 00 00             	rex add BYTE PTR [rax],al
      c5:	00 00                	add    BYTE PTR [rax],al
      c7:	00 00                	add    BYTE PTR [rax],al
      c9:	00 40 00             	add    BYTE PTR [rax+0x0],al
      cc:	00 00                	add    BYTE PTR [rax],al
      ce:	00 00                	add    BYTE PTR [rax],al
      d0:	f8                   	clc    
      d1:	04 00                	add    al,0x0
      d3:	00 00                	add    BYTE PTR [rax],al
      d5:	00 00                	add    BYTE PTR [rax],al
      d7:	00 f8                	add    al,bh
      d9:	04 00                	add    al,0x0
      db:	00 00                	add    BYTE PTR [rax],al
      dd:	00 00                	add    BYTE PTR [rax],al
      df:	00 00                	add    BYTE PTR [rax],al
      e1:	10 00                	adc    BYTE PTR [rax],al
      e3:	00 00                	add    BYTE PTR [rax],al
      e5:	00 00                	add    BYTE PTR [rax],al
      e7:	00 01                	add    BYTE PTR [rcx],al
      e9:	00 00                	add    BYTE PTR [rax],al
      eb:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 0xf1
      f1:	10 00                	adc    BYTE PTR [rax],al
      f3:	00 00                	add    BYTE PTR [rax],al
      f5:	00 00                	add    BYTE PTR [rax],al
      f7:	00 00                	add    BYTE PTR [rax],al
      f9:	10 40 00             	adc    BYTE PTR [rax+0x0],al
      fc:	00 00                	add    BYTE PTR [rax],al
      fe:	00 00                	add    BYTE PTR [rax],al
     100:	00 10                	add    BYTE PTR [rax],dl
     102:	40 00 00             	rex add BYTE PTR [rax],al
     105:	00 00                	add    BYTE PTR [rax],al
     107:	00 61 01             	add    BYTE PTR [rcx+0x1],ah
     10a:	00 00                	add    BYTE PTR [rax],al
     10c:	00 00                	add    BYTE PTR [rax],al
     10e:	00 00                	add    BYTE PTR [rax],al
     110:	61                   	(bad)  
     111:	01 00                	add    DWORD PTR [rax],eax
     113:	00 00                	add    BYTE PTR [rax],al
     115:	00 00                	add    BYTE PTR [rax],al
     117:	00 00                	add    BYTE PTR [rax],al
     119:	10 00                	adc    BYTE PTR [rax],al
     11b:	00 00                	add    BYTE PTR [rax],al
     11d:	00 00                	add    BYTE PTR [rax],al
     11f:	00 01                	add    BYTE PTR [rcx],al
     121:	00 00                	add    BYTE PTR [rax],al
     123:	00 04 00             	add    BYTE PTR [rax+rax*1],al
     126:	00 00                	add    BYTE PTR [rax],al
     128:	00 20                	add    BYTE PTR [rax],ah
     12a:	00 00                	add    BYTE PTR [rax],al
     12c:	00 00                	add    BYTE PTR [rax],al
     12e:	00 00                	add    BYTE PTR [rax],al
     130:	00 20                	add    BYTE PTR [rax],ah
     132:	40 00 00             	rex add BYTE PTR [rax],al
     135:	00 00                	add    BYTE PTR [rax],al
     137:	00 00                	add    BYTE PTR [rax],al
     139:	20 40 00             	and    BYTE PTR [rax+0x0],al
     13c:	00 00                	add    BYTE PTR [rax],al
     13e:	00 00                	add    BYTE PTR [rax],al
     140:	ec                   	in     al,dx
     141:	00 00                	add    BYTE PTR [rax],al
     143:	00 00                	add    BYTE PTR [rax],al
     145:	00 00                	add    BYTE PTR [rax],al
     147:	00 ec                	add    ah,ch
	...
     151:	10 00                	adc    BYTE PTR [rax],al
     153:	00 00                	add    BYTE PTR [rax],al
     155:	00 00                	add    BYTE PTR [rax],al
     157:	00 01                	add    BYTE PTR [rcx],al
     159:	00 00                	add    BYTE PTR [rax],al
     15b:	00 06                	add    BYTE PTR [rsi],al
     15d:	00 00                	add    BYTE PTR [rax],al
     15f:	00 10                	add    BYTE PTR [rax],dl
     161:	2e 00 00             	cs add BYTE PTR [rax],al
     164:	00 00                	add    BYTE PTR [rax],al
     166:	00 00                	add    BYTE PTR [rax],al
     168:	10 3e                	adc    BYTE PTR [rsi],bh
     16a:	40 00 00             	rex add BYTE PTR [rax],al
     16d:	00 00                	add    BYTE PTR [rax],al
     16f:	00 10                	add    BYTE PTR [rax],dl
     171:	3e 40 00 00          	ds rex add BYTE PTR [rax],al
     175:	00 00                	add    BYTE PTR [rax],al
     177:	00 20                	add    BYTE PTR [rax],ah
     179:	02 00                	add    al,BYTE PTR [rax]
     17b:	00 00                	add    BYTE PTR [rax],al
     17d:	00 00                	add    BYTE PTR [rax],al
     17f:	00 28                	add    BYTE PTR [rax],ch
     181:	02 00                	add    al,BYTE PTR [rax]
     183:	00 00                	add    BYTE PTR [rax],al
     185:	00 00                	add    BYTE PTR [rax],al
     187:	00 00                	add    BYTE PTR [rax],al
     189:	10 00                	adc    BYTE PTR [rax],al
     18b:	00 00                	add    BYTE PTR [rax],al
     18d:	00 00                	add    BYTE PTR [rax],al
     18f:	00 02                	add    BYTE PTR [rdx],al
     191:	00 00                	add    BYTE PTR [rax],al
     193:	00 06                	add    BYTE PTR [rsi],al
     195:	00 00                	add    BYTE PTR [rax],al
     197:	00 20                	add    BYTE PTR [rax],ah
     199:	2e 00 00             	cs add BYTE PTR [rax],al
     19c:	00 00                	add    BYTE PTR [rax],al
     19e:	00 00                	add    BYTE PTR [rax],al
     1a0:	20 3e                	and    BYTE PTR [rsi],bh
     1a2:	40 00 00             	rex add BYTE PTR [rax],al
     1a5:	00 00                	add    BYTE PTR [rax],al
     1a7:	00 20                	add    BYTE PTR [rax],ah
     1a9:	3e 40 00 00          	ds rex add BYTE PTR [rax],al
     1ad:	00 00                	add    BYTE PTR [rax],al
     1af:	00 d0                	add    al,dl
     1b1:	01 00                	add    DWORD PTR [rax],eax
     1b3:	00 00                	add    BYTE PTR [rax],al
     1b5:	00 00                	add    BYTE PTR [rax],al
     1b7:	00 d0                	add    al,dl
     1b9:	01 00                	add    DWORD PTR [rax],eax
     1bb:	00 00                	add    BYTE PTR [rax],al
     1bd:	00 00                	add    BYTE PTR [rax],al
     1bf:	00 08                	add    BYTE PTR [rax],cl
     1c1:	00 00                	add    BYTE PTR [rax],al
     1c3:	00 00                	add    BYTE PTR [rax],al
     1c5:	00 00                	add    BYTE PTR [rax],al
     1c7:	00 04 00             	add    BYTE PTR [rax+rax*1],al
     1ca:	00 00                	add    BYTE PTR [rax],al
     1cc:	04 00                	add    al,0x0
     1ce:	00 00                	add    BYTE PTR [rax],al
     1d0:	38 03                	cmp    BYTE PTR [rbx],al
     1d2:	00 00                	add    BYTE PTR [rax],al
     1d4:	00 00                	add    BYTE PTR [rax],al
     1d6:	00 00                	add    BYTE PTR [rax],al
     1d8:	38 03                	cmp    BYTE PTR [rbx],al
     1da:	40 00 00             	rex add BYTE PTR [rax],al
     1dd:	00 00                	add    BYTE PTR [rax],al
     1df:	00 38                	add    BYTE PTR [rax],bh
     1e1:	03 40 00             	add    eax,DWORD PTR [rax+0x0]
     1e4:	00 00                	add    BYTE PTR [rax],al
     1e6:	00 00                	add    BYTE PTR [rax],al
     1e8:	30 00                	xor    BYTE PTR [rax],al
     1ea:	00 00                	add    BYTE PTR [rax],al
     1ec:	00 00                	add    BYTE PTR [rax],al
     1ee:	00 00                	add    BYTE PTR [rax],al
     1f0:	30 00                	xor    BYTE PTR [rax],al
     1f2:	00 00                	add    BYTE PTR [rax],al
     1f4:	00 00                	add    BYTE PTR [rax],al
     1f6:	00 00                	add    BYTE PTR [rax],al
     1f8:	08 00                	or     BYTE PTR [rax],al
     1fa:	00 00                	add    BYTE PTR [rax],al
     1fc:	00 00                	add    BYTE PTR [rax],al
     1fe:	00 00                	add    BYTE PTR [rax],al
     200:	04 00                	add    al,0x0
     202:	00 00                	add    BYTE PTR [rax],al
     204:	04 00                	add    al,0x0
     206:	00 00                	add    BYTE PTR [rax],al
     208:	68 03 00 00 00       	push   0x3
     20d:	00 00                	add    BYTE PTR [rax],al
     20f:	00 68 03             	add    BYTE PTR [rax+0x3],ch
     212:	40 00 00             	rex add BYTE PTR [rax],al
     215:	00 00                	add    BYTE PTR [rax],al
     217:	00 68 03             	add    BYTE PTR [rax+0x3],ch
     21a:	40 00 00             	rex add BYTE PTR [rax],al
     21d:	00 00                	add    BYTE PTR [rax],al
     21f:	00 44 00 00          	add    BYTE PTR [rax+rax*1+0x0],al
     223:	00 00                	add    BYTE PTR [rax],al
     225:	00 00                	add    BYTE PTR [rax],al
     227:	00 44 00 00          	add    BYTE PTR [rax+rax*1+0x0],al
     22b:	00 00                	add    BYTE PTR [rax],al
     22d:	00 00                	add    BYTE PTR [rax],al
     22f:	00 04 00             	add    BYTE PTR [rax+rax*1],al
     232:	00 00                	add    BYTE PTR [rax],al
     234:	00 00                	add    BYTE PTR [rax],al
     236:	00 00                	add    BYTE PTR [rax],al
     238:	53                   	push   rbx
     239:	e5 74                	in     eax,0x74
     23b:	64 04 00             	fs add al,0x0
     23e:	00 00                	add    BYTE PTR [rax],al
     240:	38 03                	cmp    BYTE PTR [rbx],al
     242:	00 00                	add    BYTE PTR [rax],al
     244:	00 00                	add    BYTE PTR [rax],al
     246:	00 00                	add    BYTE PTR [rax],al
     248:	38 03                	cmp    BYTE PTR [rbx],al
     24a:	40 00 00             	rex add BYTE PTR [rax],al
     24d:	00 00                	add    BYTE PTR [rax],al
     24f:	00 38                	add    BYTE PTR [rax],bh
     251:	03 40 00             	add    eax,DWORD PTR [rax+0x0]
     254:	00 00                	add    BYTE PTR [rax],al
     256:	00 00                	add    BYTE PTR [rax],al
     258:	30 00                	xor    BYTE PTR [rax],al
     25a:	00 00                	add    BYTE PTR [rax],al
     25c:	00 00                	add    BYTE PTR [rax],al
     25e:	00 00                	add    BYTE PTR [rax],al
     260:	30 00                	xor    BYTE PTR [rax],al
     262:	00 00                	add    BYTE PTR [rax],al
     264:	00 00                	add    BYTE PTR [rax],al
     266:	00 00                	add    BYTE PTR [rax],al
     268:	08 00                	or     BYTE PTR [rax],al
     26a:	00 00                	add    BYTE PTR [rax],al
     26c:	00 00                	add    BYTE PTR [rax],al
     26e:	00 00                	add    BYTE PTR [rax],al
     270:	50                   	push   rax
     271:	e5 74                	in     eax,0x74
     273:	64 04 00             	fs add al,0x0
     276:	00 00                	add    BYTE PTR [rax],al
     278:	14 20                	adc    al,0x20
     27a:	00 00                	add    BYTE PTR [rax],al
     27c:	00 00                	add    BYTE PTR [rax],al
     27e:	00 00                	add    BYTE PTR [rax],al
     280:	14 20                	adc    al,0x20
     282:	40 00 00             	rex add BYTE PTR [rax],al
     285:	00 00                	add    BYTE PTR [rax],al
     287:	00 14 20             	add    BYTE PTR [rax+riz*1],dl
     28a:	40 00 00             	rex add BYTE PTR [rax],al
     28d:	00 00                	add    BYTE PTR [rax],al
     28f:	00 34 00             	add    BYTE PTR [rax+rax*1],dh
     292:	00 00                	add    BYTE PTR [rax],al
     294:	00 00                	add    BYTE PTR [rax],al
     296:	00 00                	add    BYTE PTR [rax],al
     298:	34 00                	xor    al,0x0
     29a:	00 00                	add    BYTE PTR [rax],al
     29c:	00 00                	add    BYTE PTR [rax],al
     29e:	00 00                	add    BYTE PTR [rax],al
     2a0:	04 00                	add    al,0x0
     2a2:	00 00                	add    BYTE PTR [rax],al
     2a4:	00 00                	add    BYTE PTR [rax],al
     2a6:	00 00                	add    BYTE PTR [rax],al
     2a8:	51                   	push   rcx
     2a9:	e5 74                	in     eax,0x74
     2ab:	64 06                	fs (bad) 
	...
     2d5:	00 00                	add    BYTE PTR [rax],al
     2d7:	00 10                	add    BYTE PTR [rax],dl
     2d9:	00 00                	add    BYTE PTR [rax],al
     2db:	00 00                	add    BYTE PTR [rax],al
     2dd:	00 00                	add    BYTE PTR [rax],al
     2df:	00 52 e5             	add    BYTE PTR [rdx-0x1b],dl
     2e2:	74 64                	je     0x348
     2e4:	04 00                	add    al,0x0
     2e6:	00 00                	add    BYTE PTR [rax],al
     2e8:	10 2e                	adc    BYTE PTR [rsi],ch
     2ea:	00 00                	add    BYTE PTR [rax],al
     2ec:	00 00                	add    BYTE PTR [rax],al
     2ee:	00 00                	add    BYTE PTR [rax],al
     2f0:	10 3e                	adc    BYTE PTR [rsi],bh
     2f2:	40 00 00             	rex add BYTE PTR [rax],al
     2f5:	00 00                	add    BYTE PTR [rax],al
     2f7:	00 10                	add    BYTE PTR [rax],dl
     2f9:	3e 40 00 00          	ds rex add BYTE PTR [rax],al
     2fd:	00 00                	add    BYTE PTR [rax],al
     2ff:	00 f0                	add    al,dh
     301:	01 00                	add    DWORD PTR [rax],eax
     303:	00 00                	add    BYTE PTR [rax],al
     305:	00 00                	add    BYTE PTR [rax],al
     307:	00 f0                	add    al,dh
     309:	01 00                	add    DWORD PTR [rax],eax
     30b:	00 00                	add    BYTE PTR [rax],al
     30d:	00 00                	add    BYTE PTR [rax],al
     30f:	00 01                	add    BYTE PTR [rcx],al
     311:	00 00                	add    BYTE PTR [rax],al
     313:	00 00                	add    BYTE PTR [rax],al
     315:	00 00                	add    BYTE PTR [rax],al
     317:	00 2f                	add    BYTE PTR [rdi],ch
     319:	6c                   	ins    BYTE PTR es:[rdi],dx
     31a:	69 62 36 34 2f 6c 64 	imul   esp,DWORD PTR [rdx+0x36],0x646c2f34
     321:	2d 6c 69 6e 75       	sub    eax,0x756e696c
     326:	78 2d                	js     0x355
     328:	78 38                	js     0x362
     32a:	36 2d 36 34 2e 73    	ss sub eax,0x732e3436
     330:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     331:	2e 32 00             	cs xor al,BYTE PTR [rax]
     334:	00 00                	add    BYTE PTR [rax],al
     336:	00 00                	add    BYTE PTR [rax],al
     338:	04 00                	add    al,0x0
     33a:	00 00                	add    BYTE PTR [rax],al
     33c:	20 00                	and    BYTE PTR [rax],al
     33e:	00 00                	add    BYTE PTR [rax],al
     340:	05 00 00 00 47       	add    eax,0x47000000
     345:	4e 55                	rex.WRX push rbp
     347:	00 02                	add    BYTE PTR [rdx],al
     349:	00 00                	add    BYTE PTR [rax],al
     34b:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
     34f:	00 03                	add    BYTE PTR [rbx],al
     351:	00 00                	add    BYTE PTR [rax],al
     353:	00 00                	add    BYTE PTR [rax],al
     355:	00 00                	add    BYTE PTR [rax],al
     357:	00 02                	add    BYTE PTR [rdx],al
     359:	80 00 c0             	add    BYTE PTR [rax],0xc0
     35c:	04 00                	add    al,0x0
     35e:	00 00                	add    BYTE PTR [rax],al
     360:	01 00                	add    DWORD PTR [rax],eax
     362:	00 00                	add    BYTE PTR [rax],al
     364:	00 00                	add    BYTE PTR [rax],al
     366:	00 00                	add    BYTE PTR [rax],al
     368:	04 00                	add    al,0x0
     36a:	00 00                	add    BYTE PTR [rax],al
     36c:	14 00                	adc    al,0x0
     36e:	00 00                	add    BYTE PTR [rax],al
     370:	03 00                	add    eax,DWORD PTR [rax]
     372:	00 00                	add    BYTE PTR [rax],al
     374:	47                   	rex.RXB
     375:	4e 55                	rex.WRX push rbp
     377:	00 39                	add    BYTE PTR [rcx],bh
     379:	50                   	push   rax
     37a:	f1                   	int1   
     37b:	c7                   	(bad)  
     37c:	17                   	(bad)  
     37d:	9e                   	sahf   
     37e:	80 f9 f1             	cmp    cl,0xf1
     381:	6a 29                	push   0x29
     383:	e9 9a 10 2f 25       	jmp    0x252f1422
     388:	49 2b f8             	sub    rdi,r8
     38b:	56                   	push   rsi
     38c:	04 00                	add    al,0x0
     38e:	00 00                	add    BYTE PTR [rax],al
     390:	10 00                	adc    BYTE PTR [rax],al
     392:	00 00                	add    BYTE PTR [rax],al
     394:	01 00                	add    DWORD PTR [rax],eax
     396:	00 00                	add    BYTE PTR [rax],al
     398:	47                   	rex.RXB
     399:	4e 55                	rex.WRX push rbp
     39b:	00 00                	add    BYTE PTR [rax],al
     39d:	00 00                	add    BYTE PTR [rax],al
     39f:	00 03                	add    BYTE PTR [rbx],al
     3a1:	00 00                	add    BYTE PTR [rax],al
     3a3:	00 02                	add    BYTE PTR [rdx],al
	...
     3ad:	00 00                	add    BYTE PTR [rax],al
     3af:	00 01                	add    BYTE PTR [rcx],al
     3b1:	00 00                	add    BYTE PTR [rax],al
     3b3:	00 01                	add    BYTE PTR [rcx],al
     3b5:	00 00                	add    BYTE PTR [rax],al
     3b7:	00 01                	add    BYTE PTR [rcx],al
	...
     3e5:	00 00                	add    BYTE PTR [rax],al
     3e7:	00 01                	add    BYTE PTR [rcx],al
     3e9:	00 00                	add    BYTE PTR [rax],al
     3eb:	00 12                	add    BYTE PTR [rdx],dl
	...
     3fd:	00 00                	add    BYTE PTR [rax],al
     3ff:	00 13                	add    BYTE PTR [rbx],dl
     401:	00 00                	add    BYTE PTR [rax],al
     403:	00 12                	add    BYTE PTR [rdx],dl
	...
     415:	00 00                	add    BYTE PTR [rax],al
     417:	00 39                	add    BYTE PTR [rcx],bh
     419:	00 00                	add    BYTE PTR [rax],al
     41b:	00 20                	add    BYTE PTR [rax],ah
	...
     431:	5f                   	pop    rdi
     432:	5f                   	pop    rdi
     433:	6c                   	ins    BYTE PTR es:[rdi],dx
     434:	69 62 63 5f 73 74 61 	imul   esp,DWORD PTR [rdx+0x63],0x6174735f
     43b:	72 74                	jb     0x4b1
     43d:	5f                   	pop    rdi
     43e:	6d                   	ins    DWORD PTR es:[rdi],dx
     43f:	61                   	(bad)  
     440:	69 6e 00 70 75 74 73 	imul   ebp,DWORD PTR [rsi+0x0],0x73747570
     447:	00 6c 69 62          	add    BYTE PTR [rcx+rbp*2+0x62],ch
     44b:	63 2e                	movsxd ebp,DWORD PTR [rsi]
     44d:	73 6f                	jae    0x4be
     44f:	2e 36 00 47 4c       	cs ss add BYTE PTR [rdi+0x4c],al
     454:	49                   	rex.WB
     455:	42                   	rex.X
     456:	43 5f                	rex.XB pop r15
     458:	32 2e                	xor    ch,BYTE PTR [rsi]
     45a:	32 2e                	xor    ch,BYTE PTR [rsi]
     45c:	35 00 47 4c 49       	xor    eax,0x494c4700
     461:	42                   	rex.X
     462:	43 5f                	rex.XB pop r15
     464:	32 2e                	xor    ch,BYTE PTR [rsi]
     466:	33 34 00             	xor    esi,DWORD PTR [rax+rax*1]
     469:	5f                   	pop    rdi
     46a:	5f                   	pop    rdi
     46b:	67 6d                	ins    DWORD PTR es:[edi],dx
     46d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     46e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     46f:	5f                   	pop    rdi
     470:	73 74                	jae    0x4e6
     472:	61                   	(bad)  
     473:	72 74                	jb     0x4e9
     475:	5f                   	pop    rdi
     476:	5f                   	pop    rdi
     477:	00 00                	add    BYTE PTR [rax],al
     479:	00 02                	add    BYTE PTR [rdx],al
     47b:	00 03                	add    BYTE PTR [rbx],al
     47d:	00 01                	add    BYTE PTR [rcx],al
     47f:	00 01                	add    BYTE PTR [rcx],al
     481:	00 02                	add    BYTE PTR [rdx],al
     483:	00 18                	add    BYTE PTR [rax],bl
     485:	00 00                	add    BYTE PTR [rax],al
     487:	00 10                	add    BYTE PTR [rax],dl
     489:	00 00                	add    BYTE PTR [rax],al
     48b:	00 00                	add    BYTE PTR [rax],al
     48d:	00 00                	add    BYTE PTR [rax],al
     48f:	00 75 1a             	add    BYTE PTR [rbp+0x1a],dh
     492:	69 09 00 00 03 00    	imul   ecx,DWORD PTR [rcx],0x30000
     498:	22 00                	and    al,BYTE PTR [rax]
     49a:	00 00                	add    BYTE PTR [rax],al
     49c:	10 00                	adc    BYTE PTR [rax],al
     49e:	00 00                	add    BYTE PTR [rax],al
     4a0:	b4 91                	mov    ah,0x91
     4a2:	96                   	xchg   esi,eax
     4a3:	06                   	(bad)  
     4a4:	00 00                	add    BYTE PTR [rax],al
     4a6:	02 00                	add    al,BYTE PTR [rax]
     4a8:	2e 00 00             	cs add BYTE PTR [rax],al
     4ab:	00 00                	add    BYTE PTR [rax],al
     4ad:	00 00                	add    BYTE PTR [rax],al
     4af:	00 f0                	add    al,dh
     4b1:	3f                   	(bad)  
     4b2:	40 00 00             	rex add BYTE PTR [rax],al
     4b5:	00 00                	add    BYTE PTR [rax],al
     4b7:	00 06                	add    BYTE PTR [rsi],al
     4b9:	00 00                	add    BYTE PTR [rax],al
     4bb:	00 01                	add    BYTE PTR [rcx],al
	...
     4c5:	00 00                	add    BYTE PTR [rax],al
     4c7:	00 f8                	add    al,bh
     4c9:	3f                   	(bad)  
     4ca:	40 00 00             	rex add BYTE PTR [rax],al
     4cd:	00 00                	add    BYTE PTR [rax],al
     4cf:	00 06                	add    BYTE PTR [rsi],al
     4d1:	00 00                	add    BYTE PTR [rax],al
     4d3:	00 03                	add    BYTE PTR [rbx],al
	...
     4dd:	00 00                	add    BYTE PTR [rax],al
     4df:	00 18                	add    BYTE PTR [rax],bl
     4e1:	40                   	rex
     4e2:	40 00 00             	rex add BYTE PTR [rax],al
     4e5:	00 00                	add    BYTE PTR [rax],al
     4e7:	00 07                	add    BYTE PTR [rdi],al
     4e9:	00 00                	add    BYTE PTR [rax],al
     4eb:	00 02                	add    BYTE PTR [rdx],al
	...
     ffd:	00 00                	add    BYTE PTR [rax],al
     fff:	00 f3                	add    bl,dh
    1001:	0f 1e fa             	nop    edx
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 e9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fe9]        # 0x3ff8
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     0x1016
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret    
    101b:	00 00                	add    BYTE PTR [rax],al
    101d:	00 00                	add    BYTE PTR [rax],al
    101f:	00 ff                	add    bh,bh
    1021:	35 e2 2f 00 00       	xor    eax,0x2fe2
    1026:	f2 ff 25 e3 2f 00 00 	bnd jmp QWORD PTR [rip+0x2fe3]        # 0x4010
    102d:	0f 1f 00             	nop    DWORD PTR [rax]
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 0x1020
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	f2 ff 25 cd 2f 00 00 	bnd jmp QWORD PTR [rip+0x2fcd]        # 0x4018
    104b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    1050:	f3 0f 1e fa          	endbr64 
    1054:	31 ed                	xor    ebp,ebp
    1056:	49 89 d1             	mov    r9,rdx
    1059:	5e                   	pop    rsi
    105a:	48 89 e2             	mov    rdx,rsp
    105d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1061:	50                   	push   rax
    1062:	54                   	push   rsp
    1063:	45 31 c0             	xor    r8d,r8d
    1066:	31 c9                	xor    ecx,ecx
    1068:	48 c7 c7 36 11 40 00 	mov    rdi,0x401136
    106f:	ff 15 7b 2f 00 00    	call   QWORD PTR [rip+0x2f7b]        # 0x3ff0
    1075:	f4                   	hlt    
    1076:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    107d:	00 00 00 
    1080:	f3 0f 1e fa          	endbr64 
    1084:	c3                   	ret    
    1085:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    108c:	00 00 00 
    108f:	90                   	nop
    1090:	b8 30 40 40 00       	mov    eax,0x404030
    1095:	48 3d 30 40 40 00    	cmp    rax,0x404030
    109b:	74 13                	je     0x10b0
    109d:	b8 00 00 00 00       	mov    eax,0x0
    10a2:	48 85 c0             	test   rax,rax
    10a5:	74 09                	je     0x10b0
    10a7:	bf 30 40 40 00       	mov    edi,0x404030
    10ac:	ff e0                	jmp    rax
    10ae:	66 90                	xchg   ax,ax
    10b0:	c3                   	ret    
    10b1:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    10b8:	00 00 00 00 
    10bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    10c0:	be 30 40 40 00       	mov    esi,0x404030
    10c5:	48 81 ee 30 40 40 00 	sub    rsi,0x404030
    10cc:	48 89 f0             	mov    rax,rsi
    10cf:	48 c1 ee 3f          	shr    rsi,0x3f
    10d3:	48 c1 f8 03          	sar    rax,0x3
    10d7:	48 01 c6             	add    rsi,rax
    10da:	48 d1 fe             	sar    rsi,1
    10dd:	74 11                	je     0x10f0
    10df:	b8 00 00 00 00       	mov    eax,0x0
    10e4:	48 85 c0             	test   rax,rax
    10e7:	74 07                	je     0x10f0
    10e9:	bf 30 40 40 00       	mov    edi,0x404030
    10ee:	ff e0                	jmp    rax
    10f0:	c3                   	ret    
    10f1:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    10f8:	00 00 00 00 
    10fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1100:	f3 0f 1e fa          	endbr64 
    1104:	80 3d 25 2f 00 00 00 	cmp    BYTE PTR [rip+0x2f25],0x0        # 0x4030
    110b:	75 13                	jne    0x1120
    110d:	55                   	push   rbp
    110e:	48 89 e5             	mov    rbp,rsp
    1111:	e8 7a ff ff ff       	call   0x1090
    1116:	c6 05 13 2f 00 00 01 	mov    BYTE PTR [rip+0x2f13],0x1        # 0x4030
    111d:	5d                   	pop    rbp
    111e:	c3                   	ret    
    111f:	90                   	nop
    1120:	c3                   	ret    
    1121:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
    1128:	00 00 00 00 
    112c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1130:	f3 0f 1e fa          	endbr64 
    1134:	eb 8a                	jmp    0x10c0
    1136:	f3 0f 1e fa          	endbr64 
    113a:	55                   	push   rbp
    113b:	48 89 e5             	mov    rbp,rsp
    113e:	48 8d 3d bf 0e 00 00 	lea    rdi,[rip+0xebf]        # 0x2004
    1145:	e8 f6 fe ff ff       	call   0x1040
    114a:	b8 00 00 00 00       	mov    eax,0x0
    114f:	5d                   	pop    rbp
    1150:	c3                   	ret    
    1151:	00 00                	add    BYTE PTR [rax],al
    1153:	00 f3                	add    bl,dh
    1155:	0f 1e fa             	nop    edx
    1158:	48 83 ec 08          	sub    rsp,0x8
    115c:	48 83 c4 08          	add    rsp,0x8
    1160:	c3                   	ret    
	...
    1ffd:	00 00                	add    BYTE PTR [rax],al
    1fff:	00 01                	add    BYTE PTR [rcx],al
    2001:	00 02                	add    BYTE PTR [rdx],al
    2003:	00 48 65             	add    BYTE PTR [rax+0x65],cl
    2006:	6c                   	ins    BYTE PTR es:[rdi],dx
    2007:	6c                   	ins    BYTE PTR es:[rdi],dx
    2008:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    2009:	2c 20                	sub    al,0x20
    200b:	57                   	push   rdi
    200c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    200d:	72 6c                	jb     0x207b
    200f:	64 21 00             	and    DWORD PTR fs:[rax],eax
    2012:	00 00                	add    BYTE PTR [rax],al
    2014:	01 1b                	add    DWORD PTR [rbx],ebx
    2016:	03 3b                	add    edi,DWORD PTR [rbx]
    2018:	30 00                	xor    BYTE PTR [rax],al
    201a:	00 00                	add    BYTE PTR [rax],al
    201c:	05 00 00 00 0c       	add    eax,0xc000000
    2021:	f0 ff                	lock (bad) 
    2023:	ff 74 00 00          	push   QWORD PTR [rax+rax*1+0x0]
    2027:	00 2c f0             	add    BYTE PTR [rax+rsi*8],ch
    202a:	ff                   	(bad)  
    202b:	ff 9c 00 00 00 3c f0 	call   FWORD PTR [rax+rax*1-0xfc40000]
    2032:	ff                   	(bad)  
    2033:	ff 4c 00 00          	dec    DWORD PTR [rax+rax*1+0x0]
    2037:	00 6c f0 ff          	add    BYTE PTR [rax+rsi*8-0x1],ch
    203b:	ff 60 00             	jmp    QWORD PTR [rax+0x0]
    203e:	00 00                	add    BYTE PTR [rax],al
    2040:	22 f1                	and    dh,cl
    2042:	ff                   	(bad)  
    2043:	ff b4 00 00 00 14 00 	push   QWORD PTR [rax+rax*1+0x140000]
    204a:	00 00                	add    BYTE PTR [rax],al
    204c:	00 00                	add    BYTE PTR [rax],al
    204e:	00 00                	add    BYTE PTR [rax],al
    2050:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    2053:	00 01                	add    BYTE PTR [rcx],al
    2055:	78 10                	js     0x2067
    2057:	01 1b                	add    DWORD PTR [rbx],ebx
    2059:	0c 07                	or     al,0x7
    205b:	08 90 01 00 00 10    	or     BYTE PTR [rax+0x10000001],dl
    2061:	00 00                	add    BYTE PTR [rax],al
    2063:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    2066:	00 00                	add    BYTE PTR [rax],al
    2068:	e8 ef ff ff 26       	call   0x2700205c
    206d:	00 00                	add    BYTE PTR [rax],al
    206f:	00 00                	add    BYTE PTR [rax],al
    2071:	44 07                	rex.R (bad) 
    2073:	10 10                	adc    BYTE PTR [rax],dl
    2075:	00 00                	add    BYTE PTR [rax],al
    2077:	00 30                	add    BYTE PTR [rax],dh
    2079:	00 00                	add    BYTE PTR [rax],al
    207b:	00 04 f0             	add    BYTE PTR [rax+rsi*8],al
    207e:	ff                   	(bad)  
    207f:	ff 05 00 00 00 00    	inc    DWORD PTR [rip+0x0]        # 0x2085
    2085:	00 00                	add    BYTE PTR [rax],al
    2087:	00 24 00             	add    BYTE PTR [rax+rax*1],ah
    208a:	00 00                	add    BYTE PTR [rax],al
    208c:	44 00 00             	add    BYTE PTR [rax],r8b
    208f:	00 90 ef ff ff 20    	add    BYTE PTR [rax+0x20ffffef],dl
    2095:	00 00                	add    BYTE PTR [rax],al
    2097:	00 00                	add    BYTE PTR [rax],al
    2099:	0e                   	(bad)  
    209a:	10 46 0e             	adc    BYTE PTR [rsi+0xe],al
    209d:	18 4a 0f             	sbb    BYTE PTR [rdx+0xf],cl
    20a0:	0b 77 08             	or     esi,DWORD PTR [rdi+0x8]
    20a3:	80 00 3f             	add    BYTE PTR [rax],0x3f
    20a6:	1a 3a                	sbb    bh,BYTE PTR [rdx]
    20a8:	2a 33                	sub    dh,BYTE PTR [rbx]
    20aa:	24 22                	and    al,0x22
    20ac:	00 00                	add    BYTE PTR [rax],al
    20ae:	00 00                	add    BYTE PTR [rax],al
    20b0:	14 00                	adc    al,0x0
    20b2:	00 00                	add    BYTE PTR [rax],al
    20b4:	6c                   	ins    BYTE PTR es:[rdi],dx
    20b5:	00 00                	add    BYTE PTR [rax],al
    20b7:	00 88 ef ff ff 10    	add    BYTE PTR [rax+0x10ffffef],cl
	...
    20c5:	00 00                	add    BYTE PTR [rax],al
    20c7:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    20ca:	00 00                	add    BYTE PTR [rax],al
    20cc:	84 00                	test   BYTE PTR [rax],al
    20ce:	00 00                	add    BYTE PTR [rax],al
    20d0:	66 f0 ff             	data16 lock (bad) 
    20d3:	ff 1b                	call   FWORD PTR [rbx]
    20d5:	00 00                	add    BYTE PTR [rax],al
    20d7:	00 00                	add    BYTE PTR [rax],al
    20d9:	45 0e                	rex.RB (bad) 
    20db:	10 86 02 43 0d 06    	adc    BYTE PTR [rsi+0x60d4302],al
    20e1:	52                   	push   rdx
    20e2:	0c 07                	or     al,0x7
    20e4:	08 00                	or     BYTE PTR [rax],al
	...
    2e0e:	00 00                	add    BYTE PTR [rax],al
    2e10:	30 11                	xor    BYTE PTR [rcx],dl
    2e12:	40 00 00             	rex add BYTE PTR [rax],al
    2e15:	00 00                	add    BYTE PTR [rax],al
    2e17:	00 00                	add    BYTE PTR [rax],al
    2e19:	11 40 00             	adc    DWORD PTR [rax+0x0],eax
    2e1c:	00 00                	add    BYTE PTR [rax],al
    2e1e:	00 00                	add    BYTE PTR [rax],al
    2e20:	01 00                	add    DWORD PTR [rax],eax
    2e22:	00 00                	add    BYTE PTR [rax],al
    2e24:	00 00                	add    BYTE PTR [rax],al
    2e26:	00 00                	add    BYTE PTR [rax],al
    2e28:	18 00                	sbb    BYTE PTR [rax],al
    2e2a:	00 00                	add    BYTE PTR [rax],al
    2e2c:	00 00                	add    BYTE PTR [rax],al
    2e2e:	00 00                	add    BYTE PTR [rax],al
    2e30:	0c 00                	or     al,0x0
    2e32:	00 00                	add    BYTE PTR [rax],al
    2e34:	00 00                	add    BYTE PTR [rax],al
    2e36:	00 00                	add    BYTE PTR [rax],al
    2e38:	00 10                	add    BYTE PTR [rax],dl
    2e3a:	40 00 00             	rex add BYTE PTR [rax],al
    2e3d:	00 00                	add    BYTE PTR [rax],al
    2e3f:	00 0d 00 00 00 00    	add    BYTE PTR [rip+0x0],cl        # 0x2e45
    2e45:	00 00                	add    BYTE PTR [rax],al
    2e47:	00 54 11 40          	add    BYTE PTR [rcx+rdx*1+0x40],dl
    2e4b:	00 00                	add    BYTE PTR [rax],al
    2e4d:	00 00                	add    BYTE PTR [rax],al
    2e4f:	00 19                	add    BYTE PTR [rcx],bl
    2e51:	00 00                	add    BYTE PTR [rax],al
    2e53:	00 00                	add    BYTE PTR [rax],al
    2e55:	00 00                	add    BYTE PTR [rax],al
    2e57:	00 10                	add    BYTE PTR [rax],dl
    2e59:	3e 40 00 00          	ds rex add BYTE PTR [rax],al
    2e5d:	00 00                	add    BYTE PTR [rax],al
    2e5f:	00 1b                	add    BYTE PTR [rbx],bl
    2e61:	00 00                	add    BYTE PTR [rax],al
    2e63:	00 00                	add    BYTE PTR [rax],al
    2e65:	00 00                	add    BYTE PTR [rax],al
    2e67:	00 08                	add    BYTE PTR [rax],cl
    2e69:	00 00                	add    BYTE PTR [rax],al
    2e6b:	00 00                	add    BYTE PTR [rax],al
    2e6d:	00 00                	add    BYTE PTR [rax],al
    2e6f:	00 1a                	add    BYTE PTR [rdx],bl
    2e71:	00 00                	add    BYTE PTR [rax],al
    2e73:	00 00                	add    BYTE PTR [rax],al
    2e75:	00 00                	add    BYTE PTR [rax],al
    2e77:	00 18                	add    BYTE PTR [rax],bl
    2e79:	3e 40 00 00          	ds rex add BYTE PTR [rax],al
    2e7d:	00 00                	add    BYTE PTR [rax],al
    2e7f:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    2e82:	00 00                	add    BYTE PTR [rax],al
    2e84:	00 00                	add    BYTE PTR [rax],al
    2e86:	00 00                	add    BYTE PTR [rax],al
    2e88:	08 00                	or     BYTE PTR [rax],al
    2e8a:	00 00                	add    BYTE PTR [rax],al
    2e8c:	00 00                	add    BYTE PTR [rax],al
    2e8e:	00 00                	add    BYTE PTR [rax],al
    2e90:	f5                   	cmc    
    2e91:	fe                   	(bad)  
    2e92:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    2e95:	00 00                	add    BYTE PTR [rax],al
    2e97:	00 b0 03 40 00 00    	add    BYTE PTR [rax+0x4003],dh
    2e9d:	00 00                	add    BYTE PTR [rax],al
    2e9f:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 0x2ea5
    2ea5:	00 00                	add    BYTE PTR [rax],al
    2ea7:	00 30                	add    BYTE PTR [rax],dh
    2ea9:	04 40                	add    al,0x40
    2eab:	00 00                	add    BYTE PTR [rax],al
    2ead:	00 00                	add    BYTE PTR [rax],al
    2eaf:	00 06                	add    BYTE PTR [rsi],al
    2eb1:	00 00                	add    BYTE PTR [rax],al
    2eb3:	00 00                	add    BYTE PTR [rax],al
    2eb5:	00 00                	add    BYTE PTR [rax],al
    2eb7:	00 d0                	add    al,dl
    2eb9:	03 40 00             	add    eax,DWORD PTR [rax+0x0]
    2ebc:	00 00                	add    BYTE PTR [rax],al
    2ebe:	00 00                	add    BYTE PTR [rax],al
    2ec0:	0a 00                	or     al,BYTE PTR [rax]
    2ec2:	00 00                	add    BYTE PTR [rax],al
    2ec4:	00 00                	add    BYTE PTR [rax],al
    2ec6:	00 00                	add    BYTE PTR [rax],al
    2ec8:	48 00 00             	rex.W add BYTE PTR [rax],al
    2ecb:	00 00                	add    BYTE PTR [rax],al
    2ecd:	00 00                	add    BYTE PTR [rax],al
    2ecf:	00 0b                	add    BYTE PTR [rbx],cl
    2ed1:	00 00                	add    BYTE PTR [rax],al
    2ed3:	00 00                	add    BYTE PTR [rax],al
    2ed5:	00 00                	add    BYTE PTR [rax],al
    2ed7:	00 18                	add    BYTE PTR [rax],bl
    2ed9:	00 00                	add    BYTE PTR [rax],al
    2edb:	00 00                	add    BYTE PTR [rax],al
    2edd:	00 00                	add    BYTE PTR [rax],al
    2edf:	00 15 00 00 00 00    	add    BYTE PTR [rip+0x0],dl        # 0x2ee5
	...
    2eed:	00 00                	add    BYTE PTR [rax],al
    2eef:	00 03                	add    BYTE PTR [rbx],al
	...
    2ef9:	40                   	rex
    2efa:	40 00 00             	rex add BYTE PTR [rax],al
    2efd:	00 00                	add    BYTE PTR [rax],al
    2eff:	00 02                	add    BYTE PTR [rdx],al
    2f01:	00 00                	add    BYTE PTR [rax],al
    2f03:	00 00                	add    BYTE PTR [rax],al
    2f05:	00 00                	add    BYTE PTR [rax],al
    2f07:	00 18                	add    BYTE PTR [rax],bl
    2f09:	00 00                	add    BYTE PTR [rax],al
    2f0b:	00 00                	add    BYTE PTR [rax],al
    2f0d:	00 00                	add    BYTE PTR [rax],al
    2f0f:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    2f12:	00 00                	add    BYTE PTR [rax],al
    2f14:	00 00                	add    BYTE PTR [rax],al
    2f16:	00 00                	add    BYTE PTR [rax],al
    2f18:	07                   	(bad)  
    2f19:	00 00                	add    BYTE PTR [rax],al
    2f1b:	00 00                	add    BYTE PTR [rax],al
    2f1d:	00 00                	add    BYTE PTR [rax],al
    2f1f:	00 17                	add    BYTE PTR [rdi],dl
    2f21:	00 00                	add    BYTE PTR [rax],al
    2f23:	00 00                	add    BYTE PTR [rax],al
    2f25:	00 00                	add    BYTE PTR [rax],al
    2f27:	00 e0                	add    al,ah
    2f29:	04 40                	add    al,0x40
    2f2b:	00 00                	add    BYTE PTR [rax],al
    2f2d:	00 00                	add    BYTE PTR [rax],al
    2f2f:	00 07                	add    BYTE PTR [rdi],al
    2f31:	00 00                	add    BYTE PTR [rax],al
    2f33:	00 00                	add    BYTE PTR [rax],al
    2f35:	00 00                	add    BYTE PTR [rax],al
    2f37:	00 b0 04 40 00 00    	add    BYTE PTR [rax+0x4004],dh
    2f3d:	00 00                	add    BYTE PTR [rax],al
    2f3f:	00 08                	add    BYTE PTR [rax],cl
    2f41:	00 00                	add    BYTE PTR [rax],al
    2f43:	00 00                	add    BYTE PTR [rax],al
    2f45:	00 00                	add    BYTE PTR [rax],al
    2f47:	00 30                	add    BYTE PTR [rax],dh
    2f49:	00 00                	add    BYTE PTR [rax],al
    2f4b:	00 00                	add    BYTE PTR [rax],al
    2f4d:	00 00                	add    BYTE PTR [rax],al
    2f4f:	00 09                	add    BYTE PTR [rcx],cl
    2f51:	00 00                	add    BYTE PTR [rax],al
    2f53:	00 00                	add    BYTE PTR [rax],al
    2f55:	00 00                	add    BYTE PTR [rax],al
    2f57:	00 18                	add    BYTE PTR [rax],bl
    2f59:	00 00                	add    BYTE PTR [rax],al
    2f5b:	00 00                	add    BYTE PTR [rax],al
    2f5d:	00 00                	add    BYTE PTR [rax],al
    2f5f:	00 fe                	add    dh,bh
    2f61:	ff                   	(bad)  
    2f62:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    2f65:	00 00                	add    BYTE PTR [rax],al
    2f67:	00 80 04 40 00 00    	add    BYTE PTR [rax+0x4004],al
    2f6d:	00 00                	add    BYTE PTR [rax],al
    2f6f:	00 ff                	add    bh,bh
    2f71:	ff                   	(bad)  
    2f72:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    2f75:	00 00                	add    BYTE PTR [rax],al
    2f77:	00 01                	add    BYTE PTR [rcx],al
    2f79:	00 00                	add    BYTE PTR [rax],al
    2f7b:	00 00                	add    BYTE PTR [rax],al
    2f7d:	00 00                	add    BYTE PTR [rax],al
    2f7f:	00 f0                	add    al,dh
    2f81:	ff                   	(bad)  
    2f82:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    2f85:	00 00                	add    BYTE PTR [rax],al
    2f87:	00 78 04             	add    BYTE PTR [rax+0x4],bh
    2f8a:	40 00 00             	rex add BYTE PTR [rax],al
	...
    2ffd:	00 00                	add    BYTE PTR [rax],al
    2fff:	00 20                	add    BYTE PTR [rax],ah
    3001:	3e 40 00 00          	ds rex add BYTE PTR [rax],al
	...
    3015:	00 00                	add    BYTE PTR [rax],al
    3017:	00 30                	add    BYTE PTR [rax],dh
    3019:	10 40 00             	adc    BYTE PTR [rax+0x0],al
	...
    3030:	47                   	rex.RXB
    3031:	43                   	rex.XB
    3032:	43 3a 20             	rex.XB cmp spl,BYTE PTR [r8]
    3035:	28 55 62             	sub    BYTE PTR [rbp+0x62],dl
    3038:	75 6e                	jne    0x30a8
    303a:	74 75                	je     0x30b1
    303c:	20 31                	and    BYTE PTR [rcx],dh
    303e:	30 2e                	xor    BYTE PTR [rsi],ch
    3040:	35 2e 30 2d 31       	xor    eax,0x312d302e
    3045:	75 62                	jne    0x30a9
    3047:	75 6e                	jne    0x30b7
    3049:	74 75                	je     0x30c0
    304b:	31 7e 32             	xor    DWORD PTR [rsi+0x32],edi
    304e:	32 2e                	xor    ch,BYTE PTR [rsi]
    3050:	30 34 29             	xor    BYTE PTR [rcx+rbp*1],dh
    3053:	20 31                	and    BYTE PTR [rcx],dh
    3055:	30 2e                	xor    BYTE PTR [rsi],ch
    3057:	35 2e 30 00 00       	xor    eax,0x302e
	...
    3078:	01 00                	add    DWORD PTR [rax],eax
    307a:	00 00                	add    BYTE PTR [rax],al
    307c:	04 00                	add    al,0x0
    307e:	f1                   	int1   
    307f:	ff 00                	inc    DWORD PTR [rax]
	...
    308d:	00 00                	add    BYTE PTR [rax],al
    308f:	00 08                	add    BYTE PTR [rax],cl
    3091:	00 00                	add    BYTE PTR [rax],al
    3093:	00 01                	add    BYTE PTR [rcx],al
    3095:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    3098:	8c 03                	mov    WORD PTR [rbx],es
    309a:	40 00 00             	rex add BYTE PTR [rax],al
    309d:	00 00                	add    BYTE PTR [rax],al
    309f:	00 20                	add    BYTE PTR [rax],ah
    30a1:	00 00                	add    BYTE PTR [rax],al
    30a3:	00 00                	add    BYTE PTR [rax],al
    30a5:	00 00                	add    BYTE PTR [rax],al
    30a7:	00 12                	add    BYTE PTR [rdx],dl
    30a9:	00 00                	add    BYTE PTR [rax],al
    30ab:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    30ae:	f1                   	int1   
    30af:	ff 00                	inc    DWORD PTR [rax]
	...
    30bd:	00 00                	add    BYTE PTR [rax],al
    30bf:	00 1d 00 00 00 02    	add    BYTE PTR [rip+0x2000000],bl        # 0x20030c5
    30c5:	00 0f                	add    BYTE PTR [rdi],cl
    30c7:	00 90 10 40 00 00    	add    BYTE PTR [rax+0x4010],dl
	...
    30d5:	00 00                	add    BYTE PTR [rax],al
    30d7:	00 1f                	add    BYTE PTR [rdi],bl
    30d9:	00 00                	add    BYTE PTR [rax],al
    30db:	00 02                	add    BYTE PTR [rdx],al
    30dd:	00 0f                	add    BYTE PTR [rdi],cl
    30df:	00 c0                	add    al,al
    30e1:	10 40 00             	adc    BYTE PTR [rax+0x0],al
	...
    30f0:	32 00                	xor    al,BYTE PTR [rax]
    30f2:	00 00                	add    BYTE PTR [rax],al
    30f4:	02 00                	add    al,BYTE PTR [rax]
    30f6:	0f 00 00             	sldt   WORD PTR [rax]
    30f9:	11 40 00             	adc    DWORD PTR [rax+0x0],eax
	...
    3108:	48 00 00             	rex.W add BYTE PTR [rax],al
    310b:	00 01                	add    BYTE PTR [rcx],al
    310d:	00 1a                	add    BYTE PTR [rdx],bl
    310f:	00 30                	add    BYTE PTR [rax],dh
    3111:	40                   	rex
    3112:	40 00 00             	rex add BYTE PTR [rax],al
    3115:	00 00                	add    BYTE PTR [rax],al
    3117:	00 01                	add    BYTE PTR [rcx],al
    3119:	00 00                	add    BYTE PTR [rax],al
    311b:	00 00                	add    BYTE PTR [rax],al
    311d:	00 00                	add    BYTE PTR [rax],al
    311f:	00 54 00 00          	add    BYTE PTR [rax+rax*1+0x0],dl
    3123:	00 01                	add    BYTE PTR [rcx],al
    3125:	00 15 00 18 3e 40    	add    BYTE PTR [rip+0x403e1800],dl        # 0x403e492b
	...
    3137:	00 7b 00             	add    BYTE PTR [rbx+0x0],bh
    313a:	00 00                	add    BYTE PTR [rax],al
    313c:	02 00                	add    al,BYTE PTR [rax]
    313e:	0f 00                	(bad)  
    3140:	30 11                	xor    BYTE PTR [rcx],dl
    3142:	40 00 00             	rex add BYTE PTR [rax],al
	...
    314d:	00 00                	add    BYTE PTR [rax],al
    314f:	00 87 00 00 00 01    	add    BYTE PTR [rdi+0x1000000],al
    3155:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    3158:	10 3e                	adc    BYTE PTR [rsi],bh
    315a:	40 00 00             	rex add BYTE PTR [rax],al
	...
    3165:	00 00                	add    BYTE PTR [rax],al
    3167:	00 a6 00 00 00 04    	add    BYTE PTR [rsi+0x4000000],ah
    316d:	00 f1                	add    cl,dh
    316f:	ff 00                	inc    DWORD PTR [rax]
	...
    317d:	00 00                	add    BYTE PTR [rax],al
    317f:	00 12                	add    BYTE PTR [rdx],dl
    3181:	00 00                	add    BYTE PTR [rax],al
    3183:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    3186:	f1                   	int1   
    3187:	ff 00                	inc    DWORD PTR [rax]
	...
    3195:	00 00                	add    BYTE PTR [rax],al
    3197:	00 af 00 00 00 01    	add    BYTE PTR [rdi+0x1000000],ch
    319d:	00 13                	add    BYTE PTR [rbx],dl
    319f:	00 e8                	add    al,ch
    31a1:	20 40 00             	and    BYTE PTR [rax+0x0],al
	...
    31b4:	04 00                	add    al,0x0
    31b6:	f1                   	int1   
    31b7:	ff 00                	inc    DWORD PTR [rax]
	...
    31c5:	00 00                	add    BYTE PTR [rax],al
    31c7:	00 bd 00 00 00 01    	add    BYTE PTR [rbp+0x1000000],bh
    31cd:	00 16                	add    BYTE PTR [rsi],dl
    31cf:	00 20                	add    BYTE PTR [rax],ah
    31d1:	3e 40 00 00          	ds rex add BYTE PTR [rax],al
	...
    31dd:	00 00                	add    BYTE PTR [rax],al
    31df:	00 c6                	add    dh,al
    31e1:	00 00                	add    BYTE PTR [rax],al
    31e3:	00 00                	add    BYTE PTR [rax],al
    31e5:	00 12                	add    BYTE PTR [rdx],dl
    31e7:	00 14 20             	add    BYTE PTR [rax+riz*1],dl
    31ea:	40 00 00             	rex add BYTE PTR [rax],al
	...
    31f5:	00 00                	add    BYTE PTR [rax],al
    31f7:	00 d9                	add    cl,bl
    31f9:	00 00                	add    BYTE PTR [rax],al
    31fb:	00 01                	add    BYTE PTR [rcx],al
    31fd:	00 18                	add    BYTE PTR [rax],bl
    31ff:	00 00                	add    BYTE PTR [rax],al
    3201:	40                   	rex
    3202:	40 00 00             	rex add BYTE PTR [rax],al
	...
    320d:	00 00                	add    BYTE PTR [rax],al
    320f:	00 ef                	add    bh,ch
    3211:	00 00                	add    BYTE PTR [rax],al
    3213:	00 12                	add    BYTE PTR [rdx],dl
	...
    3225:	00 00                	add    BYTE PTR [rax],al
    3227:	00 2c 01             	add    BYTE PTR [rcx+rax*1],ch
    322a:	00 00                	add    BYTE PTR [rax],al
    322c:	20 00                	and    BYTE PTR [rax],al
    322e:	19 00                	sbb    DWORD PTR [rax],eax
    3230:	20 40 40             	and    BYTE PTR [rax+0x40],al
	...
    323f:	00 0c 01             	add    BYTE PTR [rcx+rax*1],cl
    3242:	00 00                	add    BYTE PTR [rax],al
    3244:	12 00                	adc    al,BYTE PTR [rax]
	...
    3256:	00 00                	add    BYTE PTR [rax],al
    3258:	1d 01 00 00 10       	sbb    eax,0x10000001
    325d:	00 19                	add    BYTE PTR [rcx],bl
    325f:	00 30                	add    BYTE PTR [rax],dh
    3261:	40                   	rex
    3262:	40 00 00             	rex add BYTE PTR [rax],al
	...
    326d:	00 00                	add    BYTE PTR [rax],al
    326f:	00 24 01             	add    BYTE PTR [rcx+rax*1],ah
    3272:	00 00                	add    BYTE PTR [rax],al
    3274:	12 02                	adc    al,BYTE PTR [rdx]
    3276:	10 00                	adc    BYTE PTR [rax],al
    3278:	54                   	push   rsp
    3279:	11 40 00             	adc    DWORD PTR [rax+0x0],eax
	...
    3288:	2a 01                	sub    al,BYTE PTR [rcx]
    328a:	00 00                	add    BYTE PTR [rax],al
    328c:	10 00                	adc    BYTE PTR [rax],al
    328e:	19 00                	sbb    DWORD PTR [rax],eax
    3290:	20 40 40             	and    BYTE PTR [rax+0x40],al
	...
    329f:	00 37                	add    BYTE PTR [rdi],dh
    32a1:	01 00                	add    DWORD PTR [rax],eax
    32a3:	00 20                	add    BYTE PTR [rax],ah
	...
    32b5:	00 00                	add    BYTE PTR [rax],al
    32b7:	00 46 01             	add    BYTE PTR [rsi+0x1],al
    32ba:	00 00                	add    BYTE PTR [rax],al
    32bc:	11 02                	adc    DWORD PTR [rdx],eax
    32be:	19 00                	sbb    DWORD PTR [rax],eax
    32c0:	28 40 40             	sub    BYTE PTR [rax+0x40],al
	...
    32cf:	00 53 01             	add    BYTE PTR [rbx+0x1],dl
    32d2:	00 00                	add    BYTE PTR [rax],al
    32d4:	11 00                	adc    DWORD PTR [rax],eax
    32d6:	11 00                	adc    DWORD PTR [rax],eax
    32d8:	00 20                	add    BYTE PTR [rax],ah
    32da:	40 00 00             	rex add BYTE PTR [rax],al
    32dd:	00 00                	add    BYTE PTR [rax],al
    32df:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    32e2:	00 00                	add    BYTE PTR [rax],al
    32e4:	00 00                	add    BYTE PTR [rax],al
    32e6:	00 00                	add    BYTE PTR [rax],al
    32e8:	62 01                	(bad)  
    32ea:	00 00                	add    BYTE PTR [rax],al
    32ec:	10 00                	adc    BYTE PTR [rax],al
    32ee:	1a 00                	sbb    al,BYTE PTR [rax]
    32f0:	38 40 40             	cmp    BYTE PTR [rax+0x40],al
	...
    32ff:	00 67 01             	add    BYTE PTR [rdi+0x1],ah
    3302:	00 00                	add    BYTE PTR [rax],al
    3304:	12 02                	adc    al,BYTE PTR [rdx]
    3306:	0f 00 80 10 40 00 00 	sldt   WORD PTR [rax+0x4010]
    330d:	00 00                	add    BYTE PTR [rax],al
    330f:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 0x3315
    3315:	00 00                	add    BYTE PTR [rax],al
    3317:	00 30                	add    BYTE PTR [rax],dh
    3319:	01 00                	add    DWORD PTR [rax],eax
    331b:	00 12                	add    BYTE PTR [rdx],dl
    331d:	00 0f                	add    BYTE PTR [rdi],cl
    331f:	00 50 10             	add    BYTE PTR [rax+0x10],dl
    3322:	40 00 00             	rex add BYTE PTR [rax],al
    3325:	00 00                	add    BYTE PTR [rax],al
    3327:	00 26                	add    BYTE PTR [rsi],ah
    3329:	00 00                	add    BYTE PTR [rax],al
    332b:	00 00                	add    BYTE PTR [rax],al
    332d:	00 00                	add    BYTE PTR [rax],al
    332f:	00 7f 01             	add    BYTE PTR [rdi+0x1],bh
    3332:	00 00                	add    BYTE PTR [rax],al
    3334:	10 00                	adc    BYTE PTR [rax],al
    3336:	1a 00                	sbb    al,BYTE PTR [rax]
    3338:	30 40 40             	xor    BYTE PTR [rax+0x40],al
	...
    3347:	00 8b 01 00 00 12    	add    BYTE PTR [rbx+0x12000001],cl
    334d:	00 0f                	add    BYTE PTR [rdi],cl
    334f:	00 36                	add    BYTE PTR [rsi],dh
    3351:	11 40 00             	adc    DWORD PTR [rax+0x0],eax
    3354:	00 00                	add    BYTE PTR [rax],al
    3356:	00 00                	add    BYTE PTR [rax],al
    3358:	1b 00                	sbb    eax,DWORD PTR [rax]
    335a:	00 00                	add    BYTE PTR [rax],al
    335c:	00 00                	add    BYTE PTR [rax],al
    335e:	00 00                	add    BYTE PTR [rax],al
    3360:	90                   	nop
    3361:	01 00                	add    DWORD PTR [rax],eax
    3363:	00 11                	add    BYTE PTR [rcx],dl
    3365:	02 19                	add    bl,BYTE PTR [rcx]
    3367:	00 30                	add    BYTE PTR [rax],dh
    3369:	40                   	rex
    336a:	40 00 00             	rex add BYTE PTR [rax],al
	...
    3375:	00 00                	add    BYTE PTR [rax],al
    3377:	00 9c 01 00 00 12 02 	add    BYTE PTR [rcx+rax*1+0x2120000],bl
    337e:	0c 00                	or     al,0x0
    3380:	00 10                	add    BYTE PTR [rax],dl
    3382:	40 00 00             	rex add BYTE PTR [rax],al
	...
    3391:	63 72 74             	movsxd esi,DWORD PTR [rdx+0x74]
    3394:	31 2e                	xor    DWORD PTR [rsi],ebp
    3396:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    3397:	00 5f 5f             	add    BYTE PTR [rdi+0x5f],bl
    339a:	61                   	(bad)  
    339b:	62                   	(bad)  
    339c:	69 5f 74 61 67 00 63 	imul   ebx,DWORD PTR [rdi+0x74],0x63006761
    33a3:	72 74                	jb     0x3419
    33a5:	73 74                	jae    0x341b
    33a7:	75 66                	jne    0x340f
    33a9:	66 2e 63 00          	cs movsxd ax,DWORD PTR [rax]
    33ad:	64 65 72 65          	fs gs jb 0x3416
    33b1:	67 69 73 74 65 72 5f 	imul   esi,DWORD PTR [ebx+0x74],0x745f7265
    33b8:	74 
    33b9:	6d                   	ins    DWORD PTR es:[rdi],dx
    33ba:	5f                   	pop    rdi
    33bb:	63 6c 6f 6e          	movsxd ebp,DWORD PTR [rdi+rbp*2+0x6e]
    33bf:	65 73 00             	gs jae 0x33c2
    33c2:	5f                   	pop    rdi
    33c3:	5f                   	pop    rdi
    33c4:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
    33c6:	5f                   	pop    rdi
    33c7:	67 6c                	ins    BYTE PTR es:[edi],dx
    33c9:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    33ca:	62 61 6c 5f 64       	(bad)
    33cf:	74 6f                	je     0x3440
    33d1:	72 73                	jb     0x3446
    33d3:	5f                   	pop    rdi
    33d4:	61                   	(bad)  
    33d5:	75 78                	jne    0x344f
    33d7:	00 63 6f             	add    BYTE PTR [rbx+0x6f],ah
    33da:	6d                   	ins    DWORD PTR es:[rdi],dx
    33db:	70 6c                	jo     0x3449
    33dd:	65 74 65             	gs je  0x3445
    33e0:	64 2e 30 00          	fs xor BYTE PTR fs:[rax],al
    33e4:	5f                   	pop    rdi
    33e5:	5f                   	pop    rdi
    33e6:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
    33e8:	5f                   	pop    rdi
    33e9:	67 6c                	ins    BYTE PTR es:[edi],dx
    33eb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    33ec:	62 61 6c 5f 64       	(bad)
    33f1:	74 6f                	je     0x3462
    33f3:	72 73                	jb     0x3468
    33f5:	5f                   	pop    rdi
    33f6:	61                   	(bad)  
    33f7:	75 78                	jne    0x3471
    33f9:	5f                   	pop    rdi
    33fa:	66 69 6e 69 5f 61    	imul   bp,WORD PTR [rsi+0x69],0x615f
    3400:	72 72                	jb     0x3474
    3402:	61                   	(bad)  
    3403:	79 5f                	jns    0x3464
    3405:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
    3407:	74 72                	je     0x347b
    3409:	79 00                	jns    0x340b
    340b:	66 72 61             	data16 jb 0x346f
    340e:	6d                   	ins    DWORD PTR es:[rdi],dx
    340f:	65 5f                	gs pop rdi
    3411:	64 75 6d             	fs jne 0x3481
    3414:	6d                   	ins    DWORD PTR es:[rdi],dx
    3415:	79 00                	jns    0x3417
    3417:	5f                   	pop    rdi
    3418:	5f                   	pop    rdi
    3419:	66 72 61             	data16 jb 0x347d
    341c:	6d                   	ins    DWORD PTR es:[rdi],dx
    341d:	65 5f                	gs pop rdi
    341f:	64 75 6d             	fs jne 0x348f
    3422:	6d                   	ins    DWORD PTR es:[rdi],dx
    3423:	79 5f                	jns    0x3484
    3425:	69 6e 69 74 5f 61 72 	imul   ebp,DWORD PTR [rsi+0x69],0x72615f74
    342c:	72 61                	jb     0x348f
    342e:	79 5f                	jns    0x348f
    3430:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
    3432:	74 72                	je     0x34a6
    3434:	79 00                	jns    0x3436
    3436:	73 61                	jae    0x3499
    3438:	6d                   	ins    DWORD PTR es:[rdi],dx
    3439:	70 6c                	jo     0x34a7
    343b:	65 2e 63 00          	gs movsxd eax,DWORD PTR gs:[rax]
    343f:	5f                   	pop    rdi
    3440:	5f                   	pop    rdi
    3441:	46 52                	rex.RX push rdx
    3443:	41                   	rex.B
    3444:	4d                   	rex.WRB
    3445:	45 5f                	rex.RB pop r15
    3447:	45                   	rex.RB
    3448:	4e                   	rex.WRX
    3449:	44 5f                	rex.R pop rdi
    344b:	5f                   	pop    rdi
    344c:	00 5f 44             	add    BYTE PTR [rdi+0x44],bl
    344f:	59                   	pop    rcx
    3450:	4e                   	rex.WRX
    3451:	41                   	rex.B
    3452:	4d                   	rex.WRB
    3453:	49                   	rex.WB
    3454:	43 00 5f 5f          	rex.XB add BYTE PTR [r15+0x5f],bl
    3458:	47                   	rex.RXB
    3459:	4e 55                	rex.WRX push rbp
    345b:	5f                   	pop    rdi
    345c:	45                   	rex.RB
    345d:	48 5f                	rex.W pop rdi
    345f:	46 52                	rex.RX push rdx
    3461:	41                   	rex.B
    3462:	4d                   	rex.WRB
    3463:	45 5f                	rex.RB pop r15
    3465:	48                   	rex.W
    3466:	44 52                	rex.R push rdx
    3468:	00 5f 47             	add    BYTE PTR [rdi+0x47],bl
    346b:	4c                   	rex.WR
    346c:	4f                   	rex.WRXB
    346d:	42                   	rex.X
    346e:	41                   	rex.B
    346f:	4c 5f                	rex.WR pop rdi
    3471:	4f                   	rex.WRXB
    3472:	46                   	rex.RX
    3473:	46 53                	rex.RX push rbx
    3475:	45 54                	rex.RB push r12
    3477:	5f                   	pop    rdi
    3478:	54                   	push   rsp
    3479:	41                   	rex.B
    347a:	42                   	rex.X
    347b:	4c                   	rex.WR
    347c:	45 5f                	rex.RB pop r15
    347e:	00 5f 5f             	add    BYTE PTR [rdi+0x5f],bl
    3481:	6c                   	ins    BYTE PTR es:[rdi],dx
    3482:	69 62 63 5f 73 74 61 	imul   esp,DWORD PTR [rdx+0x63],0x6174735f
    3489:	72 74                	jb     0x34ff
    348b:	5f                   	pop    rdi
    348c:	6d                   	ins    DWORD PTR es:[rdi],dx
    348d:	61                   	(bad)  
    348e:	69 6e 40 47 4c 49 42 	imul   ebp,DWORD PTR [rsi+0x40],0x42494c47
    3495:	43 5f                	rex.XB pop r15
    3497:	32 2e                	xor    ch,BYTE PTR [rsi]
    3499:	33 34 00             	xor    esi,DWORD PTR [rax+rax*1]
    349c:	70 75                	jo     0x3513
    349e:	74 73                	je     0x3513
    34a0:	40                   	rex
    34a1:	47                   	rex.RXB
    34a2:	4c                   	rex.WR
    34a3:	49                   	rex.WB
    34a4:	42                   	rex.X
    34a5:	43 5f                	rex.XB pop r15
    34a7:	32 2e                	xor    ch,BYTE PTR [rsi]
    34a9:	32 2e                	xor    ch,BYTE PTR [rsi]
    34ab:	35 00 5f 65 64       	xor    eax,0x64655f00
    34b0:	61                   	(bad)  
    34b1:	74 61                	je     0x3514
    34b3:	00 5f 66             	add    BYTE PTR [rdi+0x66],bl
    34b6:	69 6e 69 00 5f 5f 64 	imul   ebp,DWORD PTR [rsi+0x69],0x645f5f00
    34bd:	61                   	(bad)  
    34be:	74 61                	je     0x3521
    34c0:	5f                   	pop    rdi
    34c1:	73 74                	jae    0x3537
    34c3:	61                   	(bad)  
    34c4:	72 74                	jb     0x353a
    34c6:	00 5f 5f             	add    BYTE PTR [rdi+0x5f],bl
    34c9:	67 6d                	ins    DWORD PTR es:[edi],dx
    34cb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    34cc:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    34cd:	5f                   	pop    rdi
    34ce:	73 74                	jae    0x3544
    34d0:	61                   	(bad)  
    34d1:	72 74                	jb     0x3547
    34d3:	5f                   	pop    rdi
    34d4:	5f                   	pop    rdi
    34d5:	00 5f 5f             	add    BYTE PTR [rdi+0x5f],bl
    34d8:	64 73 6f             	fs jae 0x354a
    34db:	5f                   	pop    rdi
    34dc:	68 61 6e 64 6c       	push   0x6c646e61
    34e1:	65 00 5f 49          	add    BYTE PTR gs:[rdi+0x49],bl
    34e5:	4f 5f                	rex.WRXB pop r15
    34e7:	73 74                	jae    0x355d
    34e9:	64 69 6e 5f 75 73 65 	imul   ebp,DWORD PTR fs:[rsi+0x5f],0x64657375
    34f0:	64 
    34f1:	00 5f 65             	add    BYTE PTR [rdi+0x65],bl
    34f4:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    34f5:	64 00 5f 64          	add    BYTE PTR fs:[rdi+0x64],bl
    34f9:	6c                   	ins    BYTE PTR es:[rdi],dx
    34fa:	5f                   	pop    rdi
    34fb:	72 65                	jb     0x3562
    34fd:	6c                   	ins    BYTE PTR es:[rdi],dx
    34fe:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    34ff:	63 61 74             	movsxd esp,DWORD PTR [rcx+0x74]
    3502:	65 5f                	gs pop rdi
    3504:	73 74                	jae    0x357a
    3506:	61                   	(bad)  
    3507:	74 69                	je     0x3572
    3509:	63 5f 70             	movsxd ebx,DWORD PTR [rdi+0x70]
    350c:	69 65 00 5f 5f 62 73 	imul   esp,DWORD PTR [rbp+0x0],0x73625f5f
    3513:	73 5f                	jae    0x3574
    3515:	73 74                	jae    0x358b
    3517:	61                   	(bad)  
    3518:	72 74                	jb     0x358e
    351a:	00 6d 61             	add    BYTE PTR [rbp+0x61],ch
    351d:	69 6e 00 5f 5f 54 4d 	imul   ebp,DWORD PTR [rsi+0x0],0x4d545f5f
    3524:	43 5f                	rex.XB pop r15
    3526:	45                   	rex.RB
    3527:	4e                   	rex.WRX
    3528:	44 5f                	rex.R pop rdi
    352a:	5f                   	pop    rdi
    352b:	00 5f 69             	add    BYTE PTR [rdi+0x69],bl
    352e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    352f:	69 74 00 00 2e 73 79 	imul   esi,DWORD PTR [rax+rax*1+0x0],0x6d79732e
    3536:	6d 
    3537:	74 61                	je     0x359a
    3539:	62                   	(bad)  
    353a:	00 2e                	add    BYTE PTR [rsi],ch
    353c:	73 74                	jae    0x35b2
    353e:	72 74                	jb     0x35b4
    3540:	61                   	(bad)  
    3541:	62                   	(bad)  
    3542:	00 2e                	add    BYTE PTR [rsi],ch
    3544:	73 68                	jae    0x35ae
    3546:	73 74                	jae    0x35bc
    3548:	72 74                	jb     0x35be
    354a:	61                   	(bad)  
    354b:	62                   	(bad)  
    354c:	00 2e                	add    BYTE PTR [rsi],ch
    354e:	69 6e 74 65 72 70 00 	imul   ebp,DWORD PTR [rsi+0x74],0x707265
    3555:	2e 6e                	outs   dx,BYTE PTR ds:[rsi]
    3557:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    3558:	74 65                	je     0x35bf
    355a:	2e 67 6e             	outs   dx,BYTE PTR ds:[esi]
    355d:	75 2e                	jne    0x358d
    355f:	70 72                	jo     0x35d3
    3561:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    3562:	70 65                	jo     0x35c9
    3564:	72 74                	jb     0x35da
    3566:	79 00                	jns    0x3568
    3568:	2e 6e                	outs   dx,BYTE PTR ds:[rsi]
    356a:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    356b:	74 65                	je     0x35d2
    356d:	2e 67 6e             	outs   dx,BYTE PTR ds:[esi]
    3570:	75 2e                	jne    0x35a0
    3572:	62 75                	(bad)  
    3574:	69 6c 64 2d 69 64 00 	imul   ebp,DWORD PTR [rsp+riz*2+0x2d],0x2e006469
    357b:	2e 
    357c:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    357d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    357e:	74 65                	je     0x35e5
    3580:	2e 41                	cs rex.B
    3582:	42                   	rex.X
    3583:	49 2d 74 61 67 00    	rex.WB sub rax,0x676174
    3589:	2e 67 6e             	outs   dx,BYTE PTR ds:[esi]
    358c:	75 2e                	jne    0x35bc
    358e:	68 61 73 68 00       	push   0x687361
    3593:	2e 64 79 6e          	cs fs jns 0x3605
    3597:	73 79                	jae    0x3612
    3599:	6d                   	ins    DWORD PTR es:[rdi],dx
    359a:	00 2e                	add    BYTE PTR [rsi],ch
    359c:	64 79 6e             	fs jns 0x360d
    359f:	73 74                	jae    0x3615
    35a1:	72 00                	jb     0x35a3
    35a3:	2e 67 6e             	outs   dx,BYTE PTR ds:[esi]
    35a6:	75 2e                	jne    0x35d6
    35a8:	76 65                	jbe    0x360f
    35aa:	72 73                	jb     0x361f
    35ac:	69 6f 6e 00 2e 67 6e 	imul   ebp,DWORD PTR [rdi+0x6e],0x6e672e00
    35b3:	75 2e                	jne    0x35e3
    35b5:	76 65                	jbe    0x361c
    35b7:	72 73                	jb     0x362c
    35b9:	69 6f 6e 5f 72 00 2e 	imul   ebp,DWORD PTR [rdi+0x6e],0x2e00725f
    35c0:	72 65                	jb     0x3627
    35c2:	6c                   	ins    BYTE PTR es:[rdi],dx
    35c3:	61                   	(bad)  
    35c4:	2e 64 79 6e          	cs fs jns 0x3636
    35c8:	00 2e                	add    BYTE PTR [rsi],ch
    35ca:	72 65                	jb     0x3631
    35cc:	6c                   	ins    BYTE PTR es:[rdi],dx
    35cd:	61                   	(bad)  
    35ce:	2e 70 6c             	cs jo  0x363d
    35d1:	74 00                	je     0x35d3
    35d3:	2e 69 6e 69 74 00 2e 	cs imul ebp,DWORD PTR [rsi+0x69],0x702e0074
    35da:	70 
    35db:	6c                   	ins    BYTE PTR es:[rdi],dx
    35dc:	74 2e                	je     0x360c
    35de:	73 65                	jae    0x3645
    35e0:	63 00                	movsxd eax,DWORD PTR [rax]
    35e2:	2e 74 65             	cs je  0x364a
    35e5:	78 74                	js     0x365b
    35e7:	00 2e                	add    BYTE PTR [rsi],ch
    35e9:	66 69 6e 69 00 2e    	imul   bp,WORD PTR [rsi+0x69],0x2e00
    35ef:	72 6f                	jb     0x3660
    35f1:	64 61                	fs (bad) 
    35f3:	74 61                	je     0x3656
    35f5:	00 2e                	add    BYTE PTR [rsi],ch
    35f7:	65 68 5f 66 72 61    	gs push 0x6172665f
    35fd:	6d                   	ins    DWORD PTR es:[rdi],dx
    35fe:	65 5f                	gs pop rdi
    3600:	68 64 72 00 2e       	push   0x2e007264
    3605:	65 68 5f 66 72 61    	gs push 0x6172665f
    360b:	6d                   	ins    DWORD PTR es:[rdi],dx
    360c:	65 00 2e             	add    BYTE PTR gs:[rsi],ch
    360f:	69 6e 69 74 5f 61 72 	imul   ebp,DWORD PTR [rsi+0x69],0x72615f74
    3616:	72 61                	jb     0x3679
    3618:	79 00                	jns    0x361a
    361a:	2e 66 69 6e 69 5f 61 	cs imul bp,WORD PTR [rsi+0x69],0x615f
    3621:	72 72                	jb     0x3695
    3623:	61                   	(bad)  
    3624:	79 00                	jns    0x3626
    3626:	2e 64 79 6e          	cs fs jns 0x3698
    362a:	61                   	(bad)  
    362b:	6d                   	ins    DWORD PTR es:[rdi],dx
    362c:	69 63 00 2e 67 6f 74 	imul   esp,DWORD PTR [rbx+0x0],0x746f672e
    3633:	00 2e                	add    BYTE PTR [rsi],ch
    3635:	67 6f                	outs   dx,DWORD PTR ds:[esi]
    3637:	74 2e                	je     0x3667
    3639:	70 6c                	jo     0x36a7
    363b:	74 00                	je     0x363d
    363d:	2e 64 61             	cs fs (bad) 
    3640:	74 61                	je     0x36a3
    3642:	00 2e                	add    BYTE PTR [rsi],ch
    3644:	62 73                	(bad)  
    3646:	73 00                	jae    0x3648
    3648:	2e 63 6f 6d          	cs movsxd ebp,DWORD PTR [rdi+0x6d]
    364c:	6d                   	ins    DWORD PTR es:[rdi],dx
    364d:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
    364f:	74 00                	je     0x3651
	...
    3695:	00 00                	add    BYTE PTR [rax],al
    3697:	00 1b                	add    BYTE PTR [rbx],bl
    3699:	00 00                	add    BYTE PTR [rax],al
    369b:	00 01                	add    BYTE PTR [rcx],al
    369d:	00 00                	add    BYTE PTR [rax],al
    369f:	00 02                	add    BYTE PTR [rdx],al
    36a1:	00 00                	add    BYTE PTR [rax],al
    36a3:	00 00                	add    BYTE PTR [rax],al
    36a5:	00 00                	add    BYTE PTR [rax],al
    36a7:	00 18                	add    BYTE PTR [rax],bl
    36a9:	03 40 00             	add    eax,DWORD PTR [rax+0x0]
    36ac:	00 00                	add    BYTE PTR [rax],al
    36ae:	00 00                	add    BYTE PTR [rax],al
    36b0:	18 03                	sbb    BYTE PTR [rbx],al
    36b2:	00 00                	add    BYTE PTR [rax],al
    36b4:	00 00                	add    BYTE PTR [rax],al
    36b6:	00 00                	add    BYTE PTR [rax],al
    36b8:	1c 00                	sbb    al,0x0
	...
    36c6:	00 00                	add    BYTE PTR [rax],al
    36c8:	01 00                	add    DWORD PTR [rax],eax
	...
    36d6:	00 00                	add    BYTE PTR [rax],al
    36d8:	23 00                	and    eax,DWORD PTR [rax]
    36da:	00 00                	add    BYTE PTR [rax],al
    36dc:	07                   	(bad)  
    36dd:	00 00                	add    BYTE PTR [rax],al
    36df:	00 02                	add    BYTE PTR [rdx],al
    36e1:	00 00                	add    BYTE PTR [rax],al
    36e3:	00 00                	add    BYTE PTR [rax],al
    36e5:	00 00                	add    BYTE PTR [rax],al
    36e7:	00 38                	add    BYTE PTR [rax],bh
    36e9:	03 40 00             	add    eax,DWORD PTR [rax+0x0]
    36ec:	00 00                	add    BYTE PTR [rax],al
    36ee:	00 00                	add    BYTE PTR [rax],al
    36f0:	38 03                	cmp    BYTE PTR [rbx],al
    36f2:	00 00                	add    BYTE PTR [rax],al
    36f4:	00 00                	add    BYTE PTR [rax],al
    36f6:	00 00                	add    BYTE PTR [rax],al
    36f8:	30 00                	xor    BYTE PTR [rax],al
	...
    3706:	00 00                	add    BYTE PTR [rax],al
    3708:	08 00                	or     BYTE PTR [rax],al
	...
    3716:	00 00                	add    BYTE PTR [rax],al
    3718:	36 00 00             	ss add BYTE PTR [rax],al
    371b:	00 07                	add    BYTE PTR [rdi],al
    371d:	00 00                	add    BYTE PTR [rax],al
    371f:	00 02                	add    BYTE PTR [rdx],al
    3721:	00 00                	add    BYTE PTR [rax],al
    3723:	00 00                	add    BYTE PTR [rax],al
    3725:	00 00                	add    BYTE PTR [rax],al
    3727:	00 68 03             	add    BYTE PTR [rax+0x3],ch
    372a:	40 00 00             	rex add BYTE PTR [rax],al
    372d:	00 00                	add    BYTE PTR [rax],al
    372f:	00 68 03             	add    BYTE PTR [rax+0x3],ch
    3732:	00 00                	add    BYTE PTR [rax],al
    3734:	00 00                	add    BYTE PTR [rax],al
    3736:	00 00                	add    BYTE PTR [rax],al
    3738:	24 00                	and    al,0x0
	...
    3746:	00 00                	add    BYTE PTR [rax],al
    3748:	04 00                	add    al,0x0
	...
    3756:	00 00                	add    BYTE PTR [rax],al
    3758:	49 00 00             	rex.WB add BYTE PTR [r8],al
    375b:	00 07                	add    BYTE PTR [rdi],al
    375d:	00 00                	add    BYTE PTR [rax],al
    375f:	00 02                	add    BYTE PTR [rdx],al
    3761:	00 00                	add    BYTE PTR [rax],al
    3763:	00 00                	add    BYTE PTR [rax],al
    3765:	00 00                	add    BYTE PTR [rax],al
    3767:	00 8c 03 40 00 00 00 	add    BYTE PTR [rbx+rax*1+0x40],cl
    376e:	00 00                	add    BYTE PTR [rax],al
    3770:	8c 03                	mov    WORD PTR [rbx],es
    3772:	00 00                	add    BYTE PTR [rax],al
    3774:	00 00                	add    BYTE PTR [rax],al
    3776:	00 00                	add    BYTE PTR [rax],al
    3778:	20 00                	and    BYTE PTR [rax],al
	...
    3786:	00 00                	add    BYTE PTR [rax],al
    3788:	04 00                	add    al,0x0
	...
    3796:	00 00                	add    BYTE PTR [rax],al
    3798:	57                   	push   rdi
    3799:	00 00                	add    BYTE PTR [rax],al
    379b:	00 f6                	add    dh,dh
    379d:	ff                   	(bad)  
    379e:	ff 6f 02             	jmp    FWORD PTR [rdi+0x2]
    37a1:	00 00                	add    BYTE PTR [rax],al
    37a3:	00 00                	add    BYTE PTR [rax],al
    37a5:	00 00                	add    BYTE PTR [rax],al
    37a7:	00 b0 03 40 00 00    	add    BYTE PTR [rax+0x4003],dh
    37ad:	00 00                	add    BYTE PTR [rax],al
    37af:	00 b0 03 00 00 00    	add    BYTE PTR [rax+0x3],dh
    37b5:	00 00                	add    BYTE PTR [rax],al
    37b7:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    37ba:	00 00                	add    BYTE PTR [rax],al
    37bc:	00 00                	add    BYTE PTR [rax],al
    37be:	00 00                	add    BYTE PTR [rax],al
    37c0:	06                   	(bad)  
    37c1:	00 00                	add    BYTE PTR [rax],al
    37c3:	00 00                	add    BYTE PTR [rax],al
    37c5:	00 00                	add    BYTE PTR [rax],al
    37c7:	00 08                	add    BYTE PTR [rax],cl
	...
    37d5:	00 00                	add    BYTE PTR [rax],al
    37d7:	00 61 00             	add    BYTE PTR [rcx+0x0],ah
    37da:	00 00                	add    BYTE PTR [rax],al
    37dc:	0b 00                	or     eax,DWORD PTR [rax]
    37de:	00 00                	add    BYTE PTR [rax],al
    37e0:	02 00                	add    al,BYTE PTR [rax]
    37e2:	00 00                	add    BYTE PTR [rax],al
    37e4:	00 00                	add    BYTE PTR [rax],al
    37e6:	00 00                	add    BYTE PTR [rax],al
    37e8:	d0 03                	rol    BYTE PTR [rbx],1
    37ea:	40 00 00             	rex add BYTE PTR [rax],al
    37ed:	00 00                	add    BYTE PTR [rax],al
    37ef:	00 d0                	add    al,dl
    37f1:	03 00                	add    eax,DWORD PTR [rax]
    37f3:	00 00                	add    BYTE PTR [rax],al
    37f5:	00 00                	add    BYTE PTR [rax],al
    37f7:	00 60 00             	add    BYTE PTR [rax+0x0],ah
    37fa:	00 00                	add    BYTE PTR [rax],al
    37fc:	00 00                	add    BYTE PTR [rax],al
    37fe:	00 00                	add    BYTE PTR [rax],al
    3800:	07                   	(bad)  
    3801:	00 00                	add    BYTE PTR [rax],al
    3803:	00 01                	add    BYTE PTR [rcx],al
    3805:	00 00                	add    BYTE PTR [rax],al
    3807:	00 08                	add    BYTE PTR [rax],cl
    3809:	00 00                	add    BYTE PTR [rax],al
    380b:	00 00                	add    BYTE PTR [rax],al
    380d:	00 00                	add    BYTE PTR [rax],al
    380f:	00 18                	add    BYTE PTR [rax],bl
    3811:	00 00                	add    BYTE PTR [rax],al
    3813:	00 00                	add    BYTE PTR [rax],al
    3815:	00 00                	add    BYTE PTR [rax],al
    3817:	00 69 00             	add    BYTE PTR [rcx+0x0],ch
    381a:	00 00                	add    BYTE PTR [rax],al
    381c:	03 00                	add    eax,DWORD PTR [rax]
    381e:	00 00                	add    BYTE PTR [rax],al
    3820:	02 00                	add    al,BYTE PTR [rax]
    3822:	00 00                	add    BYTE PTR [rax],al
    3824:	00 00                	add    BYTE PTR [rax],al
    3826:	00 00                	add    BYTE PTR [rax],al
    3828:	30 04 40             	xor    BYTE PTR [rax+rax*2],al
    382b:	00 00                	add    BYTE PTR [rax],al
    382d:	00 00                	add    BYTE PTR [rax],al
    382f:	00 30                	add    BYTE PTR [rax],dh
    3831:	04 00                	add    al,0x0
    3833:	00 00                	add    BYTE PTR [rax],al
    3835:	00 00                	add    BYTE PTR [rax],al
    3837:	00 48 00             	add    BYTE PTR [rax+0x0],cl
	...
    3846:	00 00                	add    BYTE PTR [rax],al
    3848:	01 00                	add    DWORD PTR [rax],eax
	...
    3856:	00 00                	add    BYTE PTR [rax],al
    3858:	71 00                	jno    0x385a
    385a:	00 00                	add    BYTE PTR [rax],al
    385c:	ff                   	(bad)  
    385d:	ff                   	(bad)  
    385e:	ff 6f 02             	jmp    FWORD PTR [rdi+0x2]
    3861:	00 00                	add    BYTE PTR [rax],al
    3863:	00 00                	add    BYTE PTR [rax],al
    3865:	00 00                	add    BYTE PTR [rax],al
    3867:	00 78 04             	add    BYTE PTR [rax+0x4],bh
    386a:	40 00 00             	rex add BYTE PTR [rax],al
    386d:	00 00                	add    BYTE PTR [rax],al
    386f:	00 78 04             	add    BYTE PTR [rax+0x4],bh
    3872:	00 00                	add    BYTE PTR [rax],al
    3874:	00 00                	add    BYTE PTR [rax],al
    3876:	00 00                	add    BYTE PTR [rax],al
    3878:	08 00                	or     BYTE PTR [rax],al
    387a:	00 00                	add    BYTE PTR [rax],al
    387c:	00 00                	add    BYTE PTR [rax],al
    387e:	00 00                	add    BYTE PTR [rax],al
    3880:	06                   	(bad)  
    3881:	00 00                	add    BYTE PTR [rax],al
    3883:	00 00                	add    BYTE PTR [rax],al
    3885:	00 00                	add    BYTE PTR [rax],al
    3887:	00 02                	add    BYTE PTR [rdx],al
    3889:	00 00                	add    BYTE PTR [rax],al
    388b:	00 00                	add    BYTE PTR [rax],al
    388d:	00 00                	add    BYTE PTR [rax],al
    388f:	00 02                	add    BYTE PTR [rdx],al
    3891:	00 00                	add    BYTE PTR [rax],al
    3893:	00 00                	add    BYTE PTR [rax],al
    3895:	00 00                	add    BYTE PTR [rax],al
    3897:	00 7e 00             	add    BYTE PTR [rsi+0x0],bh
    389a:	00 00                	add    BYTE PTR [rax],al
    389c:	fe                   	(bad)  
    389d:	ff                   	(bad)  
    389e:	ff 6f 02             	jmp    FWORD PTR [rdi+0x2]
    38a1:	00 00                	add    BYTE PTR [rax],al
    38a3:	00 00                	add    BYTE PTR [rax],al
    38a5:	00 00                	add    BYTE PTR [rax],al
    38a7:	00 80 04 40 00 00    	add    BYTE PTR [rax+0x4004],al
    38ad:	00 00                	add    BYTE PTR [rax],al
    38af:	00 80 04 00 00 00    	add    BYTE PTR [rax+0x4],al
    38b5:	00 00                	add    BYTE PTR [rax],al
    38b7:	00 30                	add    BYTE PTR [rax],dh
    38b9:	00 00                	add    BYTE PTR [rax],al
    38bb:	00 00                	add    BYTE PTR [rax],al
    38bd:	00 00                	add    BYTE PTR [rax],al
    38bf:	00 07                	add    BYTE PTR [rdi],al
    38c1:	00 00                	add    BYTE PTR [rax],al
    38c3:	00 01                	add    BYTE PTR [rcx],al
    38c5:	00 00                	add    BYTE PTR [rax],al
    38c7:	00 08                	add    BYTE PTR [rax],cl
	...
    38d5:	00 00                	add    BYTE PTR [rax],al
    38d7:	00 8d 00 00 00 04    	add    BYTE PTR [rbp+0x4000000],cl
    38dd:	00 00                	add    BYTE PTR [rax],al
    38df:	00 02                	add    BYTE PTR [rdx],al
    38e1:	00 00                	add    BYTE PTR [rax],al
    38e3:	00 00                	add    BYTE PTR [rax],al
    38e5:	00 00                	add    BYTE PTR [rax],al
    38e7:	00 b0 04 40 00 00    	add    BYTE PTR [rax+0x4004],dh
    38ed:	00 00                	add    BYTE PTR [rax],al
    38ef:	00 b0 04 00 00 00    	add    BYTE PTR [rax+0x4],dh
    38f5:	00 00                	add    BYTE PTR [rax],al
    38f7:	00 30                	add    BYTE PTR [rax],dh
    38f9:	00 00                	add    BYTE PTR [rax],al
    38fb:	00 00                	add    BYTE PTR [rax],al
    38fd:	00 00                	add    BYTE PTR [rax],al
    38ff:	00 06                	add    BYTE PTR [rsi],al
    3901:	00 00                	add    BYTE PTR [rax],al
    3903:	00 00                	add    BYTE PTR [rax],al
    3905:	00 00                	add    BYTE PTR [rax],al
    3907:	00 08                	add    BYTE PTR [rax],cl
    3909:	00 00                	add    BYTE PTR [rax],al
    390b:	00 00                	add    BYTE PTR [rax],al
    390d:	00 00                	add    BYTE PTR [rax],al
    390f:	00 18                	add    BYTE PTR [rax],bl
    3911:	00 00                	add    BYTE PTR [rax],al
    3913:	00 00                	add    BYTE PTR [rax],al
    3915:	00 00                	add    BYTE PTR [rax],al
    3917:	00 97 00 00 00 04    	add    BYTE PTR [rdi+0x4000000],dl
    391d:	00 00                	add    BYTE PTR [rax],al
    391f:	00 42 00             	add    BYTE PTR [rdx+0x0],al
    3922:	00 00                	add    BYTE PTR [rax],al
    3924:	00 00                	add    BYTE PTR [rax],al
    3926:	00 00                	add    BYTE PTR [rax],al
    3928:	e0 04                	loopne 0x392e
    392a:	40 00 00             	rex add BYTE PTR [rax],al
    392d:	00 00                	add    BYTE PTR [rax],al
    392f:	00 e0                	add    al,ah
    3931:	04 00                	add    al,0x0
    3933:	00 00                	add    BYTE PTR [rax],al
    3935:	00 00                	add    BYTE PTR [rax],al
    3937:	00 18                	add    BYTE PTR [rax],bl
    3939:	00 00                	add    BYTE PTR [rax],al
    393b:	00 00                	add    BYTE PTR [rax],al
    393d:	00 00                	add    BYTE PTR [rax],al
    393f:	00 06                	add    BYTE PTR [rsi],al
    3941:	00 00                	add    BYTE PTR [rax],al
    3943:	00 18                	add    BYTE PTR [rax],bl
    3945:	00 00                	add    BYTE PTR [rax],al
    3947:	00 08                	add    BYTE PTR [rax],cl
    3949:	00 00                	add    BYTE PTR [rax],al
    394b:	00 00                	add    BYTE PTR [rax],al
    394d:	00 00                	add    BYTE PTR [rax],al
    394f:	00 18                	add    BYTE PTR [rax],bl
    3951:	00 00                	add    BYTE PTR [rax],al
    3953:	00 00                	add    BYTE PTR [rax],al
    3955:	00 00                	add    BYTE PTR [rax],al
    3957:	00 a1 00 00 00 01    	add    BYTE PTR [rcx+0x1000000],ah
    395d:	00 00                	add    BYTE PTR [rax],al
    395f:	00 06                	add    BYTE PTR [rsi],al
	...
    3969:	10 40 00             	adc    BYTE PTR [rax+0x0],al
    396c:	00 00                	add    BYTE PTR [rax],al
    396e:	00 00                	add    BYTE PTR [rax],al
    3970:	00 10                	add    BYTE PTR [rax],dl
    3972:	00 00                	add    BYTE PTR [rax],al
    3974:	00 00                	add    BYTE PTR [rax],al
    3976:	00 00                	add    BYTE PTR [rax],al
    3978:	1b 00                	sbb    eax,DWORD PTR [rax]
	...
    3986:	00 00                	add    BYTE PTR [rax],al
    3988:	04 00                	add    al,0x0
	...
    3996:	00 00                	add    BYTE PTR [rax],al
    3998:	9c                   	pushf  
    3999:	00 00                	add    BYTE PTR [rax],al
    399b:	00 01                	add    BYTE PTR [rcx],al
    399d:	00 00                	add    BYTE PTR [rax],al
    399f:	00 06                	add    BYTE PTR [rsi],al
    39a1:	00 00                	add    BYTE PTR [rax],al
    39a3:	00 00                	add    BYTE PTR [rax],al
    39a5:	00 00                	add    BYTE PTR [rax],al
    39a7:	00 20                	add    BYTE PTR [rax],ah
    39a9:	10 40 00             	adc    BYTE PTR [rax+0x0],al
    39ac:	00 00                	add    BYTE PTR [rax],al
    39ae:	00 00                	add    BYTE PTR [rax],al
    39b0:	20 10                	and    BYTE PTR [rax],dl
    39b2:	00 00                	add    BYTE PTR [rax],al
    39b4:	00 00                	add    BYTE PTR [rax],al
    39b6:	00 00                	add    BYTE PTR [rax],al
    39b8:	20 00                	and    BYTE PTR [rax],al
	...
    39c6:	00 00                	add    BYTE PTR [rax],al
    39c8:	10 00                	adc    BYTE PTR [rax],al
    39ca:	00 00                	add    BYTE PTR [rax],al
    39cc:	00 00                	add    BYTE PTR [rax],al
    39ce:	00 00                	add    BYTE PTR [rax],al
    39d0:	10 00                	adc    BYTE PTR [rax],al
    39d2:	00 00                	add    BYTE PTR [rax],al
    39d4:	00 00                	add    BYTE PTR [rax],al
    39d6:	00 00                	add    BYTE PTR [rax],al
    39d8:	a7                   	cmps   DWORD PTR ds:[rsi],DWORD PTR es:[rdi]
    39d9:	00 00                	add    BYTE PTR [rax],al
    39db:	00 01                	add    BYTE PTR [rcx],al
    39dd:	00 00                	add    BYTE PTR [rax],al
    39df:	00 06                	add    BYTE PTR [rsi],al
    39e1:	00 00                	add    BYTE PTR [rax],al
    39e3:	00 00                	add    BYTE PTR [rax],al
    39e5:	00 00                	add    BYTE PTR [rax],al
    39e7:	00 40 10             	add    BYTE PTR [rax+0x10],al
    39ea:	40 00 00             	rex add BYTE PTR [rax],al
    39ed:	00 00                	add    BYTE PTR [rax],al
    39ef:	00 40 10             	add    BYTE PTR [rax+0x10],al
    39f2:	00 00                	add    BYTE PTR [rax],al
    39f4:	00 00                	add    BYTE PTR [rax],al
    39f6:	00 00                	add    BYTE PTR [rax],al
    39f8:	10 00                	adc    BYTE PTR [rax],al
	...
    3a06:	00 00                	add    BYTE PTR [rax],al
    3a08:	10 00                	adc    BYTE PTR [rax],al
    3a0a:	00 00                	add    BYTE PTR [rax],al
    3a0c:	00 00                	add    BYTE PTR [rax],al
    3a0e:	00 00                	add    BYTE PTR [rax],al
    3a10:	10 00                	adc    BYTE PTR [rax],al
    3a12:	00 00                	add    BYTE PTR [rax],al
    3a14:	00 00                	add    BYTE PTR [rax],al
    3a16:	00 00                	add    BYTE PTR [rax],al
    3a18:	b0 00                	mov    al,0x0
    3a1a:	00 00                	add    BYTE PTR [rax],al
    3a1c:	01 00                	add    DWORD PTR [rax],eax
    3a1e:	00 00                	add    BYTE PTR [rax],al
    3a20:	06                   	(bad)  
    3a21:	00 00                	add    BYTE PTR [rax],al
    3a23:	00 00                	add    BYTE PTR [rax],al
    3a25:	00 00                	add    BYTE PTR [rax],al
    3a27:	00 50 10             	add    BYTE PTR [rax+0x10],dl
    3a2a:	40 00 00             	rex add BYTE PTR [rax],al
    3a2d:	00 00                	add    BYTE PTR [rax],al
    3a2f:	00 50 10             	add    BYTE PTR [rax+0x10],dl
    3a32:	00 00                	add    BYTE PTR [rax],al
    3a34:	00 00                	add    BYTE PTR [rax],al
    3a36:	00 00                	add    BYTE PTR [rax],al
    3a38:	01 01                	add    DWORD PTR [rcx],eax
	...
    3a46:	00 00                	add    BYTE PTR [rax],al
    3a48:	10 00                	adc    BYTE PTR [rax],al
	...
    3a56:	00 00                	add    BYTE PTR [rax],al
    3a58:	b6 00                	mov    dh,0x0
    3a5a:	00 00                	add    BYTE PTR [rax],al
    3a5c:	01 00                	add    DWORD PTR [rax],eax
    3a5e:	00 00                	add    BYTE PTR [rax],al
    3a60:	06                   	(bad)  
    3a61:	00 00                	add    BYTE PTR [rax],al
    3a63:	00 00                	add    BYTE PTR [rax],al
    3a65:	00 00                	add    BYTE PTR [rax],al
    3a67:	00 54 11 40          	add    BYTE PTR [rcx+rdx*1+0x40],dl
    3a6b:	00 00                	add    BYTE PTR [rax],al
    3a6d:	00 00                	add    BYTE PTR [rax],al
    3a6f:	00 54 11 00          	add    BYTE PTR [rcx+rdx*1+0x0],dl
    3a73:	00 00                	add    BYTE PTR [rax],al
    3a75:	00 00                	add    BYTE PTR [rax],al
    3a77:	00 0d 00 00 00 00    	add    BYTE PTR [rip+0x0],cl        # 0x3a7d
	...
    3a85:	00 00                	add    BYTE PTR [rax],al
    3a87:	00 04 00             	add    BYTE PTR [rax+rax*1],al
	...
    3a96:	00 00                	add    BYTE PTR [rax],al
    3a98:	bc 00 00 00 01       	mov    esp,0x1000000
    3a9d:	00 00                	add    BYTE PTR [rax],al
    3a9f:	00 02                	add    BYTE PTR [rdx],al
	...
    3aa9:	20 40 00             	and    BYTE PTR [rax+0x0],al
    3aac:	00 00                	add    BYTE PTR [rax],al
    3aae:	00 00                	add    BYTE PTR [rax],al
    3ab0:	00 20                	add    BYTE PTR [rax],ah
    3ab2:	00 00                	add    BYTE PTR [rax],al
    3ab4:	00 00                	add    BYTE PTR [rax],al
    3ab6:	00 00                	add    BYTE PTR [rax],al
    3ab8:	12 00                	adc    al,BYTE PTR [rax]
	...
    3ac6:	00 00                	add    BYTE PTR [rax],al
    3ac8:	04 00                	add    al,0x0
	...
    3ad6:	00 00                	add    BYTE PTR [rax],al
    3ad8:	c4                   	(bad)  
    3ad9:	00 00                	add    BYTE PTR [rax],al
    3adb:	00 01                	add    BYTE PTR [rcx],al
    3add:	00 00                	add    BYTE PTR [rax],al
    3adf:	00 02                	add    BYTE PTR [rdx],al
    3ae1:	00 00                	add    BYTE PTR [rax],al
    3ae3:	00 00                	add    BYTE PTR [rax],al
    3ae5:	00 00                	add    BYTE PTR [rax],al
    3ae7:	00 14 20             	add    BYTE PTR [rax+riz*1],dl
    3aea:	40 00 00             	rex add BYTE PTR [rax],al
    3aed:	00 00                	add    BYTE PTR [rax],al
    3aef:	00 14 20             	add    BYTE PTR [rax+riz*1],dl
    3af2:	00 00                	add    BYTE PTR [rax],al
    3af4:	00 00                	add    BYTE PTR [rax],al
    3af6:	00 00                	add    BYTE PTR [rax],al
    3af8:	34 00                	xor    al,0x0
	...
    3b06:	00 00                	add    BYTE PTR [rax],al
    3b08:	04 00                	add    al,0x0
	...
    3b16:	00 00                	add    BYTE PTR [rax],al
    3b18:	d2 00                	rol    BYTE PTR [rax],cl
    3b1a:	00 00                	add    BYTE PTR [rax],al
    3b1c:	01 00                	add    DWORD PTR [rax],eax
    3b1e:	00 00                	add    BYTE PTR [rax],al
    3b20:	02 00                	add    al,BYTE PTR [rax]
    3b22:	00 00                	add    BYTE PTR [rax],al
    3b24:	00 00                	add    BYTE PTR [rax],al
    3b26:	00 00                	add    BYTE PTR [rax],al
    3b28:	48 20 40 00          	rex.W and BYTE PTR [rax+0x0],al
    3b2c:	00 00                	add    BYTE PTR [rax],al
    3b2e:	00 00                	add    BYTE PTR [rax],al
    3b30:	48 20 00             	rex.W and BYTE PTR [rax],al
    3b33:	00 00                	add    BYTE PTR [rax],al
    3b35:	00 00                	add    BYTE PTR [rax],al
    3b37:	00 a4 00 00 00 00 00 	add    BYTE PTR [rax+rax*1+0x0],ah
	...
    3b46:	00 00                	add    BYTE PTR [rax],al
    3b48:	08 00                	or     BYTE PTR [rax],al
	...
    3b56:	00 00                	add    BYTE PTR [rax],al
    3b58:	dc 00                	fadd   QWORD PTR [rax]
    3b5a:	00 00                	add    BYTE PTR [rax],al
    3b5c:	0e                   	(bad)  
    3b5d:	00 00                	add    BYTE PTR [rax],al
    3b5f:	00 03                	add    BYTE PTR [rbx],al
    3b61:	00 00                	add    BYTE PTR [rax],al
    3b63:	00 00                	add    BYTE PTR [rax],al
    3b65:	00 00                	add    BYTE PTR [rax],al
    3b67:	00 10                	add    BYTE PTR [rax],dl
    3b69:	3e 40 00 00          	ds rex add BYTE PTR [rax],al
    3b6d:	00 00                	add    BYTE PTR [rax],al
    3b6f:	00 10                	add    BYTE PTR [rax],dl
    3b71:	2e 00 00             	cs add BYTE PTR [rax],al
    3b74:	00 00                	add    BYTE PTR [rax],al
    3b76:	00 00                	add    BYTE PTR [rax],al
    3b78:	08 00                	or     BYTE PTR [rax],al
	...
    3b86:	00 00                	add    BYTE PTR [rax],al
    3b88:	08 00                	or     BYTE PTR [rax],al
    3b8a:	00 00                	add    BYTE PTR [rax],al
    3b8c:	00 00                	add    BYTE PTR [rax],al
    3b8e:	00 00                	add    BYTE PTR [rax],al
    3b90:	08 00                	or     BYTE PTR [rax],al
    3b92:	00 00                	add    BYTE PTR [rax],al
    3b94:	00 00                	add    BYTE PTR [rax],al
    3b96:	00 00                	add    BYTE PTR [rax],al
    3b98:	e8 00 00 00 0f       	call   0xf003b9d
    3b9d:	00 00                	add    BYTE PTR [rax],al
    3b9f:	00 03                	add    BYTE PTR [rbx],al
    3ba1:	00 00                	add    BYTE PTR [rax],al
    3ba3:	00 00                	add    BYTE PTR [rax],al
    3ba5:	00 00                	add    BYTE PTR [rax],al
    3ba7:	00 18                	add    BYTE PTR [rax],bl
    3ba9:	3e 40 00 00          	ds rex add BYTE PTR [rax],al
    3bad:	00 00                	add    BYTE PTR [rax],al
    3baf:	00 18                	add    BYTE PTR [rax],bl
    3bb1:	2e 00 00             	cs add BYTE PTR [rax],al
    3bb4:	00 00                	add    BYTE PTR [rax],al
    3bb6:	00 00                	add    BYTE PTR [rax],al
    3bb8:	08 00                	or     BYTE PTR [rax],al
	...
    3bc6:	00 00                	add    BYTE PTR [rax],al
    3bc8:	08 00                	or     BYTE PTR [rax],al
    3bca:	00 00                	add    BYTE PTR [rax],al
    3bcc:	00 00                	add    BYTE PTR [rax],al
    3bce:	00 00                	add    BYTE PTR [rax],al
    3bd0:	08 00                	or     BYTE PTR [rax],al
    3bd2:	00 00                	add    BYTE PTR [rax],al
    3bd4:	00 00                	add    BYTE PTR [rax],al
    3bd6:	00 00                	add    BYTE PTR [rax],al
    3bd8:	f4                   	hlt    
    3bd9:	00 00                	add    BYTE PTR [rax],al
    3bdb:	00 06                	add    BYTE PTR [rsi],al
    3bdd:	00 00                	add    BYTE PTR [rax],al
    3bdf:	00 03                	add    BYTE PTR [rbx],al
    3be1:	00 00                	add    BYTE PTR [rax],al
    3be3:	00 00                	add    BYTE PTR [rax],al
    3be5:	00 00                	add    BYTE PTR [rax],al
    3be7:	00 20                	add    BYTE PTR [rax],ah
    3be9:	3e 40 00 00          	ds rex add BYTE PTR [rax],al
    3bed:	00 00                	add    BYTE PTR [rax],al
    3bef:	00 20                	add    BYTE PTR [rax],ah
    3bf1:	2e 00 00             	cs add BYTE PTR [rax],al
    3bf4:	00 00                	add    BYTE PTR [rax],al
    3bf6:	00 00                	add    BYTE PTR [rax],al
    3bf8:	d0 01                	rol    BYTE PTR [rcx],1
    3bfa:	00 00                	add    BYTE PTR [rax],al
    3bfc:	00 00                	add    BYTE PTR [rax],al
    3bfe:	00 00                	add    BYTE PTR [rax],al
    3c00:	07                   	(bad)  
    3c01:	00 00                	add    BYTE PTR [rax],al
    3c03:	00 00                	add    BYTE PTR [rax],al
    3c05:	00 00                	add    BYTE PTR [rax],al
    3c07:	00 08                	add    BYTE PTR [rax],cl
    3c09:	00 00                	add    BYTE PTR [rax],al
    3c0b:	00 00                	add    BYTE PTR [rax],al
    3c0d:	00 00                	add    BYTE PTR [rax],al
    3c0f:	00 10                	add    BYTE PTR [rax],dl
    3c11:	00 00                	add    BYTE PTR [rax],al
    3c13:	00 00                	add    BYTE PTR [rax],al
    3c15:	00 00                	add    BYTE PTR [rax],al
    3c17:	00 fd                	add    ch,bh
    3c19:	00 00                	add    BYTE PTR [rax],al
    3c1b:	00 01                	add    BYTE PTR [rcx],al
    3c1d:	00 00                	add    BYTE PTR [rax],al
    3c1f:	00 03                	add    BYTE PTR [rbx],al
    3c21:	00 00                	add    BYTE PTR [rax],al
    3c23:	00 00                	add    BYTE PTR [rax],al
    3c25:	00 00                	add    BYTE PTR [rax],al
    3c27:	00 f0                	add    al,dh
    3c29:	3f                   	(bad)  
    3c2a:	40 00 00             	rex add BYTE PTR [rax],al
    3c2d:	00 00                	add    BYTE PTR [rax],al
    3c2f:	00 f0                	add    al,dh
    3c31:	2f                   	(bad)  
    3c32:	00 00                	add    BYTE PTR [rax],al
    3c34:	00 00                	add    BYTE PTR [rax],al
    3c36:	00 00                	add    BYTE PTR [rax],al
    3c38:	10 00                	adc    BYTE PTR [rax],al
	...
    3c46:	00 00                	add    BYTE PTR [rax],al
    3c48:	08 00                	or     BYTE PTR [rax],al
    3c4a:	00 00                	add    BYTE PTR [rax],al
    3c4c:	00 00                	add    BYTE PTR [rax],al
    3c4e:	00 00                	add    BYTE PTR [rax],al
    3c50:	08 00                	or     BYTE PTR [rax],al
    3c52:	00 00                	add    BYTE PTR [rax],al
    3c54:	00 00                	add    BYTE PTR [rax],al
    3c56:	00 00                	add    BYTE PTR [rax],al
    3c58:	02 01                	add    al,BYTE PTR [rcx]
    3c5a:	00 00                	add    BYTE PTR [rax],al
    3c5c:	01 00                	add    DWORD PTR [rax],eax
    3c5e:	00 00                	add    BYTE PTR [rax],al
    3c60:	03 00                	add    eax,DWORD PTR [rax]
    3c62:	00 00                	add    BYTE PTR [rax],al
    3c64:	00 00                	add    BYTE PTR [rax],al
    3c66:	00 00                	add    BYTE PTR [rax],al
    3c68:	00 40 40             	add    BYTE PTR [rax+0x40],al
    3c6b:	00 00                	add    BYTE PTR [rax],al
    3c6d:	00 00                	add    BYTE PTR [rax],al
    3c6f:	00 00                	add    BYTE PTR [rax],al
    3c71:	30 00                	xor    BYTE PTR [rax],al
    3c73:	00 00                	add    BYTE PTR [rax],al
    3c75:	00 00                	add    BYTE PTR [rax],al
    3c77:	00 20                	add    BYTE PTR [rax],ah
	...
    3c85:	00 00                	add    BYTE PTR [rax],al
    3c87:	00 08                	add    BYTE PTR [rax],cl
    3c89:	00 00                	add    BYTE PTR [rax],al
    3c8b:	00 00                	add    BYTE PTR [rax],al
    3c8d:	00 00                	add    BYTE PTR [rax],al
    3c8f:	00 08                	add    BYTE PTR [rax],cl
    3c91:	00 00                	add    BYTE PTR [rax],al
    3c93:	00 00                	add    BYTE PTR [rax],al
    3c95:	00 00                	add    BYTE PTR [rax],al
    3c97:	00 0b                	add    BYTE PTR [rbx],cl
    3c99:	01 00                	add    DWORD PTR [rax],eax
    3c9b:	00 01                	add    BYTE PTR [rcx],al
    3c9d:	00 00                	add    BYTE PTR [rax],al
    3c9f:	00 03                	add    BYTE PTR [rbx],al
    3ca1:	00 00                	add    BYTE PTR [rax],al
    3ca3:	00 00                	add    BYTE PTR [rax],al
    3ca5:	00 00                	add    BYTE PTR [rax],al
    3ca7:	00 20                	add    BYTE PTR [rax],ah
    3ca9:	40                   	rex
    3caa:	40 00 00             	rex add BYTE PTR [rax],al
    3cad:	00 00                	add    BYTE PTR [rax],al
    3caf:	00 20                	add    BYTE PTR [rax],ah
    3cb1:	30 00                	xor    BYTE PTR [rax],al
    3cb3:	00 00                	add    BYTE PTR [rax],al
    3cb5:	00 00                	add    BYTE PTR [rax],al
    3cb7:	00 10                	add    BYTE PTR [rax],dl
	...
    3cc5:	00 00                	add    BYTE PTR [rax],al
    3cc7:	00 08                	add    BYTE PTR [rax],cl
	...
    3cd5:	00 00                	add    BYTE PTR [rax],al
    3cd7:	00 11                	add    BYTE PTR [rcx],dl
    3cd9:	01 00                	add    DWORD PTR [rax],eax
    3cdb:	00 08                	add    BYTE PTR [rax],cl
    3cdd:	00 00                	add    BYTE PTR [rax],al
    3cdf:	00 03                	add    BYTE PTR [rbx],al
    3ce1:	00 00                	add    BYTE PTR [rax],al
    3ce3:	00 00                	add    BYTE PTR [rax],al
    3ce5:	00 00                	add    BYTE PTR [rax],al
    3ce7:	00 30                	add    BYTE PTR [rax],dh
    3ce9:	40                   	rex
    3cea:	40 00 00             	rex add BYTE PTR [rax],al
    3ced:	00 00                	add    BYTE PTR [rax],al
    3cef:	00 30                	add    BYTE PTR [rax],dh
    3cf1:	30 00                	xor    BYTE PTR [rax],al
    3cf3:	00 00                	add    BYTE PTR [rax],al
    3cf5:	00 00                	add    BYTE PTR [rax],al
    3cf7:	00 08                	add    BYTE PTR [rax],cl
	...
    3d05:	00 00                	add    BYTE PTR [rax],al
    3d07:	00 01                	add    BYTE PTR [rcx],al
	...
    3d15:	00 00                	add    BYTE PTR [rax],al
    3d17:	00 16                	add    BYTE PTR [rsi],dl
    3d19:	01 00                	add    DWORD PTR [rax],eax
    3d1b:	00 01                	add    BYTE PTR [rcx],al
    3d1d:	00 00                	add    BYTE PTR [rax],al
    3d1f:	00 30                	add    BYTE PTR [rax],dh
	...
    3d2d:	00 00                	add    BYTE PTR [rax],al
    3d2f:	00 30                	add    BYTE PTR [rax],dh
    3d31:	30 00                	xor    BYTE PTR [rax],al
    3d33:	00 00                	add    BYTE PTR [rax],al
    3d35:	00 00                	add    BYTE PTR [rax],al
    3d37:	00 2b                	add    BYTE PTR [rbx],ch
	...
    3d45:	00 00                	add    BYTE PTR [rax],al
    3d47:	00 01                	add    BYTE PTR [rcx],al
    3d49:	00 00                	add    BYTE PTR [rax],al
    3d4b:	00 00                	add    BYTE PTR [rax],al
    3d4d:	00 00                	add    BYTE PTR [rax],al
    3d4f:	00 01                	add    BYTE PTR [rcx],al
    3d51:	00 00                	add    BYTE PTR [rax],al
    3d53:	00 00                	add    BYTE PTR [rax],al
    3d55:	00 00                	add    BYTE PTR [rax],al
    3d57:	00 01                	add    BYTE PTR [rcx],al
    3d59:	00 00                	add    BYTE PTR [rax],al
    3d5b:	00 02                	add    BYTE PTR [rdx],al
	...
    3d6d:	00 00                	add    BYTE PTR [rax],al
    3d6f:	00 60 30             	add    BYTE PTR [rax+0x30],ah
    3d72:	00 00                	add    BYTE PTR [rax],al
    3d74:	00 00                	add    BYTE PTR [rax],al
    3d76:	00 00                	add    BYTE PTR [rax],al
    3d78:	30 03                	xor    BYTE PTR [rbx],al
    3d7a:	00 00                	add    BYTE PTR [rax],al
    3d7c:	00 00                	add    BYTE PTR [rax],al
    3d7e:	00 00                	add    BYTE PTR [rax],al
    3d80:	1d 00 00 00 12       	sbb    eax,0x12000000
    3d85:	00 00                	add    BYTE PTR [rax],al
    3d87:	00 08                	add    BYTE PTR [rax],cl
    3d89:	00 00                	add    BYTE PTR [rax],al
    3d8b:	00 00                	add    BYTE PTR [rax],al
    3d8d:	00 00                	add    BYTE PTR [rax],al
    3d8f:	00 18                	add    BYTE PTR [rax],bl
    3d91:	00 00                	add    BYTE PTR [rax],al
    3d93:	00 00                	add    BYTE PTR [rax],al
    3d95:	00 00                	add    BYTE PTR [rax],al
    3d97:	00 09                	add    BYTE PTR [rcx],cl
    3d99:	00 00                	add    BYTE PTR [rax],al
    3d9b:	00 03                	add    BYTE PTR [rbx],al
	...
    3dad:	00 00                	add    BYTE PTR [rax],al
    3daf:	00 90 33 00 00 00    	add    BYTE PTR [rax+0x33],dl
    3db5:	00 00                	add    BYTE PTR [rax],al
    3db7:	00 a2 01 00 00 00    	add    BYTE PTR [rdx+0x1],ah
	...
    3dc5:	00 00                	add    BYTE PTR [rax],al
    3dc7:	00 01                	add    BYTE PTR [rcx],al
	...
    3dd5:	00 00                	add    BYTE PTR [rax],al
    3dd7:	00 11                	add    BYTE PTR [rcx],dl
    3dd9:	00 00                	add    BYTE PTR [rax],al
    3ddb:	00 03                	add    BYTE PTR [rbx],al
	...
    3ded:	00 00                	add    BYTE PTR [rax],al
    3def:	00 32                	add    BYTE PTR [rdx],dh
    3df1:	35 00 00 00 00       	xor    eax,0x0
    3df6:	00 00                	add    BYTE PTR [rax],al
    3df8:	1f                   	(bad)  
    3df9:	01 00                	add    DWORD PTR [rax],eax
	...
    3e07:	00 01                	add    BYTE PTR [rcx],al
	...
