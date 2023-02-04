
_test_1:     file format elf32-i386


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
  int x1 = getreadcount();
  int x2 = getreadcount();
  char buf[100];
  (void) read(4, buf, 1);
   f:	8d 75 84             	lea    -0x7c(%ebp),%esi
main(int argc, char *argv[]) {
  12:	53                   	push   %ebx
  int x3 = getreadcount();
  13:	bb e8 03 00 00       	mov    $0x3e8,%ebx
main(int argc, char *argv[]) {
  18:	51                   	push   %ecx
  19:	81 ec 88 00 00 00    	sub    $0x88,%esp
  int x1 = getreadcount();
  1f:	e8 6f 03 00 00       	call   393 <getreadcount>
  24:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
  int x2 = getreadcount();
  2a:	e8 64 03 00 00       	call   393 <getreadcount>
  (void) read(4, buf, 1);
  2f:	83 ec 04             	sub    $0x4,%esp
  32:	6a 01                	push   $0x1
  34:	56                   	push   %esi
  35:	6a 04                	push   $0x4
  int x2 = getreadcount();
  37:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
  (void) read(4, buf, 1);
  3d:	e8 c9 02 00 00       	call   30b <read>
  int x3 = getreadcount();
  42:	e8 4c 03 00 00       	call   393 <getreadcount>
  47:	83 c4 10             	add    $0x10,%esp
  4a:	89 c7                	mov    %eax,%edi
  int i;
  for (i = 0; i < 1000; i++) {
  4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    (void) read(4, buf, 1);
  50:	83 ec 04             	sub    $0x4,%esp
  53:	6a 01                	push   $0x1
  55:	56                   	push   %esi
  56:	6a 04                	push   $0x4
  58:	e8 ae 02 00 00       	call   30b <read>
  for (i = 0; i < 1000; i++) {
  5d:	83 c4 10             	add    $0x10,%esp
  60:	83 eb 01             	sub    $0x1,%ebx
  63:	75 eb                	jne    50 <main+0x50>
  }
  int x4 = getreadcount();
  65:	e8 29 03 00 00       	call   393 <getreadcount>
  printf(1, "XV6_TEST_OUTPUT %d %d %d\n", x2-x1, x3-x2, x4-x3);
  6a:	83 ec 0c             	sub    $0xc,%esp
  6d:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
  73:	29 f8                	sub    %edi,%eax
  75:	50                   	push   %eax
  76:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
  7c:	29 c7                	sub    %eax,%edi
  7e:	29 d0                	sub    %edx,%eax
  80:	57                   	push   %edi
  81:	50                   	push   %eax
  82:	68 78 07 00 00       	push   $0x778
  87:	6a 01                	push   $0x1
  89:	e8 c2 03 00 00       	call   450 <printf>
  exit();
  8e:	83 c4 20             	add    $0x20,%esp
  91:	e8 5d 02 00 00       	call   2f3 <exit>
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <strcpy>:
  a0:	55                   	push   %ebp
  a1:	31 c0                	xor    %eax,%eax
  a3:	89 e5                	mov    %esp,%ebp
  a5:	53                   	push   %ebx
  a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  b7:	83 c0 01             	add    $0x1,%eax
  ba:	84 d2                	test   %dl,%dl
  bc:	75 f2                	jne    b0 <strcpy+0x10>
  be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c1:	89 c8                	mov    %ecx,%eax
  c3:	c9                   	leave
  c4:	c3                   	ret
  c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000d0 <strcmp>:
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	53                   	push   %ebx
  d4:	8b 55 08             	mov    0x8(%ebp),%edx
  d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  da:	0f b6 02             	movzbl (%edx),%eax
  dd:	84 c0                	test   %al,%al
  df:	75 17                	jne    f8 <strcmp+0x28>
  e1:	eb 3a                	jmp    11d <strcmp+0x4d>
  e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  e7:	90                   	nop
  e8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  ec:	83 c2 01             	add    $0x1,%edx
  ef:	8d 59 01             	lea    0x1(%ecx),%ebx
  f2:	84 c0                	test   %al,%al
  f4:	74 1a                	je     110 <strcmp+0x40>
  f6:	89 d9                	mov    %ebx,%ecx
  f8:	0f b6 19             	movzbl (%ecx),%ebx
  fb:	38 c3                	cmp    %al,%bl
  fd:	74 e9                	je     e8 <strcmp+0x18>
  ff:	29 d8                	sub    %ebx,%eax
 101:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 104:	c9                   	leave
 105:	c3                   	ret
 106:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 114:	31 c0                	xor    %eax,%eax
 116:	29 d8                	sub    %ebx,%eax
 118:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 11b:	c9                   	leave
 11c:	c3                   	ret
 11d:	0f b6 19             	movzbl (%ecx),%ebx
 120:	31 c0                	xor    %eax,%eax
 122:	eb db                	jmp    ff <strcmp+0x2f>
 124:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 12f:	90                   	nop

00000130 <strlen>:
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 55 08             	mov    0x8(%ebp),%edx
 136:	80 3a 00             	cmpb   $0x0,(%edx)
 139:	74 15                	je     150 <strlen+0x20>
 13b:	31 c0                	xor    %eax,%eax
 13d:	8d 76 00             	lea    0x0(%esi),%esi
 140:	83 c0 01             	add    $0x1,%eax
 143:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 147:	89 c1                	mov    %eax,%ecx
 149:	75 f5                	jne    140 <strlen+0x10>
 14b:	89 c8                	mov    %ecx,%eax
 14d:	5d                   	pop    %ebp
 14e:	c3                   	ret
 14f:	90                   	nop
 150:	31 c9                	xor    %ecx,%ecx
 152:	5d                   	pop    %ebp
 153:	89 c8                	mov    %ecx,%eax
 155:	c3                   	ret
 156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15d:	8d 76 00             	lea    0x0(%esi),%esi

00000160 <memset>:
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	57                   	push   %edi
 164:	8b 55 08             	mov    0x8(%ebp),%edx
 167:	8b 4d 10             	mov    0x10(%ebp),%ecx
 16a:	8b 45 0c             	mov    0xc(%ebp),%eax
 16d:	89 d7                	mov    %edx,%edi
 16f:	fc                   	cld
 170:	f3 aa                	rep stos %al,%es:(%edi)
 172:	8b 7d fc             	mov    -0x4(%ebp),%edi
 175:	89 d0                	mov    %edx,%eax
 177:	c9                   	leave
 178:	c3                   	ret
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000180 <strchr>:
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 45 08             	mov    0x8(%ebp),%eax
 186:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 18a:	0f b6 10             	movzbl (%eax),%edx
 18d:	84 d2                	test   %dl,%dl
 18f:	75 12                	jne    1a3 <strchr+0x23>
 191:	eb 1d                	jmp    1b0 <strchr+0x30>
 193:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 197:	90                   	nop
 198:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 19c:	83 c0 01             	add    $0x1,%eax
 19f:	84 d2                	test   %dl,%dl
 1a1:	74 0d                	je     1b0 <strchr+0x30>
 1a3:	38 d1                	cmp    %dl,%cl
 1a5:	75 f1                	jne    198 <strchr+0x18>
 1a7:	5d                   	pop    %ebp
 1a8:	c3                   	ret
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1b0:	31 c0                	xor    %eax,%eax
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret
 1b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1bf:	90                   	nop

000001c0 <gets>:
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	56                   	push   %esi
 1c5:	8d 7d e7             	lea    -0x19(%ebp),%edi
 1c8:	53                   	push   %ebx
 1c9:	31 db                	xor    %ebx,%ebx
 1cb:	83 ec 1c             	sub    $0x1c,%esp
 1ce:	eb 27                	jmp    1f7 <gets+0x37>
 1d0:	83 ec 04             	sub    $0x4,%esp
 1d3:	6a 01                	push   $0x1
 1d5:	57                   	push   %edi
 1d6:	6a 00                	push   $0x0
 1d8:	e8 2e 01 00 00       	call   30b <read>
 1dd:	83 c4 10             	add    $0x10,%esp
 1e0:	85 c0                	test   %eax,%eax
 1e2:	7e 1d                	jle    201 <gets+0x41>
 1e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1e8:	8b 55 08             	mov    0x8(%ebp),%edx
 1eb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 1ef:	3c 0a                	cmp    $0xa,%al
 1f1:	74 1d                	je     210 <gets+0x50>
 1f3:	3c 0d                	cmp    $0xd,%al
 1f5:	74 19                	je     210 <gets+0x50>
 1f7:	89 de                	mov    %ebx,%esi
 1f9:	83 c3 01             	add    $0x1,%ebx
 1fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ff:	7c cf                	jl     1d0 <gets+0x10>
 201:	8b 45 08             	mov    0x8(%ebp),%eax
 204:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 208:	8d 65 f4             	lea    -0xc(%ebp),%esp
 20b:	5b                   	pop    %ebx
 20c:	5e                   	pop    %esi
 20d:	5f                   	pop    %edi
 20e:	5d                   	pop    %ebp
 20f:	c3                   	ret
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	89 de                	mov    %ebx,%esi
 215:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 219:	8d 65 f4             	lea    -0xc(%ebp),%esp
 21c:	5b                   	pop    %ebx
 21d:	5e                   	pop    %esi
 21e:	5f                   	pop    %edi
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 228:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <stat>:
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	56                   	push   %esi
 234:	53                   	push   %ebx
 235:	83 ec 08             	sub    $0x8,%esp
 238:	6a 00                	push   $0x0
 23a:	ff 75 08             	push   0x8(%ebp)
 23d:	e8 f1 00 00 00       	call   333 <open>
 242:	83 c4 10             	add    $0x10,%esp
 245:	85 c0                	test   %eax,%eax
 247:	78 27                	js     270 <stat+0x40>
 249:	83 ec 08             	sub    $0x8,%esp
 24c:	ff 75 0c             	push   0xc(%ebp)
 24f:	89 c3                	mov    %eax,%ebx
 251:	50                   	push   %eax
 252:	e8 f4 00 00 00       	call   34b <fstat>
 257:	89 1c 24             	mov    %ebx,(%esp)
 25a:	89 c6                	mov    %eax,%esi
 25c:	e8 ba 00 00 00       	call   31b <close>
 261:	83 c4 10             	add    $0x10,%esp
 264:	8d 65 f8             	lea    -0x8(%ebp),%esp
 267:	89 f0                	mov    %esi,%eax
 269:	5b                   	pop    %ebx
 26a:	5e                   	pop    %esi
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret
 26d:	8d 76 00             	lea    0x0(%esi),%esi
 270:	be ff ff ff ff       	mov    $0xffffffff,%esi
 275:	eb ed                	jmp    264 <stat+0x34>
 277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27e:	66 90                	xchg   %ax,%ax

00000280 <atoi>:
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	53                   	push   %ebx
 284:	8b 55 08             	mov    0x8(%ebp),%edx
 287:	0f be 02             	movsbl (%edx),%eax
 28a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 28d:	80 f9 09             	cmp    $0x9,%cl
 290:	b9 00 00 00 00       	mov    $0x0,%ecx
 295:	77 1e                	ja     2b5 <atoi+0x35>
 297:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29e:	66 90                	xchg   %ax,%ax
 2a0:	83 c2 01             	add    $0x1,%edx
 2a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 2aa:	0f be 02             	movsbl (%edx),%eax
 2ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2b0:	80 fb 09             	cmp    $0x9,%bl
 2b3:	76 eb                	jbe    2a0 <atoi+0x20>
 2b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2b8:	89 c8                	mov    %ecx,%eax
 2ba:	c9                   	leave
 2bb:	c3                   	ret
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002c0 <memmove>:
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	8b 45 10             	mov    0x10(%ebp),%eax
 2c7:	8b 55 08             	mov    0x8(%ebp),%edx
 2ca:	56                   	push   %esi
 2cb:	8b 75 0c             	mov    0xc(%ebp),%esi
 2ce:	85 c0                	test   %eax,%eax
 2d0:	7e 13                	jle    2e5 <memmove+0x25>
 2d2:	01 d0                	add    %edx,%eax
 2d4:	89 d7                	mov    %edx,%edi
 2d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
 2e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 2e1:	39 f8                	cmp    %edi,%eax
 2e3:	75 fb                	jne    2e0 <memmove+0x20>
 2e5:	5e                   	pop    %esi
 2e6:	89 d0                	mov    %edx,%eax
 2e8:	5f                   	pop    %edi
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret

000002eb <fork>:
 2eb:	b8 01 00 00 00       	mov    $0x1,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret

000002f3 <exit>:
 2f3:	b8 02 00 00 00       	mov    $0x2,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret

000002fb <wait>:
 2fb:	b8 03 00 00 00       	mov    $0x3,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret

00000303 <pipe>:
 303:	b8 04 00 00 00       	mov    $0x4,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret

0000030b <read>:
 30b:	b8 05 00 00 00       	mov    $0x5,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret

00000313 <write>:
 313:	b8 10 00 00 00       	mov    $0x10,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret

0000031b <close>:
 31b:	b8 15 00 00 00       	mov    $0x15,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret

00000323 <kill>:
 323:	b8 06 00 00 00       	mov    $0x6,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret

0000032b <exec>:
 32b:	b8 07 00 00 00       	mov    $0x7,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <open>:
 333:	b8 0f 00 00 00       	mov    $0xf,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret

0000033b <mknod>:
 33b:	b8 11 00 00 00       	mov    $0x11,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <unlink>:
 343:	b8 12 00 00 00       	mov    $0x12,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <fstat>:
 34b:	b8 08 00 00 00       	mov    $0x8,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <link>:
 353:	b8 13 00 00 00       	mov    $0x13,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret

0000035b <mkdir>:
 35b:	b8 14 00 00 00       	mov    $0x14,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret

00000363 <chdir>:
 363:	b8 09 00 00 00       	mov    $0x9,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret

0000036b <dup>:
 36b:	b8 0a 00 00 00       	mov    $0xa,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret

00000373 <getpid>:
 373:	b8 0b 00 00 00       	mov    $0xb,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret

0000037b <sbrk>:
 37b:	b8 0c 00 00 00       	mov    $0xc,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret

00000383 <sleep>:
 383:	b8 0d 00 00 00       	mov    $0xd,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret

0000038b <uptime>:
 38b:	b8 0e 00 00 00       	mov    $0xe,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret

00000393 <getreadcount>:
 393:	b8 16 00 00 00       	mov    $0x16,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret
 39b:	66 90                	xchg   %ax,%ax
 39d:	66 90                	xchg   %ax,%ax
 39f:	90                   	nop

000003a0 <printint>:
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	56                   	push   %esi
 3a5:	53                   	push   %ebx
 3a6:	83 ec 3c             	sub    $0x3c,%esp
 3a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
 3ac:	89 d1                	mov    %edx,%ecx
 3ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
 3b1:	85 d2                	test   %edx,%edx
 3b3:	0f 89 7f 00 00 00    	jns    438 <printint+0x98>
 3b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3bd:	74 79                	je     438 <printint+0x98>
 3bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
 3c6:	f7 d9                	neg    %ecx
 3c8:	31 db                	xor    %ebx,%ebx
 3ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	89 c8                	mov    %ecx,%eax
 3d2:	31 d2                	xor    %edx,%edx
 3d4:	89 cf                	mov    %ecx,%edi
 3d6:	f7 75 c4             	divl   -0x3c(%ebp)
 3d9:	0f b6 92 f4 07 00 00 	movzbl 0x7f4(%edx),%edx
 3e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3e3:	89 d8                	mov    %ebx,%eax
 3e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
 3e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
 3eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
 3ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3f1:	76 dd                	jbe    3d0 <printint+0x30>
 3f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3f6:	85 c9                	test   %ecx,%ecx
 3f8:	74 0c                	je     406 <printint+0x66>
 3fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3ff:	89 d8                	mov    %ebx,%eax
 401:	ba 2d 00 00 00       	mov    $0x2d,%edx
 406:	8b 7d b8             	mov    -0x48(%ebp),%edi
 409:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 40d:	eb 07                	jmp    416 <printint+0x76>
 40f:	90                   	nop
 410:	0f b6 13             	movzbl (%ebx),%edx
 413:	83 eb 01             	sub    $0x1,%ebx
 416:	83 ec 04             	sub    $0x4,%esp
 419:	88 55 d7             	mov    %dl,-0x29(%ebp)
 41c:	6a 01                	push   $0x1
 41e:	56                   	push   %esi
 41f:	57                   	push   %edi
 420:	e8 ee fe ff ff       	call   313 <write>
 425:	83 c4 10             	add    $0x10,%esp
 428:	39 de                	cmp    %ebx,%esi
 42a:	75 e4                	jne    410 <printint+0x70>
 42c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 42f:	5b                   	pop    %ebx
 430:	5e                   	pop    %esi
 431:	5f                   	pop    %edi
 432:	5d                   	pop    %ebp
 433:	c3                   	ret
 434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 438:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 43f:	eb 87                	jmp    3c8 <printint+0x28>
 441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 448:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44f:	90                   	nop

00000450 <printf>:
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 2c             	sub    $0x2c,%esp
 459:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 45c:	8b 75 08             	mov    0x8(%ebp),%esi
 45f:	0f b6 13             	movzbl (%ebx),%edx
 462:	84 d2                	test   %dl,%dl
 464:	74 6a                	je     4d0 <printf+0x80>
 466:	8d 45 10             	lea    0x10(%ebp),%eax
 469:	83 c3 01             	add    $0x1,%ebx
 46c:	8d 7d e7             	lea    -0x19(%ebp),%edi
 46f:	31 c9                	xor    %ecx,%ecx
 471:	89 45 d0             	mov    %eax,-0x30(%ebp)
 474:	eb 36                	jmp    4ac <printf+0x5c>
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
 480:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 483:	b9 25 00 00 00       	mov    $0x25,%ecx
 488:	83 f8 25             	cmp    $0x25,%eax
 48b:	74 15                	je     4a2 <printf+0x52>
 48d:	83 ec 04             	sub    $0x4,%esp
 490:	88 55 e7             	mov    %dl,-0x19(%ebp)
 493:	6a 01                	push   $0x1
 495:	57                   	push   %edi
 496:	56                   	push   %esi
 497:	e8 77 fe ff ff       	call   313 <write>
 49c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 49f:	83 c4 10             	add    $0x10,%esp
 4a2:	0f b6 13             	movzbl (%ebx),%edx
 4a5:	83 c3 01             	add    $0x1,%ebx
 4a8:	84 d2                	test   %dl,%dl
 4aa:	74 24                	je     4d0 <printf+0x80>
 4ac:	0f b6 c2             	movzbl %dl,%eax
 4af:	85 c9                	test   %ecx,%ecx
 4b1:	74 cd                	je     480 <printf+0x30>
 4b3:	83 f9 25             	cmp    $0x25,%ecx
 4b6:	75 ea                	jne    4a2 <printf+0x52>
 4b8:	83 f8 25             	cmp    $0x25,%eax
 4bb:	0f 84 07 01 00 00    	je     5c8 <printf+0x178>
 4c1:	83 e8 63             	sub    $0x63,%eax
 4c4:	83 f8 15             	cmp    $0x15,%eax
 4c7:	77 17                	ja     4e0 <printf+0x90>
 4c9:	ff 24 85 9c 07 00 00 	jmp    *0x79c(,%eax,4)
 4d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d3:	5b                   	pop    %ebx
 4d4:	5e                   	pop    %esi
 4d5:	5f                   	pop    %edi
 4d6:	5d                   	pop    %ebp
 4d7:	c3                   	ret
 4d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop
 4e0:	83 ec 04             	sub    $0x4,%esp
 4e3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 4e6:	6a 01                	push   $0x1
 4e8:	57                   	push   %edi
 4e9:	56                   	push   %esi
 4ea:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4ee:	e8 20 fe ff ff       	call   313 <write>
 4f3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
 4f7:	83 c4 0c             	add    $0xc,%esp
 4fa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4fd:	6a 01                	push   $0x1
 4ff:	57                   	push   %edi
 500:	56                   	push   %esi
 501:	e8 0d fe ff ff       	call   313 <write>
 506:	83 c4 10             	add    $0x10,%esp
 509:	31 c9                	xor    %ecx,%ecx
 50b:	eb 95                	jmp    4a2 <printf+0x52>
 50d:	8d 76 00             	lea    0x0(%esi),%esi
 510:	83 ec 0c             	sub    $0xc,%esp
 513:	b9 10 00 00 00       	mov    $0x10,%ecx
 518:	6a 00                	push   $0x0
 51a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 51d:	8b 10                	mov    (%eax),%edx
 51f:	89 f0                	mov    %esi,%eax
 521:	e8 7a fe ff ff       	call   3a0 <printint>
 526:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 52a:	83 c4 10             	add    $0x10,%esp
 52d:	31 c9                	xor    %ecx,%ecx
 52f:	e9 6e ff ff ff       	jmp    4a2 <printf+0x52>
 534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 538:	8b 45 d0             	mov    -0x30(%ebp),%eax
 53b:	8b 10                	mov    (%eax),%edx
 53d:	83 c0 04             	add    $0x4,%eax
 540:	89 45 d0             	mov    %eax,-0x30(%ebp)
 543:	85 d2                	test   %edx,%edx
 545:	0f 84 8d 00 00 00    	je     5d8 <printf+0x188>
 54b:	0f b6 02             	movzbl (%edx),%eax
 54e:	31 c9                	xor    %ecx,%ecx
 550:	84 c0                	test   %al,%al
 552:	0f 84 4a ff ff ff    	je     4a2 <printf+0x52>
 558:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 55b:	89 d3                	mov    %edx,%ebx
 55d:	8d 76 00             	lea    0x0(%esi),%esi
 560:	83 ec 04             	sub    $0x4,%esp
 563:	83 c3 01             	add    $0x1,%ebx
 566:	88 45 e7             	mov    %al,-0x19(%ebp)
 569:	6a 01                	push   $0x1
 56b:	57                   	push   %edi
 56c:	56                   	push   %esi
 56d:	e8 a1 fd ff ff       	call   313 <write>
 572:	0f b6 03             	movzbl (%ebx),%eax
 575:	83 c4 10             	add    $0x10,%esp
 578:	84 c0                	test   %al,%al
 57a:	75 e4                	jne    560 <printf+0x110>
 57c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 57f:	31 c9                	xor    %ecx,%ecx
 581:	e9 1c ff ff ff       	jmp    4a2 <printf+0x52>
 586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi
 590:	83 ec 0c             	sub    $0xc,%esp
 593:	b9 0a 00 00 00       	mov    $0xa,%ecx
 598:	6a 01                	push   $0x1
 59a:	e9 7b ff ff ff       	jmp    51a <printf+0xca>
 59f:	90                   	nop
 5a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5a3:	83 ec 04             	sub    $0x4,%esp
 5a6:	8b 00                	mov    (%eax),%eax
 5a8:	6a 01                	push   $0x1
 5aa:	57                   	push   %edi
 5ab:	56                   	push   %esi
 5ac:	88 45 e7             	mov    %al,-0x19(%ebp)
 5af:	e8 5f fd ff ff       	call   313 <write>
 5b4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5b8:	83 c4 10             	add    $0x10,%esp
 5bb:	31 c9                	xor    %ecx,%ecx
 5bd:	e9 e0 fe ff ff       	jmp    4a2 <printf+0x52>
 5c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5c8:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5cb:	83 ec 04             	sub    $0x4,%esp
 5ce:	e9 2a ff ff ff       	jmp    4fd <printf+0xad>
 5d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5d7:	90                   	nop
 5d8:	ba 92 07 00 00       	mov    $0x792,%edx
 5dd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5e0:	b8 28 00 00 00       	mov    $0x28,%eax
 5e5:	89 d3                	mov    %edx,%ebx
 5e7:	e9 74 ff ff ff       	jmp    560 <printf+0x110>
 5ec:	66 90                	xchg   %ax,%ax
 5ee:	66 90                	xchg   %ax,%ax

000005f0 <free>:
 5f0:	55                   	push   %ebp
 5f1:	a1 ac 0a 00 00       	mov    0xaac,%eax
 5f6:	89 e5                	mov    %esp,%ebp
 5f8:	57                   	push   %edi
 5f9:	56                   	push   %esi
 5fa:	53                   	push   %ebx
 5fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 608:	89 c2                	mov    %eax,%edx
 60a:	8b 00                	mov    (%eax),%eax
 60c:	39 ca                	cmp    %ecx,%edx
 60e:	73 30                	jae    640 <free+0x50>
 610:	39 c1                	cmp    %eax,%ecx
 612:	72 04                	jb     618 <free+0x28>
 614:	39 c2                	cmp    %eax,%edx
 616:	72 f0                	jb     608 <free+0x18>
 618:	8b 73 fc             	mov    -0x4(%ebx),%esi
 61b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 61e:	39 f8                	cmp    %edi,%eax
 620:	74 30                	je     652 <free+0x62>
 622:	89 43 f8             	mov    %eax,-0x8(%ebx)
 625:	8b 42 04             	mov    0x4(%edx),%eax
 628:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 62b:	39 f1                	cmp    %esi,%ecx
 62d:	74 3a                	je     669 <free+0x79>
 62f:	89 0a                	mov    %ecx,(%edx)
 631:	5b                   	pop    %ebx
 632:	89 15 ac 0a 00 00    	mov    %edx,0xaac
 638:	5e                   	pop    %esi
 639:	5f                   	pop    %edi
 63a:	5d                   	pop    %ebp
 63b:	c3                   	ret
 63c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 640:	39 c2                	cmp    %eax,%edx
 642:	72 c4                	jb     608 <free+0x18>
 644:	39 c1                	cmp    %eax,%ecx
 646:	73 c0                	jae    608 <free+0x18>
 648:	8b 73 fc             	mov    -0x4(%ebx),%esi
 64b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 64e:	39 f8                	cmp    %edi,%eax
 650:	75 d0                	jne    622 <free+0x32>
 652:	03 70 04             	add    0x4(%eax),%esi
 655:	89 73 fc             	mov    %esi,-0x4(%ebx)
 658:	8b 02                	mov    (%edx),%eax
 65a:	8b 00                	mov    (%eax),%eax
 65c:	89 43 f8             	mov    %eax,-0x8(%ebx)
 65f:	8b 42 04             	mov    0x4(%edx),%eax
 662:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 665:	39 f1                	cmp    %esi,%ecx
 667:	75 c6                	jne    62f <free+0x3f>
 669:	03 43 fc             	add    -0x4(%ebx),%eax
 66c:	89 15 ac 0a 00 00    	mov    %edx,0xaac
 672:	89 42 04             	mov    %eax,0x4(%edx)
 675:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 678:	89 0a                	mov    %ecx,(%edx)
 67a:	5b                   	pop    %ebx
 67b:	5e                   	pop    %esi
 67c:	5f                   	pop    %edi
 67d:	5d                   	pop    %ebp
 67e:	c3                   	ret
 67f:	90                   	nop

00000680 <malloc>:
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	53                   	push   %ebx
 686:	83 ec 1c             	sub    $0x1c,%esp
 689:	8b 45 08             	mov    0x8(%ebp),%eax
 68c:	8b 3d ac 0a 00 00    	mov    0xaac,%edi
 692:	8d 70 07             	lea    0x7(%eax),%esi
 695:	c1 ee 03             	shr    $0x3,%esi
 698:	83 c6 01             	add    $0x1,%esi
 69b:	85 ff                	test   %edi,%edi
 69d:	0f 84 9d 00 00 00    	je     740 <malloc+0xc0>
 6a3:	8b 17                	mov    (%edi),%edx
 6a5:	8b 4a 04             	mov    0x4(%edx),%ecx
 6a8:	39 f1                	cmp    %esi,%ecx
 6aa:	73 6a                	jae    716 <malloc+0x96>
 6ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6b1:	39 de                	cmp    %ebx,%esi
 6b3:	0f 43 de             	cmovae %esi,%ebx
 6b6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6c0:	eb 17                	jmp    6d9 <malloc+0x59>
 6c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6c8:	8b 02                	mov    (%edx),%eax
 6ca:	8b 48 04             	mov    0x4(%eax),%ecx
 6cd:	39 f1                	cmp    %esi,%ecx
 6cf:	73 4f                	jae    720 <malloc+0xa0>
 6d1:	8b 3d ac 0a 00 00    	mov    0xaac,%edi
 6d7:	89 c2                	mov    %eax,%edx
 6d9:	39 d7                	cmp    %edx,%edi
 6db:	75 eb                	jne    6c8 <malloc+0x48>
 6dd:	83 ec 0c             	sub    $0xc,%esp
 6e0:	ff 75 e4             	push   -0x1c(%ebp)
 6e3:	e8 93 fc ff ff       	call   37b <sbrk>
 6e8:	83 c4 10             	add    $0x10,%esp
 6eb:	83 f8 ff             	cmp    $0xffffffff,%eax
 6ee:	74 1c                	je     70c <malloc+0x8c>
 6f0:	89 58 04             	mov    %ebx,0x4(%eax)
 6f3:	83 ec 0c             	sub    $0xc,%esp
 6f6:	83 c0 08             	add    $0x8,%eax
 6f9:	50                   	push   %eax
 6fa:	e8 f1 fe ff ff       	call   5f0 <free>
 6ff:	8b 15 ac 0a 00 00    	mov    0xaac,%edx
 705:	83 c4 10             	add    $0x10,%esp
 708:	85 d2                	test   %edx,%edx
 70a:	75 bc                	jne    6c8 <malloc+0x48>
 70c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 70f:	31 c0                	xor    %eax,%eax
 711:	5b                   	pop    %ebx
 712:	5e                   	pop    %esi
 713:	5f                   	pop    %edi
 714:	5d                   	pop    %ebp
 715:	c3                   	ret
 716:	89 d0                	mov    %edx,%eax
 718:	89 fa                	mov    %edi,%edx
 71a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 720:	39 ce                	cmp    %ecx,%esi
 722:	74 4c                	je     770 <malloc+0xf0>
 724:	29 f1                	sub    %esi,%ecx
 726:	89 48 04             	mov    %ecx,0x4(%eax)
 729:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 72c:	89 70 04             	mov    %esi,0x4(%eax)
 72f:	89 15 ac 0a 00 00    	mov    %edx,0xaac
 735:	8d 65 f4             	lea    -0xc(%ebp),%esp
 738:	83 c0 08             	add    $0x8,%eax
 73b:	5b                   	pop    %ebx
 73c:	5e                   	pop    %esi
 73d:	5f                   	pop    %edi
 73e:	5d                   	pop    %ebp
 73f:	c3                   	ret
 740:	c7 05 ac 0a 00 00 b0 	movl   $0xab0,0xaac
 747:	0a 00 00 
 74a:	bf b0 0a 00 00       	mov    $0xab0,%edi
 74f:	c7 05 b0 0a 00 00 b0 	movl   $0xab0,0xab0
 756:	0a 00 00 
 759:	89 fa                	mov    %edi,%edx
 75b:	c7 05 b4 0a 00 00 00 	movl   $0x0,0xab4
 762:	00 00 00 
 765:	e9 42 ff ff ff       	jmp    6ac <malloc+0x2c>
 76a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 770:	8b 08                	mov    (%eax),%ecx
 772:	89 0a                	mov    %ecx,(%edx)
 774:	eb b9                	jmp    72f <malloc+0xaf>
