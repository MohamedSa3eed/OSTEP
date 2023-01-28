
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 6f                	jle    90 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  27:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  2b:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  30:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  33:	75 2d                	jne    62 <main+0x62>
  35:	eb 6c                	jmp    a3 <main+0xa3>
  37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  3e:	66 90                	xchg   %ax,%ax
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  40:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
  43:	83 c6 01             	add    $0x1,%esi
  46:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  49:	50                   	push   %eax
  4a:	ff 75 e0             	push   -0x20(%ebp)
  4d:	e8 7e 01 00 00       	call   1d0 <grep>
    close(fd);
  52:	89 3c 24             	mov    %edi,(%esp)
  55:	e8 91 05 00 00       	call   5eb <close>
  for(i = 2; i < argc; i++){
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  60:	7e 29                	jle    8b <main+0x8b>
    if((fd = open(argv[i], 0)) < 0){
  62:	83 ec 08             	sub    $0x8,%esp
  65:	6a 00                	push   $0x0
  67:	ff 33                	push   (%ebx)
  69:	e8 95 05 00 00       	call   603 <open>
  6e:	83 c4 10             	add    $0x10,%esp
  71:	89 c7                	mov    %eax,%edi
  73:	85 c0                	test   %eax,%eax
  75:	79 c9                	jns    40 <main+0x40>
      printf(1, "grep: cannot open %s\n", argv[i]);
  77:	50                   	push   %eax
  78:	ff 33                	push   (%ebx)
  7a:	68 68 0a 00 00       	push   $0xa68
  7f:	6a 01                	push   $0x1
  81:	e8 9a 06 00 00       	call   720 <printf>
      exit();
  86:	e8 38 05 00 00       	call   5c3 <exit>
  }
  exit();
  8b:	e8 33 05 00 00       	call   5c3 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	51                   	push   %ecx
  91:	51                   	push   %ecx
  92:	68 48 0a 00 00       	push   $0xa48
  97:	6a 02                	push   $0x2
  99:	e8 82 06 00 00       	call   720 <printf>
    exit();
  9e:	e8 20 05 00 00       	call   5c3 <exit>
    grep(pattern, 0);
  a3:	52                   	push   %edx
  a4:	52                   	push   %edx
  a5:	6a 00                	push   $0x0
  a7:	50                   	push   %eax
  a8:	e8 23 01 00 00       	call   1d0 <grep>
    exit();
  ad:	e8 11 05 00 00       	call   5c3 <exit>
  b2:	66 90                	xchg   %ax,%ax
  b4:	66 90                	xchg   %ax,%ax
  b6:	66 90                	xchg   %ax,%ax
  b8:	66 90                	xchg   %ax,%ax
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  c5:	53                   	push   %ebx
  c6:	83 ec 0c             	sub    $0xc,%esp
  c9:	8b 75 08             	mov    0x8(%ebp),%esi
  cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
  cf:	0f b6 06             	movzbl (%esi),%eax
  d2:	84 c0                	test   %al,%al
  d4:	75 2d                	jne    103 <matchhere+0x43>
  d6:	e9 7d 00 00 00       	jmp    158 <matchhere+0x98>
  db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  df:	90                   	nop
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  e0:	0f b6 0f             	movzbl (%edi),%ecx
  if(re[0] == '$' && re[1] == '\0')
  e3:	80 fb 24             	cmp    $0x24,%bl
  e6:	75 04                	jne    ec <matchhere+0x2c>
  e8:	84 c0                	test   %al,%al
  ea:	74 79                	je     165 <matchhere+0xa5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  ec:	84 c9                	test   %cl,%cl
  ee:	74 58                	je     148 <matchhere+0x88>
  f0:	38 d9                	cmp    %bl,%cl
  f2:	74 05                	je     f9 <matchhere+0x39>
  f4:	80 fb 2e             	cmp    $0x2e,%bl
  f7:	75 4f                	jne    148 <matchhere+0x88>
    return matchhere(re+1, text+1);
  f9:	83 c7 01             	add    $0x1,%edi
  fc:	83 c6 01             	add    $0x1,%esi
  if(re[0] == '\0')
  ff:	84 c0                	test   %al,%al
 101:	74 55                	je     158 <matchhere+0x98>
  if(re[1] == '*')
 103:	0f be d8             	movsbl %al,%ebx
 106:	0f b6 46 01          	movzbl 0x1(%esi),%eax
 10a:	3c 2a                	cmp    $0x2a,%al
 10c:	75 d2                	jne    e0 <matchhere+0x20>
    return matchstar(re[0], re+2, text);
 10e:	83 c6 02             	add    $0x2,%esi
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
 111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 118:	83 ec 08             	sub    $0x8,%esp
 11b:	57                   	push   %edi
 11c:	56                   	push   %esi
 11d:	e8 9e ff ff ff       	call   c0 <matchhere>
 122:	83 c4 10             	add    $0x10,%esp
 125:	85 c0                	test   %eax,%eax
 127:	75 2f                	jne    158 <matchhere+0x98>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
 129:	0f be 17             	movsbl (%edi),%edx
 12c:	84 d2                	test   %dl,%dl
 12e:	74 0c                	je     13c <matchhere+0x7c>
 130:	83 c7 01             	add    $0x1,%edi
 133:	83 fb 2e             	cmp    $0x2e,%ebx
 136:	74 e0                	je     118 <matchhere+0x58>
 138:	39 da                	cmp    %ebx,%edx
 13a:	74 dc                	je     118 <matchhere+0x58>
}
 13c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 13f:	5b                   	pop    %ebx
 140:	5e                   	pop    %esi
 141:	5f                   	pop    %edi
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 148:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 14b:	31 c0                	xor    %eax,%eax
}
 14d:	5b                   	pop    %ebx
 14e:	5e                   	pop    %esi
 14f:	5f                   	pop    %edi
 150:	5d                   	pop    %ebp
 151:	c3                   	ret    
 152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 158:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 1;
 15b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 160:	5b                   	pop    %ebx
 161:	5e                   	pop    %esi
 162:	5f                   	pop    %edi
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    
    return *text == '\0';
 165:	31 c0                	xor    %eax,%eax
 167:	84 c9                	test   %cl,%cl
 169:	0f 94 c0             	sete   %al
 16c:	eb ce                	jmp    13c <matchhere+0x7c>
 16e:	66 90                	xchg   %ax,%ax

00000170 <match>:
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
 175:	8b 5d 08             	mov    0x8(%ebp),%ebx
 178:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
 17b:	80 3b 5e             	cmpb   $0x5e,(%ebx)
 17e:	75 11                	jne    191 <match+0x21>
 180:	eb 2e                	jmp    1b0 <match+0x40>
 182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 188:	83 c6 01             	add    $0x1,%esi
 18b:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 18f:	74 16                	je     1a7 <match+0x37>
    if(matchhere(re, text))
 191:	83 ec 08             	sub    $0x8,%esp
 194:	56                   	push   %esi
 195:	53                   	push   %ebx
 196:	e8 25 ff ff ff       	call   c0 <matchhere>
 19b:	83 c4 10             	add    $0x10,%esp
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 e6                	je     188 <match+0x18>
      return 1;
 1a2:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1aa:	5b                   	pop    %ebx
 1ab:	5e                   	pop    %esi
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    
 1ae:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
 1b0:	83 c3 01             	add    $0x1,%ebx
 1b3:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 1b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b9:	5b                   	pop    %ebx
 1ba:	5e                   	pop    %esi
 1bb:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 1bc:	e9 ff fe ff ff       	jmp    c0 <matchhere>
 1c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <grep>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
 1d5:	53                   	push   %ebx
 1d6:	83 ec 1c             	sub    $0x1c,%esp
 1d9:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
 1dc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    return matchhere(re+1, text);
 1e3:	8d 47 01             	lea    0x1(%edi),%eax
 1e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 1f0:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 1f3:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 1f8:	83 ec 04             	sub    $0x4,%esp
 1fb:	29 c8                	sub    %ecx,%eax
 1fd:	50                   	push   %eax
 1fe:	8d 81 80 0e 00 00    	lea    0xe80(%ecx),%eax
 204:	50                   	push   %eax
 205:	ff 75 0c             	push   0xc(%ebp)
 208:	e8 ce 03 00 00       	call   5db <read>
 20d:	83 c4 10             	add    $0x10,%esp
 210:	85 c0                	test   %eax,%eax
 212:	0f 8e e5 00 00 00    	jle    2fd <grep+0x12d>
    m += n;
 218:	01 45 dc             	add    %eax,-0x24(%ebp)
 21b:	8b 4d dc             	mov    -0x24(%ebp),%ecx
    p = buf;
 21e:	c7 45 e4 80 0e 00 00 	movl   $0xe80,-0x1c(%ebp)
    buf[m] = '\0';
 225:	c6 81 80 0e 00 00 00 	movb   $0x0,0xe80(%ecx)
    while((q = strchr(p, '\n')) != 0){
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 230:	83 ec 08             	sub    $0x8,%esp
 233:	6a 0a                	push   $0xa
 235:	ff 75 e4             	push   -0x1c(%ebp)
 238:	e8 13 02 00 00       	call   450 <strchr>
 23d:	83 c4 10             	add    $0x10,%esp
 240:	89 c3                	mov    %eax,%ebx
 242:	85 c0                	test   %eax,%eax
 244:	74 72                	je     2b8 <grep+0xe8>
      *q = 0;
 246:	c6 03 00             	movb   $0x0,(%ebx)
        write(1, p, q+1 - p);
 249:	8d 43 01             	lea    0x1(%ebx),%eax
  if(re[0] == '^')
 24c:	80 3f 5e             	cmpb   $0x5e,(%edi)
        write(1, p, q+1 - p);
 24f:	89 45 e0             	mov    %eax,-0x20(%ebp)
 252:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  if(re[0] == '^')
 255:	75 12                	jne    269 <grep+0x99>
 257:	eb 47                	jmp    2a0 <grep+0xd0>
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }while(*text++ != '\0');
 260:	83 c6 01             	add    $0x1,%esi
 263:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 267:	74 2b                	je     294 <grep+0xc4>
    if(matchhere(re, text))
 269:	83 ec 08             	sub    $0x8,%esp
 26c:	56                   	push   %esi
 26d:	57                   	push   %edi
 26e:	e8 4d fe ff ff       	call   c0 <matchhere>
 273:	83 c4 10             	add    $0x10,%esp
 276:	85 c0                	test   %eax,%eax
 278:	74 e6                	je     260 <grep+0x90>
        write(1, p, q+1 - p);
 27a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 27d:	8b 45 e0             	mov    -0x20(%ebp),%eax
 280:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 283:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 286:	29 d0                	sub    %edx,%eax
 288:	50                   	push   %eax
 289:	52                   	push   %edx
 28a:	6a 01                	push   $0x1
 28c:	e8 52 03 00 00       	call   5e3 <write>
 291:	83 c4 10             	add    $0x10,%esp
      p = q+1;
 294:	8b 45 e0             	mov    -0x20(%ebp),%eax
 297:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 29a:	eb 94                	jmp    230 <grep+0x60>
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return matchhere(re+1, text);
 2a0:	83 ec 08             	sub    $0x8,%esp
 2a3:	56                   	push   %esi
 2a4:	ff 75 d8             	push   -0x28(%ebp)
 2a7:	e8 14 fe ff ff       	call   c0 <matchhere>
 2ac:	83 c4 10             	add    $0x10,%esp
      if(match(pattern, p)){
 2af:	85 c0                	test   %eax,%eax
 2b1:	74 e1                	je     294 <grep+0xc4>
 2b3:	eb c5                	jmp    27a <grep+0xaa>
 2b5:	8d 76 00             	lea    0x0(%esi),%esi
    if(p == buf)
 2b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2bb:	81 fa 80 0e 00 00    	cmp    $0xe80,%edx
 2c1:	74 2e                	je     2f1 <grep+0x121>
    if(m > 0){
 2c3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 2c6:	85 c9                	test   %ecx,%ecx
 2c8:	0f 8e 22 ff ff ff    	jle    1f0 <grep+0x20>
      m -= p - buf;
 2ce:	89 d0                	mov    %edx,%eax
      memmove(buf, p, m);
 2d0:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 2d3:	2d 80 0e 00 00       	sub    $0xe80,%eax
 2d8:	29 c1                	sub    %eax,%ecx
      memmove(buf, p, m);
 2da:	51                   	push   %ecx
 2db:	52                   	push   %edx
 2dc:	68 80 0e 00 00       	push   $0xe80
      m -= p - buf;
 2e1:	89 4d dc             	mov    %ecx,-0x24(%ebp)
      memmove(buf, p, m);
 2e4:	e8 a7 02 00 00       	call   590 <memmove>
 2e9:	83 c4 10             	add    $0x10,%esp
 2ec:	e9 ff fe ff ff       	jmp    1f0 <grep+0x20>
      m = 0;
 2f1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 2f8:	e9 f3 fe ff ff       	jmp    1f0 <grep+0x20>
}
 2fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 300:	5b                   	pop    %ebx
 301:	5e                   	pop    %esi
 302:	5f                   	pop    %edi
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    
 305:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <matchstar>:
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	56                   	push   %esi
 315:	53                   	push   %ebx
 316:	83 ec 0c             	sub    $0xc,%esp
 319:	8b 5d 08             	mov    0x8(%ebp),%ebx
 31c:	8b 75 0c             	mov    0xc(%ebp),%esi
 31f:	8b 7d 10             	mov    0x10(%ebp),%edi
 322:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(matchhere(re, text))
 328:	83 ec 08             	sub    $0x8,%esp
 32b:	57                   	push   %edi
 32c:	56                   	push   %esi
 32d:	e8 8e fd ff ff       	call   c0 <matchhere>
 332:	83 c4 10             	add    $0x10,%esp
 335:	85 c0                	test   %eax,%eax
 337:	75 1f                	jne    358 <matchstar+0x48>
  }while(*text!='\0' && (*text++==c || c=='.'));
 339:	0f be 17             	movsbl (%edi),%edx
 33c:	84 d2                	test   %dl,%dl
 33e:	74 0c                	je     34c <matchstar+0x3c>
 340:	83 c7 01             	add    $0x1,%edi
 343:	39 da                	cmp    %ebx,%edx
 345:	74 e1                	je     328 <matchstar+0x18>
 347:	83 fb 2e             	cmp    $0x2e,%ebx
 34a:	74 dc                	je     328 <matchstar+0x18>
}
 34c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34f:	5b                   	pop    %ebx
 350:	5e                   	pop    %esi
 351:	5f                   	pop    %edi
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    
 354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 358:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
 35b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 360:	5b                   	pop    %ebx
 361:	5e                   	pop    %esi
 362:	5f                   	pop    %edi
 363:	5d                   	pop    %ebp
 364:	c3                   	ret    
 365:	66 90                	xchg   %ax,%ax
 367:	66 90                	xchg   %ax,%ax
 369:	66 90                	xchg   %ax,%ax
 36b:	66 90                	xchg   %ax,%ax
 36d:	66 90                	xchg   %ax,%ax
 36f:	90                   	nop

00000370 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 370:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 371:	31 c0                	xor    %eax,%eax
{
 373:	89 e5                	mov    %esp,%ebp
 375:	53                   	push   %ebx
 376:	8b 4d 08             	mov    0x8(%ebp),%ecx
 379:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 380:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 384:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 387:	83 c0 01             	add    $0x1,%eax
 38a:	84 d2                	test   %dl,%dl
 38c:	75 f2                	jne    380 <strcpy+0x10>
    ;
  return os;
}
 38e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 391:	89 c8                	mov    %ecx,%eax
 393:	c9                   	leave  
 394:	c3                   	ret    
 395:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 55 08             	mov    0x8(%ebp),%edx
 3a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3aa:	0f b6 02             	movzbl (%edx),%eax
 3ad:	84 c0                	test   %al,%al
 3af:	75 17                	jne    3c8 <strcmp+0x28>
 3b1:	eb 3a                	jmp    3ed <strcmp+0x4d>
 3b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b7:	90                   	nop
 3b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 3bc:	83 c2 01             	add    $0x1,%edx
 3bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 3c2:	84 c0                	test   %al,%al
 3c4:	74 1a                	je     3e0 <strcmp+0x40>
    p++, q++;
 3c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 3c8:	0f b6 19             	movzbl (%ecx),%ebx
 3cb:	38 c3                	cmp    %al,%bl
 3cd:	74 e9                	je     3b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 3cf:	29 d8                	sub    %ebx,%eax
}
 3d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d4:	c9                   	leave  
 3d5:	c3                   	ret    
 3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 3e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3e4:	31 c0                	xor    %eax,%eax
 3e6:	29 d8                	sub    %ebx,%eax
}
 3e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3eb:	c9                   	leave  
 3ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 3ed:	0f b6 19             	movzbl (%ecx),%ebx
 3f0:	31 c0                	xor    %eax,%eax
 3f2:	eb db                	jmp    3cf <strcmp+0x2f>
 3f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <strlen>:

uint
strlen(const char *s)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 406:	80 3a 00             	cmpb   $0x0,(%edx)
 409:	74 15                	je     420 <strlen+0x20>
 40b:	31 c0                	xor    %eax,%eax
 40d:	8d 76 00             	lea    0x0(%esi),%esi
 410:	83 c0 01             	add    $0x1,%eax
 413:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 417:	89 c1                	mov    %eax,%ecx
 419:	75 f5                	jne    410 <strlen+0x10>
    ;
  return n;
}
 41b:	89 c8                	mov    %ecx,%eax
 41d:	5d                   	pop    %ebp
 41e:	c3                   	ret    
 41f:	90                   	nop
  for(n = 0; s[n]; n++)
 420:	31 c9                	xor    %ecx,%ecx
}
 422:	5d                   	pop    %ebp
 423:	89 c8                	mov    %ecx,%eax
 425:	c3                   	ret    
 426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42d:	8d 76 00             	lea    0x0(%esi),%esi

00000430 <memset>:

void*
memset(void *dst, int c, uint n)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 437:	8b 4d 10             	mov    0x10(%ebp),%ecx
 43a:	8b 45 0c             	mov    0xc(%ebp),%eax
 43d:	89 d7                	mov    %edx,%edi
 43f:	fc                   	cld    
 440:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 442:	8b 7d fc             	mov    -0x4(%ebp),%edi
 445:	89 d0                	mov    %edx,%eax
 447:	c9                   	leave  
 448:	c3                   	ret    
 449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000450 <strchr>:

char*
strchr(const char *s, char c)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 45a:	0f b6 10             	movzbl (%eax),%edx
 45d:	84 d2                	test   %dl,%dl
 45f:	75 12                	jne    473 <strchr+0x23>
 461:	eb 1d                	jmp    480 <strchr+0x30>
 463:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 467:	90                   	nop
 468:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 46c:	83 c0 01             	add    $0x1,%eax
 46f:	84 d2                	test   %dl,%dl
 471:	74 0d                	je     480 <strchr+0x30>
    if(*s == c)
 473:	38 d1                	cmp    %dl,%cl
 475:	75 f1                	jne    468 <strchr+0x18>
      return (char*)s;
  return 0;
}
 477:	5d                   	pop    %ebp
 478:	c3                   	ret    
 479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 480:	31 c0                	xor    %eax,%eax
}
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    
 484:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop

00000490 <gets>:

char*
gets(char *buf, int max)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 495:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 498:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 499:	31 db                	xor    %ebx,%ebx
{
 49b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 49e:	eb 27                	jmp    4c7 <gets+0x37>
    cc = read(0, &c, 1);
 4a0:	83 ec 04             	sub    $0x4,%esp
 4a3:	6a 01                	push   $0x1
 4a5:	57                   	push   %edi
 4a6:	6a 00                	push   $0x0
 4a8:	e8 2e 01 00 00       	call   5db <read>
    if(cc < 1)
 4ad:	83 c4 10             	add    $0x10,%esp
 4b0:	85 c0                	test   %eax,%eax
 4b2:	7e 1d                	jle    4d1 <gets+0x41>
      break;
    buf[i++] = c;
 4b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4b8:	8b 55 08             	mov    0x8(%ebp),%edx
 4bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 4bf:	3c 0a                	cmp    $0xa,%al
 4c1:	74 1d                	je     4e0 <gets+0x50>
 4c3:	3c 0d                	cmp    $0xd,%al
 4c5:	74 19                	je     4e0 <gets+0x50>
  for(i=0; i+1 < max; ){
 4c7:	89 de                	mov    %ebx,%esi
 4c9:	83 c3 01             	add    $0x1,%ebx
 4cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4cf:	7c cf                	jl     4a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 4d1:	8b 45 08             	mov    0x8(%ebp),%eax
 4d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 4d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4db:	5b                   	pop    %ebx
 4dc:	5e                   	pop    %esi
 4dd:	5f                   	pop    %edi
 4de:	5d                   	pop    %ebp
 4df:	c3                   	ret    
  buf[i] = '\0';
 4e0:	8b 45 08             	mov    0x8(%ebp),%eax
 4e3:	89 de                	mov    %ebx,%esi
 4e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 4e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ec:	5b                   	pop    %ebx
 4ed:	5e                   	pop    %esi
 4ee:	5f                   	pop    %edi
 4ef:	5d                   	pop    %ebp
 4f0:	c3                   	ret    
 4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop

00000500 <stat>:

int
stat(const char *n, struct stat *st)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	56                   	push   %esi
 504:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 505:	83 ec 08             	sub    $0x8,%esp
 508:	6a 00                	push   $0x0
 50a:	ff 75 08             	push   0x8(%ebp)
 50d:	e8 f1 00 00 00       	call   603 <open>
  if(fd < 0)
 512:	83 c4 10             	add    $0x10,%esp
 515:	85 c0                	test   %eax,%eax
 517:	78 27                	js     540 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 519:	83 ec 08             	sub    $0x8,%esp
 51c:	ff 75 0c             	push   0xc(%ebp)
 51f:	89 c3                	mov    %eax,%ebx
 521:	50                   	push   %eax
 522:	e8 f4 00 00 00       	call   61b <fstat>
  close(fd);
 527:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 52a:	89 c6                	mov    %eax,%esi
  close(fd);
 52c:	e8 ba 00 00 00       	call   5eb <close>
  return r;
 531:	83 c4 10             	add    $0x10,%esp
}
 534:	8d 65 f8             	lea    -0x8(%ebp),%esp
 537:	89 f0                	mov    %esi,%eax
 539:	5b                   	pop    %ebx
 53a:	5e                   	pop    %esi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    
 53d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 540:	be ff ff ff ff       	mov    $0xffffffff,%esi
 545:	eb ed                	jmp    534 <stat+0x34>
 547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54e:	66 90                	xchg   %ax,%ax

00000550 <atoi>:

int
atoi(const char *s)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	53                   	push   %ebx
 554:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 557:	0f be 02             	movsbl (%edx),%eax
 55a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 55d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 560:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 565:	77 1e                	ja     585 <atoi+0x35>
 567:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 570:	83 c2 01             	add    $0x1,%edx
 573:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 576:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 57a:	0f be 02             	movsbl (%edx),%eax
 57d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 580:	80 fb 09             	cmp    $0x9,%bl
 583:	76 eb                	jbe    570 <atoi+0x20>
  return n;
}
 585:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 588:	89 c8                	mov    %ecx,%eax
 58a:	c9                   	leave  
 58b:	c3                   	ret    
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000590 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	8b 45 10             	mov    0x10(%ebp),%eax
 597:	8b 55 08             	mov    0x8(%ebp),%edx
 59a:	56                   	push   %esi
 59b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 59e:	85 c0                	test   %eax,%eax
 5a0:	7e 13                	jle    5b5 <memmove+0x25>
 5a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 5a4:	89 d7                	mov    %edx,%edi
 5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 5b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 5b1:	39 f8                	cmp    %edi,%eax
 5b3:	75 fb                	jne    5b0 <memmove+0x20>
  return vdst;
}
 5b5:	5e                   	pop    %esi
 5b6:	89 d0                	mov    %edx,%eax
 5b8:	5f                   	pop    %edi
 5b9:	5d                   	pop    %ebp
 5ba:	c3                   	ret    

000005bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5bb:	b8 01 00 00 00       	mov    $0x1,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <exit>:
SYSCALL(exit)
 5c3:	b8 02 00 00 00       	mov    $0x2,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <wait>:
SYSCALL(wait)
 5cb:	b8 03 00 00 00       	mov    $0x3,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <pipe>:
SYSCALL(pipe)
 5d3:	b8 04 00 00 00       	mov    $0x4,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <read>:
SYSCALL(read)
 5db:	b8 05 00 00 00       	mov    $0x5,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <write>:
SYSCALL(write)
 5e3:	b8 10 00 00 00       	mov    $0x10,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <close>:
SYSCALL(close)
 5eb:	b8 15 00 00 00       	mov    $0x15,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <kill>:
SYSCALL(kill)
 5f3:	b8 06 00 00 00       	mov    $0x6,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <exec>:
SYSCALL(exec)
 5fb:	b8 07 00 00 00       	mov    $0x7,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <open>:
SYSCALL(open)
 603:	b8 0f 00 00 00       	mov    $0xf,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <mknod>:
SYSCALL(mknod)
 60b:	b8 11 00 00 00       	mov    $0x11,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <unlink>:
SYSCALL(unlink)
 613:	b8 12 00 00 00       	mov    $0x12,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <fstat>:
SYSCALL(fstat)
 61b:	b8 08 00 00 00       	mov    $0x8,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <link>:
SYSCALL(link)
 623:	b8 13 00 00 00       	mov    $0x13,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <mkdir>:
SYSCALL(mkdir)
 62b:	b8 14 00 00 00       	mov    $0x14,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <chdir>:
SYSCALL(chdir)
 633:	b8 09 00 00 00       	mov    $0x9,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <dup>:
SYSCALL(dup)
 63b:	b8 0a 00 00 00       	mov    $0xa,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <getpid>:
SYSCALL(getpid)
 643:	b8 0b 00 00 00       	mov    $0xb,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <sbrk>:
SYSCALL(sbrk)
 64b:	b8 0c 00 00 00       	mov    $0xc,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <sleep>:
SYSCALL(sleep)
 653:	b8 0d 00 00 00       	mov    $0xd,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <uptime>:
SYSCALL(uptime)
 65b:	b8 0e 00 00 00       	mov    $0xe,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    
 663:	66 90                	xchg   %ax,%ax
 665:	66 90                	xchg   %ax,%ax
 667:	66 90                	xchg   %ax,%ax
 669:	66 90                	xchg   %ax,%ax
 66b:	66 90                	xchg   %ax,%ax
 66d:	66 90                	xchg   %ax,%ax
 66f:	90                   	nop

00000670 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	53                   	push   %ebx
 676:	83 ec 3c             	sub    $0x3c,%esp
 679:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 67c:	89 d1                	mov    %edx,%ecx
{
 67e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 681:	85 d2                	test   %edx,%edx
 683:	0f 89 7f 00 00 00    	jns    708 <printint+0x98>
 689:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 68d:	74 79                	je     708 <printint+0x98>
    neg = 1;
 68f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 696:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 698:	31 db                	xor    %ebx,%ebx
 69a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 69d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 6a0:	89 c8                	mov    %ecx,%eax
 6a2:	31 d2                	xor    %edx,%edx
 6a4:	89 cf                	mov    %ecx,%edi
 6a6:	f7 75 c4             	divl   -0x3c(%ebp)
 6a9:	0f b6 92 e0 0a 00 00 	movzbl 0xae0(%edx),%edx
 6b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6b3:	89 d8                	mov    %ebx,%eax
 6b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 6b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 6bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 6be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 6c1:	76 dd                	jbe    6a0 <printint+0x30>
  if(neg)
 6c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 6c6:	85 c9                	test   %ecx,%ecx
 6c8:	74 0c                	je     6d6 <printint+0x66>
    buf[i++] = '-';
 6ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 6cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 6d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 6d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 6d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6dd:	eb 07                	jmp    6e6 <printint+0x76>
 6df:	90                   	nop
    putc(fd, buf[i]);
 6e0:	0f b6 13             	movzbl (%ebx),%edx
 6e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6e6:	83 ec 04             	sub    $0x4,%esp
 6e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6ec:	6a 01                	push   $0x1
 6ee:	56                   	push   %esi
 6ef:	57                   	push   %edi
 6f0:	e8 ee fe ff ff       	call   5e3 <write>
  while(--i >= 0)
 6f5:	83 c4 10             	add    $0x10,%esp
 6f8:	39 de                	cmp    %ebx,%esi
 6fa:	75 e4                	jne    6e0 <printint+0x70>
}
 6fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ff:	5b                   	pop    %ebx
 700:	5e                   	pop    %esi
 701:	5f                   	pop    %edi
 702:	5d                   	pop    %ebp
 703:	c3                   	ret    
 704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 708:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 70f:	eb 87                	jmp    698 <printint+0x28>
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 718:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71f:	90                   	nop

00000720 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 729:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 72c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 72f:	0f b6 13             	movzbl (%ebx),%edx
 732:	84 d2                	test   %dl,%dl
 734:	74 6a                	je     7a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 736:	8d 45 10             	lea    0x10(%ebp),%eax
 739:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 73c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 73f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 741:	89 45 d0             	mov    %eax,-0x30(%ebp)
 744:	eb 36                	jmp    77c <printf+0x5c>
 746:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74d:	8d 76 00             	lea    0x0(%esi),%esi
 750:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 753:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 758:	83 f8 25             	cmp    $0x25,%eax
 75b:	74 15                	je     772 <printf+0x52>
  write(fd, &c, 1);
 75d:	83 ec 04             	sub    $0x4,%esp
 760:	88 55 e7             	mov    %dl,-0x19(%ebp)
 763:	6a 01                	push   $0x1
 765:	57                   	push   %edi
 766:	56                   	push   %esi
 767:	e8 77 fe ff ff       	call   5e3 <write>
 76c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 76f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 772:	0f b6 13             	movzbl (%ebx),%edx
 775:	83 c3 01             	add    $0x1,%ebx
 778:	84 d2                	test   %dl,%dl
 77a:	74 24                	je     7a0 <printf+0x80>
    c = fmt[i] & 0xff;
 77c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 77f:	85 c9                	test   %ecx,%ecx
 781:	74 cd                	je     750 <printf+0x30>
      }
    } else if(state == '%'){
 783:	83 f9 25             	cmp    $0x25,%ecx
 786:	75 ea                	jne    772 <printf+0x52>
      if(c == 'd'){
 788:	83 f8 25             	cmp    $0x25,%eax
 78b:	0f 84 07 01 00 00    	je     898 <printf+0x178>
 791:	83 e8 63             	sub    $0x63,%eax
 794:	83 f8 15             	cmp    $0x15,%eax
 797:	77 17                	ja     7b0 <printf+0x90>
 799:	ff 24 85 88 0a 00 00 	jmp    *0xa88(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7a3:	5b                   	pop    %ebx
 7a4:	5e                   	pop    %esi
 7a5:	5f                   	pop    %edi
 7a6:	5d                   	pop    %ebp
 7a7:	c3                   	ret    
 7a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop
  write(fd, &c, 1);
 7b0:	83 ec 04             	sub    $0x4,%esp
 7b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 7b6:	6a 01                	push   $0x1
 7b8:	57                   	push   %edi
 7b9:	56                   	push   %esi
 7ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7be:	e8 20 fe ff ff       	call   5e3 <write>
        putc(fd, c);
 7c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 7c7:	83 c4 0c             	add    $0xc,%esp
 7ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7cd:	6a 01                	push   $0x1
 7cf:	57                   	push   %edi
 7d0:	56                   	push   %esi
 7d1:	e8 0d fe ff ff       	call   5e3 <write>
        putc(fd, c);
 7d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7d9:	31 c9                	xor    %ecx,%ecx
 7db:	eb 95                	jmp    772 <printf+0x52>
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 7e0:	83 ec 0c             	sub    $0xc,%esp
 7e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7e8:	6a 00                	push   $0x0
 7ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7ed:	8b 10                	mov    (%eax),%edx
 7ef:	89 f0                	mov    %esi,%eax
 7f1:	e8 7a fe ff ff       	call   670 <printint>
        ap++;
 7f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7fd:	31 c9                	xor    %ecx,%ecx
 7ff:	e9 6e ff ff ff       	jmp    772 <printf+0x52>
 804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 808:	8b 45 d0             	mov    -0x30(%ebp),%eax
 80b:	8b 10                	mov    (%eax),%edx
        ap++;
 80d:	83 c0 04             	add    $0x4,%eax
 810:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 813:	85 d2                	test   %edx,%edx
 815:	0f 84 8d 00 00 00    	je     8a8 <printf+0x188>
        while(*s != 0){
 81b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 81e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 820:	84 c0                	test   %al,%al
 822:	0f 84 4a ff ff ff    	je     772 <printf+0x52>
 828:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 82b:	89 d3                	mov    %edx,%ebx
 82d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 830:	83 ec 04             	sub    $0x4,%esp
          s++;
 833:	83 c3 01             	add    $0x1,%ebx
 836:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 839:	6a 01                	push   $0x1
 83b:	57                   	push   %edi
 83c:	56                   	push   %esi
 83d:	e8 a1 fd ff ff       	call   5e3 <write>
        while(*s != 0){
 842:	0f b6 03             	movzbl (%ebx),%eax
 845:	83 c4 10             	add    $0x10,%esp
 848:	84 c0                	test   %al,%al
 84a:	75 e4                	jne    830 <printf+0x110>
      state = 0;
 84c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 84f:	31 c9                	xor    %ecx,%ecx
 851:	e9 1c ff ff ff       	jmp    772 <printf+0x52>
 856:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 860:	83 ec 0c             	sub    $0xc,%esp
 863:	b9 0a 00 00 00       	mov    $0xa,%ecx
 868:	6a 01                	push   $0x1
 86a:	e9 7b ff ff ff       	jmp    7ea <printf+0xca>
 86f:	90                   	nop
        putc(fd, *ap);
 870:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 873:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 876:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 878:	6a 01                	push   $0x1
 87a:	57                   	push   %edi
 87b:	56                   	push   %esi
        putc(fd, *ap);
 87c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 87f:	e8 5f fd ff ff       	call   5e3 <write>
        ap++;
 884:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 888:	83 c4 10             	add    $0x10,%esp
      state = 0;
 88b:	31 c9                	xor    %ecx,%ecx
 88d:	e9 e0 fe ff ff       	jmp    772 <printf+0x52>
 892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 898:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 89b:	83 ec 04             	sub    $0x4,%esp
 89e:	e9 2a ff ff ff       	jmp    7cd <printf+0xad>
 8a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8a7:	90                   	nop
          s = "(null)";
 8a8:	ba 7e 0a 00 00       	mov    $0xa7e,%edx
        while(*s != 0){
 8ad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8b0:	b8 28 00 00 00       	mov    $0x28,%eax
 8b5:	89 d3                	mov    %edx,%ebx
 8b7:	e9 74 ff ff ff       	jmp    830 <printf+0x110>
 8bc:	66 90                	xchg   %ax,%ax
 8be:	66 90                	xchg   %ax,%ax

000008c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c1:	a1 80 12 00 00       	mov    0x1280,%eax
{
 8c6:	89 e5                	mov    %esp,%ebp
 8c8:	57                   	push   %edi
 8c9:	56                   	push   %esi
 8ca:	53                   	push   %ebx
 8cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8d8:	89 c2                	mov    %eax,%edx
 8da:	8b 00                	mov    (%eax),%eax
 8dc:	39 ca                	cmp    %ecx,%edx
 8de:	73 30                	jae    910 <free+0x50>
 8e0:	39 c1                	cmp    %eax,%ecx
 8e2:	72 04                	jb     8e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e4:	39 c2                	cmp    %eax,%edx
 8e6:	72 f0                	jb     8d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8ee:	39 f8                	cmp    %edi,%eax
 8f0:	74 30                	je     922 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 8f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8f5:	8b 42 04             	mov    0x4(%edx),%eax
 8f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8fb:	39 f1                	cmp    %esi,%ecx
 8fd:	74 3a                	je     939 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 8ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 901:	5b                   	pop    %ebx
  freep = p;
 902:	89 15 80 12 00 00    	mov    %edx,0x1280
}
 908:	5e                   	pop    %esi
 909:	5f                   	pop    %edi
 90a:	5d                   	pop    %ebp
 90b:	c3                   	ret    
 90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 910:	39 c2                	cmp    %eax,%edx
 912:	72 c4                	jb     8d8 <free+0x18>
 914:	39 c1                	cmp    %eax,%ecx
 916:	73 c0                	jae    8d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 918:	8b 73 fc             	mov    -0x4(%ebx),%esi
 91b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 91e:	39 f8                	cmp    %edi,%eax
 920:	75 d0                	jne    8f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 922:	03 70 04             	add    0x4(%eax),%esi
 925:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 928:	8b 02                	mov    (%edx),%eax
 92a:	8b 00                	mov    (%eax),%eax
 92c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 92f:	8b 42 04             	mov    0x4(%edx),%eax
 932:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 935:	39 f1                	cmp    %esi,%ecx
 937:	75 c6                	jne    8ff <free+0x3f>
    p->s.size += bp->s.size;
 939:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 93c:	89 15 80 12 00 00    	mov    %edx,0x1280
    p->s.size += bp->s.size;
 942:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 945:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 948:	89 0a                	mov    %ecx,(%edx)
}
 94a:	5b                   	pop    %ebx
 94b:	5e                   	pop    %esi
 94c:	5f                   	pop    %edi
 94d:	5d                   	pop    %ebp
 94e:	c3                   	ret    
 94f:	90                   	nop

00000950 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	57                   	push   %edi
 954:	56                   	push   %esi
 955:	53                   	push   %ebx
 956:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 959:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 95c:	8b 3d 80 12 00 00    	mov    0x1280,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 962:	8d 70 07             	lea    0x7(%eax),%esi
 965:	c1 ee 03             	shr    $0x3,%esi
 968:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 96b:	85 ff                	test   %edi,%edi
 96d:	0f 84 9d 00 00 00    	je     a10 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 973:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 975:	8b 4a 04             	mov    0x4(%edx),%ecx
 978:	39 f1                	cmp    %esi,%ecx
 97a:	73 6a                	jae    9e6 <malloc+0x96>
 97c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 981:	39 de                	cmp    %ebx,%esi
 983:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 986:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 98d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 990:	eb 17                	jmp    9a9 <malloc+0x59>
 992:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 998:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 99a:	8b 48 04             	mov    0x4(%eax),%ecx
 99d:	39 f1                	cmp    %esi,%ecx
 99f:	73 4f                	jae    9f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9a1:	8b 3d 80 12 00 00    	mov    0x1280,%edi
 9a7:	89 c2                	mov    %eax,%edx
 9a9:	39 d7                	cmp    %edx,%edi
 9ab:	75 eb                	jne    998 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 9ad:	83 ec 0c             	sub    $0xc,%esp
 9b0:	ff 75 e4             	push   -0x1c(%ebp)
 9b3:	e8 93 fc ff ff       	call   64b <sbrk>
  if(p == (char*)-1)
 9b8:	83 c4 10             	add    $0x10,%esp
 9bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 9be:	74 1c                	je     9dc <malloc+0x8c>
  hp->s.size = nu;
 9c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9c3:	83 ec 0c             	sub    $0xc,%esp
 9c6:	83 c0 08             	add    $0x8,%eax
 9c9:	50                   	push   %eax
 9ca:	e8 f1 fe ff ff       	call   8c0 <free>
  return freep;
 9cf:	8b 15 80 12 00 00    	mov    0x1280,%edx
      if((p = morecore(nunits)) == 0)
 9d5:	83 c4 10             	add    $0x10,%esp
 9d8:	85 d2                	test   %edx,%edx
 9da:	75 bc                	jne    998 <malloc+0x48>
        return 0;
  }
}
 9dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9df:	31 c0                	xor    %eax,%eax
}
 9e1:	5b                   	pop    %ebx
 9e2:	5e                   	pop    %esi
 9e3:	5f                   	pop    %edi
 9e4:	5d                   	pop    %ebp
 9e5:	c3                   	ret    
    if(p->s.size >= nunits){
 9e6:	89 d0                	mov    %edx,%eax
 9e8:	89 fa                	mov    %edi,%edx
 9ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9f0:	39 ce                	cmp    %ecx,%esi
 9f2:	74 4c                	je     a40 <malloc+0xf0>
        p->s.size -= nunits;
 9f4:	29 f1                	sub    %esi,%ecx
 9f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9fc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 9ff:	89 15 80 12 00 00    	mov    %edx,0x1280
}
 a05:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a08:	83 c0 08             	add    $0x8,%eax
}
 a0b:	5b                   	pop    %ebx
 a0c:	5e                   	pop    %esi
 a0d:	5f                   	pop    %edi
 a0e:	5d                   	pop    %ebp
 a0f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 a10:	c7 05 80 12 00 00 84 	movl   $0x1284,0x1280
 a17:	12 00 00 
    base.s.size = 0;
 a1a:	bf 84 12 00 00       	mov    $0x1284,%edi
    base.s.ptr = freep = prevp = &base;
 a1f:	c7 05 84 12 00 00 84 	movl   $0x1284,0x1284
 a26:	12 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a29:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 a2b:	c7 05 88 12 00 00 00 	movl   $0x0,0x1288
 a32:	00 00 00 
    if(p->s.size >= nunits){
 a35:	e9 42 ff ff ff       	jmp    97c <malloc+0x2c>
 a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 a40:	8b 08                	mov    (%eax),%ecx
 a42:	89 0a                	mov    %ecx,(%edx)
 a44:	eb b9                	jmp    9ff <malloc+0xaf>
