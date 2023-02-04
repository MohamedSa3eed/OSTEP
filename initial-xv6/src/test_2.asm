
_test_2:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	8d 75 84             	lea    -0x7c(%ebp),%esi
  12:	53                   	push   %ebx
    int x1 = getreadcount();

    int rc = fork();
  13:	bb a0 86 01 00       	mov    $0x186a0,%ebx
main(int argc, char *argv[]) {
  18:	51                   	push   %ecx
  19:	81 ec 88 00 00 00    	sub    $0x88,%esp
    int x1 = getreadcount();
  1f:	e8 4f 03 00 00       	call   373 <getreadcount>
  24:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    int rc = fork();
  2a:	e8 9c 02 00 00       	call   2cb <fork>
  2f:	89 c7                	mov    %eax,%edi

    int total = 0;
    int i;
    for (i = 0; i < 100000; i++) {
  31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	char buf[100];
	(void) read(4, buf, 1);
  38:	83 ec 04             	sub    $0x4,%esp
  3b:	6a 01                	push   $0x1
  3d:	56                   	push   %esi
  3e:	6a 04                	push   $0x4
  40:	e8 a6 02 00 00       	call   2eb <read>
    for (i = 0; i < 100000; i++) {
  45:	83 c4 10             	add    $0x10,%esp
  48:	83 eb 01             	sub    $0x1,%ebx
  4b:	75 eb                	jne    38 <main+0x38>
    }
    // https://wiki.osdev.org/Shutdown
    // (void) shutdown();

    if (rc > 0) {
  4d:	85 ff                	test   %edi,%edi
  4f:	7e 23                	jle    74 <main+0x74>
	(void) wait();
  51:	e8 85 02 00 00       	call   2db <wait>
	int x2 = getreadcount();
  56:	e8 18 03 00 00       	call   373 <getreadcount>
	total += (x2 - x1);
	printf(1, "XV6_TEST_OUTPUT %d\n", total);
  5b:	52                   	push   %edx
	total += (x2 - x1);
  5c:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
  62:	29 d0                	sub    %edx,%eax
	printf(1, "XV6_TEST_OUTPUT %d\n", total);
  64:	50                   	push   %eax
  65:	68 58 07 00 00       	push   $0x758
  6a:	6a 01                	push   $0x1
  6c:	e8 bf 03 00 00       	call   430 <printf>
  71:	83 c4 10             	add    $0x10,%esp
    }
    exit();
  74:	e8 5a 02 00 00       	call   2d3 <exit>
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <strcpy>:
  80:	55                   	push   %ebp
  81:	31 c0                	xor    %eax,%eax
  83:	89 e5                	mov    %esp,%ebp
  85:	53                   	push   %ebx
  86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  90:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  94:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  97:	83 c0 01             	add    $0x1,%eax
  9a:	84 d2                	test   %dl,%dl
  9c:	75 f2                	jne    90 <strcpy+0x10>
  9e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  a1:	89 c8                	mov    %ecx,%eax
  a3:	c9                   	leave
  a4:	c3                   	ret
  a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000b0 <strcmp>:
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	8b 55 08             	mov    0x8(%ebp),%edx
  b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ba:	0f b6 02             	movzbl (%edx),%eax
  bd:	84 c0                	test   %al,%al
  bf:	75 17                	jne    d8 <strcmp+0x28>
  c1:	eb 3a                	jmp    fd <strcmp+0x4d>
  c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  c7:	90                   	nop
  c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  cc:	83 c2 01             	add    $0x1,%edx
  cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  d2:	84 c0                	test   %al,%al
  d4:	74 1a                	je     f0 <strcmp+0x40>
  d6:	89 d9                	mov    %ebx,%ecx
  d8:	0f b6 19             	movzbl (%ecx),%ebx
  db:	38 c3                	cmp    %al,%bl
  dd:	74 e9                	je     c8 <strcmp+0x18>
  df:	29 d8                	sub    %ebx,%eax
  e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e4:	c9                   	leave
  e5:	c3                   	ret
  e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  f4:	31 c0                	xor    %eax,%eax
  f6:	29 d8                	sub    %ebx,%eax
  f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  fb:	c9                   	leave
  fc:	c3                   	ret
  fd:	0f b6 19             	movzbl (%ecx),%ebx
 100:	31 c0                	xor    %eax,%eax
 102:	eb db                	jmp    df <strcmp+0x2f>
 104:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 10f:	90                   	nop

00000110 <strlen>:
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 55 08             	mov    0x8(%ebp),%edx
 116:	80 3a 00             	cmpb   $0x0,(%edx)
 119:	74 15                	je     130 <strlen+0x20>
 11b:	31 c0                	xor    %eax,%eax
 11d:	8d 76 00             	lea    0x0(%esi),%esi
 120:	83 c0 01             	add    $0x1,%eax
 123:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 127:	89 c1                	mov    %eax,%ecx
 129:	75 f5                	jne    120 <strlen+0x10>
 12b:	89 c8                	mov    %ecx,%eax
 12d:	5d                   	pop    %ebp
 12e:	c3                   	ret
 12f:	90                   	nop
 130:	31 c9                	xor    %ecx,%ecx
 132:	5d                   	pop    %ebp
 133:	89 c8                	mov    %ecx,%eax
 135:	c3                   	ret
 136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13d:	8d 76 00             	lea    0x0(%esi),%esi

00000140 <memset>:
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	8b 55 08             	mov    0x8(%ebp),%edx
 147:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14a:	8b 45 0c             	mov    0xc(%ebp),%eax
 14d:	89 d7                	mov    %edx,%edi
 14f:	fc                   	cld
 150:	f3 aa                	rep stos %al,%es:(%edi)
 152:	8b 7d fc             	mov    -0x4(%ebp),%edi
 155:	89 d0                	mov    %edx,%eax
 157:	c9                   	leave
 158:	c3                   	ret
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000160 <strchr>:
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 16a:	0f b6 10             	movzbl (%eax),%edx
 16d:	84 d2                	test   %dl,%dl
 16f:	75 12                	jne    183 <strchr+0x23>
 171:	eb 1d                	jmp    190 <strchr+0x30>
 173:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 177:	90                   	nop
 178:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 17c:	83 c0 01             	add    $0x1,%eax
 17f:	84 d2                	test   %dl,%dl
 181:	74 0d                	je     190 <strchr+0x30>
 183:	38 d1                	cmp    %dl,%cl
 185:	75 f1                	jne    178 <strchr+0x18>
 187:	5d                   	pop    %ebp
 188:	c3                   	ret
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 190:	31 c0                	xor    %eax,%eax
 192:	5d                   	pop    %ebp
 193:	c3                   	ret
 194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 19f:	90                   	nop

000001a0 <gets>:
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
 1a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
 1a8:	53                   	push   %ebx
 1a9:	31 db                	xor    %ebx,%ebx
 1ab:	83 ec 1c             	sub    $0x1c,%esp
 1ae:	eb 27                	jmp    1d7 <gets+0x37>
 1b0:	83 ec 04             	sub    $0x4,%esp
 1b3:	6a 01                	push   $0x1
 1b5:	57                   	push   %edi
 1b6:	6a 00                	push   $0x0
 1b8:	e8 2e 01 00 00       	call   2eb <read>
 1bd:	83 c4 10             	add    $0x10,%esp
 1c0:	85 c0                	test   %eax,%eax
 1c2:	7e 1d                	jle    1e1 <gets+0x41>
 1c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1c8:	8b 55 08             	mov    0x8(%ebp),%edx
 1cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 1cf:	3c 0a                	cmp    $0xa,%al
 1d1:	74 1d                	je     1f0 <gets+0x50>
 1d3:	3c 0d                	cmp    $0xd,%al
 1d5:	74 19                	je     1f0 <gets+0x50>
 1d7:	89 de                	mov    %ebx,%esi
 1d9:	83 c3 01             	add    $0x1,%ebx
 1dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1df:	7c cf                	jl     1b0 <gets+0x10>
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 1e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1eb:	5b                   	pop    %ebx
 1ec:	5e                   	pop    %esi
 1ed:	5f                   	pop    %edi
 1ee:	5d                   	pop    %ebp
 1ef:	c3                   	ret
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	89 de                	mov    %ebx,%esi
 1f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 1f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fc:	5b                   	pop    %ebx
 1fd:	5e                   	pop    %esi
 1fe:	5f                   	pop    %edi
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 208:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <stat>:
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
 215:	83 ec 08             	sub    $0x8,%esp
 218:	6a 00                	push   $0x0
 21a:	ff 75 08             	push   0x8(%ebp)
 21d:	e8 f1 00 00 00       	call   313 <open>
 222:	83 c4 10             	add    $0x10,%esp
 225:	85 c0                	test   %eax,%eax
 227:	78 27                	js     250 <stat+0x40>
 229:	83 ec 08             	sub    $0x8,%esp
 22c:	ff 75 0c             	push   0xc(%ebp)
 22f:	89 c3                	mov    %eax,%ebx
 231:	50                   	push   %eax
 232:	e8 f4 00 00 00       	call   32b <fstat>
 237:	89 1c 24             	mov    %ebx,(%esp)
 23a:	89 c6                	mov    %eax,%esi
 23c:	e8 ba 00 00 00       	call   2fb <close>
 241:	83 c4 10             	add    $0x10,%esp
 244:	8d 65 f8             	lea    -0x8(%ebp),%esp
 247:	89 f0                	mov    %esi,%eax
 249:	5b                   	pop    %ebx
 24a:	5e                   	pop    %esi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret
 24d:	8d 76 00             	lea    0x0(%esi),%esi
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb ed                	jmp    244 <stat+0x34>
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax

00000260 <atoi>:
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	53                   	push   %ebx
 264:	8b 55 08             	mov    0x8(%ebp),%edx
 267:	0f be 02             	movsbl (%edx),%eax
 26a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 26d:	80 f9 09             	cmp    $0x9,%cl
 270:	b9 00 00 00 00       	mov    $0x0,%ecx
 275:	77 1e                	ja     295 <atoi+0x35>
 277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27e:	66 90                	xchg   %ax,%ax
 280:	83 c2 01             	add    $0x1,%edx
 283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 28a:	0f be 02             	movsbl (%edx),%eax
 28d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 290:	80 fb 09             	cmp    $0x9,%bl
 293:	76 eb                	jbe    280 <atoi+0x20>
 295:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 298:	89 c8                	mov    %ecx,%eax
 29a:	c9                   	leave
 29b:	c3                   	ret
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002a0 <memmove>:
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	8b 45 10             	mov    0x10(%ebp),%eax
 2a7:	8b 55 08             	mov    0x8(%ebp),%edx
 2aa:	56                   	push   %esi
 2ab:	8b 75 0c             	mov    0xc(%ebp),%esi
 2ae:	85 c0                	test   %eax,%eax
 2b0:	7e 13                	jle    2c5 <memmove+0x25>
 2b2:	01 d0                	add    %edx,%eax
 2b4:	89 d7                	mov    %edx,%edi
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
 2c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 2c1:	39 f8                	cmp    %edi,%eax
 2c3:	75 fb                	jne    2c0 <memmove+0x20>
 2c5:	5e                   	pop    %esi
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret

000002cb <fork>:
 2cb:	b8 01 00 00 00       	mov    $0x1,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret

000002d3 <exit>:
 2d3:	b8 02 00 00 00       	mov    $0x2,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret

000002db <wait>:
 2db:	b8 03 00 00 00       	mov    $0x3,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret

000002e3 <pipe>:
 2e3:	b8 04 00 00 00       	mov    $0x4,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret

000002eb <read>:
 2eb:	b8 05 00 00 00       	mov    $0x5,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret

000002f3 <write>:
 2f3:	b8 10 00 00 00       	mov    $0x10,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret

000002fb <close>:
 2fb:	b8 15 00 00 00       	mov    $0x15,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret

00000303 <kill>:
 303:	b8 06 00 00 00       	mov    $0x6,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret

0000030b <exec>:
 30b:	b8 07 00 00 00       	mov    $0x7,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret

00000313 <open>:
 313:	b8 0f 00 00 00       	mov    $0xf,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret

0000031b <mknod>:
 31b:	b8 11 00 00 00       	mov    $0x11,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret

00000323 <unlink>:
 323:	b8 12 00 00 00       	mov    $0x12,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret

0000032b <fstat>:
 32b:	b8 08 00 00 00       	mov    $0x8,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <link>:
 333:	b8 13 00 00 00       	mov    $0x13,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret

0000033b <mkdir>:
 33b:	b8 14 00 00 00       	mov    $0x14,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <chdir>:
 343:	b8 09 00 00 00       	mov    $0x9,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <dup>:
 34b:	b8 0a 00 00 00       	mov    $0xa,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <getpid>:
 353:	b8 0b 00 00 00       	mov    $0xb,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret

0000035b <sbrk>:
 35b:	b8 0c 00 00 00       	mov    $0xc,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret

00000363 <sleep>:
 363:	b8 0d 00 00 00       	mov    $0xd,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret

0000036b <uptime>:
 36b:	b8 0e 00 00 00       	mov    $0xe,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret

00000373 <getreadcount>:
 373:	b8 16 00 00 00       	mov    $0x16,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret
 37b:	66 90                	xchg   %ax,%ax
 37d:	66 90                	xchg   %ax,%ax
 37f:	90                   	nop

00000380 <printint>:
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	53                   	push   %ebx
 386:	83 ec 3c             	sub    $0x3c,%esp
 389:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
 38c:	89 d1                	mov    %edx,%ecx
 38e:	89 45 b8             	mov    %eax,-0x48(%ebp)
 391:	85 d2                	test   %edx,%edx
 393:	0f 89 7f 00 00 00    	jns    418 <printint+0x98>
 399:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 39d:	74 79                	je     418 <printint+0x98>
 39f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
 3a6:	f7 d9                	neg    %ecx
 3a8:	31 db                	xor    %ebx,%ebx
 3aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
 3b0:	89 c8                	mov    %ecx,%eax
 3b2:	31 d2                	xor    %edx,%edx
 3b4:	89 cf                	mov    %ecx,%edi
 3b6:	f7 75 c4             	divl   -0x3c(%ebp)
 3b9:	0f b6 92 cc 07 00 00 	movzbl 0x7cc(%edx),%edx
 3c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3c3:	89 d8                	mov    %ebx,%eax
 3c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
 3c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
 3cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
 3ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3d1:	76 dd                	jbe    3b0 <printint+0x30>
 3d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3d6:	85 c9                	test   %ecx,%ecx
 3d8:	74 0c                	je     3e6 <printint+0x66>
 3da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3df:	89 d8                	mov    %ebx,%eax
 3e1:	ba 2d 00 00 00       	mov    $0x2d,%edx
 3e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 3e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3ed:	eb 07                	jmp    3f6 <printint+0x76>
 3ef:	90                   	nop
 3f0:	0f b6 13             	movzbl (%ebx),%edx
 3f3:	83 eb 01             	sub    $0x1,%ebx
 3f6:	83 ec 04             	sub    $0x4,%esp
 3f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3fc:	6a 01                	push   $0x1
 3fe:	56                   	push   %esi
 3ff:	57                   	push   %edi
 400:	e8 ee fe ff ff       	call   2f3 <write>
 405:	83 c4 10             	add    $0x10,%esp
 408:	39 de                	cmp    %ebx,%esi
 40a:	75 e4                	jne    3f0 <printint+0x70>
 40c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40f:	5b                   	pop    %ebx
 410:	5e                   	pop    %esi
 411:	5f                   	pop    %edi
 412:	5d                   	pop    %ebp
 413:	c3                   	ret
 414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 418:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 41f:	eb 87                	jmp    3a8 <printint+0x28>
 421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 428:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop

00000430 <printf>:
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 2c             	sub    $0x2c,%esp
 439:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 43c:	8b 75 08             	mov    0x8(%ebp),%esi
 43f:	0f b6 13             	movzbl (%ebx),%edx
 442:	84 d2                	test   %dl,%dl
 444:	74 6a                	je     4b0 <printf+0x80>
 446:	8d 45 10             	lea    0x10(%ebp),%eax
 449:	83 c3 01             	add    $0x1,%ebx
 44c:	8d 7d e7             	lea    -0x19(%ebp),%edi
 44f:	31 c9                	xor    %ecx,%ecx
 451:	89 45 d0             	mov    %eax,-0x30(%ebp)
 454:	eb 36                	jmp    48c <printf+0x5c>
 456:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45d:	8d 76 00             	lea    0x0(%esi),%esi
 460:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 463:	b9 25 00 00 00       	mov    $0x25,%ecx
 468:	83 f8 25             	cmp    $0x25,%eax
 46b:	74 15                	je     482 <printf+0x52>
 46d:	83 ec 04             	sub    $0x4,%esp
 470:	88 55 e7             	mov    %dl,-0x19(%ebp)
 473:	6a 01                	push   $0x1
 475:	57                   	push   %edi
 476:	56                   	push   %esi
 477:	e8 77 fe ff ff       	call   2f3 <write>
 47c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 47f:	83 c4 10             	add    $0x10,%esp
 482:	0f b6 13             	movzbl (%ebx),%edx
 485:	83 c3 01             	add    $0x1,%ebx
 488:	84 d2                	test   %dl,%dl
 48a:	74 24                	je     4b0 <printf+0x80>
 48c:	0f b6 c2             	movzbl %dl,%eax
 48f:	85 c9                	test   %ecx,%ecx
 491:	74 cd                	je     460 <printf+0x30>
 493:	83 f9 25             	cmp    $0x25,%ecx
 496:	75 ea                	jne    482 <printf+0x52>
 498:	83 f8 25             	cmp    $0x25,%eax
 49b:	0f 84 07 01 00 00    	je     5a8 <printf+0x178>
 4a1:	83 e8 63             	sub    $0x63,%eax
 4a4:	83 f8 15             	cmp    $0x15,%eax
 4a7:	77 17                	ja     4c0 <printf+0x90>
 4a9:	ff 24 85 74 07 00 00 	jmp    *0x774(,%eax,4)
 4b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b3:	5b                   	pop    %ebx
 4b4:	5e                   	pop    %esi
 4b5:	5f                   	pop    %edi
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret
 4b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4bf:	90                   	nop
 4c0:	83 ec 04             	sub    $0x4,%esp
 4c3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 4c6:	6a 01                	push   $0x1
 4c8:	57                   	push   %edi
 4c9:	56                   	push   %esi
 4ca:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4ce:	e8 20 fe ff ff       	call   2f3 <write>
 4d3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
 4d7:	83 c4 0c             	add    $0xc,%esp
 4da:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4dd:	6a 01                	push   $0x1
 4df:	57                   	push   %edi
 4e0:	56                   	push   %esi
 4e1:	e8 0d fe ff ff       	call   2f3 <write>
 4e6:	83 c4 10             	add    $0x10,%esp
 4e9:	31 c9                	xor    %ecx,%ecx
 4eb:	eb 95                	jmp    482 <printf+0x52>
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
 4f0:	83 ec 0c             	sub    $0xc,%esp
 4f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4f8:	6a 00                	push   $0x0
 4fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4fd:	8b 10                	mov    (%eax),%edx
 4ff:	89 f0                	mov    %esi,%eax
 501:	e8 7a fe ff ff       	call   380 <printint>
 506:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 50a:	83 c4 10             	add    $0x10,%esp
 50d:	31 c9                	xor    %ecx,%ecx
 50f:	e9 6e ff ff ff       	jmp    482 <printf+0x52>
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 518:	8b 45 d0             	mov    -0x30(%ebp),%eax
 51b:	8b 10                	mov    (%eax),%edx
 51d:	83 c0 04             	add    $0x4,%eax
 520:	89 45 d0             	mov    %eax,-0x30(%ebp)
 523:	85 d2                	test   %edx,%edx
 525:	0f 84 8d 00 00 00    	je     5b8 <printf+0x188>
 52b:	0f b6 02             	movzbl (%edx),%eax
 52e:	31 c9                	xor    %ecx,%ecx
 530:	84 c0                	test   %al,%al
 532:	0f 84 4a ff ff ff    	je     482 <printf+0x52>
 538:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 53b:	89 d3                	mov    %edx,%ebx
 53d:	8d 76 00             	lea    0x0(%esi),%esi
 540:	83 ec 04             	sub    $0x4,%esp
 543:	83 c3 01             	add    $0x1,%ebx
 546:	88 45 e7             	mov    %al,-0x19(%ebp)
 549:	6a 01                	push   $0x1
 54b:	57                   	push   %edi
 54c:	56                   	push   %esi
 54d:	e8 a1 fd ff ff       	call   2f3 <write>
 552:	0f b6 03             	movzbl (%ebx),%eax
 555:	83 c4 10             	add    $0x10,%esp
 558:	84 c0                	test   %al,%al
 55a:	75 e4                	jne    540 <printf+0x110>
 55c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 55f:	31 c9                	xor    %ecx,%ecx
 561:	e9 1c ff ff ff       	jmp    482 <printf+0x52>
 566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
 570:	83 ec 0c             	sub    $0xc,%esp
 573:	b9 0a 00 00 00       	mov    $0xa,%ecx
 578:	6a 01                	push   $0x1
 57a:	e9 7b ff ff ff       	jmp    4fa <printf+0xca>
 57f:	90                   	nop
 580:	8b 45 d0             	mov    -0x30(%ebp),%eax
 583:	83 ec 04             	sub    $0x4,%esp
 586:	8b 00                	mov    (%eax),%eax
 588:	6a 01                	push   $0x1
 58a:	57                   	push   %edi
 58b:	56                   	push   %esi
 58c:	88 45 e7             	mov    %al,-0x19(%ebp)
 58f:	e8 5f fd ff ff       	call   2f3 <write>
 594:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 598:	83 c4 10             	add    $0x10,%esp
 59b:	31 c9                	xor    %ecx,%ecx
 59d:	e9 e0 fe ff ff       	jmp    482 <printf+0x52>
 5a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5a8:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5ab:	83 ec 04             	sub    $0x4,%esp
 5ae:	e9 2a ff ff ff       	jmp    4dd <printf+0xad>
 5b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5b7:	90                   	nop
 5b8:	ba 6c 07 00 00       	mov    $0x76c,%edx
 5bd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5c0:	b8 28 00 00 00       	mov    $0x28,%eax
 5c5:	89 d3                	mov    %edx,%ebx
 5c7:	e9 74 ff ff ff       	jmp    540 <printf+0x110>
 5cc:	66 90                	xchg   %ax,%ax
 5ce:	66 90                	xchg   %ax,%ax

000005d0 <free>:
 5d0:	55                   	push   %ebp
 5d1:	a1 84 0a 00 00       	mov    0xa84,%eax
 5d6:	89 e5                	mov    %esp,%ebp
 5d8:	57                   	push   %edi
 5d9:	56                   	push   %esi
 5da:	53                   	push   %ebx
 5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 5e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5e8:	89 c2                	mov    %eax,%edx
 5ea:	8b 00                	mov    (%eax),%eax
 5ec:	39 ca                	cmp    %ecx,%edx
 5ee:	73 30                	jae    620 <free+0x50>
 5f0:	39 c1                	cmp    %eax,%ecx
 5f2:	72 04                	jb     5f8 <free+0x28>
 5f4:	39 c2                	cmp    %eax,%edx
 5f6:	72 f0                	jb     5e8 <free+0x18>
 5f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5fe:	39 f8                	cmp    %edi,%eax
 600:	74 30                	je     632 <free+0x62>
 602:	89 43 f8             	mov    %eax,-0x8(%ebx)
 605:	8b 42 04             	mov    0x4(%edx),%eax
 608:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 60b:	39 f1                	cmp    %esi,%ecx
 60d:	74 3a                	je     649 <free+0x79>
 60f:	89 0a                	mov    %ecx,(%edx)
 611:	5b                   	pop    %ebx
 612:	89 15 84 0a 00 00    	mov    %edx,0xa84
 618:	5e                   	pop    %esi
 619:	5f                   	pop    %edi
 61a:	5d                   	pop    %ebp
 61b:	c3                   	ret
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 620:	39 c2                	cmp    %eax,%edx
 622:	72 c4                	jb     5e8 <free+0x18>
 624:	39 c1                	cmp    %eax,%ecx
 626:	73 c0                	jae    5e8 <free+0x18>
 628:	8b 73 fc             	mov    -0x4(%ebx),%esi
 62b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 62e:	39 f8                	cmp    %edi,%eax
 630:	75 d0                	jne    602 <free+0x32>
 632:	03 70 04             	add    0x4(%eax),%esi
 635:	89 73 fc             	mov    %esi,-0x4(%ebx)
 638:	8b 02                	mov    (%edx),%eax
 63a:	8b 00                	mov    (%eax),%eax
 63c:	89 43 f8             	mov    %eax,-0x8(%ebx)
 63f:	8b 42 04             	mov    0x4(%edx),%eax
 642:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 645:	39 f1                	cmp    %esi,%ecx
 647:	75 c6                	jne    60f <free+0x3f>
 649:	03 43 fc             	add    -0x4(%ebx),%eax
 64c:	89 15 84 0a 00 00    	mov    %edx,0xa84
 652:	89 42 04             	mov    %eax,0x4(%edx)
 655:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 658:	89 0a                	mov    %ecx,(%edx)
 65a:	5b                   	pop    %ebx
 65b:	5e                   	pop    %esi
 65c:	5f                   	pop    %edi
 65d:	5d                   	pop    %ebp
 65e:	c3                   	ret
 65f:	90                   	nop

00000660 <malloc>:
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	83 ec 1c             	sub    $0x1c,%esp
 669:	8b 45 08             	mov    0x8(%ebp),%eax
 66c:	8b 3d 84 0a 00 00    	mov    0xa84,%edi
 672:	8d 70 07             	lea    0x7(%eax),%esi
 675:	c1 ee 03             	shr    $0x3,%esi
 678:	83 c6 01             	add    $0x1,%esi
 67b:	85 ff                	test   %edi,%edi
 67d:	0f 84 9d 00 00 00    	je     720 <malloc+0xc0>
 683:	8b 17                	mov    (%edi),%edx
 685:	8b 4a 04             	mov    0x4(%edx),%ecx
 688:	39 f1                	cmp    %esi,%ecx
 68a:	73 6a                	jae    6f6 <malloc+0x96>
 68c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 691:	39 de                	cmp    %ebx,%esi
 693:	0f 43 de             	cmovae %esi,%ebx
 696:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 69d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6a0:	eb 17                	jmp    6b9 <malloc+0x59>
 6a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6a8:	8b 02                	mov    (%edx),%eax
 6aa:	8b 48 04             	mov    0x4(%eax),%ecx
 6ad:	39 f1                	cmp    %esi,%ecx
 6af:	73 4f                	jae    700 <malloc+0xa0>
 6b1:	8b 3d 84 0a 00 00    	mov    0xa84,%edi
 6b7:	89 c2                	mov    %eax,%edx
 6b9:	39 d7                	cmp    %edx,%edi
 6bb:	75 eb                	jne    6a8 <malloc+0x48>
 6bd:	83 ec 0c             	sub    $0xc,%esp
 6c0:	ff 75 e4             	push   -0x1c(%ebp)
 6c3:	e8 93 fc ff ff       	call   35b <sbrk>
 6c8:	83 c4 10             	add    $0x10,%esp
 6cb:	83 f8 ff             	cmp    $0xffffffff,%eax
 6ce:	74 1c                	je     6ec <malloc+0x8c>
 6d0:	89 58 04             	mov    %ebx,0x4(%eax)
 6d3:	83 ec 0c             	sub    $0xc,%esp
 6d6:	83 c0 08             	add    $0x8,%eax
 6d9:	50                   	push   %eax
 6da:	e8 f1 fe ff ff       	call   5d0 <free>
 6df:	8b 15 84 0a 00 00    	mov    0xa84,%edx
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	85 d2                	test   %edx,%edx
 6ea:	75 bc                	jne    6a8 <malloc+0x48>
 6ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ef:	31 c0                	xor    %eax,%eax
 6f1:	5b                   	pop    %ebx
 6f2:	5e                   	pop    %esi
 6f3:	5f                   	pop    %edi
 6f4:	5d                   	pop    %ebp
 6f5:	c3                   	ret
 6f6:	89 d0                	mov    %edx,%eax
 6f8:	89 fa                	mov    %edi,%edx
 6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 700:	39 ce                	cmp    %ecx,%esi
 702:	74 4c                	je     750 <malloc+0xf0>
 704:	29 f1                	sub    %esi,%ecx
 706:	89 48 04             	mov    %ecx,0x4(%eax)
 709:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 70c:	89 70 04             	mov    %esi,0x4(%eax)
 70f:	89 15 84 0a 00 00    	mov    %edx,0xa84
 715:	8d 65 f4             	lea    -0xc(%ebp),%esp
 718:	83 c0 08             	add    $0x8,%eax
 71b:	5b                   	pop    %ebx
 71c:	5e                   	pop    %esi
 71d:	5f                   	pop    %edi
 71e:	5d                   	pop    %ebp
 71f:	c3                   	ret
 720:	c7 05 84 0a 00 00 88 	movl   $0xa88,0xa84
 727:	0a 00 00 
 72a:	bf 88 0a 00 00       	mov    $0xa88,%edi
 72f:	c7 05 88 0a 00 00 88 	movl   $0xa88,0xa88
 736:	0a 00 00 
 739:	89 fa                	mov    %edi,%edx
 73b:	c7 05 8c 0a 00 00 00 	movl   $0x0,0xa8c
 742:	00 00 00 
 745:	e9 42 ff ff ff       	jmp    68c <malloc+0x2c>
 74a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 750:	8b 08                	mov    (%eax),%ecx
 752:	89 0a                	mov    %ecx,(%edx)
 754:	eb b9                	jmp    70f <malloc+0xaf>
